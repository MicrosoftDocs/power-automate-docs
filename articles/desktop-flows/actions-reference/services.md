---
title: Services | Microsoft Docs
description: Services Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Services

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Control the workstation's installed services

|<!-- --> |
|-----|
|[Start service](#start)|
|[Stop service](#stop)|
|[Pause service](#pause)|
|[Resume service](#resume)|

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


