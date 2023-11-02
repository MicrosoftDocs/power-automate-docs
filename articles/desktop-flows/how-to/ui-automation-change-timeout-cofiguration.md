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
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Timeout configuration for UI/browser automation

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

# Key Values Editing 

Each configuration item follows the below rules: 
- **key**: The name of the configuration item. This is a reserved word and should be listed in the table below
  - **Automation Server**: This is a PAD unit, where several other PAD components such as designer, robot, recorder etc, that utilize Desktop and Web automation capabilities, communicate with, to perform various operations either on design or run time:
    - **AutomationServerEndpoint.DesignTime.ConnectionTimeout**: The time out period for designer or recorder to establish a connection with the Automation Server. This configuration might be useful when an error that indicates that a connection could not be successful established at a specific period of time is shown. By increasing the default time out value of this setting could solve the issue.
    - **AutomationServerEndpoint.DesignTime.CallTimeout**: The time out period for designer or recorder to send/receive messages with the Automation Server through an already established connection. This setting can be useful in cases when capturing an element, either using the UI element picker (designer) or the recorder, takes too long time without capturing the element. By increasing the time out value to a greater value than the default could solve the issue.
    - **AutomationServerEndpoint.Runtime.ConnectionTimeout**: The time out period for PAD Robot to establish a connection with the Automation Server when a UI Automation or a Browser Automation action is executed. This configuration might be useful when an error that indicates that a connection could not be successful established at a specific period of time is shown.
    - **AutomationServerEndpoint.Runtime.CallTimeout**: The time out period for Robot to send/receive messages with the Automation Server through an already established connection, when a UI Automation or Browser Automation action is executed. This configuration can be useful in cases where the execution of a UI or Browser automation action might take too much time and fails due to time out.
    - **AutomationServerEndpoint.ExtractDataFromWeb.ConnectTimeout**:  The time out period for ExtractDataFromWeb module to establish a connection with the Automation Server. This setting might be useful when an error that indicates that a connection could not be successful established at a specific period of time when trying to capture the data to be extracted in design time. By increasing the default time out value of this setting could solve the issue.
    - **AutomationServerEndpoint.ExtractDataFromWeb.CallTimeout**: The time out period for ExtractDataFromWeb module to send/receive messages through the connection established with the Automation Server. This setting might be useful during the design time when trying to capture the data to be extracted in design time but the elements are not captured without any specific error thrown.
  - **SAP Bridge**: This is the PAD module where several UI Automation modules communicate with SAP Bridge to perform various operations related to SAP applications.
    - **Sap.Bridge.Client.OpenTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to open a connection with the SAP Bridge. This setting might be useful, during runtime or design time, when an error that indicates that a connection could not be successful established at a specific period of time with SAP bridge is shown. By increasing the default time out value of this setting could solve the issue.
    - **Sap.Bridge.Client.CloseTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to close a connection with the SAP Bridge. This setting might be useful during runtime or design time. when an error that indicates that a connection could not be successful closed at a specific period of time with SAP Bridge is shown. By increasing the default time out value of this setting could solve the issue.
    - **Sap.Bridge.Client.SendTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to send a message over a connection established with the SAP Bridge. This setting might be useful during runtime or design time, when an error that indicates that a message could not be sent at a specific period of time to SAP Bridge is shown. By increasing the default time out value of this setting could solve the issue.
    - **Sap.Bridge.Client.ReceiveTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to receive a message over a connection established with the SAP Bridge. This setting might be useful during runtime or design time, when an error that indicates that a response could not be received at a specific period of time from SAP Bridge is shown. By increasing the default time out value of this setting could solve the issue.
  - **Java Bridge**: This is the PAD module where several UI Automation modules communicate with Java bridge to perform various operations related to Java applications.
    - **Java.Bridge.Client.ConnectTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to connect with the Java Bridge. This setting might be useful during runtime or design time. when an error that indicates that a connection could not be successful established at a specific period of time with Java Bridge is shown. By increasing the default time out value of this setting could solve the issue.
    - **Java.Bridge.Client.ReadWriteTimeout**: The time out period for a PAD client module (Designer, Robot, Recorder) to send or receive messages though a connection established with the Java Bridge. This setting might be useful during runtime or design time, when an error that indicates that a message could not be sent, or a response could not be received at a specific period of time when communicating with Java Bridge is shown. By increasing the default time out value of this setting could solve the issue.
  - **Web Extensions Message Proxy**:
    - **WebExtensionsMessageProxy.OpenTimeout**: The time out period for PAD to open a connection with the Browser Web Extension Message Host.  This setting might be useful during runtime or design time, when an error is shown indicating that a connection could not be successful established at a specific period of time with Browser Native Message Host. By increasing the default time out value of this setting could solve the issue.
    - **Host.WebExtensionsMessageProxy.CloseTimeout**: The time out period for PAD to close an established connection with the Browser Web Extension Message. This setting might be useful during runtime or design time. when an error that indicates that a connection could not be successful closed at a specific period of time with Browser Native Message Host. By increasing the default time out value of this setting could solve the issue.
    - **WebExtensionsMessageProxy.SendTimeout**: The time out period for PAD to send a message through an established connection with the Browser Web Extension Message Host. This setting might be useful during runtime or design time. when an error that indicates that a message could not be sent at a specific period of time to Browser Native Message Host. By increasing the default time out value of this setting could solve the issue.
    - **WebExtensionsMessageProxy.ReceiveTimeOut**: The time out period for PAD to send a message through an established connection with the Browser Web Extension Message Host. This setting might be useful during runtime or design time. when an error that indicates that a response could not be received at a specific period of time from Browser Native Message Host is shown.
  - **RDP.Client.ConnectTimeOut**: The time out period for a PAD client module, running on the Host such as the Designer, Robot to establish a connection with the Remote Desktop agent that is running on the remote machine. This setting might be useful in case a Remote Desktop Automation is performed and error that indicates that a connection with the Remote Desktop Agent could not be established on a specific period of time. By increasing the default time out value of this setting could solve the issue.
  - **RDP.Client.CallTimeOut**: The time out period for a PAD client module, running on the Host such as the Designer, Robot to send or receive messages though a connection with the Remote Desktop agent that is running on the remote machine. This setting might be useful in case a Remote Desktop Automation is performed and error that indicates that a connection with the Remote Desktop Agent that a message could not be sent or received on a specific period of time. By increasing the default time out value of this setting could solve the issue.
  - **Recorder.LaunchBrowserTimeout**: The time out period for the launch browser option inside the recorder. Increasing this could avoid issues with extension installation popup windows appearing when choosing the option in the recorder.
- **value**: The time out value. The value should be in the following format HH:MM:SS. For example, if you want to set the time out to 5 seconds then use 00:00:05 as value.  


# Sample Xml Configuration file:  

<?xml version="1.0" encoding="utf-8" ?> 

    <configuration> 

        <appSettings> 

            <!--Automation Server Endpoint Configuration for Designer --> 

            <add key="AutomationServerEndpoint.DesignTime.ConnectionTimeout" value="00:01:00" /> 

            <add key="AutomationServerEndpoint.DesignTime.CallTimeout" value="00:00:30" /> 

     

            <!--Automation Server Endpoint Configuration for Runtime --> 

            <add key="AutomationServerEndpoint.Runtime.ConnectionTimeout" value="00:05:00" /> 

            <add key="AutomationServerEndpoint.Runtime.CallTimeout" value="00:05:00" /> 

     

    	    <!--Automation Server Endpoint Configuration for ExtractFromWeb --> 

            <add key="AutomationServerEndpoint.ExtractDataFromWeb.ConnectTimeout"  value="00:01:00" /> 

            <add key="AutomationServerEndpoint.ExtractDataFromWeb.CallTimeout"  value="00:00:30" /> 

     

     

            <!—SAP Bridge Client Configuration --> 

            <add key="Sap.Bridge.Client.SendTimeout" value="00:10:00"/> 

            <add key="Sap.Bridge.Client.ReceiveTimeout" value="00:10:00"/> 

            <add key="Sap.Bridge.Client.OpenTimeout" value="00:01:00"/> 

            <add key="Sap.Bridge.Client.CloseTimeout" value="00:01:00"/> 

  

    <!—Java Bridge Configuration --> 

            <add key="Java.Bridge.Client.ConnectTimeout" value="00:00:05"/> 

            <add key="Java.Bridge.Client.ReadWriteTimeout" value="00:01:00"/> 

  

            <!-- Web Extensions Message Proxy--> 

            <add key="WebExtensionsMessageProxy.SendTimeout" value="00:01:00"/> 

            <add key="WebExtensionsMessageProxy.ReceiveTimeOut" value="00:01:00"/> 

            <add key="WebExtensionsMessageProxy.OpenTimeout" value="00:01:00" /> 

            <add key="WebExtensionsMessageProxy.CloseTimeout" value="00:01:00" /> 

  

            <!--RDP Client Configuration--> 

            <add key="RDP.Client.ConnectTimeOut" value="00:00:10" /> 

            <add key="RDP.Client.CallTimeOut" value="00:00:15" /> 

 	 

    <!-- Recorder Configuration--> 

            <add key="Recorder.LaunchBrowserTimeout" value="00:00:10" /> 

 

       </appSettings> 

    </configuration> 

  
