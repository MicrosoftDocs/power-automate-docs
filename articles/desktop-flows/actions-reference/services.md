---
title: Windows services | Microsoft Docs
description: Windows services Actions Reference
author: mariosleon

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Windows services



Control the workstation's installed services

[If service](#ifserviceaction)  
[Wait for service](#waitforserviceaction)  
[Start service](#start)  
[Stop service](#stop)  
[Pause service](#pause)  
[Resume service](#resume)  

## Getting started with services

Power Automate allows users to handle Windows services through the Windows services group of actions. With these actions, users can maintain full control of the operating system and limit the running services.

To control services, use the Windows services group of actions. These actions allow flows to start, stop, pause and resume Windows services. In the figure below, the **Start service** action starts **UIFlowService**. For this group of actions, only the service name is required, and no output is returned.

![Screenshot of the Start service action.](\media\services\start-service-example.png)

> [!NOTE]
> Please note that Windows services are essential to the smooth operation of the operating system. Managing Windows services incorrectly could adversely affect your PC. 


## Windows services actions

### <a name="ifserviceaction"></a> If service
Marks the beginning of a conditional block of actions depending on whether a service is running, paused, stopped or installed on the computer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If service|N/A|Is stopped, Is installed, Isn't installed, Is running, Is paused|Is running|The state of the service to check|
|Service name|No|Text value||The name of the service to check|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifserviceaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there is a problem retrieving the status of the service|


### <a name="waitforserviceaction"></a> Wait for service
Suspend the execution of the automation until a service is running, paused or stopped on the computer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for service to|N/A|Stop, Start, Pause|Start|Specifies whether the flow pauses until a certain service starts, stops or pauses|
|Service name|No|Text value||The name of the service to check|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforserviceaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there is a problem retrieving the status of the service|

### <a name="start"></a> Start service
Start a stopped Windows service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to start|No|Text value||The name of the service to start|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="start_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service is already running|Indicates that the service is already running|
|Can't start service|Indicates that there is a problem starting the service|

### <a name="stop"></a> Stop service
Stop a running Windows service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to stop|No|Text value||The name of the service to stop|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="stop_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't stop service|Indicates that there is a problem stopping the service|

### <a name="pause"></a> Pause service
Pause a running Windows service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to pause|No|Text value||The name of the service to pause|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="pause_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't pause service|Indicates that there is a problem pausing the service|

### <a name="resume"></a> Resume service
Resume a paused Windows service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to resume|No|Text value||The name of the service to resume|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="resume_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't resume service|Indicates that there is a problem resuming the service|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]