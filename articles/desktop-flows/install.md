---
title: Install Power Automate
description: Learn how to install Power Automate for desktop on your device.
author: johndund
ms.topic: how-to
ms.date: 08/06/2026
ms.author: kdeepika
ms.reviewer: ellenwehrle
contributors:
  - DanaMartens
  - v-aangie
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
ai-usage: ai-assisted
---
# Install Power Automate

Before you install Power Automate on your device, make sure that it meets the [system requirements](requirements.md).

Download and install Power Automate [using an MSI installer](#install-power-automate-using-the-msi-installer) or [from Microsoft Store](#install-power-automate-from-microsoft-store). The following table compares the two installation methods:

| Feature | MSI installer | Microsoft Store |
|---|---|---|
| Admin rights required | Yes | No |
| Updates | Manual (or [automatic starting with v2.54](./auto-update.md)) | Automatic |
| Machine-runtime app included | Yes | No (install separately from MSI) |
| Silent installation support | Yes ([learn more](install-silently.md)) | No |
 
> [!IMPORTANT]
> - You can't install both the MSI and Microsoft Store (MSIX) versions of Power Automate on your machine. Choose one installation method. If you already have one version and want to switch, [uninstall](#uninstall-power-automate) the existing version first.
> - However, you *can* use the Power Automate for desktop Microsoft Store installation in conjunction with the machine-runtime application, which you can install from the MSI if you're an admin on your local computer.

By default, Power Automate for desktop honors the proxy settings specified in Windows. To learn how to override this configuration for the Power Automate console, go to [Power Automate for desktop using a proxy server](governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server). To learn how to configure proxy settings for the machine runtime, go to [override them after install](https://support.microsoft.com/topic/power-automate-for-desktop-proxy-setup-8a79d690-1c02-416f-8af1-f057df5fe9b7).

> [!TIP]
> If your network restricts internet access or uses a [proxy server](how-to/proxy-settings.md), make sure the required URLs are accessible before starting the installation. For more information, go to [system requirements](requirements.md).

## Install Power Automate using the MSI installer

> [!NOTE]
> Admin permissions on your local computer are required to install Power Automate for desktop using the MSI installer.

1. [Download the Power Automate installer](https://go.microsoft.com/fwlink/?linkid=2102613) and save the file, **Setup.Microsoft.PowerAutomate.exe**, to your desktop or **Downloads** folder. The download link always points to the latest version of the installer. If you need a specific version, contact your IT administrator.

1. Run the **Setup.Microsoft.PowerAutomate.exe** file. If your browser downloads a file with a different name or redirects you to the Microsoft Store, make sure you're using the [direct download link](https://go.microsoft.com/fwlink/?linkid=2102613) for the MSI installer.

1. Follow the instructions in the **Power Automate for desktop setup** installer.

1. Make your selections for each feature:

    - **Power Automate for desktop** is the app you use to build, edit, and run desktop flows.

    - **Machine-runtime app** allows you to connect your machine to the Power Automate cloud and harness the full power of robotic process automation (RPA). [Learn more about machine management](./manage-machines.md).

    - Install required files for UI automation in Java applets. Close all Java-related processes before you install these files.

1. Select the **check box** to agree to the terms of use, and then select **Install**.

If the installation fails, go to the [troubleshooting guide](/troubleshoot/power-platform/power-automate/desktop-flows/power-automate-desktop-installation-issues) for help. For common issues and solutions, go to the [Troubleshoot common installation issues](#troubleshoot-common-installation-issues) section in this article.

> [!NOTE]
> There's only one Power Automate installer for both 32-bit and 64-bit computers. It automatically identifies the architecture of your operating system and proceeds to install the suitable version of the files accordingly.

### .NET 10 requirement for MSI installer

Starting with version 2.69, Power Automate for desktop requires the [.NET 10 runtime](/dotnet/core/whats-new/dotnet-10/overview). The Power Automate MSI installer downloads and installs the .NET 10 runtime if it isn't already on the machine. Without .NET 10, computers need internet access to these URLs:

- `https://aka.ms/dotnet/8.0/windowsdesktop-runtime-win-x64.exe`
- `https://aka.ms/dotnet/8.0/windowsdesktop-runtime-win-x86.exe`

Power Automate for desktop uses the .NET 10 runtime to bring you the best and latest UI experience. The x86 package is required even on x64 operating systems because some automation modules within Power Automate are only available in 32-bit mode.

If you receive an error indicating that the .NET 10 runtime failed to install, try these steps:

1. Check that your computer can connect to both URLs listed earlier. Corporate firewalls or proxy servers might block these connections.
1. Download both runtime packages manually from the URLs and install them on the machine.
1. After you install the .NET 10 runtime manually, run the Power Automate installer again.

> [!NOTE]
> After you install the .NET 10 runtime on your machine, future versions of Power Automate don't attempt to download it again.

## Install Power Automate from Microsoft Store 

1. Go to the [Power Automate for desktop install page](https://www.microsoft.com/en-us/power-platform/products/power-automate/#tabs-pill-bar-ocb9d4_tab2) located in the [Microsoft Store](https://apps.microsoft.com/home).
1. Select **Download** to download Power Automate desktop from the Microsoft Store. You can also select **View in Store** to go to the Microsoft Store desktop experience.

## Update Power Automate desktop

- **Microsoft Store download**: Always automatically updates.
- **MSI installer – version 2.54 or newer**: Automatically updates if you [configure automatic updates](./auto-update.md). To learn about managing Power Automate for desktop using System Center Configuration Manager, go to [Manage Power Automate for desktop on Windows](../guidance/automation-coe/manage-pad-on-windows.md). 
- **MSI installer – versions older than 2.54**: You need to manually update. By default, Power Automate for desktop notifies you when a new version is available. Select **Update** to automatically download and open the latest installer for your region. You must have admin permissions on your local computer to perform the update. Updating to the latest version is recommended to have the latest features and bug fixes.

> [!NOTE]
> New versions of Power Automate MSI installer are served from a URL beginning with https://download.microsoft.com.

## Determine which install you have on your computer

If you already have Power Automate installed on your machine but didn't install it, check whether it's the Microsoft Store version or the MSI version:

1. Go to **Start Menu** > **Add or remove programs**.
1. Search for **Power Automate**.

- If **Power Automate for desktop** appears in the list, it's the MSI version.
- If **Power Automate** (without "for desktop") appears, it's the Microsoft Store version.

> [!TIP]
> If you can't find Power Automate in the app list but see it in the **Start** menu, it might not be installed completely. Try [uninstalling](#uninstall-power-automate) any remaining files and reinstalling.

## Troubleshoot common installation issues

If you experience problems during installation, try the following solutions. For detailed troubleshooting, go to the [Power Automate desktop installation troubleshooting guide](/troubleshoot/power-platform/power-automate/desktop-flows/power-automate-desktop-installation-issues).

### Installation fails with no error message

If the installer stops or closes without displaying an error:

1. Run the installer as an administrator. Right-click **Setup.Microsoft.PowerAutomate.exe** and select **Run as administrator**.
1. Make sure no previous version of Power Automate is installed. Go to **Settings** > **Apps** and remove any existing Power Automate installation.
1. Check that your machine meets the [system requirements](requirements.md).

### Installation fails with error code 1603

Error code 1603 typically indicates a permissions or registry issue. To resolve the problem:

1. Verify that you have admin permissions on the machine.
1. Close all running instances of Power Automate and related processes.
1. Check the Windows Event Viewer for more details about the error.

> [!NOTE]
> Power Automate for desktop isn't supported on Windows multi-session environments. If you're trying to install on a multi-session virtual machine, consider using a single-session VM image instead.

### Can't launch Power Automate after installation

If you installed Power Automate but can't find or launch it:

1. Search for **Power Automate** in the **Start** menu.
1. If it doesn't appear, check **Settings** > **Apps** to verify the installation completed.
1. Make sure you can connect to the Power Automate cloud service. If you see a connection error, check your network settings and proxy configuration.
1. Try signing out and signing back in to the application.

### Version mismatch across environments

If you need the same version of Power Automate across multiple machines (for example, in development and production environments):

1. Check the installed version on each machine by opening Power Automate for desktop and going to **Help** > **About**.
1. [Download the latest installer](https://go.microsoft.com/fwlink/?linkid=2102613) and deploy it to all machines.
1. For managed environments, consider using the [silent installation option](install-silently.md) to deploy a specific version consistently.

## Uninstall Power Automate

1. Open the **Start** menu > **Settings** > **Apps**.

1. Search for **Power Automate**, and then select it.

1. Select **Uninstall**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
