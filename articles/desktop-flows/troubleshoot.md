---
title: Troubleshoot desktop flows
description: See how to troubleshoot common issues of Power Automate desktop flows.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/21/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- PetrosFeleskouras
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot desktop flows

To open the Power Automate troubleshoot tool:

1. Launch **Power Automate machine runtime**
1. Select **Troubleshoot**
1. Select **Launch Troubleshoot tool**  

>[!NOTE]
>You need to have admin privileges to open the troubleshoot tool from Power Automate machine runtime.  

## Resolve sign in and sign out issues

Power Automate uses a file named **msalcache.bin3** to acquire tokens and authenticate users.

If you encounter errors while signing in or signing out, try to erase all the stored tokens by deleting this file. To delete the file, navigate to **C:\Users\Username\AppData\Local\Microsoft\Power Automate Desktop\Cache**.

> [!NOTE]
> If the **AppData** folder isn't visible in your user folder, try to [display hidden files](https://support.microsoft.com/windows/show-hidden-files-0320fe58-0117-fd59-6851-9b7f9840fdb2).

If you have Power Automate installed in another drive, replace **C** with the letter of the respective drive. Also, replace **Username** with the name of your user folder.

After deleting the **msalcache.bin3** file, restart the Power Automate service and sign in to your account.

:::image type="content" source="media/troubleshoot/msal-file.png" alt-text="Screenshot of the msalcache.bin3 file in the file explorer.":::

### Sign in using Web Account Manager (WAM)

By default, Power Automate for desktop uses an Internet Explorer client to facilitate user authentication. If you encounter errors while signing in, try setting it to authenticate users through Web Account Manager (WAM).

WAM allows signing in using accounts already registered to Windows without requiring passwords. You can find more information regarding WAM in [this article](/azure/active-directory/develop/scenario-desktop-acquire-token-wam).

To enable the WAM functionality in Power Automate for desktop, modify the [appropriate registry entry](governance.md#allow-users-to-sign-in-to-power-automate-for-desktop-using-web-account-manager-wam).

## Resolve failed connection between Power Automate components

In some cases, Power Automate may display an error indicating that the connection between its components couldn't be established.

The cause of this error can be another process running a named pipes server in the same machine. This process probably runs with elevated rights using the localhost endpoint. As a result, it blocks other applications from using the endpoint.

To identify whether another process is indeed the issue:

- Close Power Automate and use Windows Task Manager to ensure that its process isn't still running.

- Download the [Sysinternals Suite](/sysinternals/downloads/sysinternals-suite).

- Extract the zip file to a folder on your desktop.

- Run a command prompt session as administrator.

- Navigate to the folder in which you've extracted Sysinternals.

- Run the following command:

  ``` CMD
  handle net.pipe
  ```

  Running this command should display a list of processes that use named pipes and the address they listen to.

  :::image type="content" source="media/troubleshoot/command-prompt.png" alt-text="Screenshot of the results of the handle net.pipe command.":::

- Identify whether a process displaying the string **EbmV0LnBpcGU6Ly8rLw==** exists.

- If such a process exists, stop the process identified in the previous step, and try again to launch Power Automate.

As a permanent fix, you can stop the process causing the issue from running. Alternatively,  if it's an internal process, you can change it to use a more specific endpoint, such as **net.pipe://localhost/something**.

If none of the above is possible, specify Power Automate executables to run as administrator. However, this solution may not solve the issue in all cases, and it will cause a UAC prompt to appear each time.

## Change the on-premises Service account

The UIFlowService uses the virtual account **NT SERVICE\UIFlowService**. This account needs the ability to "Log on as a service" in order to successfully start.

Most environments don't require to change the default configuration. If your company has some restrictions in place, you can either ask your domain administrator to grant **NT SERVICE\UIFlowService** the right to **Log on as a service** or change the account here with an allowed one.

1. Select **Change account**
1. Select **This account**
1. Provide the new account, for example: **DOMAIN\AlexJohnson** 
1. Provide the password of this account and select **Configure**

:::image type="content" source="media/troubleshoot/power-automate-troubleshoot-dialog.png" alt-text="Screenshot of the Power Automate troubleshoot dialog.":::

## Troubleshoot desktop flow runs

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for the China region. Switch to our machine-management capabilities. [Learn more about the switch from gateways to direct connectivity.](manage-machines.md#switch-from-gateways-to-direct-connectivity)

- If your unattended desktop flow fails with the **cannot create new session** message, perform the following steps to resolve the issue:

    1. On Windows 10 or Windows 11, confirm that you don't have an active user session locked or unlocked on your target machine.

    2. On Windows Server (2016, 2019, or 2022), confirm that you have yet to reach the maximum number of active user sessions configured for your device. Desktop flows can only run if they can create new sessions.

- If the **gateway status** is **offline**, confirm that the device is turned on and connected to the Internet. To find more information regarding gateway troubleshooting, go to [Troubleshoot the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot).

- If the **gateway status** is **online**, try the following actions:

   1. Confirm that the Power Automate for desktop app and services are running on your device.

   1. Restart the service on your device.

## Collect machine logs

There are several logs you can collect for the machine’s configuration and service logs. To do so, select **Exports logs** link in the Troubleshoot tool.

:::image type="content" source="media/troubleshoot/power-automate-machine-logs.png" alt-text="Screenshot of the Machine logs.":::

This file is saved to the desktop as a zip file.

## Resolve Power Automate agent for virtual desktops issues

If you encounter errors while launching the Power Automate agent for virtual desktops, perform the following steps:

1. Close the RDP or Citrix session.
1. Ensure you've installed the correct version of Power Automate for desktop.
1. Connect again to the RDP or Citrix virtual desktop.
1. Restart the Power Automate agent for virtual desktops.

If the agent for virtual desktops can't communicate with Power Automate for desktop, the agent will be closed. If you're sure that a correct Power Automate for desktop version is installed, one that supports UI automation in virtual desktops, try the following remediation steps:

1. Open PowerShell
1. Navigate to the appropriate directory using the following command:

    ``` PowerShell
    cd "C:\Program Files (x86)\Power Automate Desktop\RDP\DVCPlugin\x64"
    ```

1. Run the following two commands:

    ``` PowerShell
    regsvr32 /u .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll
    ```

    ``` PowerShell
    regsvr32  .\Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin.dll"
    ```

## Troubleshoot missing on-premises data gateway

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for China region. Switch to our machine-management capabilities. To learn more, go to [Switch from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

The following reasons might cause you to not find your on-premises data gateway in the displayed list on the Power Automate portal.

- The gateway may be installed in a different region than your Power Automate region. To resolve this issue, uninstall the gateway from the device, and then reinstall it, selecting [the correct Power Automate region](../regions-overview.md#region-mappings-for-power-automate-and-gateways).
- The gateway has been deleted by its owner.

## Get self-help or ask help from support

If you need help, use our self-help options, or ask for help from support.

### Self help

1. Go to the [Power Automate support site](https://make.powerautomate.com/support/).
1. Go to the **Self Help** category, and select one of the available self-help options.

### Ask for help from support

1. Go to the [Power Automate support site](https://make.powerautomate.com/support/).
1. Select **Contact support** under the **Ask for help** category.
1. Enter **Desktop flows** in **Problem type**, and populate the other fields with information about your issue.
1. Select **See solutions**.

> [!IMPORTANT]
> We offer full support for all Power Automate for desktop product versions released within a year from the latest public product release. For product releases prior to a year back from the latest release, only issues of severity level **Critical** and **Severity A** are supported.
>
>To find more information about severity levels, go to [Support overview](/power-platform/admin/support-overview#what-is-initial-response-time-and-how-quickly-can-i-expect-to-hear-back-from-someone-after-submitting-my-support-request). To see what are the currently supported releases, go to [Released versions for Power Automate for desktop](/power-platform/released-versions/power-automate-desktop).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
