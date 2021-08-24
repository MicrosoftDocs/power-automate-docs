---
title: Services | Microsoft Docs
description: Services Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Services



Control the workstation's installed services

|<!-- --> |
|-----|
|[Start service](#start)|
|[Stop service](#stop)|
|[Pause service](#pause)|
|[Resume service](#resume)|

## Getting started with services

Power Automate Desktop allows users to handle Windows services through the services actions. With these actions, users can maintain full control of the operating system and limit the running services.

To control services, use the services group of actions. These actions allow flows to start, stop, pause and resume Windows services.  In the figure below, the **Start service** action starts **UIFlowService**. For this group of actions, only the service name is required, and no output is returned.

![screenshot of start service action properties.](\media\services\start-service-example.png)

> [!NOTE]
> Please note that Windows services are essential to the smooth operation of the operating system. Managing Windows services incorrectly could adversely affect your PC. 


## Services actions

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