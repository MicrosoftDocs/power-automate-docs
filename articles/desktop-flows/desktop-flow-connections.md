---
title: Create desktop flow connections
description: See how to create connections to trigger desktop flows from cloud flows.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 07/02/2024
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

- Microsoft Entra users must be in the same tenant as the selected environment in the Power Automate portal.
- The target (machine / group) should be Microsoft Entra ID or AD joined. If there's a Microsoft Entra ID joined target, the machine or group must be synchronized with Microsoft Entra ID.
- The Microsoft Entra user account must be granted permission to open a Windows session on the target machines (interactive sign in). At runtime, there should a Windows interaction session matching the connection user in order to process the run (as it's today for existing connections).
- The tenant of the target Microsoft Entra account is configured to use modern [Authentication with Microsoft Entra ID](/azure/well-architected/).

> [!NOTE]
> Connect with sign-in for attended runs is available in the Power Platform regions.
> For GCCH, DOD, and China regions, the feature requires the December version of the Power Automate for desktop app.
> For GCC, the feature requires the July version of the Power Automate for desktop app.

### Set up the connection with sign-in

To set up a connection with sign-in:

1. Select **Connect with Sign-in** in the **Connect** dropdown.
1. Select the target (machine or machine group).
1. Select **Sign in**.
1. Pick or provide an **Microsoft Entra account** in the sign in pop-up.

The desktop flow connect is automatically created.

### How it works

- An access / refresh token is created during the Microsoft Entra authentication.
- The token scope is limited to executing a desktop flow.
- The Power Platform services manage the refresh of those tokens.

### Limitations

- Connect with sign-in (preview) works only for attended runs. Running unattended with this connection fails.
- Queue time duration is limited to one hour.

> [!IMPORTANT]
> If you consistently encounter issues when creating a connection on a new machine, first try to remove it, and then [register it](/power-automate/desktop-flows/manage-machines#register-a-new-machine) again.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
