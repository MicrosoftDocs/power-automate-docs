---
title: Setup the Automation Kit satellite components | Microsoft Docs
description: Setup the Automation Kit satellite components.
suite: flow
documentationcenter: na
author: grarchib
manager: marcsc
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: deonhe
---

# Set up satellites

## Create an Azure AD app registration to connect to Dataverse Web API

Use the following steps to create an app registration that will be used by flows in the satellite environment.

1. Sign in to [Azure](https://portal.azure.com/).
1. Go to **Azure Active Directory** > **App registrations**.
1. Select **New Registration**.
1. Enter a name (for example, Automation CoE Dataverse API), leave everything else, and the select **Register**.
1. In the **Overview tab**, select **Add an Application Id URI**.
1. Select **Set**, leave the default, and then select **Save**.

## Add a new client secret

1. Select **Certificates & secrets.**
1. Select **New client secret.**
1. Enter description (for example, Auto CoE Dataverse), and then select appropriate expiry value.
1. Select **Add**.
1. Copy down the secret value that's generated.

   This secret will be added to **Azure Key Vault** in a later step.

1. Go back to the **Overview** tab and then copy down the following information.

    - Application (client) ID
    - Directory (tenant) ID

1. Next go to your Azure Key Vault, this is where we will store the values so that Power Automate can use them to call the Dataverse Web API.

## Create secrets for the client Id and tenant Id you copied earlier

1. Inside the **Secrets** tab, select **Generate/Import**.
1. Use a descriptive name for each secret. Here are a few examples.

    - KVS-AutomationCoE-ClientID
    - KVS-AutomationCoE-TenantID
    - KVS-AutomationCoE-Secret

## Create a new environment or use an existing environment for your satellite

Microsoft recommends that you have the satellite solution imported inside your production environment. Follow the [steps to import the main solution](main.md) if you create a new environment.

### Create application user inside Dataverse (Per satellite Env)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select the satellite environment, and then select **Settings**.
1. Select Users + permissions > Application Users > New app user.
1. Select **Add an app**.

1. Select the app registration that was created in previous steps.
    >[!TIP]
    >Verify the AppID if you're unsure.

1. Select a business unit.
1. Add the **System Administrator** security role.
1. Select **Create**.

## Import the satellite solution into the satellite environment

1. Sign into [Power Automate](https://flow.microsoft.com).
1. Select your designated environment for the satellite solution.

   For this example, we're importing to the environment named **Contoso_Prod.**

1. On the left pane, select **Solutions**.
1. Select **Import**, and then **Browse**.
1. Select the Automation CoE satellite solution (**AutomationCoESatellite_x_x_x_x_managed.zip**).
1. When the compressed (.zip) file loads, select **Next**.
1. Review the information, and then select **Next**.
1. Establish connections to activate your solution. If you create a new connection, you must select **Refresh**. You won't lose your import progress.

## Import the desktop flow actions csv

Next, we want to import all the desktop flow actions from the csv file into the **Desktop Flow Action** table.

This must be done for all environments to which the Automation Kit is installed, such as main and all satellites.

1. Open a browser, navigate to [Power Automate](https://flow.microsoft.com) and sign-in with your account.
1. Navigate to your environment where the solution is installed.
1. Select Solutions tab.
1. Find and select Automation CoE Main solution.
1. Select the table, Desktop Flow Action.
1. Click the Import dropdown near the top.
1. Select Import data from Excel.
1. After the popup opens, select the **Upload** button, and then upload the included Excel file (autocoe_desktopflowactions.csv).
1. Wait for the **mapping status** to show as successful.
1. Select **Import**.
1. After the import completes, verify that the data was imported.
