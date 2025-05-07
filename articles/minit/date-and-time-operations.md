---
title: List of date and time operations
description: Get a list of date and time operations in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/10/2025
ms.author: dbekirop
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# List of date and time operations

[!INCLUDE [papm-operations-note](../includes/papm-operations-note.md)]

## TODATE([year],[month],[day])

Creates a date from specified date parts.

**Parameters:**- **[year]** - the year part of the date
Data type: INT

- **[month]** - the month part of the date
Data type: INT

- **[day]** - the day part of the date

   Data type: INT

**Output Data Type**: DATE

## TODATE([year],[month],[day],[hour],[minute],[second],[millisecond])

Creates a date from specified date parts along with time.

**Parameters:**- **[year]** - the year part of the date

   Data type: INT

- **[month]** - the month part of the date

   Data type: INT

- **[day]** - the day part of the date

   Data type: INT

- **[hour]** - the hour part of the date

   Data type: INT

- **[minute]** - the minute part of the date

   Data type: INT

- **[second]** - the second part of the date

   Data type: INT

- **[millisecond]** - the millisecond part of the date

   Data type: INT

**Output Data Type**: DATE

## TODATE([year],[month],[day],[time])

Creates a date from specified date parts along with time.

**Parameters:**- **[year]** - the year part of the date

   Data type: INT

- **[month]** - the month part of the date

   Data type: INT

- **[day]** - the day part of the date

   Data type: INT

- **[time]** - the time part of the date

   Data type: INT

**Output Data Type**: DATE

## TOTIME([hour],[minute],[second],[millisecond])

Creates a timespan from the specified date parts.

**Parameters:**- **[hour]** - the hour part of the date

   Data type: INT

- **[minute]** - the minute part of the date

   Data type: INT

- **[second]** - the second part of the date

   Data type: INT

- **[millisecond]** - the millisecond part of the date

   Data type: INT

**Output Data Type**: TIME

## TOTIMEFROMDAYS([value])

Creates a time interval from the total number of days.

**Parameters:**- **[value]** - attribute name, nested operation, or expression to create a timespan

   Data type: INT

**Output Data Type**: TIME, FLOAT

## TOTIMEFROMHOURS([value])

Creates a time interval from the total number of hours.

**Parameters:**- **[value]** - attribute name, nested operation, or expression to create a timespan

   Data type: INT

**Output Data Type**: TIME, FLOAT

## TOTIMEFROMMILLIS([value])

Creates a time interval from the total number of milliseconds.

**Parameters:**- **[value]** - attribute name, nested operation, or expression to create a timespan

   Data type: INT

**Output Data Type**: TIME

## TOTIMEFROMMINUTES([value])

Creates a time interval from the total number of minutes.

**Parameters:**- **[value]** - attribute name, nested operation, or expression to create a timespan

   Data type: INT, FLOAT

**Output Data Type**: TIME

## TOTIMEFROMSECONDS([value])

Creates a time interval from the total number of seconds.

**Parameters:**- **[value]** - attribute name, nested operation, or expression to create a timespan

   Data type: INT, FLOAT

**Output Data Type**: TIME

## ADDDAYS([date],[count])

Adds the specified number of days to the date / time interval.

**Parameters:**- **[date]** - a specific date to which days are added

   Data type: DATE, TIME

- **[count]** - the number of days that are added to the date

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDHOURS([date],[count])

Adds the specified number of hours to the date / time interval.

**Parameters:**- **[date]** - a specific date to which hours are added

   Data type: DATE, TIME

- **[count]** - the number of hours that are added to the date

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDMILLIS([date],[count])

Adds the specified number of milliseconds to the date / time interval.

**Parameters:**- **[date]** - a specific date to which milliseconds are added

   Data type: DATE, TIME

- **[count]** - the number of milliseconds that are added to the date

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDMINUTES([date],[count])

Adds the specified number of minutes to the date / time interval.

**Parameters:**- **[date]** - a specific date to which minutes are added

   Data type: DATE, TIME

- **[count]** - the number of minutes that are added to the date

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDMONTHS([date],[count])

Adds the specified number of months to the date / time interval.

**Parameters:**- **[date]** - a specific date to which months are added

   Data type: DATE, TIME

- **[count]** - the number of months that are added to the date, ignores fractional values

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDSECONDS([date],[count])

Adds the specified number of seconds to the date / time interval.

**Parameters:**- **[date]** - a specific date to which seconds are added

   Data type: DATE, TIME

- **[count]** - the number of seconds that are added to the date

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## ADDYEARS([date],[count])

Adds the specified number of years to the date / time interval.

**Parameters:**- **[date]** - a specific date to which years are added

   Data type: DATE, TIME

- **[count]** - the number of years that are added to the date, ignores fractional values

   Data type: INT, FLOAT

**Output Data Type**: DATE, TIME

## DATE([date])

Returns the date part of the date without a timespan.

**Parameters:**- **[date]** - the date from which the date part is returned

   Data type: DATE

**Output Data Type**: DATE

## DAY([date])

Returns the day of the month from the date.

**Parameters:**- **[date]** - the date from which the day part is returned

   Data type: DATE

**Output Data Type**: INT

## DAYOFWEEK([date])

Returns the day of the week from the date.

**Parameters:**- **[date]** - the date from which the day of the week is returned

   Data type: DATE

**Output Data Type**: INT

## DAYOFYEAR([date])

Returns the day of the year from the date.

**Parameters:**- **[date]** - the date from which the day of the year is returned

   Data type: DATE

**Output Data Type**: INT

## HOUR([date])

Returns an hour from the date.

**Parameters:**- **[date]** - the date from which the hour is returned

   Data type: DATE

**Output Data Type**: INT

## MILLISECOND([date])

Returns a millisecond from the date.

**Parameters:**- **[date]** - the date from which the millisecond is returned

   Data type: DATE

**Output Data Type**: INT

## MINUTE([date])

Returns a minute from the date.

**Parameters:**- **[date]** - the date from which the minute is returned

   Data type: DATE

**Output Data Type**: INT

## MONTH([date])

Returns a month from the date.

**Parameters:**- **[date]** - the date from which the month is returned

   Data type: DATE

**Output Data Type**: INT

## QUARTER([date])

Returns the quarter from the date.

**Parameters:**- **[date]** - the date from which the quarter is returned

   Data type: DATE

**Output Data Type**: INT

## SECOND([date])

Returns the seconds part from the date.

**Parameters:**- **[date]** - the date from which the second is returned

   Data type: DATE

**Output Data Type**: INT

## TIMEOFDAY([date])

Returns the time part of the date.

**Parameters:**- **[date]** - the date from which the time part is returned

   Data type: DATE

**Output Data Type**: TIME

## WEEKOFYEAR([date])

Returns the week number of the year from a date according to ISO 8601 standard.

**Parameters:**- **[date]** - the date from which the week number of the year according to ISO 8601 standard is returned

   Data type: DATE

**Output Data Type**: INT

## YEAR([date])

Returns the year from the date.

**Parameters:**- **[date]** - the date from which the year is returned

   Data type: DATE

**Output Data Type**: INT

## ISLEAPYEAR([year])

Returns TRUE if the year is leap, otherwise returns FALSE.

**Parameters:**- **[year]** - the year which I'm checking whether it is a leap one or not

   Data type: INT

**Output Data Type**: BOOL

## DAYS([time])

Returns the day part from the timespan.

**Parameters:**- **[time]** - the date from which the day part is returned

   Data type: TIME

**Output Data Type**: INT

## HOURS([time])

Returns the hour part from the timespan.

**Parameters:**- **[time]** - the date from which the hour part is returned

   Data type: TIME

**Output Data Type**: INT

## MILLISECONDS([time])

Returns the millisecond part from the timespan.

**Parameters:**- **[time]** - the date from which the millisecond part is returned

   Data type: TIME

**Output Data Type**: INT

## MINUTES([time])

Returns the minute part from the timespan.

**Parameters:**- **[time]** - the date from which the minute part is returned

   Data type: TIME

**Output Data Type**: INT

## SECONDS([time])

Returns the second part from the timespan.

**Parameters:**- **[time]** - the date from which the second part is returned

   Data type: TIME

**Output Data Type**: INT

## TOTALDAYS([time])

Returns the value of the timespan expressed in whole and fractional days.

**Parameters:**- **[time]** - the date from which the timespan expressed in whole and fractional days is returned

   Data type: TIME

**Output Data Type**: FLOAT

## TOTALHOURS([time])

Returns the value of the timespan expressed in whole and fractional hours.

**Parameters:**- **[time]** - the date from which the timespan expressed in whole and fractional hours is returned

   Data type: TIME

**Output Data Type**: FLOAT

## TOTALMILLIS([time])

Returns the value of the timespan expressed in whole and fractional milliseconds.

**Parameters:**- **[time]** - the date from which the timespan expressed in whole and fractional milliseconds is returned

   Data type: TIME

**Output Data Type**: FLOAT

## TOTALMINUTES([time])

Returns the value of the timespan expressed in whole and fractional minutes.

**Parameters:**- **[time]** - the date from which the timespan expressed in whole and fractional minutes is returned

   Data type: TIME

**Output Data Type**: FLOAT

## TOTALSECONDS([time])

Returns the value of the timespan expressed in whole and fractional seconds.

**Parameters:**- **[time]** - the date from which the timespan expressed in whole and fractional seconds is returned

   Data type: TIME

**Output Data Type**: FLOAT

## ISWORKINGHOUR([dateTime])

Returns true when time date belongs to working hours defined in the actual calendar.

**Parameters:**- **[dateTime]** - the date to be evaluated

   Data type: DATE

**Output Data Type**: BOOL

## ISWORKINGDAY([date])

Returns true when date belongs to working day defined in the actual calendar.

**Parameters:**- **[date]** - the date to be evaluated

   Data type: DATE

**Output Data Type**: FLOAT

## ISPUBLICHOLIDAY([date])

Returns true when date belongs to public holiday defined in the actual calendar.

**Parameters:**- **[date]** - the date to be evaluated

   Data type: DATE

**Output Data Type**: FLOAT

## DURATIONCALENDAR([startDate], [endDate])

Returns working time duration between two dates calculated actual calendar.

>[!IMPORTANT]
>
>The calculations associated with the work calendar work correctly only in the range from the start of the process minus 6 months to the end of the process plus 24 months. Calculating calendar values such as working days or working hours outside this range will return an error and a default value. This calendar range can't be set by you in the application and is automatically applied after each data refresh. **Parameters:** - **[startDate]** - start date of timespan.

   Data type: DATE

- **[endDate]** - end date of timespan

   Data type: DATE

**Output Data Type**: FLOAT

## ADDWORKINGDAYS([date],[count])

Adds the specified number of working days to the date. Exact number of defined working hours is not relevant. Any day which is marked as working day is counted as one.

>[!IMPORTANT]
>
>The calculations associated with the work calendar return correct results only in the range from 6 months prior to the process start until 24 months past the process end date. Calculating calendar values (for example, working days and working hours) outside this range will return an error and a default value. This range is automatically applied after each data refresh and isn't available for you to change. **Parameters:** - **[date]** - a specific date to which days are added.

   Data type: DATE

- **[count]** - the number of working days that are added to the date

   Data type: INT

**Output Data Type**: DATE

## ADDWORKINGHOURS([date],[count])

Adds the specified number of working hours to the date.

>[!IMPORTANT]
>
>The calculations associated with the work calendar return correct results only in the range from 6 months prior to the process start until 24 months past the process end date. Calculating calendar values (for example, working days and working hours) outside this range will return an error and a default value. This range is automatically applied after each data refresh and isn't available to change. **Parameters:** - **[date]** - a specific date to which working hours are added.

   Data type: DATE

- **[count]** - the number of working hours that are added to the date

   Data type: INT

**Output Data Type**: DATE

## ADDWORKINGMINUTES([date],[count])

Adds the specified number of working minutes to the date.

>[!IMPORTANT]
>
>The calculations associated with the work calendar return correct results only in the range from 6 months prior to the process start until 24 months past the process end date. Calculating calendar values (for example, working days and working hours) outside this range will return an error and a default value. This range is automatically applied after each data refresh and isn't available for you to change. **Parameters:** - **[date]** - a specific date to which working minutes are added.

   Data type: DATE

- **[count]** - the number of working minutes that are added to the date

   Data type: INT

**Output Data Type**: DATE


