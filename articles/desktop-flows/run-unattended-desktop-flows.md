---
title: Run unattended desktop flows
description: See how to run unattended desktop flows on your device.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/15/2023
ms.author: pefelesk
ms.reviewer: gtrantzas
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Run unattended desktop flows

[Triggering desktop flows from cloud flows](trigger-desktop-flows.md) enables you to run desktop flows in unattended mode. Unattended desktop flows are ideal for automating tasks that don't need human supervision.

Power Automate uses the selected [desktop flow connection](desktop-flow-connections.md) to automatically sign in to your machine and run the unattended desktop flow. When the flow is complete, it signs out from the device and reports its activity.

When running desktop flows in unattended mode, keep in mind that:

- Power Automate creates a remote desktop (RDP) session on the machine to run unattended desktop flows. Connecting to the machine's console session isn't available for unattended runs.

- Power Automate creates, manages, and then releases the Windows user session on the target devices.

- Unattended desktop flows keep the screen of the target machine locked so no one can see them running.

- Windows 10 and Windows 11 devices can't run unattended desktop flows if any active Windows user sessions are present (even a locked one).

- On Windows Server, if you have a locked Windows user session open with the same user as the desktop flow connection, you receive an error.

>[!IMPORTANT]
>
> - The user specified in the connection must have permissions to create a remote desktop session on the machine.
> - Unattended desktop flows require an available machine with all users signed out.
> - Locked Windows user sessions will prevent unattended desktop flows from running.
> - Unattended desktop flows can't run with elevated privileges.

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

## Known issues and limitations

- Reusing sessions isn't supported on machines that allow users to have multiple sessions (users aren't restricted to a single session).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
