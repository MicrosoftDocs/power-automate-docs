---
title: Windows services actions reference
description: See all the available Windows services actions.
author: mattp123

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/24/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Windows services actions

> [!IMPORTANT]
> To prevent unauthorized access, Windows require administrator rights to manage services. To handle services using the Windows services actions, run Power Automate with administrator rights. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

Power Automate allows you to handle Windows services via the available Windows services actions. With these actions, you can maintain complete control of the operating system and limit the running services.

These actions allow desktop flows to start, stop, pause, and resume Windows services. To use any action of this group, you need to enter only the service name.

The following example starts the **UIFlowService** service.

:::image type="content" source="media/services/start-service-example.png" alt-text="Screenshot of the Start service action.":::

> [!WARNING]
> Windows services are essential to the smooth operation of the operating system. Managing Windows services incorrectly could adversely affect your machine.

## <a name="ifserviceaction"></a> If service

Marks the beginning of a conditional block of actions depending on whether a service is running, paused, stopped or installed on the computer.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If service|N/A|Is stopped, Is installed, Isn't installed, Is running, Is paused|Is running|The state of the service to check|
|Service name|No|[Text value](../variable-data-types.md#text-value)||The name of the service to check|

### Variables produced

This action doesn't produce any variables.

### <a name="ifserviceaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there's a problem retrieving the status of the service|

## <a name="waitforserviceaction"></a> Wait for service

Suspend the execution of the automation until a service is running, paused or stopped on the computer.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for service to|N/A|Stop, Start, Pause|Start|Specifies whether the flow pauses until a certain service starts, stops or pauses|
|Service name|No|[Text value](../variable-data-types.md#text-value)||The name of the service to check|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforserviceaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there's a problem retrieving the status of the service|

## <a name="start"></a> Start service

Start a stopped Windows service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to start|No|[Text value](../variable-data-types.md#text-value)||The name of the service to start|

### Variables produced

This action doesn't produce any variables.

### <a name="start_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service is already running|Indicates that the service is already running|
|Can't start service|Indicates that there's a problem starting the service|

## <a name="stop"></a> Stop service

Stop a running Windows service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to stop|No|[Text value](../variable-data-types.md#text-value)||The name of the service to stop|

### Variables produced

This action doesn't produce any variables.

### <a name="stop_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't stop service|Indicates that there's a problem stopping the service|

## <a name="pause"></a> Pause service

Pause a running Windows service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to pause|No|[Text value](../variable-data-types.md#text-value)||The name of the service to pause|

### Variables produced

This action doesn't produce any variables.

### <a name="pause_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't pause service|Indicates that there's a problem pausing the service|

## <a name="resume"></a> Resume service

Resume a paused Windows service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Service to resume|No|[Text value](../variable-data-types.md#text-value)||The name of the service to resume|

### Variables produced

This action doesn't produce any variables.

### <a name="resume_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Service isn't running|Indicates that the service isn't running|
|Can't resume service|Indicates that there's a problem resuming the service|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
