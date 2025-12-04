---
title: Install Power Automate silently
description: Learn how to install Power Automate for desktop without user intervention.
author: mattp123
ms.topic: concept-article
ms.date: 01/30/2024
ms.author: pefelesk
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---

# Install Power Automate silently

You can use the same installer for both [manual](install.md) and silent installation of Power Automate. Silent installation means that no user intervention is required during installation.

1. Download [Power Automate for desktop](https://go.microsoft.com/fwlink/?linkid=2102613). Save the file to your desktop or Downloads folder.

1. Open the **Start** menu, search for **Command Prompt**, and then run it as administrator.

    :::image type="content" source="media/desktop-flows-setup/command-prompt.png" alt-text="Screenshot of the command prompt on the start menu.":::

1. Navigate to the directory to which you downloaded the Power Automate installer; for example:

   ```CMD
    cd C:\Users\Admin\Downloads\
   ```

1. Run the following command to run the installer silently:

   ```CMD
   Setup.Microsoft.PowerAutomate.exe -Silent -Install -ACCEPTEULA
   ```

   >[!IMPORTANT]
   > You must include the "-ACCEPTEULA" argument to indicate that you accept the [terms and conditions](/dynamics365/legal/slt-power-automate-desktop) for Power Automate.

## Command line arguments

You can use more arguments in the command line to customize the installation. Use the help menu to view command line arguments you can use.

```CMD
Setup.Microsoft.PowerAutomate.exe -HELP
```

|Command|Description|
|----|----|
| -INSTALLPATH:Value |Specify the full path of the installation folder that will be created. Default: `%PROGRAMFILES(X86)%\Power Automate`|
| -ALLOWOPTIONALDATACOLLECTION |Enables sending optional usage data to Microsoft.|
| -DISABLEPADSHORTCUT |Doesn't create a shortcut for Power Automate for desktop.|
| -DISABLETURNONRDP |Doesn't turn on Remote Desktop on the machine.|
| -ACCEPTEULA |Accepts the end user license agreement needed for the installation.|
| -RESTOREDEFAULTCONFIG |Restores to the default installation settings during an upgrade.|
| -DONOTINSTALLPAD |Doesn't create a shortcut for Power Automate for desktop.|
| -DONOTINSTALLMACHINERUNTIME |Doesn't install Power Automate machine-runtime app.|
| -SKIPINSTALLINGJAVAAUTOMATION |Doesn't install files that are required for enabling UI automation in Java applets.| 
| -SKIPENABLEPIPMODE |Doesn't enable Picture-in-Picture run mode on the machine.|
| -SKIPGATEWAYSUPPORT |Doesn't install certificates or start the http server required for use with the on-premises data gateway.| 
| -ADDGATEWAYSUPPORT |Re-enables on-premises data gateway support after it has been disabled with the SKIPGATEWAYSUPPORT parameter.|

Here's an example of a command that installs Power Automate silently in the folder My Programs\foo on the D: drive:

```CMD
Setup.Microsoft.PowerAutomate.exe -Silent -Install -ACCEPTEULA -INSTALLPATH: D:\My Programs\foo
```

## Update Power Automate silently

To update Power Automate silently, use the same command line arguments that you use to install it.

>[!NOTE]
>All your data and settings, including telemetry, shortcuts, and more, are retained when you update Power Automate. Therefore, if you want to change the settings that were enabled or disabled on installation, you need to uninstall and reinstall Power Automate.

## Uninstall Power Automate silently

Use the following command to silently uninstall Power Automate:

```CMD
Setup.Microsoft.PowerAutomate.exe -Silent -Uninstall
```

## Install an on-premises data gateway with PowerShell cmdlets

> [!IMPORTANT]
> Gateways for desktop flows are deprecated except for China region. Switch to our machine-management capabilities. Learn more about [switching from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

To find information about how to install, configure, and manage a gateway using PowerShell cmdlets, go to [PowerShell Cmdlets for On-premises data gateway management](/powershell/gateway/overview). To use the cmdlets, you must run them from PowerShell 7.0.0 or higher with elevated permissions.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
