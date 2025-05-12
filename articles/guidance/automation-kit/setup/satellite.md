---
title: Set up the automation kit satellite components
description: Learn how to set up the automation kit satellite components.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
contributors:
  - Grant-Archibald-MS
  - v-aangie
editor: ''
ms.custom: guidance
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/21/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Set up the automation kit satellite components

This article includes the manual install process for the Satellite solution of the automation kit. There's an automated [command line installer](./command-line-install.md) that will also guide you through this process.

## Create a Microsoft Entra app registration to connect to Dataverse Web API

Use the following steps to create an app registration that will be used by flows in the satellite environment.

1. Sign in to [Azure](https://portal.azure.com/).

1. Go to **Microsoft Entra** > **App registrations**.

1. Select **New Registration**.

1. Enter a name (for example, Automation CoE Dataverse API), leave everything else, and then select **Register**.

1. In the **Overview tab**, select **Add an Application ID URI**.

1. Select **Set**, leave the default, and then select **Save**.

## Add a new client secret

Starting from the April 2023 release, a client secret isn't required.

> [!IMPORTANT]
> 
> Azure Key Vault is required only for automation kit satellite release March 2023 or earlier. Starting with the April 2023 release, Azure Key Vault is no longer required as a prerequisite.

1. Select **Certificates & secrets** > **New client secret**.

1. Enter description (for example, Auto CoE Dataverse), and then select appropriate expiry value.

1. Select **Add**.

1. Copy the secret value that's generated.

   This secret will be added to **Azure Key Vault** in a later step.

1. Go back to the **Overview** tab, and then copy down the following information.

   - Application (client) ID
   - Directory (tenant) ID

1. Go to your Azure Key Vault. This is where we'll store the values so that Power Automate can use them to call the Dataverse Web API.

## Create secrets for the client ID and tenant ID you copied earlier

Starting from the April 2023 release, a client secret isn't required.

1. Inside the **Secrets** tab, select **Generate/Import**.

1. Use a descriptive name for each secret. Here are some examples:

   - KVS-AutomationCoE-ClientID
   - KVS-AutomationCoE-TenantID
   - KVS-AutomationCoE-Secret

## Create a new environment or use an existing environment for your satellite

Microsoft recommends that you have the satellite solution imported inside your production environment. If you create a new environment, follow the steps in [Set up the automation kit](main.md).

### Import the Creator Kit

Enable the Power Apps component framework, and then import the Power Platform Creator Kit.

1. Enable the Power Apps component framework.

    1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

    1. Select an environment where you want to enable this feature. (We need to do this for both the **Main** and all **Satellite** environments)

    1. Select **Settings** in the top pane.

    1. Select **Product** > **Features**.

    1. Turn on **Allow publishing of canvas apps with code components**.

    1. Select **Save**.

1. Import the [Power Platform Creator Kit](/power-platform/guidance/creator-kit/overview).

    1. Download the [Power Platform Creator Kit](https://aka.ms/creatorkitdownload).

    1. Sign in to [Power Automate](https://make.powerautomate.com).

    1. Go to the environment you just created into which the main solution will be imported. For this example, you're importing to the environment named **Contoso_Prod**.

    1. On the left pane, select **Solutions** > **Import** > **Browse**.

    1. Select the Creator Kit solution named **CreatorKitCore_x_x_x_x_managed.zip**.

    1. Select **Import**.

Wait for the Creator Kit to finish importing before continuing to next step.

## Create an application user inside Dataverse

Create an application user inside Dataverse, per satellite environment.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select the satellite environment, and then select **Settings**.

1. Select **Users + permissions** > **Application Users** > **New app user**.

1. Select **Add an app**.

1. Select the app registration that was created in previous steps.

    >[!TIP]
    >If you're unsure, verify the AppID.

1. Select a business unit.

1. Add the **System Administrator** security role.

1. Select **Create**.

## Import the satellite solution into the satellite environment

Follow these steps to import the satellite solution.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select your designated environment for the satellite solution. For this example, we're importing to the environment named **Contoso_Prod.**

1. Download the most recent release of the automation kit satellite managed solution from the **Assets** section of the [automation kit](https://github.com/microsoft/powercat-automation-kit/releases) file.

1. On the left pane, select **Solutions**.

1. Select **Import**, and then **Browse**.

1. Select the Automation CoE satellite solution named **AutomationCoESatellite_x_x_x_x_managed.zip**.

1. When the compressed (.zip) file loads, select **Next**.

1. Review the information, and then select **Next**.

1. Establish connections to activate your solution.

    If you create a new connection, you must select **Refresh**. You won't lose your import progress.

1. Configure the [environment variables](./environment-variables.md).

## Import the desktop flow actions CSV

Import all the desktop flow actions from the CSV file into the **Desktop Flow Action** table. This must be done for all environments in which the automation kit is installed, such as main and all satellites.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select the environment where the solution is installed.

1. Select **Solutions**.

1. Find and then select the Automation CoE main solution.

1. Select the **Desktop Flow Action** table.

1. Near the top, expand the **Import** list.

1. Select **Import data from Excel**.

1. After the popup opens, select **Upload**, and then upload the included Excel file named **autocoe_desktopflowactions.csv**.

1. Wait for the **mapping status** to show as successful.

1. Select **Import**.

1. After the import completes, verify that the data was imported.