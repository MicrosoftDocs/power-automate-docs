---
title: Automate Java applications
description: Automate Java applications 
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/21/2025
ms.author: nimoutzo
ms.reviewer: matp
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

- Java apps: Java version 7 and above.
- Java applets: Java version 7 and version 8.

OpenJ9 editions of the Java runtime aren't supported.

## The following sections include information for enabling the UI automation in Java applets.

### Install Java configuration

To automate Java applications, you need to enable specific settings during installation or by using the troubleshooter.

When you install Power Automate for desktop, select **Install files for enabling UI automation in Java applets**.  
This option installs the files required for Java automation. Close all running Java applications before you select **Install**.

If you already installed Power Automate for desktop, you can enable Java automation by running the troubleshooter. This applies to both the standard and Microsoft Store versions.

1. Open **Power Automate for desktop**.
2. Select **Help** > **Troubleshooter**.
3. Run the troubleshooter and choose **Troubleshoot UI/Web automation issues**.

The troubleshooter detects your Java installation and installs the required agent files in the correct folders.  
If it reports an issue with Java automation, select **Fix**. The troubleshooter may request administrator rights.

### Utilization of the default UI automation instead of Java UI automation

Το prevent the [recorder](../recording-flow.md) and the [UI element picker](../ui-elements.md) from recognizing Java elements built with the SWT framework and make them work with the default desktop UI elements:

- Edit the configuration file located under the machine’s Program Files: **Power Automate Desktop\Microsoft.Flow.RPA.Desktop.UIAutomation.Plugin.Java.dll.config**.
- Set the **BlockSwt** property to **true**.

### Uninstalling Java configuration

To uninstall the Java configuration (revert all changes applied to the machine by the Java installer): 

1. Launch the Command Line tool (cmd)

1. Run the following command in the PAD installation folder C:\Program Files (x86)\Power Automate Desktop (default):

    ``` CMD
    PAD.Java.Installer.Host.exe -u 
    ```

### Troubleshooting

If you come across any issues while automating Java applications, there are multiple potential causes. Learn more in [Can't access the elements of a Java application](/troubleshoot/power-platform/power-automate/desktop-flows/cannot-access-java-application-elements).
