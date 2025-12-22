---
title: Automate Java applications
description: Automate Java applications 
author: iomimtso
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 12/22/2025
ms.author: nimoutzo
ms.reviewer: EllenWehrle
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Automate Java applications

Currently, Power Automate for desktop supports the use of UI automation in all Java apps and applets for the following Java versions:

- Java apps: Java version 7 and later.
- Java applets: Java version 7 and version 8.

OpenJ9 editions of the Java runtime aren't supported.

This article covers how to enable the UI automation in Java applets.

## Install Java configuration

To automate Java applications, you need to enable specific settings during installation or by using the troubleshooter.

When you install Power Automate for desktop, select **Install files for enabling UI automation in Java applets**.  
This option installs the files required for Java automation. Close all running Java applications before you select **Install**.

If you already installed Power Automate for desktop, you can enable Java automation by running the troubleshooter. This step applies to both the standard and Microsoft Store versions. Take these steps to enable Java automation:

1. Open **Power Automate for desktop**.
1. Select **Help** > **Troubleshooter**.
1. Run the troubleshooter and choose **Troubleshoot UI/Web automation issues**.

The troubleshooter detects your Java installation and installs the required agent files in the correct folders.  
If it reports an issue with Java automation, select **Fix**. The troubleshooter might request administrator rights.

## Use default UI automation instead of Java UI automation

To prevent the [recorder](../recording-flow.md) and the [UI element picker](../ui-elements.md) from recognizing Java elements that the SWT framework builds, and to make them work with the default desktop UI elements:

- Edit the configuration file under the machine's Program Files: **Power Automate Desktop\Microsoft.Flow.RPA.Desktop.UIAutomation.Plugin.Java.dll.config**.
- Set the **BlockSwt** property to **true**.

## Uninstall Java configuration

To uninstall the Java configuration and revert all changes that the Java installer made to the machine:

1. Open the Command Line tool (cmd).

1. Run the following command in the PAD installation folder `C:\Program Files (x86)\Power Automate Desktop` (default):

    ``` CMD
    PAD.Java.Installer.Host.exe -u 
    ```

## Troubleshooting

If you encounter any problems while automating Java applications, many potential causes exist. For more information, see [Can't access the elements of a Java application](/troubleshoot/power-platform/power-automate/desktop-flows/cannot-access-java-application-elements).
