---
title: Use credentials in desktop flow connections (preview)
description: Use credentials in desktop flow connections 
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 11/09/2023
ms.author: QuentinSele
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---


# Use credentials in desktop flow connections (preview)

[This article is pre-release documentation and is subject to change.]

The new Credentials page (preview) in the Power Automate portal allows you to create, edit, share login credentials using Azure Key Vault and use them in desktop flow connections. The following table provides the feature availability information in various regions. 

  |Regions|Feature availability (preview)|
  |---|---|
  |Preview, Canada|Available|
  |All regions except Europe and US|November 2023|
  |All regions|December 2023|
  |US Government Clouds|Second half of 2024|

## Prerequisites

Credentials use secrets stored in Azure Key Vault. To allow you to create credentials, your administrator needs to configure Azure Key Vault first.
In a nutshell, admin needs to ensure:
1. Microsoft Power Platform resource provider is registered in Azure subscription
1. There is an Azure Key Vault that contains the secrets to be used in the credentials.
1. Dataverse service principal has permissions to use the secrets
1. Users who create the environment variable have appropriate permissions to the Azure Key Vault resource.
1. The Power Automate environment and the Azure subscription must be on the same tenant

To configure Azure Key Vault, follow the steps described in [this page](https://learn.microsoft.com/power-apps/maker/data-platform/environmentvariables#configure-azure-key-vault).

## Create a credential

To create your credentials, go to Credentials page. 
1. Select **more** in the left nav, then select Discover all
2. In Data, select **Credentials (preview)**. You can pin the page in the left nav to make it more accessible.

In the credentials page, you can now create your first credential.

:::image type="content" source="./media/manage-machines/CreateCredential.png" alt-text="Screenshot of the creation of a credential.":::

To create your credential, you need to provide the following information:
- **Credential name**: Enter a name for the credential
- **Description** (optional)
- **Username**: credential usernames must be **text environment variables**. To select a variable, you can use the dropdown. If you don’t have any environment variables, you must [create a text variable from the solutions page](https://learn.microsoft.com/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution).
- **Password**: the password must use a **secret environment variables**. To select a variable, you can use the dropdown. If you don’t have any secret environment variables, you must [create a secret variable from the solutions page](https://learn.microsoft.com/power-apps/maker/data-platform/environmentvariables#create-a-new-environment-variable-for-the-key-vault-secret).

> [!NOTE]
> Secret environment variables reference secrets stored in Azure Key Vault. 


## Share a credential
You can share the credential(s) you own with other users in your organization and give those users specific permissions to access it.
- Sign-in to the Power Automate portal.
-	Go to **Credentials (preview)**.
-	Select your credential from the list of credentials.
-	In the command bar, select **Share**.
-	Select **Add people** and enter the name of the person in your organization with whom you would like to share the credentials.
-	Select the role you want to grant to this user:
    - **Co-owner** (can edit). This access level gives full permission to that credential. Co-owners can use the credential, share it with others, edit its details, and delete it.
    - **User** (can view only). This access level only gives permission to use the credential. No edit, share, or delete permissions are possible with this access.
    - **User** (can view and share). Same as above, but it gives permission to share.
-	Select **Save**

>[!NOTE]
> By sharing your credential, all the environment variables used in the credential are shared as well. Removing permissions on a credential don't remove permissions on the environment variables.

## Delete a credential
1. Sign in to the Power Automate portal.
2. Go to **Credentials (preview)**.
3. From the list, select the credential you want to delete.
4. Select Delete machine in the command bar.

>[!Note]
> Deleting a credential don't delete the associated environment variables

## Create desktop flow connections using a credential
Note: Credentials (preview) are only supported in the desktop flow connections for now.
1.	Sign in to Power Automate.
2.	Create or edit a cloud flow.
3.	Add or edit a Desktop flow action (run a flow built with Power Automate for desktop)
4.	Select **Add new connection**:
    -	Select Connect with username and password.
    -	Select the machine or the machine group.
5.	Select **Switch to credentials**.
6. You can now select the credential you want to use on the selected machine and click on **Create**.

:::image type="content" source="./media/manage-machines/CreateConnection.png" alt-text="Screenshot of the connection using credentials.":::

## Update a secret (password rotation)

### Prerequisites: 
- Ensure Event Grid is registered as a Resource provider in Azure. [Learn more about resource providers](https://learn.microsoft.com/azure/azure-resource-manager/management/resource-providers-and-types).
- Ensure users who use Event Grid trigger in Power Automate have Event Grid Contributor permissions. [Learn more](https://learn.microsoft.com/azure/event-grid/security-authorization)

>[!Note]
>This section requires specific permissions such as system admin of the organization otherwise only your own desktop flow connections will be updated. 

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
  
:::image type="content" source="./media/manage-machines/UpdateEnvVariable.png" alt-text="Screenshot of the Dataverse action.":::

If you use one Key Vault for all your secrets, you need only one cloud flow. If you have several Key Vaults, you need to duplicate the cloud flow and simply update the resource name.
To ensure that your cloud flow is working correctly with Azure Key Vault:
-	Go to your Key Vault
-	Select **Events**
-	In **Events subscriptions**, check if you can see a LogicApps webhook.

:::image type="content" source="./media/manage-machines/KeyVaultUpdates.png" alt-text="Screenshot of Event subscriptions in AKV.":::

## View where secrets are used 
From Solutions page, you can retrieve all the dependencies of secret environment variables. This helps you to understand where your Azure Key Vault secrets are used before editing them.
-	Select one environment variable.
-	Select the **advanced** option and select **Show dependencies**.
-	You can see:
      -	The credentials using this environment variable.
    -	The connections using this environment variable.

## Export a desktop flow connection using credential
>[!NOTE]
>You should read first the article about [ALM for desktop flows](https://learn.microsoft.com/power-automate/desktop-flows/alm/alm-solution)

You can export a cloud flow with a desktop flow connection using credential. 
You should import the solution containing the credential and the related environment variables first then import the one containing the cloud flow and the desktop flow. 

## Limitations
-	Credentials (preview) are only available for desktop flow connections for now. 
-	Creating credentials in the new designer is not available yet. 
-	You cannot edit the selected environment variables in an existing credential. If you want to change the value of username and password, you need to either update the environment variables or the AKV secret.
-	Update of connections using credentials is asynchronous but should not exceed 1 minute. 

