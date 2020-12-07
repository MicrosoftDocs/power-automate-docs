---
title: Datetime | Microsoft Docs
description: Datetime Actions Reference
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

# Datetime

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Get the date and time and perform time related functions

|<!-- --> |
|-----|
|[Add to datetime](#add)|
|[Subtract dates](#subtract)|
|[Get current date and time](#getcurrentdatetime)|

### <a name="add"></a> Add to datetime
Adds (or subtracts) a specific number of seconds, minutes, hours or days to a datetime value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Datetime|No|Datetime||The datetime value to alter|
|Add|No|Numeric value||The numeric value to add. To subtract a time, this value would be negative. For example, add -7 days here to go back one week|
|Time unit|N/A|Seconds, Minutes, Hours, Days, Months, Years|Seconds|The time unit the time to add represents|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ResultedDate|Datetime|The new, altered datetime value|


##### <a name="add_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="subtract"></a> Subtract dates
Finds the time difference between two given dates in days, hours, minutes, or seconds

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|From date|No|Datetime||The datetime to subtract the first datetime from. This will be the base datetime, so generally put the later date/time in this attribute|
|Subtract date|No|Datetime||The datetime to subtract|
|Get difference in|N/A|Seconds, Minutes, Hours, Days|Days|The unit of time to express the difference in|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TimeDifference|Numeric value|The difference in time as a numeric value|


##### <a name="subtract_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="getcurrentdatetime"></a> Get current date and time
Retrieves the current date or the current date and time

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Retrieve|N/A|Current date and time, Current date only|Current date and time|Specify whether to get the date and time, or just the date. If the latter is chosen, the time value will be stored as midnight (0:00:00)|
|Time zone|N/A|System time zone, Specific time zone|System time zone|Whether to use the system's time zone or a custom one|
|Country/region|Yes|Text value|Europe/Bucharest|The country/region to get the time of or add a numeric value as the hours that will be added in the UTC time zone|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CurrentDateTime|Datetime|The current datetime value|


##### <a name="getcurrentdatetime_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to get current date and time|Indicates that there was a problem retrieving the current date and time|
|Specified country/region not found|Indicates that the specified country or region wasn't found|


