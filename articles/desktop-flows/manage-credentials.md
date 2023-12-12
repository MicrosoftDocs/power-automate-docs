---
title: Use credentials in desktop flow connections (preview)
description: Use credentials in desktop flow connections 
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/12/2023
ms.author: quseleba
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---


# Use credentials in desktop flow connections (preview)

[This article is prerelease documentation and is subject to change.]

The new **Credentials** page (preview) in Power Automate allows you to create, edit, and share login credentials using Azure Key Vault and use them in desktop flow connections. The following table provides the feature availability information in various regions. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality.
> - These features are available before an official release so that customers can get early access and provide feedback.
> - Currently, this feature isn't available for US Government Clouds.

## Prerequisites

Credentials use secrets stored in Azure Key Vault. To allow you to create credentials, your administrator needs to configure Azure Key Vault first.
In a nutshell, admin needs to ensure:
1. Microsoft Power Platform resource provider is registered in Azure subscription
1. There is an Azure Key Vault that contains the secrets to be used in the credentials.
1. Dataverse service principal has permissions to use the secrets
1. Users who create the environment variable have appropriate permissions to the Azure Key Vault resource.
1. The Power Automate environment and the Azure subscription must be on the same tenant

To configure Azure Key Vault, follow the steps described in [Configure Azure Key Vault](/power-apps/maker/data-platform/environmentvariables#configure-azure-key-vault).

## Create a credential

To create your credentials, go to the **Credentials** page. 
1. Select **more** in the left nav, then select **Discover all**.
2. Under **Data**, select **Credentials (preview)**. You can pin the page in the left nav to make it more accessible.

In the credentials page, you can now create your first credential.

:::image type="content" source="./media/manage-machines/CreateCredential.png" alt-text="Screenshot of the creation of a credential.":::

To create your credential, you need to provide the following information:
- **Credential name**: Enter a name for the credential
- **Description** (optional)
- **Username**: credential usernames must be **text environment variables**. To select a variable, you can use the dropdown. If you don’t have any environment variables, you must [create a text variable from the solutions page](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution).
- **Password**: the password must use a **secret environment variables**. To select a variable, you can use the dropdown. If you don’t have any secret environment variables, you must [create a secret variable from the solutions page](/power-apps/maker/data-platform/environmentvariables#create-a-new-environment-variable-for-the-key-vault-secret).

> [!NOTE]
> Secret environment variables reference secrets stored in Azure Key Vault. 

## Create desktop flow connections using a credential
Note: Credentials (preview) are only supported in the desktop flow connections for now.
1.	Sign in to [Power Automate](https://make.powerautomate.com).
2.	Create or edit a cloud flow.
3.	Add or edit a Desktop flow action (run a flow built with Power Automate for desktop)
4.	Select **Add new connection**:
    -	Select Connect with username and password.
    -	Select the machine or the machine group.
5.	Select **Switch to credentials**.
6. You can now select the credential you want to use on the selected machine and select **Create**.

:::image type="content" source="./media/manage-machines/CreateConnection.png" alt-text="Screenshot of the connection using credentials.":::

## Update a secret (password rotation)

### Prerequisites: 
- Ensure Event Grid is registered as a Resource provider in Azure. [Learn more about resource providers](/azure/azure-resource-manager/management/resource-providers-and-types).
- Ensure users who use Event Grid trigger in Power Automate have Event Grid Contributor permissions. [Learn more](/azure/event-grid/security-authorization)

> [!NOTE]
> This section requires specific permissions such as system admin of the organization otherwise only your own desktop flow connections will be updated. 

### Create a cloud flow using EventGrid trigger
When you edit secrets in your Azure Key Vault, you want to ensure that the credentials and connections using these secrets are always up to date to avoid breaking your automations.
In Power Automate, you need to create a cloud flow that will update the credentials when secrets are changed in Azure Key Vault.

This cloud flow contains one trigger and one action:
1. Trigger: When a resource event occurs (Event Grid)
    -	Resource type: **Microsoft.KeyVault.vaults**
    -	Resource name: Provide the name of the key vault.
    -	Subscription: Provide the name of the subscription.
    -	Event type: **Microsoft.KeyVault.SecretNewVersionCreated**
2. Action: Perform an unbound action (Dataverse)
    -	 Action name: **NotifyEnvironmentVariableSecretChange**
    -	KeyVaultUrl: **Topic**
    -	Secret name: **Subject**
  
:::image type="content" source="./media/manage-machines/UpdateEnvVariables.png" alt-text="Screenshot of the Dataverse action.":::

If you use one Key Vault for all your secrets, you need only one cloud flow. If you have several Key Vaults, you need to duplicate the cloud flow and update the resource name.
To ensure that your cloud flow is working correctly with Azure Key Vault:
-	Go to your Key Vault.
-	Select **Events**.
-	In **Events subscriptions**, check if you can see a LogicApps webhook.

:::image type="content" source="./media/manage-machines/KeyVaultUpdates.png" alt-text="Screenshot of Event subscriptions in AKV.":::

## View where secrets are used 
From Solutions page, you can retrieve all the dependencies of secret environment variables. This helps you to understand where your Azure Key Vault secrets are used before editing them.
-	Select one environment variable.
-	Select the **advanced** option and select **Show dependencies**.
-	You can see:
    -	The credentials using this environment variable.
    -	The connections using this environment variable.

## Share a credential
You can share the credentials you own with other users in your organization and give those users specific permissions to access it.
1. Sign-in to [Power Automate](https://make.powerautomate.com), and then go to **Credentials (preview)**.
2. Select your credential from the list of credentials.
3. On the command bar, select **Share**.
4. Select **Add people**, enter the name of the person in your organization with whom you would like to share the credentials, and then select the role you want to grant to this user:
    - **Co-owner** (can edit). This access level gives full permission to that credential. Co-owners can use the credential, share it with others, edit its details, and delete it.
    - **User** (can view only). This access level only gives permission to use the credential. No edit, share, or delete permissions are possible with this access.
    - **User** (can view and share). Same as above, but it gives permission to share.
5.	Select **Save**.

>[!NOTE]
> By sharing your credential, all the environment variables used in the credential are shared as well. Removing permissions on a credential doesn't remove permissions on the environment variables.

## Delete a credential
1. Sign in to [Power Automate](https://make.powerautomate.com), and then go to **Credentials (preview)**.
2. From the list, select the credential you want to delete, and then select **Delete machine** on the command bar.

>[!NOTE]
> Deleting a credential doesn't delete the associated environment variables.

## Export a desktop flow connection using credential

>[!NOTE]
>You should first read the article about [ALM for desktop flows](/power-automate/desktop-flows/alm/alm-solution).

You can export a cloud flow with a desktop flow connection using credential. 
You should import the solution containing the credential and the related environment variables first then import the one containing the cloud flow and the desktop flow. 

## Limitations
-	Currently, this feature is available only for desktop flow connections. 
-	Creating credentials in the new designer isn't available yet. 
-	You can't edit the selected environment variables in an existing credential. If you want to change the value of username and password, you need to either update the environment variables or the AKV secret.
-	Update of connections using credentials is asynchronous. It can take up to one minute for the desktop flow connection to use the new credentials after the secret is updated. 

