---
title: Change the timeout configuration for the UI/Browser automation
description: Change the timeout configuration for the UI and Browser automation actions
author: NikosMoutzourakis

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 11/02/2023
ms.author: NikosMoutzourakis
ms.reviewer: NikosMoutzourakis
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# UI Automation Configuration

Power Automate for Desktop provides various components, including the Designer, Recorder, Power Automate agent for virtual desktops, and actions from UI automation and Browser automation groups. However, in some cases, these components may fail due to time-out constraints. To overcome this issue, users can now adjust the time-out settings for distinct desktop and web automation scenarios. By modifying a configuration file and adding the appropriate key/value pairs for the desired scenarios, users can customize the time-out duration for specific operations based on the specified configuration value.

# Before creating the configuration file
Before creating the configuration file, it's crucial to make sure that Power Automate for Desktop and all its components are not running. To do this, open Task Manager, go to the Details tab, and sort the processes by name. Check that no process related to Power Automate Desktop is currently active. 

If you need to stop the 'PAD.BrowserNativeMessageHost', you should first deactivate the Power Automate web extension and close all browser windows. Once you have finished configuring the settings, you can re-enable the Power Automate web extension.

# How to create the configuration file. 

1. Navigate to %LOCALAPPDATA%\Microsoft\Power Automate Desktop.
2. Check if a folder named ‘Configurations’ exists. If not create it.
3. Create a new file with name UIAutomationTimeOut.config inside the Configurations directory.
4. Copy the below xml section inside the file. Add the key/value pairs you need, inside the <appSettings> section as shown in the following the example. 
'<?xml version="1.0" encoding="utf-8" ?> 

<configuration> 

      <appSettings> 

          <!-- Please add here the key values for the configuration. See examples below: 

          <add key="AutomationServerEndpoint.DesignTime.ConnectionTimeout" value="00:01:00" /> 

          <add key="AutomationServerEndpoint.DesignTime.CallTimeout" value="00:00:30" /> 

           --> 

      </appSettings> 

</configuration>

5. Save the file. 
6. Open Power Automate for desktop. 
