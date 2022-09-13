---
title: Configure the Automation Kit environment variables | Microsoft Docs
description: Configure the Automation Kit environment variables.
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

# Configure environment variables

1. To get the information for the environment variables, open a new tab.
2. Navigate to the satellite environment from the [maker portal](https://make.powerapps.com).
3. Select the **Settings** in the top right nav bar > **Session details Developer resources**.

Next, we need to get the **URL path** for our **Azure Key Vault secrets**.

The Azure Key Vault secrets are using the new environment variable type. These environment variables need to be in the following format.
  
   ```azurecli
   /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}
   ```

Follow these steps to get the format.

1. Go to [Azure Portal](https://portal.azure.com/#home), navigate to your Key Vault with the secrets for your [App Registration](#create-an-azure-ad-app-registration-to-connect-to-dataverse-web-api).
1. Select the **Secrets** tab.
1. Copy the **URL**.
1. Paste the URL into notepad.
1. Remove everything from **https://** to **/resource**.
![A screenshot that displays the the parts of the URL to remove](../media/de7d37307607c10210a3d198898d1f40.png)

1. At the end of the URL, add **/{SecretName}**. Replace **{secretname}** with your **secret name**.

1. Do this for all three Azure Key Vault secrets (Client ID, Client Secret, Tenant ID).

    See the example in the screenshot. These reference strings are needed for three environment variables.

   ![A screenshot that displays the environment variables](../media/247d5b62089b726962d20f94ae46e062.png)

   Use this information for the environment variables.

| **Environment variable name**         | **Description**                                                                                                                                                                                                                                                                                 |
|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AKV Client Id Secret                  | Azure Key Vault secret for client Id (application Id) from app registration: /subscriptions/{Subscription ID}/resourceGroups/{Resource Group Name}/providers/Microsoft.KeyVault/vaults/{Key Vault Name}/secrets/{Secret Name}                                                                   |
| AKV Client Secret Secret              | Azure Key Vault secret for secret from app Registration                                                                                                                                                                                                                                         |
| AKV Tenant Id Secret                  | Azure Key Vault secret for Tenant Id from app Registration                                                                                                                                                                                                                                      |
| Automation CoE Alert Email Recipient  | The email address where operational reports and alerts should be sent to, for this environment. **(**[See Exception Framework](#flow-exception-rules-framework)**)**                                                                                                                            |
| Automation Project app Id             | Enter the **Automation Project** app Id of the Power Apps that is deployed with the main solution (main environment)                                                                                                                                                                            |
| Desktop Flows Base URL                | Follow the steps in [Desktop flows base url steps](#steps-to-get-desktop-flow-base-url)                                                                                                                     |
| Environment Id                        | Use **Session details** to find this value from current environment that you are importing into (satellite)                                                                                                                                                                                     |
| Environment Name                      | Display name of the current environment (satellite)                                                                                                                                                                                                                                             |
| Environment Region                    | Region of the satellite. Can be found in the Power Platform admin center                                                                                                                                                                                                                        |
| Environment Unique Name               | Use **Session details** to find this value from the current environment that you are importing into (**satellite**) Also must add **.crm** to the end of the string. Example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]' etc. is region dependent. [See datacenter regions](/power-platform/admin/new-datacenter-regions)  |
| \*Environment Unique Name of CoE Main | Use **Session details** to find this value **from Main**. Also must add **.crm** to the end of the string. For example: unq08ed139e532b4edc8f38851fd1bb3279.crm. Please note that the extension 'crm', 'crm[x]' etc. is region dependent. [See datacenter regions](/power-platform/admin/new-datacenter-regions)                                                                                                                                                                                                                          |
| Environment URL                       | Open a new tab > navigate to [Power Platform admin center](https://microsoft.sharepoint.com/teams/AutomationCOE/Shared%20Documents/General/Releases/PAD%20DLP%20Impact%20Analysis/Docs/aka.ms/ppac).                                                                                            |
| Flow Session Trace Record Owner Id    | This is the UserID (guid) from the Users table inside the satellite environment for the admin account. Select Tables under Data on the left > User > Data > Change view to **"All columns"** Find the **Auto CoE Admin** account and copy the value under **User**. Flow User Id (guid):        |


## Steps to get desktop flow base url

1. Select **My flows** tab.
1. Copy the web address up to …environments/
1. You can also get the **environment id** from this URL.
1. Select your environment.
1. Right click the environment URL.
1. Select **Copy link**.

## Post environment variable setup steps

1. After you've configured all the environment variables, select **Import**.
1. After the importation completes, verify and turn on all the flows.
1. Share all apps with the administrators or administrator group of the satellite environment.
