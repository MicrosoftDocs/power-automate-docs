---
title: Install Power Automate silently
description: See how to install Power Automate silently on your device.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/07/2022
ms.author: gtrantzas
ms.reviewer: pefelesk
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Install Power Automate silently

>[!NOTE]
>You can use the same installer for both [manual](install.md) and silent installation of Power Automate.

To install Power Automate silently:

1. Download [Power Automate for desktop](https://go.microsoft.com/fwlink/?linkid=2102613).

1. Open the **Start** menu, search for **Command Prompt**, and then run it as administrator.

    :::image type="content" source="media/desktop-flows-setup/command-prompt.png" alt-text="Screenshot of the command prompt on the start menu.":::

1. Use commands to navigate to the directory in which you've downloaded the Power Automate installer. This directory is usually the **Downloads** folder.

   ```CMD
    cd C:\Users\Admin\Downloads\
   ```

1. Run the following command to run the installer and complete the setup of Power Automate.

   ```CMD
   Setup.Microsoft.PowerAutomate.exe -Silent -Install -ACCEPTEULA
   ```

   >[!IMPORTANT]
   > You must provide the "-ACCEPTEULA" argument to indicate that you accept the [terms and conditions](/dynamics365/legal/slt-power-automate-desktop) for Power Automate.

## Command line argument details

You can use the help menu of the command prompt to see all the available command line arguments for the Power Automate installation.

```CMD
Setup.Microsoft.PowerAutomate.exe -HELP
```

|Command|Description|
|----|----|
|-INSTALLPATH:Value|The full path of the installation folder that will be created. Default: <br />is `%PROGRAMFILES(X86)%\Power Automate`.|
|-ALLOWOPTIONALDATACOLLECTION|Enables sending optional telemetry data to Microsoft.|
|-DISABLEPADSHORTCUT|Doesn't create a shortcut for Power Automate for desktop.|
|-DISABLETURNONRDP|Doesn't turn on Remote Desktop on the machine.|
|-ACCEPTEULA|Accepts the end user license agreement needed for the installation.|
|-RESTOREDEFAULTCONFIG|Restores to the default installation settings during an upgrade.|
|-DONOTINSTALLPAD|Skips installing Power Automate for desktop.|
|-DONOTINSTALLMACHINERUNTIME|Skips installing Power Automate machine-runtime app.|
<!-- |-SKIPINSTALLINGJAVAAUTOMATION|Skips installing files that are required for enabling UI automation in Java applets.| -->

Here's an example of a command line argument that installs Power Automate:

```CMD
Setup.Microsoft.PowerAutomate.exe -SILENT -Install -ACCEPTEULA -INSTALLPATH: D:\My Programs\foo
```

## Update Power Automate silently

To update Power Automate silently, use the same command line arguments that you use to install it.

>[!NOTE]
>All your data and configuration, including telemetry, shortcuts, and more, are retained when you update Power Automate. Therefore, if you want to enable parameters previously disabled, you need to uninstall and reinstall Power Automate.

## Uninstall Power Automate silently

Use the following command to silently uninstall Power Automate:

```CMD
Setup.Microsoft.PowerAutomate.exe -Silent -Uninstall
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
