---
title: Create desktop flow connections
description: See how to create connections to trigger desktop flows from cloud flows.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/08/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Create desktop flow connections

> [!IMPORTANT]
> Before using a machine to run desktop flows from the cloud, ensure that the machine is secured and the machine's admins are trusted.

Before using the **Run desktop flow** action in your cloud flow to trigger a desktop flow, you need to create a connection to your machine. To create a connection:

1. Sign in to [Power Automate](https://make.powerautomate.com), go to **Data** > **Connections**,  and then select **New connection**.

    :::image type="content" source="media/desktop-flows-setup/new-connection.png" alt-text="Screenshot of the option to create a new connection.":::

1. Search for **Desktop flows**, and then select the appropriate result.

> [!NOTE]
> Desktop flows connection cannot be shared with other users.

There are two different methods to connect Power Automate with your machines (or groups).

## Connect with username and password

With this option, you need to provide the machine information and device credentials:

- **Connect**: Select if you want to connect to a machine or a machine group.

    To connect to a machine or a machine group, select **Connect with username and password**, and choose the appropriate machine or machine group in  **Machine or machine group**.

    :::image type="content" source="./media/manage-machines/select-machine.png" alt-text="Select Machine":::

### Option 1: Select credential

1. Select **Switch to credentials**.
1. You can now select the credential you want to use on the selected machine and select **Create**. If you don't have any credential yet, select **New credential**. You can create credentials with secrets stored in [Azure Key Vault](create-azurekeyvault-credential.md) or [CyberArk®](create-cyberark-credential.md) (preview).

:::image type="content" source="./media/manage-machines/select-credential.png" alt-text="Select credential.":::

### Option 2: Enter username and password 

- **Domain and username**: Provide your device account. To use a local account, populate the name of the user (for example, `<MACHINENAME\User>` or `<local\User>`) or a Microsoft Entra ID account, such as `<DOMAIN\User>` or `<username@domain.com>`.

- **Password**: Your account’s password.

  :::image type="content" source="media/desktop-flows-setup/credentials-screen.png" alt-text="Screenshot that shows where to enter the credentials for the connection.":::

## Connect with sign-in for attended runs

With this option, you don't need to provide session credentials. This option might be helpful when your organization doesn't allow username and password for user sessions.

### Prerequisites

To use connection with sign-in, you need to meet the following prerequisites:

- Microsoft Entra ID users must be in the same tenant as the selected environment in the Power Automate portal.
- The target (machine / group) should be Microsoft Entra joined or AD domain-joined. Microsoft Entra joined targets must be synchronized with Microsoft Entra ID.
- If the target is AD domain-joined but not Entra joined, you must [allowlist your Power Platform tenant](how-to/allowlist-tenant-for-connect-with-sign-in-and-registration.md).
- The Microsoft Entra user account must be granted permission to open a Windows session on the target machines (interactive sign in). At runtime, there should be a Windows user session matching the connection user opened on the machine in order to process the run (same as running attended with other connection types).
- The tenant of the target Microsoft Entra account is configured to use modern [Authentication with Microsoft Entra ID](/azure/well-architected/).

### Set up the connection with sign-in

To set up a connection with sign-in:

1. Select **Connect with Sign-in** in the **Connect** dropdown.
1. Select the target (machine or machine group).
1. Select **Sign in**.
1. Pick or provide an **Microsoft Entra account** in the sign in pop-up.

The desktop flow connection is automatically created.

### How it works

- An access / refresh token is created by the Microsoft Entra ID authentication during connection creation.
- The created token's scope is limited to executing desktop flows.
- The Power Platform services manage these tokens.

### Limitations

- Connect with sign-in works only for attended runs. Running unattended with this kind of connection will fail.
- Connect with sign-in runs likely fail with a PasswordlessTokenExpiry error if **AsyncDisabled** is set to True.
- Queue time duration is limited to one hour.
- On AD-joined but not Entra-joined machines, you must [allowlist your Power Platform tenant](how-to/allowlist-tenant-for-connect-with-sign-in-and-registration.md) for your machine to trust passwordless tokens from that tenant. If your tenant is not allowlisted, connect with sign-in runs will most likely fail with `UnallowedTenantForConnectWithSignIn` errors. Connect with sign-in connection creation and testing will fail with either `Unable to connect. The credentials for the machine are incorrect.` or `Tenant [tenantId] needs to be explicitly allowlisted to authorize 'connect with sign-in' runs on the machine` error messages.

> [!IMPORTANT]
> If you consistently encounter issues when creating a connection on a new machine, first try to remove it, and then [register it](/power-automate/desktop-flows/manage-machines#register-a-new-machine) again.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
