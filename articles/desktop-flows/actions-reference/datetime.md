---
title: Date time actions reference
description: See all the available date time actions.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/20/2023
ms.author: matp
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Date time actions

Use the **Get current date and time** action to retrieve the current date and time (or date only, if selected) and store it in a variable. The date format depends on the Windows configuration. To find more information about the syntax of date and time values, go to [Variable data types](../variable-data-types.md#dates-and-time).

To add various time units to date variables, deploy the **Add to datetime** action.

To calculate the difference between two dates, use the **Subtract dates** action. You can retrieve the difference in seconds, minutes, hours, or days.

:::image type="content" source="media/datetime/subtract-dates.png" alt-text="Screenshot of the Subtract dates action.":::

## <a name="add"></a> Add to datetime

Adds (or subtracts) a specific number of seconds, minutes, hours or days to a datetime value.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Datetime|No|[Datetime](../variable-data-types.md#dates-and-time)||The datetime value to alter|
|Add|No|[Numeric value](../variable-data-types.md#numeric-value)||The numeric value to add. To subtract a time, the value should be negative. For example, add -7 days here to go back one week|
|Time unit|N/A|Seconds, Minutes, Hours, Days, Months, Years|Seconds|The time unit the time to add represents|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ResultedDate|[Datetime](../variable-data-types.md#dates-and-time)|The new, altered datetime value|

### <a name="add_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="subtract"></a> Subtract dates

Finds the time difference between two given dates in days, hours, minutes, or seconds.

To subtract a given date from another one use the **Subtract dates** action. Input a valid date in the **From date** property to use as a base to subtract the other date from. Then populate the **Subtract date** property to calculate the difference. Make sure to use a valid `Datetime` type of variable here (to create one use the **Get current date and time** action). You can specify how the returned difference should be represented (in days/ hours/ minutes/ seconds) by selecting the respective option in the **Get difference in** property.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|From date|No|[Datetime](../variable-data-types.md#dates-and-time)||The datetime to subtract the first datetime from. This will be the base datetime, so generally put the later date/time in this attribute|
|Subtract date|No|[Datetime](../variable-data-types.md#dates-and-time)||The datetime to subtract|
|Get difference in|N/A|Seconds, Minutes, Hours, Days|Days|The unit of time to express the difference in|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TimeDifference|[Numeric value](../variable-data-types.md#numeric-value)|The difference in time as a numeric value|

### <a name="subtract_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="getcurrentdatetime"></a> Get current date and time

Retrieves the current date or the current date and time.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Retrieve|N/A|Current date and time, Current date only|Current date and time|Specify whether to get the date and time, or just the date. If the latter is chosen, the time value will be stored as midnight (0:00:00)|
|Time zone|N/A|System time zone, Specific time zone **(to be deprecated)**, Windows time zone, Custom input|System time zone|Specify whether to use the system's time zone or select a specific one or set up a time zone manually|
|Country/region|No|[Text value](../variable-data-types.md#text-value)|Europe/Bucharest|The country/region to get the time of or add a numeric value as the hours that will be added in the UTC time zone|
|Windows time zone|No|Available [Windows time zones](/windows-hardware/manufacture/desktop/default-time-zones#time-zones)|(UTC) Coordinated Universal Time|Specify the country/region to obtain the time zone from|
|Input Type|No|Offset, Windows time zone|Offset|Choose whether to set the offset via a numeric value or by providing a Windows format time zone|
|Offset|No|[Numeric value](../variable-data-types.md#numeric-value)|N/A|Specify the number of hours the offset is going to be. Time format is UTC.|
|Time zone|No|[Text value](../variable-data-types.md#text-value)|N/A|Specify the time zone (Windows time zone)|


### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CurrentDateTime|[Datetime](../variable-data-types.md#dates-and-time)|The current datetime value|

### <a name="getcurrentdatetime_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get current date and time|Indicates that there was a problem retrieving the current date and time|
|Specified country/region not found|Indicates that the specified country or region wasn't found|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
