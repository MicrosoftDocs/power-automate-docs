---
title: List of aggregations (preview)
description: Learn the syntax to use for various aggregations in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# List of aggregations (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This article provides the syntax to use for various aggregations.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

## AVG([context],[value])

Calculates the average of values grouped according to the defined context

- **[context]:** Defines the context in which the operation is calculated.

- **[value]:** Attribute name, nested operation, or expression whose values ​​are input for the average calculation.

Data Type: INT, FLOAT, DATE, TIME

**Output Data Type**: FLOAT, DATE, TIME



## AVGIF([context], [condition], [value])

calculates the average of values fulfilling the defined condition grouped according to the defined context.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[condition]*** - condition under which the [value] is included into the average calculation
Data type: BOOL

- ***[value]*** - attribute name, nested operation, or expression whose values ​​are input for the average calculation
Data type: INT, FLOAT, DATE, TIME

**Output Data Type**: INT, FLOAT, DATE, TIME

**Example**:


```
AVGIF(ViewEvents, userName == "Laura", eventCost)
```


Metric applicable on any custom metric usage within the application. Returns average event cost for events done by the user "Laura".



## COUNT([context])

Counts the number of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

**Output Data Type**: INT



## COUNTIF([context],[condition])

Counts the number of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

**Output Data Type**: INT



## COUNTUNIQUE([context],[value])

Counts the number of unique values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are input for counting unique values
Data Type: INT, FLOAT, BOOL, STRING, DATE, TIME

**Output Data Type**: INT



## COUNTUNIQUEIF([context],[condition],[value])

Counts the number of unique values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are summed up
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## MAX([context],[value])

Returns the maximum of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are input for maximum selection
Data Type: INT, FLOAT, DATE, TIME

**Output Data Type**: INT, FLOAT, DATE, TIME



## MAXIF([context],[condition],[value])

Returns the maximum of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are input for maximum selection
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## MAXVAL([context],[value1],[value2])

Selects item with maximum value from value1 and returns its calculated value defined by value2, grouped according to the defined context



**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[value1]*** - attribute name, nested operation, or expression, values of which are input for maximum selection
Data Type: INT, FLOAT, TIME, DATE

- ***[value2]*** - attribute name, nested operation, or expression, values of which are used as the return value
Data Type: INT, FLOAT, STRING, TIME, DATE

**Output Data Type**: INT, FLOAT, STRING, TIME, DATE

**Example**:


```
MAXVAL(EventsPerAttribute, Duration(), userName)
```


Metric applicable on the process map. Returns the username of a user who worked on the longest event per activity.



## MAXVALIF([context], [condition], [value1], [value2])

Selects item with the maximum value defined by value1 fulfilling the defined condition and returns its calculated value defined by value2, grouped according to the defined context.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[condition]*** - condition under which the [value1] is included into the maximum selection
Data type: BOOL

- ***[value1]*** - attribute name, nested operation, or expression whose values ​​are input for the maximum selection
Data type: INT, FLOAT, DATE, TIME

- ***[value2]*** - attribute name, nested operation, or expression, values of which are used as the return value
Data type: INT, FLOAT, STRING, TIME, DATE

**Output Data Type**: INT, FLOAT, STRING, TIME, DATE



## MIN([context],[value])

Returns the minimum of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are input for counting unique values
Data Type: INT, FLOAT, DATE, TIME

**Output Data Type**: INT, FLOAT, DATE, TIME



## MINIF([context],[condition],[value])

Returns the minimum of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are summed up
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## MINVAL([context], [value1], [value2])

Selects item with the minimum value defined by value1 and returns its calculated value defined by value2, grouped according to the defined context.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[value1]*** - attribute name, nested operation, or expression whose values ​​are input for the maximum selection
Data type: INT, FLOAT, DATE, TIME

- ***[value2]*** - attribute name, nested operation, or expression, values of which is used as the return value
Data type: INT, FLOAT, STRING, TIME, DATE

**Output Data Type**: INT, FLOAT, STRING, TIME, DATE



## MINVALIF([context], [condition], [value1], [value2])

Selects item with the minimum value defined by value1 fulfilling the defined condition and returns its calculated value defined by value2, grouped according to the defined context.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[condition]*** - condition under which the [value1] is included into the minimum selection
Data type: BOOL

- ***[value1]*** - attribute name, nested operation, or expression whose values ​​are input for the minimum selection
Data type: INT, FLOAT, DATE, TIME

- ***[value2]*** - attribute name, nested operation, or expression, values of which is used as the return value
Data type: INT, FLOAT, STRING, TIME, DATE

**Output Data Type**: INT, FLOAT, STRING, TIME, DATE



## RANGE([context],[value])

Returns the range (maximum-minimum) of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are input for calculation
Data Type: INT, FLOAT, DATE, TIME

**Output Data Type**: INT, FLOAT, TIME



## RANGEIF([context],[condition],[value])

Returns the range (maximum-minimum) of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- [value] - attribute name, nested operation, or expression whose values are input for calculation
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## STDEV([context],[value])

Calculates the standard deviation of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are input for calculation
Data Type: INT, FLOAT, DATE, TIME

**Output Data Type**: FLOAT, TIME



## STDEVIF([context],[condition],[value])

Calculates the standard deviation of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are input for calculation
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## SUM([context],[value])

Calculates the sum of values grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression whose values ​​are summed up
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## SUMIF([context],[condition],[value])

Calculates the sum of values fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are summed up
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## FIRST([context], [value])

Returns the first value, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression, values of which are returned
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## FIRSTIF([context], [condition], [value])

Returns the first value fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are returned
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## LAST([context], [value])

Returns last value, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression, values of which ​​are returned
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## LASTIF([context], [condition], [value])

Returns last value fulfilling the defined condition, grouped according to the defined context



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - condition under which the [value] is included into the operation calculation
Data Type: BOOL

- **[value]** - attribute name, nested operation, or expression, values of which are returned
Data Type: INT, FLOAT, TIME

**Output Data Type**: FLOAT, TIME



## SELFLOOP([context],[attributeName])

Calculates count of selfloop events grouped according to the defined context, short version of COUNTIF(ISSELFLOOP()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## LOOP([context],[attributeName])

Calculates count of loop events grouped according to the defined context, short version of COUNTIF(ISLOOP()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## REWORK([context],[attributeName])

Calculates count of rework events grouped according to the defined context, short version of COUNTIF(ISREWORK()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## LOOPINFLOW([context],[attributeName])

Calculates count of loop inflows grouped according to the defined context, short version of COUNTIF(ISLOOPINFLOW()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## LOOPOUTFLOW([context],[attributeName])

Calculates count of loop outflows grouped according to the defined context, short version of COUNTIF(ISLOOPOUTFLOW()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## NETLOOPGAIN([context],[attributeName])

Calculates sum of loop gains grouped according to the defined context, short version of SUM(LOOPGAIN()) expression



- **[context]** - defines the context in which the operation is calculated

- **[attributeName]** - attribute name; if no attribute is defined, current activity (mining) attribute is used
Data Type: STRING

**Output Data Type**: INT



## MODE([context],[value])

Returns most common value from defined context.



- **[context]** - defines the context in which the operation is calculated

- **[value]** - attribute name, nested operation, or expression
Data Type: STRING, INT, FLOAT, DATE, TIME, BOOL

**Output Data Type**: STRING, INT, FLOAT, DATE, TIME, BOOL



## MODEIF([context],[condition][value])

Returns most common value from data elements that met the condition in a defined context.



- **[context]** - defines the context in which the operation is calculated

- **[condition]** - defines the criteria for data element

- **[value]** - attribute name, nested operation, or expression
Data Type: STRING, INT, FLOAT, DATE, TIME, BOOL

**Output Data Type**: STRING, INT, FLOAT, DATE, TIME, BOOL



## ALL([context],[condition])

returns true if all values grouped according to the defined context are fulfilling the defined condition.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[condition]*** - defines the criteria for data element.
Data type: BOOL

**Output Data Type**: BOOL

**Example**:


```
ALL(CaseEvents, eventCost > 0)
```


Metric applicable on case metrics filters or case overview statistics. Returns true if all events in the case have an event cost greater than zero.



## ANY([context],[condition])

returns true if any of the values grouped according to the defined context are fulfilling the defined condition.

** Supported context:** case (implicit)

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

- ***[condition]*** - defines the criteria for data element.
Data type: BOOL

**Output Data Type**: BOOL

**Example**:


```
ANY(CaseEvents, eventCost > 0)
```


Metric applicable on case metrics filters or case overview statistics. Returns true if an event in the case has an event cost greater than zero.



List of all calculation contexts for aggregation operations is available here: [**Calculation context**](calculation-context.md)


