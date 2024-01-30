---
title: Run a desktop flow in Picture-in-Picture
description: See how to run desktop flows in Picture-in-Picture mode.
author: pefelesk
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 30/01/2024
ms.author: pefelesk
ms.reviewer: 
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows in Picture-in-Picture

Power Automate enables you to run attended desktop flows within a virtual window that replicates your desktop, so that you can continue working on your machine while the automation is running in parallel. 

This attended run mode is called **Picture-in-Picture** and it is leveraging the [Child Sessions](/windows/win32/termserv/child-sessions) technology.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality.
> - These features are available before an official release so that customers can get early access and provide feedback.

## Prerequisites 

- Power Automate for desktop needs to be installed on the machine. 

- The user must be signed in.

- The user needs a trial or paid organization subscription or a pay-as-you-go environment.

- The user running flows in Picture-in-Picture should be part of the following Windows policies:
  - Computer Configuration\Windows Settings\Security Settings\Local Policies\User Rights Assignment\Allow Log On Locally
  - Computer Configuration\Windows Settings\Security Settings\Local Policies\User Rights Assignment\Access this computer from the network

## Enable Picture-in-Picture on the machine

To enable the Picture-in-Picture run mode on the machine, you can use either the [MSI installer](../install#install-power-automate-using-the-msi-installer) or enable manually during the first run in Picture-in-Picture.

> [!IMPORTANT]
>
> - Administrator rights are required to manually enable Picture-in-Picture on the machine on the first desktop flow run.

To enable through the MSI installer, make sure the **Enable Picture-in-Picture mode** option is selected during the installation process.

If you install Power Automate for desktop with [silent installation](../install-silently), Picture-in-Picture will be enabled by default on the machine. To skip the enablement of Picture-in-Picture mode, add the **-SKIPENABLEPIPMODE** argument. 

## Run a desktop flow in Picture-in-Picture

You can trigger a desktop flow in Picture-in-Picture mode through the **Power Automate console**. 

Select the target flow, open the **More actions** menu, and select **Run in Picture-in-Picture**.

:::image type="content" source="media/run-flow-pip/console-run-in-pip.png" alt-text="Run in Picture-in-Picture through the Power Automate console.":::

Alternatively, enable the **Run in Picture-in-Picture** flow property so that the flow will always run in Picture-in-Picture mode when it is triggered locally.

:::image type="content" source="media/run-flow-pip/console-pip-property.png" alt-text="Enable the Picture-in-Picture flow property.":::

:::image type="content" source="media/run-flow-pip/console-run-pip-property.png" alt-text="Run in Picture-in-Picture through the Power Automate console.":::

Upon authenticating on the Picture-in-Picture session, the flow starts running within the Picture-in-Picture window. 

:::image type="content" source="media/run-flow-pip/pip-window.png" alt-text="The flow is running in the Picture-in-Picture window.":::

Enable options **View only** to block user input, and **Always on top** to always keep the window on the foreground.

## Debug a desktop flow in Picture-in-Picture

You can debug a desktop flow in a Picture-in-Picture session directly through the **Power Automate flow designer**.

To enable the Picture-in-Picture run mode in the designer, select **Debug** and **Enable Picture-in-Picture mode**. 

:::image type="content" source="media/run-flow-pip/designer-run-in-pip.png" alt-text="Enable the Picture-in-Picture mode in the Power Automate designer.":::

## Limitations of Browser automation in Picture-in-Picture

Two instances of a web browser (Chrome, Firefox, Edge) cannot open concurrently with the same user data folder in both main and Picture-in-Picture sessions. 

If a web browser is already open on the desktop with a user data folder, then it should open in Picture-in-Picture with another user data folder. 

This limitation is handled automatically with the **User data folder** parameter in the launch browser actions in the Power Automate designer. For example, [learn more about the Launch new Microsoft Edge action](../actions-reference/webautomation#launchedgebase).

The **User data folder** parameter has the following options:

1. Picture-in-Picture default (default option)
2. Browser default
3. Custom

If it is set to **Picture-in-Picture default**, Power Automate creates a new user data folder for the browser to use when the flow runs in Picture-in-Picture mode.

> [!IMPORTANT]
>
> -  For browser automation to work successfully, use a launch browser action to open your web browser within the Picture-in-Picture window and enable the **Power Automate browser extension** on the **Picture-in-Picture** user data folder.

If it is set to **Browser default**, the browser within the Picture-in-Picture session uses the default user data folder, which is the same as the one used when the flow runs in the main session. 

> [!IMPORTANT]
>
> - If **User data folder** is set to **Browser default**, the web browser can only open in one session at a time.

If it is set to **Custom**, you can enter a custom user data folder to be used by the browser in Picture-in-Picture flow runs.

## Known issues and limitations

- If you are using a PIN to sign in to Windows, PIN authentication only works the first time the Picture-in-Picture session is launched. After that, it can only be authenticated with username and password.
- Applications that start on Windows startup are automatically launched within the Picture-in-Picture session as well. This may cause a conflict between the two sessions, as two instances of an application are running concurrently. To avoid this, do not set the applications to start automatically on Windows startup. To resolve this, it may be required to sign out and sign in again or restart the machine.
- Windows Home editions are not supported.
- The machine cannot be restarted or shut down while the Picture-in-Picture session is open.
- The clipboard is shared between the Picture-in-Picture session and the main session.
- In Windows servers, if multiple users are connected concurrently to the machine, only one Picture-in-Picture session can be launched at a time.
- The default timeout to start a process in a Picture-in-Picture is 120 seconds. If the sign in takes longer than that, a timeout error is thrown.
- Picture-in-Picture asks for credentials every time it starts in case the following Windows policy is set to *Disabled*: 
  - Local Group Policy\Computer Configuration\Administrative Templates\System\Credential Delegation\Allow delegating default credentials
- If smartcard is used to sign in to Windows, the following policy should not be set to *Enabled*:
  - Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host\Device and Resource Redirection\Do not allow smart card device redirection

[!INCLUDE[footer-include](../includes/footer-banner.md)]









