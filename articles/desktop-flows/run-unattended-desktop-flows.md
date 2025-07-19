---
title: Run unattended desktop flows
description: See how to run unattended desktop flows on your device.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 02/10/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
  - iomavrid
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-ropc-nochange
---
# Run unattended desktop flows

[Triggering desktop flows from cloud flows](trigger-desktop-flows.md) enables you to run desktop flows in unattended mode. Unattended desktop flows are ideal for automating tasks that don't need human supervision.

> [!TIP]
> For unattended desktop automation, you need the [Power Automate Process](https://powerautomate.microsoft.com/pricing/) plan. More information: [Allocate and assign the Process license](/power-platform/admin/power-automate-licensing/buy-licenses#assign-process-license)

Power Automate uses the selected [desktop flow connection](desktop-flow-connections.md) to automatically sign in to your machine and run the unattended desktop flow. When the flow is complete, it signs out from the device and reports its activity.

When running desktop flows in unattended mode, keep in mind that:

- Power Automate creates a remote desktop (RDP) session on the machine to run unattended desktop flows. Connecting to the machine's console session isn't available for unattended runs.

- Power Automate creates, manages, and then releases the Windows user session on the target devices.

- Unattended desktop flows keep the screen of the target machine locked so no one can see them running.

- Windows 10 and Windows 11 devices can't run unattended desktop flows if any active Windows user sessions are present (even a locked one).

- On Windows Server, if you have a locked Windows user session open with the same user as the desktop flow connection, you receive an error.

- The user specified in the connection must have permissions to create a remote desktop session on the machine. In most cases this means the user must be a member of the **Remote Desktop Users** group on the machine. On some Citrix configurations, the user must be in the **Direct Access Users** group.

- The default screen resolution of the remote desktop session might be different than the one used during flow authoring. This might create different conditions, such as smaller screen size, less visible elements in target app, and so on, for the flows that run in unattended mode. This can result in errors if a target element isn't found, or even in interacting with the wrong element if keyboard or mouse actions are used. To prevent this behavior, [set the proper screen resolution on unattended mode](how-to/set-screen-resolution-unattended-mode.md).

>[!IMPORTANT]
>
> - Unattended desktop flows require an available machine with all users signed out.
> - Locked Windows user sessions will prevent unattended desktop flows from running.
> - Unattended desktop flows can't run with elevated privileges.
> - Logging into a machine during an unattended flow execution isn't supported and might cause the flow to fail.

## Reuse a Windows session in unattended mode

Desktop flows can run on a Windows session as long as it exists and is unlocked for unattended runs.

Power Automate creates a new session for each unattended run on the machine using the credentials provided in the connection. The flow runs on this session, and then Power Automate signs it off.

The **reuse Windows session** functionality allows desktop flows to run on an existing session. After a desktop flow run, the session gets locked, and Power Automate can reuse it for another run.

To allow reusing Windows session:

1. Sign in to Power Automate.

1. Select **Monitor**, and then select **Machines**.

1. Select the target machine or machine group.

1. Select **Settings** in the Command bar.

1. Enable **Reuse sessions for unattended runs**.

> [!NOTE]
> When you add machines to machine groups, they inherit the settings of the group. When you remove machines from machine groups, they keep the settings defined at the group level.

## Admin consent for unattended runs using CBA or sign-in credentials with NLA (preview)

[!INCLUDE [cc-preview-features-definition](../includes/cc-beta-prerelease-disclaimer.md)]

To perform unattended runs with Microsoft Entra ID using certificate-based authentication (CBA) or sign-in credentials with Network Level Authentication (NLA), follow these steps:

[!INCLUDE [preview-tags](../includes/cc-preview-features-definition.md)]

### Step 1 - Enable Microsoft Entra authentication for RDP

[Enable Microsoft Entra authentication for RDP](/azure/virtual-desktop/configure-single-sign-on#enable-microsoft-entra-authentication-for-rdp) only for the AppID `a4a365df-50f1-4397-bc59-1a1564b8bb9c` (MSRDspId).

### Step 2 - Hide the consent prompt dialog for a target device group

[Hide the consent prompt dialog](/azure/virtual-desktop/configure-single-sign-on#hide-the-consent-prompt-dialog) only for the AppID `a4a365df-50f1-4397-bc59-1a1564b8bb9c` (MSRDspId).

The desktop flow fails with an `MSEntraRemoteDesktopAppConsentRequired` error if consent isn't granted.

> [!NOTE]
> To authenticate with Microsoft Entra ID using a username and password with Network Level Authentication, ensure the following prerequisites are met:
> - Install Power Automate Desktop version 2.50 or later on your machine.
> - Ensure required [endpoints for Power Automate services](/power-automate/ip-address-configuration) are accessible, specifically `config.edge.skype.com`.

## Known issues and limitations

- Reusing sessions isn’t supported on machines that allow users to have multiple sessions (users aren’t restricted to a single session).
- Audio peripherals (such as microphones and speakers), cameras, webcams, and video capture peripherals aren't supported in unattended desktop flows.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
