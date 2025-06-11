---
title: Change the timeout configuration for the UI/Browser automation
description: Change the timeout configuration for the UI and Browser automation actions.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/09/2024
ms.author: nimoutzo
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
# Timeout configuration for UI and browser automation

Power Automate for desktop provides various components, including the designer, recorder, Power Automate agent for virtual desktops, and actions from UI automation and browser automation groups. However, in some cases, these components might fail due to time-out constraints. To overcome this issue, users can adjust the time-out settings for distinct desktop and web automation scenarios. When you modify a configuration file and add the appropriate key or value pairs for the desired scenarios, users can customize the timeout duration for specific operations based on the specified configuration value.

## Before creating the configuration file

Before creating the configuration file, it's crucial to make sure that Power Automate for desktop and all its components aren't running. To do this, open Task Manager, go to the **Details** tab, and sort the processes by name. Check that no process related to Power Automate is currently active.

If you need to stop the 'PAD.BrowserNativeMessageHost' process, you should first deactivate the Power Automate web extension and close all browser windows. Once you have finished configuring the settings, you can re-enable the Power Automate web extension.

## How to create the configuration file

1. In File Explorer, go to the `%LOCALAPPDATA%\Microsoft\Power Automate Desktop` folder.
1. Check if a folder named **Configurations** exists. If not, create it.
1. Create a new file with name *UIAutomationTimeOut.config* inside the **Configurations** folder.
1. The template of the XML code to be copied inside the file can be viewed in the following XML snippet. Add the key and value pairs you need, inside the `appSettings` section. Replace everything between `<appSettings>` and `</appSettings>`.

> [!NOTE]
> The provided sample is only a template and is non-functional. Populate it with the required key-value pairs to make it functional.

```xml
<?xml version="1.0" encoding="utf-8" ?> 

<configuration> 

      <appSettings> 

          <!-- Please add here the key values for the configuration. See examples below: 

          <add key="AutomationServerEndpoint.DesignTime.ConnectionTimeout" value="00:01:00" /> 

          <add key="AutomationServerEndpoint.DesignTime.CallTimeout" value="00:00:30" /> 

           --> 

      </appSettings> 

</configuration>
```

5. Save the file.
6. Open Power Automate for desktop.

## Key values editing

Each XML configuration item follows these rules:

- `key`: The name of the configuration item. This is a reserved word and should be listed in the XML configuration file for the elements that follow:
  - `Automation Server`: This is a Power Automate for desktop unit, where several other Power Automate for desktop components such as designer, robot, recorder, and so on, that utilize desktop and web automation capabilities, communicate with to perform various operations either at design or run time:
    - `AutomationServerEndpoint.DesignTime.ConnectionTimeout`: The timeout period for designer or recorder to establish a connection with the Automation Server. This configuration might be useful when an error that indicates that a connection couldn't be successfully established at a specific period of time is shown. Increasing the default timeout value of this setting could resolve the issue.
    - `AutomationServerEndpoint.DesignTime.CallTimeout`: The timeout period for designer or recorder to send and receive messages with the Automation Server through an already established connection. This setting can be useful in cases when capturing an element, either using the UI element picker (designer) or the recorder, takes too long without capturing the element. Increasing the timeout value to a greater value than the default might resolve the issue.
    - `AutomationServerEndpoint.Runtime.ConnectionTimeout`: The timeout period for the Power Automate for desktop robot to establish a connection with the Automation Server when a UI automation or a browser automation action is executed. This configuration might be useful when an error that indicates that a connection couldn't be successfully established at a specific period of time is shown.
    - `AutomationServerEndpoint.Runtime.CallTimeout`: The timeout period for the robot to send and receive messages with the Automation Server through an already established connection, when a UI automation or browser automation action is executed. This configuration can be useful in cases where the execution of a UI or browser automation action might take too much time and fails due to timeout.
    - `AutomationServerEndpoint.ExtractDataFromWeb.ConnectTimeout`:  The timeout period for the `ExtractDataFromWeb` module to establish a connection with the Automation Server. This setting might be useful when an error that indicates that a connection couldn't be successfully established at a specific period of time when trying to capture the data to be extracted at design time. Increasing the default timeout value of this setting might resolve the issue.
    - `AutomationServerEndpoint.ExtractDataFromWeb.CallTimeout`: The timeout period for the `ExtractDataFromWeb` module to send and receive messages through the connection established with the Automation Server. This setting might be useful during the design time when trying to capture the data to be extracted at design time but the elements aren't captured without any specific error.
  - `SAP Bridge`: This is the Power Automate for desktop module where several UI automation modules communicate with SAP bridge to perform various operations related to SAP applications:
    - `Sap.Bridge.Client.OpenTimeout`: The timeout period for a Power Automate for desktop client module (designer, robot, recorder) to open a connection with the SAP bridge. This setting might be useful during runtime or design time, when an error that indicates that a connection couldn't be successfully established at a specific period of time with the SAP bridge is shown. Increasing the default timeout value of this setting might resolve the issue.
    - `Sap.Bridge.Client.SendTimeout`: The timeout period for a Power Automate for desktop client module (designer, robot, recorder) to send a message over a connection established with the SAP bridge. This setting might be useful during runtime or design time, when an error that indicates that a message couldn't be sent at a specific period of time to the SAP bridge is shown. Increasing the default timeout value of this setting might resolve the issue.
  - **`Java Bridge`: This is the Power Automate for desktop module where several UI automation modules communicate with the Java bridge to perform various operations related to Java applications.
    - `Java.Bridge.Client.ConnectTimeout`: The timeout period for a Power Automate for desktop client module (designer, robot, recorder) to connect with the Java bridge. This setting might be useful during runtime or design time when an error that indicates a connection couldn't be successfully established at a specific period of time with the Java bridge is shown. Increasing the default timeout value of this setting might resolve the issue.
    - `Java.Bridge.Client.ReadWriteTimeout`: The timeout period for a Power Automate for desktop client module (designer, robot, recorder) to send or receive messages through a connection established with the Java bridge. This setting might be useful during runtime or design time, when an error that indicates that a message couldn't be sent, or a response couldn't be received at a specific period of time when communicating with the Java bridge is shown. Increasing the default timeout value of this setting might resolve the issue.
  - `Web Extensions Message Proxy`:
    - `WebExtensionsMessageProxy.OpenTimeout`: The timeout period for Power Automate for desktop to open a connection with the browser web extension message host. This setting might be useful during runtime or design time, when an error is shown indicating that a connection couldn't be successfully established at a specific period of time with the browser native message host. Increasing the default timeout value of this setting might resolve the issue.
    - `WebExtensionsMessageProxy.SendTimeout`: The timeout period for Power Automate for desktop to send a message through an established connection with the browser web extension message host. This setting might be useful during runtime or design time when an error that indicates that a message couldn't be sent at a specific period of time to browser native message host. Increasing the default timeout value of this setting might resolve the issue.
  - `RDP.Client.ConnectTimeOut`: The timeout period for a Power Automate for desktop client module, running on the host, such as the designer or robot, to establish a connection with the Remote Desktop agent that is running on the remote machine. This setting might be useful in case a Remote Desktop automation is performed and an error that indicates that a connection with the Remote Desktop Agent couldn't be established for a specific period of time. Increasing the default timeout value of this setting might resolve the issue.
  - `RDP.Client.CallTimeOut`: The timeout period for a Power Automate for desktop client module, running on the host, such as the designer or robot, to send or receive messages through a connection with the Remote Desktop agent that is running on the remote machine. This setting might be useful in case a Remote Desktop automation is performed and an error that indicates a connection with the Remote Desktop Agent that a message couldn't be sent or received for a specific period of time. Increasing the default timeout value of this setting might resolve the issue.
  - `Recorder.LaunchBrowserTimeout`: The timeout period for the launch browser option inside the recorder. Increasing this might avoid issues with extension installation popup windows appearing when choosing the option in the recorder.
- `value`: The timeout value. The value should be in the format HH:MM:SS. For example, if you want to set the timeout to five seconds then use 00:00:05 as value.  

## Sample XML configuration file

```xml
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

     

     

            <!--SAP Bridge Client Configuration --> 

            <add key="Sap.Bridge.Client.SendTimeout" value="00:10:00"/> 

            <add key="Sap.Bridge.Client.OpenTimeout" value="00:01:00"/> 

  

    <!--Java Bridge Configuration --> 

            <add key="Java.Bridge.Client.ConnectTimeout" value="00:00:05"/> 

            <add key="Java.Bridge.Client.ReadWriteTimeout" value="00:01:00"/> 

  

            <!-- Web Extensions Message Proxy--> 

            <add key="WebExtensionsMessageProxy.SendTimeout" value="00:01:00"/> 

            <add key="WebExtensionsMessageProxy.OpenTimeout" value="00:01:00" /> 

  

            <!--RDP Client Configuration--> 

            <add key="RDP.Client.ConnectTimeOut" value="00:00:10" /> 

            <add key="RDP.Client.CallTimeOut" value="00:00:15" /> 

 	 

    <!-- Recorder Configuration--> 

            <add key="Recorder.LaunchBrowserTimeout" value="00:00:10" /> 

 

       </appSettings> 

    </configuration>
```
