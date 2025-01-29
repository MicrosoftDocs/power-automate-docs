---
title: Automate Java applications
description: Automate Java applications 
author: mariosleon
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 01/29/2025
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

Note that OpenJ9 editions of the Java runtime are not supported.

## The following sections include information for enabling the UI automation in Java applets.

### Installing Java configuration

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
### Java Automation Attach Mechanism
For Java versions greater than 8, Power Automate Desktop loads its Java automation agent via the JNI attach mechanism. Ensure that the Attach API is enabled on your JVM.

If the attach mechanism for Java automation does not work, you can add the following arguments when starting your Java application:

- 64-bit Java
  - -javaagent:"C:\Program Files (x86)\Power Automate Desktop\java-support\PAD.JavaBridge.jar" -Djava.library.path="${env_var:PATH};C:\Program Files (x86)\Power Automate Desktop\java-support\x64"
- 32-bit Java
  - -javaagent:"C:\Program Files (x86)\Power Automate Desktop\java-support\PAD.JavaBridge.jar" -Djava.library.path="${env_var:PATH};C:\Program Files (x86)\Power Automate Desktop\java-support\x86"
 
Please note that the paths are relative to the Power Automate Desktop installation location, so adjustments may be needed if installed elsewhere.

If modifying the startup arguments of the Java application is not feasible, you can set a new environment variable named JDK_JAVA_OPTIONS with the appropriate value based on the architecture of the JDK. This will load the Power Automate Desktop Java automation agent at the startup of every Java application that uses the Java JDK.

### Troubleshooting 

If you come across any issues while automating Java applications, there are multiple potential causes. Learn more in [Can't access the elements of a Java application](/troubleshoot/power-platform/power-automate/desktop-flows/cannot-access-java-application-elements).

