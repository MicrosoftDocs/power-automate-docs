---
title: Setup the Power Automate Azure Virtual Desktop integration starter kit | Microsoft Docs
description: Setup instructions
services: ''
author: raaourik
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/28/2021
ms.author: raaourik
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - admin
---

# Starter kit modules

The Power Automate AVD integration starter kit is shipped as a solution which can be imported into your environment, plus an Azure Automation runbook that will
allow you to automate the installation of Power Automate for desktop and machine
registrations.

The starter kit solution includes:

-   An application, that will help with configuring your scale strategy and
    collecting the necessary information to interact with both your Azure
    Virtual Desktop deployment and the Power Platform.

-   A sample orchestration flow that will be used as a template to generate new
    flows with your own configurations.

-   Other helpful flows that either enable the configuration application or help
    generating the customized orchestration flows.

## Prerequisites

The following are prerequisites for installing the Power Automate AVD
integration starter kit as it's included in the solution:

-   Download the [content package](https://go.microsoft.com/fwlink/?linkid=2174628) which includes the starter kit solution and runbook script to your device.

### Azure Virtual Desktop hostpool

-   An Azure Virtual Desktop deployment with at least one host pool. If you
    don’t have one, you can follow this [documentation](/azure/virtual-desktop/getting-started-feature)
    to set it up.

-   You have provisioned VMs in the host pool, that the starter kit will turn
    on/off when applying your scaling strategy.

### Microsoft Dataverse

-   Admin account:

    -   Microsoft Power Platform service admin, global tenant admin, or Dynamics
        365 service admin for access to all tenant resources through the Power
        Apps APIs.

    -   This solution will work for environment admins, but the view will be
        restricted to only the environments an environment admin has access to.

-   Environment with a Dataverse instance, where the user installing the
    solution has the System Administrator security role.

-   If you are using this starter kit in Production environment with a
    Dataverse, premium licenses are required for all users interacting with the
    Power Automate AVD integration starter kit. Depending on what components you
    will use, your organization size and the existing licenses available in your
    organization, you will require either a Power Apps per user or per app or
    Power Automate per user or per flow license or a combination of these
    licenses.

### Azure Automation and Key vaults

-   [An Azure Automation Account](/azure/automation/quickstarts/create-account-portal)

-   [An Azure Automation Credential](/azure/automation/shared-resources/credentials?tabs=azure-powershell#create-a-new-credential-asset) which is needed to run the runbook automation and is used to authenticate to
    Azure.

-   [A service principal account to register your VMs](machines-silent-registration.md#using-a-service-principal-account)

-   [An app registration with Azure Service Management permission]
    ()/azure/active-directory/develop/quickstart-register-app)

-   An Azure Key Vault where you can store the secrets for your app
    registrations and machine group passwords.

## Setup the Power Automate AVD integration starter kit

### Import the solution into a Production environment

1.  Download the Power Automate AVD integration starter kit from the [Github repository](https://go.microsoft.com/fwlink/?linkid=2174628)

1.  Navigate to your environment:

    1.  Go to <https://flow.microsoft.com>

    1.  Select the environment in which the starter kit will be hosted.

1.  On the left pane, select **Solutions**.

1.  Select **Import**, and then **Browse**.

1.  Select the Power Automate AVD integration starter kit solution from File
    Explorer (AzureVirtualDesktopStarterKit_x_x_x_xx_managed.zip or
    AzureVirtualDesktopStarterKit_x_x_x_xx.zip)

1.  When the compressed (.zip) file has been loaded, select **Next**.

1.  Review the information, and then select **Next**.

1.  Establish connections to activate your solution. If you create a new
    connection, you must select **Refresh**. You won't lose your import progress.

1.  Make sure you create connections that target the AVD tenant you want to
        use.

1.  Select **Import**.

> [!NOTE]
> The import can take up to 10 minutes to be completed.


### Update the Flow Sample Environment Variable
>[!NOTE]
>You can't update the values for environment variables from within the solution.

Once the solution import is competed, click on the VM Orchestration Sample
Flow, navigate to its details page and copy the Flow Id.

> [!NOTE]
> You can find the flow Id by navigating to the details page of your flow and then copying the value in the address bar of your browser:
https://flow.microsoft.com/manage/environments/**\<environmentId\>**/solutions/**\<solutionId\>**/flows/**\<flow-Id\>**

To update Environment Variables:

1.  Go to [Power Automate](https://flow.microsoft.com/).

1.  On the left pane, select **Solutions**.

1.  Select the **Default Solution** and change the filter to show **Environment
    Variables**.

1.  Select the **Sample Orchestration Flow Id** variable and then configure its
    **Current Value**.

1.  Enter the Flow Id you copied earlier as the current value.

### Update the runbook name Variable

If you rename the runbook file when you import it in your Azure Automation
account, you need to update the **Runbook Name** environment variable with the
same value.

To update Environment Variables:

1.  Go to [Power Automate](https://flow.microsoft.com/).

1.  On the left pane, select **Solutions**.

1.  Select the **Default Solution** and change the filter to show **Environment
    Variables**.

1.  Select the **Runbook Name** variable and then configure its **Current
    Value**.

1.  Enter the new runbook name you specified in the “import the runbook script“
    step.

> [!IMPORTANT]
> When environment variable values are changed directly within an environment
instead of through an ALM operation like solution import, flows will continue
using the previous value until the flow is either saved or turned off and turned
on again.

### Import the Runbook script

1.  Sign in to the Azure portal.

1.  Search for and select Automation Accounts.

1.  On the Automation Accounts page, select your Automation account from the
    list.

1.  From the Automation account, select Runbooks under Process Automation to
    open the list of runbooks.

1.  Click **Import a runbook** and then **Select a file.**

1.  Select the runbook from the File Explorer (runbookWorkflow.ps1)

1.  Rename the runbook if needed and select **PowerShell** in the **Runbook type** dropdown.

1.  Click **Create**. The new runbook appears in the list of runbooks for the Automation account.

1.  You have to [publish the runbook](/azure/automation/manage-runbooks#publish-a-runbook)
    before you can run it.

### Create an Azure AD app registration to connect to Azure Service Management APIs and to the Power Platform

-   [Create an app registration to register your VMs and add them to machine
    groups](machines-silent-registration.md#using-a-service-principal-account)
>[!NOTE]
>The application user should at least have maker role in the environment.

> [!IMPORTANT]
> Make sure you follow these steps to create an application
        user in the Power Platform Admin Center: [Manage application users in
        the Power Platform admin center](/power-platform/admin/manage-application-users#create-an-application-user)


-   [Create an app registration with Azure Service Management permission](/azure/active-directory/develop/quickstart-register-app)

    ![App Regsitration Screenshot](media/avd-starter-kit/AppRegistration.png)

> [!NOTE]
>The AAD application needs to have read permission on the subscription.

> [!IMPORTANT]
>You need to save the App registration secrets in the Key Vault in order to use
them within the starter kit.

## Limitations

### Coauth and connections

If you have multiple identities managing the CoE Toolkit you may see this error
when trying to use the flows:

The caller with object id '...GUID...' does not have permission for
connection. 

This is because the product does not yet support multiple people using
connection references. 

If you see this you should either log in with the identity that installed the
solution to run the flows, or update the flows to use your identity.

To do the later, browse to the default solution, filter to connection
references, and edit each connection to use your connection instead.

## Supported languages

The Power Automate Azure Virtual Desktop integration starter kit is currently
available only in English. Add the English language pack to your environment to
make sure all apps and flows work. Read more in the [regional and language
options for your environment.](/power-platform/admin/enable-languages)

## Multi-tenant App registrations

If your Dataverse tenant is different from the AVD one, there are additional
steps and validation you need to go through to let your application interact
with your Dataverse tenant.Read more on [how to use multi-tenant server-to-server authentication](/powerapps/developer/data-platform/use-multi-tenant-server-server-authentication>