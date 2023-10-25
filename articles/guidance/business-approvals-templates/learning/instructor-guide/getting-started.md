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

To help remove the manual setup process which is time consuming and repetitive when you have a set of users to deliver the workshop to the Automation kit includes a set of automation scripts to help you setup isolated environments for each attendee. This approach is taken so that each learner is isolated from each other and does not get impacted by other learners. This instructor guide assumes that you will use one of the following methods to setup and run the automation scripts:

- **Local Install** - you have the ability to install the required components on your local environment.
- **Docker Install** - You have the ability to run and build a docker image to install components for learners.
- **Azure Cloud Virtual Machine** - You will use Azure Cloud Shell and Azure Virtual Machine to install setup components.

Given the installer components are based on cross platform tools including PowerShell, Azure CLI, Power Platform CLI and the .Net SDK you could make your choice from supported Windows, Mac OS or Linux based operating systems to install the required components.

## Local Install

To perform a local install the following steps can be followed:

1. Install .Net SDK 7.0 from [Download .NET](https://dotnet.microsoft.com/download)

1. Azure CLI is installed. One option using .Net is

```pwsh
dotnet tool install Microsoft.PowerApps.CLI.Tool
```

1. PowerShell is installed one option using .Net is

```pwsh
dotnet tool install --global PowerShell
```

1. Install SecureStore one option using .Net is

```pwsh
dotnet tool install --global SecureStore.Client
```

1. Clone the Approvals Kit GitHub repository

```bash
git clone https://www.github/microsoft/powercat-business-approvals-kit.git
```

1. Build the .Net library and playwright on Windows

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

A Docker setup is a way to run your application with a known set of tools in a contained environment. This ensures that your application runs consistently across different systems, without being affected by differences in the underlying infrastructure like operating system versions or library dependencies.

Using a Docker setup also means you don't need to install all the tools on your local computer, as everything is contained within the Docker container. This makes it easier to manage dependencies and avoid conflicts with other tools you may have installed.

Another benefit of a Docker setup is that you can run multiple installations at the same time, as each installation is isolated within its own container. This can improve efficiency and reduce the time needed to perform installations or updates.

Overall, the Docker based install install is a helpful tool for developers and system administrators who need to manage complex software environments across multiple systems.

### Setup Steps

```pwsh
docker build . -t automation-kit-setup
```

## Azure Cloud Virtual Machine

This approach includes a summary of how to use create a small Azure Linux based Virtual machine to assist you with the setup of development environments that wil be used by learners.

### Why is this important?

If you want to setup a class size of 20+ students each environment setup could take up to 20 minutes for each user environment. By using an Azure Cloud based Virtual Machine you could automate a set of machines without the need to have an active PC connected to the Internet.

### Installation Steps

1. Inside the [Azure Portal](https://portal.azure.com) start a new bash based Azure Cloud Shell.

> NOTE: If Azure Cloud Shell is new to you [Overview of Azure Cloud Shell](https://learn.microsoft.com/azure/cloud-shell/overview) an the [Quickstart](https://learn.microsoft.com/azure/cloud-shell/quickstart) could be useful starting points.

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

1. In the Azure Cloud Shell login to virtual machine using ssh

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

1. Setup the installer app and install dependencies

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

In this section you have have the option of installing and verify that you have the tools required to use the automated setup scripts that can assist you with setup of a workshop.
