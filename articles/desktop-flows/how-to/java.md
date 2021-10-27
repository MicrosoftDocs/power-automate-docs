---
title: Automate Java applications  | Microsoft Docs
description: Automate Java applications 
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/08/2021
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Automate Java applications

In order to automate Java applications, particular settings must be in place. 

To install the Java configuration manually, after Power Automate gets installed, navigate to the installation folder (e.g. ‘C:\Program Files (x86)\Power Automate’) and run the ‘PAD.Java.Installer.exe’ as an administrator. 

User can uninstall the Java configuration (revert all changes applied to the machine with the Java installer. 

Open Command Line tool (cmd) 

Execute following command: 

PAD.Java.Installer.exe -u 

Logs for Java automation with PAD can be found at: ‘%temp%/ java_automation_log’ folder (e.g. ‘C:\Users\username\AppData\Local\Temp\java_automation_log’) 

 

Troubleshooting 

Make sure you have Java installed in your machine. You may check this by: 

First, let's open a command window or terminal and enter: > java –version 

If Java is not installed in your machine, then you will receive an error message as:  

'java' is not recognized as an internal or external command, operable program or batch file. 

Java Access Bridge from Control Panel should be disabled 

Go to ‘Control Panel->Ease of Access->Optimize visual display->Java Access Bridge fromOracle, Inc. Providing Assistive Technology access to Java applications’ and disable (uncheck) the ‘Enable Java Access Bridge’ option. 

Specific files have to exist in the Java folder(s) of the machine after the PAD installation.  

You may check the installed Java version and installation path in your machine by: 

Type ‘Configure Java’ in the Search bar of Windows 

Open Java control panel 

Go to ‘Java’ tab 

Click on ‘View’ 

Check values in ‘Path’ column. Row with ‘Architecture’ equal to x86 refers to 32-bit Java installation, while the row with value ‘x86x64’ refers to 64-bit Java installation. 

You may check the below files: 

For 64-bit Java installation: 

File ‘Microsoft.Flow.RPA.Desktop.UIAutomation.Java.Bridge.Native.dll’ should have been replaced in folder ‘C:\Program Files\Java\jre1.8.0_271\bin’. (jre1.8.0_271 could be replaced with your machine’s Java installation) 

File ‘accessibility.properties’ should have been replaced in folder ‘C:\Program Files\Java\jre1.8.0_271\lib’. (jre1.8.0_271 could be replaced with your machine’s Java installation) 

If you edit the file with a notepad, it should have the following value: “assistive_technologies=com.sun.java.accessibility.AccessBridge, microsoft.flows.rpa.desktop.uiautomation.JavaBridge” 

File ‘PAD.JavaBridge.jar’ should have been inserted in folder ‘C:\Program Files\Java\jre1.8.0_271\lib\ext’. (jre1.8.0_271 could be replaced with your machine’s Java installation) 

For 32-bit Java installation: 

Same actions for the same files as above but in folder path ‘C:\Program Files (x86) \Java…’ 

Make sure there isn't an '.accessibility.properties' file present in your user folder.  

Check ‘C:\Users\user’ if a file with name ‘.accessibility.properties’ is present. If yes, then please rename it. 

Ensure that 'VC_redist.x64.exe' and/or 'VC_redist.x86.exe' have been executed.  

 