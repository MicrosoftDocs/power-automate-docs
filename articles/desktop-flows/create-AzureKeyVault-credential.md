---
title: Create an Azure Key Vault credential 
description: Learn how to create a credential with secret stored in Azure Key Vault.
author: QuentinSele
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 04/11/2025
ms.author: quseleba
ms.reviewer: 
contributors:
  - DanaMartens
  - yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---
# Create an Azure Key Vault credential

The **Credentials** page in Power Automate allows you to create, edit, and share sign in credentials using Azure Key Vault and use them in desktop flows or desktop flow connections.

You can also [create credentials with CyberArk® (preview)](create-cyberark-credential.md).

> [!IMPORTANT]
> - Currently, this feature isn't available for US Government Clouds.

## Prerequisites

Credentials use secrets stored in Azure Key Vault. To create credentials, your admin must first set up Azure Key Vault.

In short, the admin needs to ensure:

1. Microsoft Power Platform resource provider is registered in Azure subscription.
1. There's an Azure Key Vault that contains the secrets to be used in the credentials.
1. Dataverse service principal has permissions to use the secrets.
1. Users who create the environment variable have appropriate permissions to the Azure Key Vault resource.
1. The Power Automate environment and the Azure subscription must be on the same tenant.

To configure Azure Key Vault, follow the steps described in [Configure Azure Key Vault](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets#configure-azure-key-vault).

### Certificate-based authentication (preview)

Microsoft Entra ID certificate-based authentication is a single factor authentication that lets you meet multifactor authentication (MFA) requirements.
Instead of using password-based authentication, use certificate-based authentication (CBA), which verifies your identity based on digital certificates.

To use CBA, follow the steps in [Configure certificate-based authentication](configure-certificate-based-auth.md). Otherwise, start creating a credential.

## Create a credential

To create your credentials:

1. Go to the **Credentials** page. If you don't see the **Credentials** page, follow these steps:
   1. Select **More** in the left nav, then select **Discover all**.
   1. Under **Data**, select **Credentials**. You can pin the page in the left navigation to make it more accessible.

1. On the **Credentials** page, create your first credential by selecting **New Credential**.

:::image type="content" source="./media/manage-machines/define-name.png" alt-text="Screenshot of defining the name of the credential.":::

### Define credential name

Provide the following information to create your credential:

- **Credential name**: Enter a name for the credential
- **Description** (optional)

### Select credential store

1. After selecting **Next**, select location to use credential.
1. Select **Connection**, **Desktop flow**, or **Network** as the location to use the credential. 
1. If prompted, select **Azure Key Vault** as the type of credential store, and then select **Next**.

  | Location to use credential | Description                    | Supported  Azure Key Vault authentication                   |
  | --------- | ------------------------------ | ------------ |
  | **Connection** | Used in a desktop flow connection, the credential is used to sign into the machine during runtime (attended and unattended runs). | • Username and password<br> • Certificate-based authentication |
  | **Desktop flow** | In desktop flow automation, credentials let you sign in, enter passwords, and perform similar actions without storing sensitive information in the script. | • Username and password |
  | **Network** | Used when creating [Microsoft Entra hybrid join network connection](hosted-machine-groups.md#additional-requirements-for-microsoft-entra-hybrid-joined-hosted-machines-groups-preview) for hosted machine groups. | • Username and password   |

### Select credential values

In the last step of the wizard, select credential values. Depending on the location to use the credential, there might be two types of supported authentications:

1. **Username and password**: The secret stored in the vault is a password.
1. **Certificate-based authentication**: The secret stored in the vault is a certificate.

- **Username**: To select a username, you can use the dropdown. If you don’t have any environment variables, select **new**:
  - **Display name**. Enter a name for the environment variable.
  - **Name**. The unique name is automatically generated from the Display name, but you can change it.
  - **Value**. Populate the name of the user. For local users, provide username. For domain users, provide `<DOMAIN\username>` or `<username@domain.com>`.

    :::image type="content" source="./media/manage-machines/define-username.png" alt-text="Screenshot of defining the username of the credential.":::

> [!NOTE]
> Credential username is a text environment variable. You can also [create a text variable from the solutions page](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution) and select it as username.

- **Password**: To select a password, you can use the dropdown. If you don’t have any secret environment variables, select **new**:
  - **Display name**. Enter a name for the environment variable.
  - **Name**. The unique name is automatically generated from the Display name, but you can change it.
  - **Subscription id**. The Azure subscription ID associated with the key vault.
  - **Resource group name**. The Azure resource group where the key vault that contains the secret is located.
  - **Azure key vault name**. The name of the key vault that contains the secret.  
  - **Secret name**. The name of the secret located in Azure Key Vault.

:::image type="content" source="./media/manage-machines/define-password.png" alt-text="Screenshot of defining the password of the credential.":::
  
> [!NOTE]
> The subscription ID, resource group name, and key vault name can be found on the Azure portal Overview page of the key vault. The secret name can be found on the key vault page in the Azure portal by selecting Secrets under Settings.
> User access validation for the secret is performed in the background. If the user doesn’t have at least read permission, this validation error is displayed: "This variable didn't save properly. User is not authorized to read secrets from 'Azure Key Vault path'."
> Passwords use **secret environment variables**. You can also [create a secret variable from the solutions page](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets) and select it as password.

## Create desktop flow connections using a credential

You can now use your credential in a [desktop flow connections](desktop-flow-connections.md)

## Use the credential in a desktop flow action

1. Make sure you have a [registered machine](manage-machines.md) where your desktop flow runs. The credential is retrieved from this machine.  

    > [!NOTE]
    > The registered machine is required for credentials to work properly at runtime, even for local attended or debugging runs.

1. In the desktop flow designer, select the **[Power Automate secret variables](actions-reference/powerautomatesecretvariables.md)** module and then select the **[Get credential](actions-reference/powerautomatesecretvariables.md#getcredentialaction)** action.
1. Specify the credential to retrieve. You see only the credentials defined as usable in a desktop flow. Credentials using Azure key vault or CyberArk as a vault are supported.
1. Define the name of the variable you create. This variable is marked as "sensitive" and can't be changed. This means the value of this variable isn't stored in the logs.

    > [!NOTE]
    > Credential type variables are always enforced to be [sensitive](manage-variables.md#sensitive-variables), independently of how they're produced (**Get credential** action or reassigning a credential variable to a new one, which inherits the same variable type). The same applies to the 'Password' property of credential variables.

1. After you select **Save**, use your credential in another action. All Power Automate actions can use credentials.
1. In the action field, select the variable picker. In your flow variables list, find your credential and expand it. You can see the attributes **Username** and **Password**. Select the one you want to use in this action (double-click).
1. Run your flow.

## View where secrets are used

From Solutions page, you can retrieve all the dependencies of secret environment variables. This helps you to understand where your Azure Key Vault secrets are used before editing them.

- Select one environment variable.
- Select the **advanced** option and select **Show dependencies**.
- You can see:
  - The credentials using this environment variable.
  - The connections using this environment variable.

## Share a credential

You can share the credentials you own with other users in your organization and give those users specific permissions to access it.

1. Sign-in to [Power Automate](https://make.powerautomate.com), and then go to **Credentials**.
1. Select your credential from the list of credentials.
1. On the command bar, select **Share**.
1. Select **Add people**, enter the name of the person in your organization with whom you would like to share the credentials, and then select the role you want to grant to this user:
    - **Co-owner** (can edit). This access level gives full permission to that credential. Co-owners can use the credential, share it with others, edit its details, and delete it.
    - **User** (can view only). This access level only gives permission to use the credential. No edit, share, or delete permissions are possible with this access.
    - **User** (can view and share). This access level is the same as the can view only option, but it gives permission to share.
1. Select **Save**.

>[!NOTE]
> By sharing your credential, all the environment variables used in the credential are shared as well. Removing permissions on a credential doesn't remove permissions on the environment variables.

## Delete a credential

1. Sign in to [Power Automate](https://make.powerautomate.com), and then go to **Credentials**.
1. From the list, select the credential you want to delete, and then select **Delete machine** on the command bar.

>[!NOTE]
> Deleting a credential doesn't delete the associated environment variables.

## Export a desktop flow connection using credential

>[!NOTE]
>You should first read the article about [ALM for desktop flows](/power-automate/desktop-flows/alm/alm-solution).

You can export a cloud flow with a desktop flow connection using credential.
You should import the solution containing the credential and the related environment variables first then import the one containing the cloud flow and the desktop flow.

## Limitations

- Currently, this feature is available only for desktop flow connections.
- You can't edit the selected username and secret in an existing credential. If you want to change the value of username and password, you need to either update the environment variables or the Azure Key Vault secret.
- If your environment uses a managed identity to [access your Azure Data Lake](/power-apps/maker/data-platform/azure-synapse-link-msi), that identity is also used to access your Azure Key Vault. Only one enterprise policy can connect to the Dataverse environment simultaneously. Ensure that the managed identity has the appropriate permissions to the Azure Key Vault resource.

## Update a secret (password rotation) - Deprecated

> [!NOTE]
> This section is now deprecated for desktop flow connections. Desktop flow connections using Credentials are now retrieving secrets during the flow execution. It is not necessary anymore to create this custom flow to update the connections.
> The connections using Credentials created before April 2024 should be updated to benefit of the automatic update.

### Prerequisites for updating a secret (password rotation)

- Ensure Event Grid is registered as a Resource provider in Azure. [Learn more about resource providers](/azure/azure-resource-manager/management/resource-providers-and-types).
- Ensure users who use Event Grid trigger in Power Automate have Event Grid Contributor permissions. [Learn more](/azure/event-grid/security-authorization)

> [!NOTE]
> This section requires specific permissions such as system admin of the organization otherwise only your own desktop flow connections will be updated.

### Create a cloud flow using Event Grid trigger

When you edit secrets in your Azure Key Vault, you want to ensure that the credentials and connections using these secrets are always up to date to avoid breaking your automations.
In Power Automate, you need to create a cloud flow that updates the credentials when secrets are changed in Azure Key Vault.

This cloud flow contains one trigger and one action:

1. Trigger: When a resource event occurs (Event Grid)
    - Resource type: **Microsoft.KeyVault.vaults**
    - Resource name: Provide the name of the key vault.
    - Subscription: Provide the name of the subscription.
    - Event type: **Microsoft.KeyVault.SecretNewVersionCreated**
2. Action: Perform an unbound action (Dataverse)
    - Action name: **NotifyEnvironmentVariableSecretChange**
    - KeyVaultUrl: **Topic**
    - Secret name: **Subject**
  
:::image type="content" source="./media/manage-machines/update-environment-variables.png" alt-text="Screenshot of the Dataverse action.":::

If you use one Key Vault for all your secrets, you need only one cloud flow. If you have several Key Vaults, you need to duplicate the cloud flow and update the resource name.

To ensure that your cloud flow is working correctly with Azure Key Vault:

1. Go to your Key Vault.
1. Select **Events**.
1. In **Events subscriptions**, check if you can see a LogicApps webhook.

:::image type="content" source="./media/manage-machines/keyvault-updates.png" alt-text="Screenshot of Event subscriptions in Azure Key Vault.":::
