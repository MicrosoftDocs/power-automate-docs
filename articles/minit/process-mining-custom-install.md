---
title: Custom installation of Power Automate Process Mining desktop app
description: Use the custom installation instructions to access Power Automate Process Mining desktop app when the standard installation package isn't available.
author: janPidych
contributors:
  - janPidych
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 12/02/2024
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Custom installation of Power Automate Process Mining desktop app

Your admin might have disabled the option to install Power Automate Process Mining desktop app on your workstation with Microsoft App Installer, which is used in the standard installation. In this case, you can use the MSIX file to install the app. With this installation, updates are managed customarily during the application startup process.

## Installation scenarios

The following table lists the different scenarios to install the Power Automate Process Mining desktop app for all scenarios.

|App Installer allowed  |Internet access | Steps |
|---------|---------|---------|
|Yes     | Yes        | Download and install Power Automate Process Mining desktop app using the portal link in the [standard installation](how-to-start-with-minit-desktop-application.md) article. The installation checks for automatic updates and makes sure auto-updating works.    |
|No     | Yes        | Use the custom installation in [Run the custom installation](#run-the-custom-installation) in this article.  |
|Yes or No    | No        | You can’t download the package from the portal. You and your admin have specific tasks:<br/><br/></li><li>**You**: Ask your admin to download the MSIX package and share it with you. Then, install the package and [set up the custom location for updates](#set-up-the-custom-location-for-updates).<br/><br/></li><li>**Admin**: Download the updates and put them into the [custom location](#set-up-the-custom-location-for-updates) that the user set up. |

## Run the custom installation

If App Installer isn't allowed and you have internet access, follow these steps:

1. Download the [MSIX bundle](https://go.microsoft.com/fwlink/?linkid=2276402) file. The app checks for updates automatically at startup.
1. Select **Open file**.
1. Select **Install**.

If you have access to extranet locations, the app checks automatically for updates for the standard installation with App Installer. If you have limited access to extranet, which might prevent auto-updates, continue with the following instructions.

## Upload the latest version of the app

If you don’t have access to extranet locations and can’t access install files for updates, you can store update files on their own cloud. From this location, you can update the app.

For this scenario, the admin needs to upload the latest version of the application [MSIX bundle](https://go.microsoft.com/fwlink/?linkid=2276402) file to the internal location and rename the MSIX file as follows:

`PowerAutomateProcessMining_{latestVersion}.msixbundle`

### Get the latest version number for the downloaded update

Download the text file that contains the product version number.

1. Download the [msixVersion](https://go.microsoft.com/fwlink/?linkid=2271379) text file.
1. Select **Open file**.
1. Copy the last version number from the file into `PowerAutomateProcessMining_{latestVersion}.msixbundle`.

    For example, if the last version number is **6.1.2401.1234**, the MSIX file name is `PowerAutomateProcessMining_6.1.2401.1234.msixbundle`.

## Set up the custom location for updates

After you install the Process Mining desktop app with the MSIX package, the system looks for a setting where the update is located. You need to identify this setting as the internal location where the MSIX files for the update are stored.

1. In the **Settings** menu, select **Options**.
1. In the **Options** screen, select **Update**.
1. In the **Local Url to installers** field, enter the internal location where the MSIX files for the update are stored.

:::image type="content" source="media/process-mining-custom-install/update-url.png" alt-text="media/process-mining-custom-install/update-url.png":::


