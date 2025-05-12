---
title: Configure the automation kit environment variables
description: Learn how to configure the automation kit environment variables.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
Contributors:
  - Grant-Archibald-MS
  - v-aangie
editor: ''
ms.custom: guidance
ms.topic: conceptual
ms.date: 04/21/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Configure automation kit environment variables

In this article, you'll learn how to configure the automation kit environment variables. To get the information for the environment variables, open a new tab.

1. Sign in to [Power Apps](https://make.powerapps.com).

1. In the **Environments** dropdown menu in the title bar, select **satellite**.

   > [!IMPORTANT]
   > Azure Key Vault is required only for automation kit satellite release March 2023 or earlier. Starting with the April 2023 release, Azure Key Vault is no longer required as a prerequisite. Environment variables for this are no longer required.

1. On the top right side of the title bar, select **Settings** (the gear icon) > **Developer resources**.

    The information on this panel will be copied to the Key Vault secrets that follow.

## Get the URL path for your Azure Key Vault secrets

The Azure Key Vault secrets are using the environment variable type. These environment variables need to be in the following format.
  
   ```azurecli
   /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}
   ```

To get the format, follow these steps:

1. Sign in to [Azure](https://portal.azure.com/home).

1. Under **Security**, open your Key Vault with the secrets for your app registration.

1. Select the **Secrets** tab.

1. In the **URL** field, copy the URL.

1. Open Notepad and paste the URL.

1. Remove everything from **https://** to **/resource**.

    :::image type="content" source="../media/url-parts.png" alt-text="Screenshot of the URL syntax to remove.":::

1. At the end of the URL, enter **/{SecretName}**.

1. Replace **{secretname}** with your **secret name**.

1. Repeat step 6 through 8 for all three Azure Key Vault secrets (Client ID, Client Secret, Tenant ID).

    Use the following example as a guide. These reference strings are needed for three environment variables.

    :::image type="content" source="../media/environment-vars.png" alt-text="Screenshot of the environment variables.":::

## Environment variable summary

   Use the information in the following table for the environment variables.

| Environment variable name      | Description |
|---------------------------------------|-------------------|
| AKV Client ID Secret                  | Azure Key Vault secret for client ID (application ID) from app registration: /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}                                                                   |
| AKV Client Secret Secret              | Azure Key Vault secret for secret from app Registration                                                                                                                                                                                                                                         |
| AKV Tenant ID Secret                  | Azure Key Vault secret for Tenant ID from app Registration                                                                                                                                                                                                                                      |
| Automation CoE Alert Email Recipient  | The email address where operational reports and alerts should be sent to, for this environment. ([See Flow exception rules framework](../exception-rules-framework.md#flow-exception-rules-framework))                                                                                                                            |
| Automation Project app ID             | Enter the **Automation Project** app Id of the Power Apps that is deployed with the main solution (main environment)                                                                                                                                                                            |
| Desktop Flows Base URL                | Follow the steps in [Get the desktop flow base URL](#get-the-desktop-flow-base-url)                                                                                                                     |
| Environment ID                        | Use **Session details** to find this value from current environment that you're importing into (satellite)                                                                                                                                                                                     |
| Environment Name                      | Display name of the current environment (satellite)                                                                                                                                                                                                                                             |
| Environment Region                    | Region of the satellite. Can be found in the Power Platform admin center                                                                                                                                                                                                                        |
| Environment Unique Name               | Use **Session details** to find this value from the current environment that you're importing into (**satellite**) Also must add **.crm** to the end of the string. Example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]', and more. is region dependent. [See datacenter regions](/power-platform/admin/new-datacenter-regions)  |
| \*Environment Unique Name of CoE Main | Use **Session details** to find this value **from Main**. Also must add **.crm** to the end of the string. For example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]', and more. is region dependent. [See datacenter regions](/power-platform/admin/new-datacenter-regions)                                                                                                                                                                                                                          |
| Environment URL                       | Open a new tab and then sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).                                                                                            |
| Flow Session Trace Record Owner Id    | This is the UserID (GUID) from the **Users** table inside the satellite environment for the admin account. Select **Tables** under **Data** on the left > **User** > **Data**. Change the view to **"All columns"**. Find the **Auto CoE Admin** account, and then copy the value under **User**. |

## Get the desktop flow base URL

Follow these steps to  get the desktop flow base URL.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left navigation menu, select **My flows**.

1. On the address bar, copy the web address up to **…environments/**.

    You can also get the **environment ID** from this URL.

1. On the **Environment** dropdown menu, select your environment.

1. Select the environment URL. <!--From where?-->

1. Select **Copy link**.

## Post environment variable setup

After you've configured all the environment variables, you need to import them.

1. Select **Import**. <!--Are you still in Power Automate?-->

1. After the import completes, verify the variables for accuracy,

1. Turn on all the flows. <!--Say how to do this.-->

1. Share all apps with the administrators or administrator group of the satellite environment. <!--Say how to do this.-->
