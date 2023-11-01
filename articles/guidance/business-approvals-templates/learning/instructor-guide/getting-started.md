---
title: Approvals Kit instructor guide getting started | Microsoft Learn
description: Approvals Kit instructor guide getting started
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Getting Started

To help remove the manual setup process that is time consuming and repetitive when you have a set of users to deliver the workshop to the Automation kit includes a set of automation scripts to help you set up isolated environments for each attendee. This approach is taken so that each learner is isolated from each other and doesn't get impacted by other learners. This instructor guide assumes that you use one of the following methods to set up and run the automation scripts:

- **Local Install** - you have the ability to install the required components on your local environment.
- **Docker Install** - You have the ability to run and build a docker image to install components for learners.
- **Azure Cloud Virtual Machine** - Use Azure Cloud Shell and Azure Virtual Machine to install setup components.

The installer components are based on cross platform tools. The required tools include PowerShell, Azure CLI, Power Platform CLI and the .NET SDK you could make your choice from supported Windows, macOS or Linux based operating systems.

## Local Install

Perform a local install using the following steps:

1. Install .NET SDK 7.0 from [Download .NET](https://dotnet.microsoft.com/download)

1. Azure CLI is installed. One option using .NET is

```pwsh
dotnet tool install Microsoft.PowerApps.CLI.Tool
```

1. PowerShell is installed one option using .NET is

```pwsh
dotnet tool install --global PowerShell
```

1. Install SecureStore one option using .NET is

```pwsh
dotnet tool install --global SecureStore.Client
```

1. Clone the Approvals Kit GitHub repository

```bash
git clone https://www.github/microsoft/powercat-business-approvals-kit.git
```

1. Build the .NET library and playwright on Windows

```pwsh
cd .\powercat-business-approvals-kit\Workshop\src\installer
dotnet build
./bin/Debug/net7.0/playwright.ps1 install
```

> NOTE: If you are installing on a non Windows operating system the additional command may be needed

```pwsh
./bin/Debug/net7.0/playwright.ps1 install-deps
```

## Docker Install

A Docker setup is a way to run your application with a known set of tools in a contained environment. By using Docker, it ensures that your application runs consistently across different systems. For example, it helps provide isolation from underlying infrastructure like operating system or library versions.

Using a Docker setup also means you don't need to install all the tools on your local computer, as everything is contained within the Docker container.

Another benefit of a Docker setup is that you can run multiple installations at the same time, as each installation is isolated within its own container. Multiple containers can improve efficiency and reduce the time needed to perform installations or updates.

Overall, the Docker based install is a helpful tool for developers and system administrators who need to manage complex software environments across multiple systems.

### Setup Steps

```pwsh
docker build . -t automation-kit-setup
```

## Azure Cloud Virtual Machine

One approach to allow you to create development environments for learners is to use a small Azure Linux based Virtual machine to assist you.

### Setting up for scale

Setting up a class size of 20+ students each environment setup could take up to 20 minutes for each user environment. When using an Azure Cloud based Virtual Machine, you can automate a setup of machines without the need to have an active PC connected to the Internet.

### Installation Steps

1. Inside the [Azure portal](https://portal.azure.com), start a new bash based Azure Cloud Shell.

> NOTE: If Azure Cloud Shell is new to you can use [Overview of Azure Cloud Shell](/azure/cloud-shell/overview)an the [Quickstart](/azure/cloud-shell/quickstart) as useful starting points.

2. Use the following Bash script inside the Azure Cloud Shell to create a resource group, create and start a Virtual Machine (VM)

```bash
vmName="ApprovalsKitSetupVM"
exists=`az group exists --name ApprovalsKitSetup`
if [ $exists = 'false' ];
then
  az group create --name ApprovalsKitSetup --location westus
else
  echo 'Group already exists'
fi
match=`az vm list -d -o table --query "[?name=='$vmName']"`
if [ "$match" = "" ];
then
  az vm create --resource-group ApprovalsKitSetup --name "$vmName" --image "Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest" --size "Standard_B2s" --storage-sku Standard_LRS --os-disk-size-gb 63 --public-ip-sku Standard --admin-username accadmin --generate-ssh-keys --ssh-key-value ~/.ssh/azurevm-$vmName.pub --storage-sku Standard_LRS
else
  echo 'VM Already exists'
fi
$running=`az vm list -d --query "[?powerState=='VM running' && name=='$vmName']" -o table`
if [  "$running" = "" ];
then
    az vm start  --resource-group ApprovalsKitSetup --name "$vmName"
fi
```

1. Create ssh session to get command line to your virtual machine

```bash
vmName="ApprovalsKitSetupVM"
ip=`az vm list-ip-addresses --resource-group ApprovalsKitSetup --name $vmName --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`
ssh -i ~/.ssh/azurevm-$vmName "accadmin@$ip" -t -l bash
```

1. Install the Azure CLI using the following script inside the SSH connection of your linux VM.

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

1. Restart you virtual machine.

1. Wait for your machine to start again and have a status of running.

1. In the Azure Cloud Shell sign in to virtual machine using ssh.

```bash
vmName="ApprovalsKitSetupVM"
ip=`az vm list-ip-addresses --resource-group ApprovalsKitSetup --name $vmName --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`
ssh -i ~/.ssh/azurevm-$vmName "accadmin@$ip" -t -l bash
```

1. Install the required tools inside the Virtual Machine bash shell

> **NOTES:**
>
> 1. `sudo`: This command is used to run a command with elevated privileges. It allows a user to execute a command as the root user or another user with higher privileges
>
> 2. `apt remove`: This command is used to remove a package from your system. It removes all the files associated with the package, as well as any configuration files that were created when the package was installed
>
> 3. `apt remove`: This command is used to remove a package from your system. It removes all the files associated with the package, as well as any configuration files that were created when the package was installed
>
> 4. The `dotnet tool install` command is used to install a .NET Core global tool. Global tools are .NET Core console applications that are installed on your system and can be accessed from any directory in the command prompt.
>
> 5. The `.bash_profile` file is a script that is executed whenever a new terminal session is started in Bash. It is used to set environment variables, define aliases, and perform other customizations to the shell environment.
>

```bash
sudo apt remove -y 'dotnet*' 'aspnet*' 'netstandard*'
sudo rm -f /etc/apt/sources.list.d/microsoft-prod.list
sudo sudo apt install -y dotnet-sdk-7.0 dotnet-runtime-6.0 unzip
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
dotnet tool install --global PowerShell
dotnet tool install --global SecureStore.Client

cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/home/accadmin/.dotnet/tools"
EOF
```

1. Clone the Approvals Kit GitHub repository

```bash
git clone https://www.github/microsoft/powercat-business-approvals-kit.git
```

> NOTE: If git clone is not an option, you could download the repository as a zip file upload the zip file to your Cloud Shell. Then use ```scp -i ~/.ssh/azurevm-$vmName powercat-business-approvals-kit-main.zip "accadmin@$ip":/home/accadmin```

1. Set up the installer app and install dependencies

> **NOTE:** Playwright is an open-source solution for automating web browsers. It is used by the installer to automate interactive tasks as a workshop user account. [Playwright documentation](https://playwright.dev/docs/intro) provides official documentation for Playwright. It provides a comprehensive guide to using the library, including installation instructions, API reference, and examples

```pwsh
Push-Location
cd powercat-business-approvals-kit/Workshop/src/install
dotnet build
pwsh ./bin/Debug/net7.0/playwright.ps1 install
pwsh ./bin/Debug/net7.0/playwright.ps1 install-deps
Pop-Location
```

> NOTE: If you are using zip file copied via scp use the command ```unzip powercat-business-approvals-kit-main.zip``` and move the folder name ```mv powercat-business-approvals-kit-main powercat-business-approvals-kit```

## Verifying Install

Independent of which method you selected each of the following commands should be able to run to verify successful install of components needed to get started.

1. Power Platform CLI is installed

```pwsh
pac --help
```

1. Azure CLI is installed

```pwsh
az --version
```

1. PowerShell is installed

```pwsh
pwsh --version
```

1. Secure Store is installed

```powershell
SecureStore --version
```

## Summary

In this section, you have the option of installing and verify that you have the tools required to use the automated setup scripts that can assist you with setup of a workshop.
