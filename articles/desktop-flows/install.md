---
title: Install Power Automate
description: Learn how to install Power Automate for desktop on your device.
author: johndund
ms.topic: how-to
ms.date: 02/19/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---
# Install Power Automate

Before you install Power Automate on your device, make sure that it meets the [system requirements](requirements.md).

Download and install Power Automate [using an MSI installer](#install-power-automate-using-the-msi-installer) or [from Microsoft Store](#install-power-automate-from-microsoft-store). The Microsoft Store installation doesn't require you to have admin rights on your device and is updated automatically regularly. The MSI installer requires admin rights and requires manual updates. However it also includes an option to install the machine runtime application, which allows you to [manage machines from the Power Automate portal](manage-machines.md). You can use the Power Automate for desktop store installation in conjunction with the runtime application, which you can install from the MSI.

> [!NOTE]
> Having both versions of Power Automate on your machine isn't supported. You must choose between Power Automate MSI installer or Microsoft Store (MSIX).

By default, Power Automate for desktop honors the proxy settings specified in Windows. To learn how to override this configuration for the Power Automate console, go to [Power Automate for desktop using a proxy server](governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server). To learn how to configure proxy settings for the machine runtime, go to [override them after install](https://support.microsoft.com/topic/power-automate-for-desktop-proxy-setup-8a79d690-1c02-416f-8af1-f057df5fe9b7).

## Install Power Automate using the MSI installer

> [!NOTE]
> Admin permissions on your local computer are required to install Power Automate for desktop using the MSI installer.

1. [Download the Power Automate installer](https://go.microsoft.com/fwlink/?linkid=2102613). Save the file to your desktop or Downloads folder.

1. Run the **Setup.Microsoft.PowerAutomate.exe** file.

1. Follow the instructions in the **Power Automate for desktop setup** installer.

1. Make your selections for each feature:

    - **Power Automate for desktop** is the app you use to build, edit, and run desktop flows.

    - **Machine-runtime app** allows you to connect your machine to the Power Automate cloud and harness the full power of robotic process automation (RPA). [Learn more about machine management](./manage-machines.md).

    - Install required files for UI automation in Java applets. Close all Java-related processes before you install these files.

1. Select the check box to agree to the terms of use, and then select **Install**.

If the installation fails, go to the [troubleshooting guide](/troubleshoot/power-platform/power-automate/desktop-flows/power-automate-desktop-installation-issues) for help.

> [!NOTE]
> There is only one Power Automate installer for both 32-bit and 64-bit computers. It automatically identifies the architecture of your operating system and proceeds to install the suitable version of the files accordingly.

### .NET 8 requirement

Starting with version 2.55, the Power Automate for desktop requires the .NET 8 runtime to be installed. The Power Automate MSI installer attempts to download and install the .NET 8 runtime if it does not exist on the machine. Therefore, without .NET 8, computers need internet access to the following URLs:

- https://aka.ms/dotnet/8.0/windowsdesktop-runtime-win-x64.exe
- https://aka.ms/dotnet/8.0/windowsdesktop-runtime-win-x86.exe

If you get an error indicating that the .NET 8 runtime has failed to install on your computer, this may be because you don’t have connectivity to these URLs, or because one or both packages couldn’t be installed. To resolve this, you can install these runtime packages manually on the machine. Once installed, future versions of Power Automate will not need to download the .NET 8 runtime.

## Install Power Automate from Microsoft Store

1. Find Power Automate in Microsoft Store:

    - Launch Microsoft Store and search for **Power Automate for desktop**.

    - Open a browser and go to [this Microsoft Store page](https://www.microsoft.com/store/productId/9NFTCH6J7FHV). Then, select **Get in Store app** to launch Microsoft Store on your device.

    - Go to the [Power Automate product page](https://make.powerautomate.com/desktop/) and select the appropriate option for installing.

1. After Microsoft Store is open, select **Get** to download and install Power Automate.

## Update Power Automate

New versions of Power Automate MSI installer are served from a URL beginning with https://download.microsoft.com.

### Update manually

By default, Power Automate for desktop notifies you when a new version is available. Select **Update** to automatically download and open the latest installer for your region. You must have admin permissions on your local computer to perform the update. Updating to the latest version is recommended to have the latest features and bug fixes.

### Update automatically

Starting with the April 2025 (2.54) release, automatic updates are available for the MSI installation of Power Automate for desktop. Learn more at [Automatic update capability](./auto-update.md).

To learn about managing Power Automate for desktop using System Center Configuration Manager, go to [Manage Power Automate for desktop on Windows](../guidance/automation-coe/manage-pad-on-windows.md).

## Determining which install you have on your computer

If you already have Power Automate installed on your machine and you didn't install it, check whether it's the Microsoft Store version or the MSI version. To do this, go to Start Menu > Add or remove programs. Then search for "Power Automate". If **Power Automate for desktop** is in the list, it's the MSI version. **Power Automate** is the Microsoft Store version.

## Uninstall Power Automate

1. Open the **Start** menu > **Settings** > **Apps**.

1. Search for **Power Automate**, and then select it.

1. Select **Uninstall**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
