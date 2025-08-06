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

In order to automate Java applications, particular settings must be in place. 

To install the Java configuration manually, after Power Automate for desktop has been installed, navigate to the installation folder (**C:\Program Files (x86)\Power Automate Desktop**) and run the **PAD.Java.Installer.exe** as an administrator. 

Logs for Java automation with Power Automate for desktop can be found in the **%temp%/ java_automation_log** folder (for example, **C:\Users\username\AppData\Local\Temp\java_automation_log**). 

### Utilization of the default UI automation instead of Java UI automation

Το prevent the [recorder](../recording-flow.md) and the [UI element picker](../ui-elements.md) from recognizing Java elements built with the SWT framework and make them work with the default desktop UI elements:

- Edit the configuration file located under the machine’s Program Files: **Power Automate Desktop\Microsoft.Flow.RPA.Desktop.UIAutomation.Plugin.Java.dll.config**.
- Set the **BlockSwt** property to **true**.

### Uninstalling Java configuration

To uninstall the Java configuration (revert all changes applied to the machine by the Java installer): 

1. Launch the Command Line tool (cmd)

1. Run the following command:

    ``` CMD
    PAD.Java.Installer.exe -u 
    ```

### Java automation attach mechanism

For Java versions greater than 8, Power Automate desktop loads its Java automation agent via the JNI attach mechanism. Ensure that the Attach API is enabled on the JVM.

If the attach mechanism for Java automation doesn't work, add the following arguments when starting the Java application:

- 64-bit Java
  - -javaagent:"C:\Program Files (x86)\Power Automate Desktop\dotnet\java-support\PAD.JavaBridge.jar" -Djava.library.path="${env_var:PATH};C:\Program Files (x86)\Power Automate Desktop\dotnet\java-support\x64"
- 32-bit Java
  - -javaagent:"C:\Program Files (x86)\Power Automate Desktop\dotnet\java-support\PAD.JavaBridge.jar" -Djava.library.path="${env_var:PATH};C:\Program Files (x86)\Power Automate Desktop\dotnet\java-support\x86"

The paths use the Power Automate Desktop installation location. Adjust the paths if you install Power Automate Desktop in a different location.

If you can't modify the startup arguments of the Java application, set a new environment variable named JDK_JAVA_OPTIONS with the appropriate value based on the architecture of the JDK. This loads the Power Automate Desktop Java automation agent at the startup of every Java application that uses the Java JDK.

### Troubleshooting

If you come across any issues while automating Java applications, there are multiple potential causes. Learn more in [Can't access the elements of a Java application](/troubleshoot/power-platform/power-automate/desktop-flows/cannot-access-java-application-elements).
