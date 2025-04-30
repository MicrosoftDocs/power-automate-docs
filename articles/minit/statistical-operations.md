---
title: List of statistical operations
description: Learn about the statistical operations in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/10/2025
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# List of statistical operations

This article lists statistical operations in the Power Automate Process Mining desktop app.

[!INCLUDE [papm-operations-note](../includes/papm-operations-note.md)]

## START()

Returns the start of a process/event/case/path.

**Supported context:** process, event, case, edge

**Output Data Type**: DATE

## END()

Returns the end of a process/event/case/path.

**Supported context:** process, event, case, edge

**Output Data Type**: DATE

## DURATION()

Returns the duration of a process/event/case/path.

**Supported context:** process, event, case, edge

**Output Data Type**: TIME

## EVENTCOUNT()

Returns number of the events in the case/process.

**Supported context:** process, event

**Output Data Type**: INT

## CASECOUNT()

Returns number of the cases in the process.

**Supported context:** process

**Output Data Type**: INT

## ACTIVETIME()

Returns case active time.

**Supported context:** case

**Output Data Type**: TIME

## WAITINGTIME()

Returns case waiting time.

**Supported context:** case

**Output Data Type**: TIME

## ISPARALLEL()

In the case context, it returns TRUE if at least one event occurred in parallel with another event, otherwise FALSE. In the event context, it returns TRUE if the event occurred in parallel with another event, otherwise FALSE.

**Supported context:** case, event

**Output Data Type**: BOOL

## ISPARALLELWITH([condition])

Returns TRUE if the event occurred in parallel with another event which fullfilla given condition, otherwise FALSE.

**Supported context:** event

**Parameters:**

- ***[condition]*** - condition under which is parallelism accepted

   Data type: BOOLEAN

**Output Data Type**: BOOL

## UTILIZATION()

Returns case utilization (number from 0 to 1).

**Supported context:** case

**Output Data Type**: FLOAT

## PARALLELUTILIZATION()

Returns the cumulative case utilization (a number from 0 to 1 to N). A value above 1 is due to parallel events that last longer than the case itself.

**Supported context:** case

**Output Data Type**: FLOAT

## REWORKCOUNT([attributeName])

Returns the total count of all reworks (loops and self-loops) within the case.

**Supported context:** case

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional.

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: INT

## LOOPCOUNT([attributeName])

Returns count of loops within the case.

**Supported context:** case

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: INT

## SELFLOOPCOUNT([attributeName])

Returns count of self-loops within the case.

**Supported context:** case

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: INT

## OCCURRENCE([attributeName])

Returns occurrence index of a given event attribute value within the case.

**Supported context:** event

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: INT

## ISSELFLOOP([attributeName])

Returns true when event/edge has self-loop repetition.

**Supported context:** event, edge

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: BOOL

## ISLOOP([attributeName])

Returns true when event/edge has loop repetition.

**Supported context:** event, edge

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: BOOL

## ISREWORK([attributeName])

Returns true when event/edge has any kind of rework (self-loop or loop).

**Supported context:** event, edge

**Parameters:**

- ***[attributeName]*** - Attribute name to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: BOOL

## ISLOOPINFLOW([attributeName])

Returns true when event/edge has loop inflow.

**Supported context:** event, edge

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: BOOL

## ISLOOPOUTFLOW([attributeName])

Returns true when event/edge has loop outflow.

**Supported context:** event, edge

**Parameters:**

- ***[attributeName]*** - Attribute to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

**Output Data Type**: BOOL

## LOOPGAIN([attributeName])

Returns difference between the event's loop outflow and loop inflow. Value +1 when the event has loop outflow and no loop inflow. Value -1 when the event has no loop outflow and loop inflow. Otherwise returns 0.

**Supported context:** event

**Parameters:**

- ***[attributeName]*** - Attribute name to calculate repetitions. If none is entered, the default attribute is mining attribute (activity attribute), optional

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: INT

## MEDIAN([context],[value],[compression])

Calculates the approximate median of values grouped according to the defined context.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

   Data type: STRING (only fixed string is allowed)

- ***[value]*** - value over which the median is calculated

   Data type: STRING (only fixed string is allowed)

- ***[compression]*** - controls the estimation accuracy and memory utilization. High compression values increase the accuracy of estimation but make the operation slower. The value must be between 20 and 1000, the default value is 200.

   Data type: FLOAT

**Output Data Type**: INT, FLOAT, DATE, TIME

## QUANTILE([context],[value],[q],[compression])

Calculates the approximate q-th quantile of values grouped according to defined context. The q-th quantile of a data set is defined as that value where a q fraction of the data is below that value and (1-q) fraction of the data above that value.

**Supported context:** process, case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

   Data type: STRING (only fixed string is allowed)

- ***[value]*** - value for evaluation

   Data type: INT, FLOAT, DATE, TIME

- ***[q]*** - quantile to compute, must be between 0 and 1 inclusive.

   Data type: FLOAT (only constant value is allowed)

- ***[compression]*** - controls the estimation accuracy and memory utilization. High compression values increase the accuracy of estimation but make the operation slower. The value must be between 20 and 1000, the default value is 200.

   Data type: FLOAT

**Output Data Type**: INT, FLOAT, DATE, TIME

## CDF([context],[value],[x],[compression])

Calculates the estimated cumulative distribution function (cdf) for the given value from values grouped according to the defined context.

**Supported context:** case, event, edge

**Parameters:**

- ***[context]*** - defines the context in which the operation is calculated

   Data type: STRING (only fixed string is allowed)

- ***[value]*** - value for evaluation for cumulative distribution.

   Data type: INT, FLOAT, DATE, TIME

- ***[x]*** - threshold value
Data type: INT, FLOAT, DATE, TIME (need to be the same data type as [value] parameter)

- ***[compression]*** - controls the estimation accuracy and memory utilization. High compression values increase the accuracy of estimation but make the operation slower. The value must be between 20 and 1000, the default value is 200.

   Data type: FLOAT

**Output Data Type**: INT, FLOAT, DATE, TIME

## ISFINISHED()

Returns true when the case is categorized as finished (as defined in Process Context – Case Categorization).

**Supported context:** case

**Output Data Type**: BOOL

## ISRUNNING()

Returns true when the case is categorized as running (as defined in Process Context – Case Categorization)

**Supported context:** case

**Output Data Type**: BOOL

## ISSTUCK()

Returns true when the case is categorized as stuck (as defined in Process Context – Case Categorization).

**Supported context:** case

**Output Data Type**: BOOL

## ISINCOMPLETEIMPORT()

Returns true when the case is categorized as import incomplete (as defined in Process Context – Case Categorization)

**Supported context:** case

**Output Data Type**: BOOL

## STATS([Aggregate]*,[Type]**)

Returns calculated process statistics according to the selected aggregation and type of statistics.

**Supported context:** process

**Parameters:**

- ***[Aggregate]*** – aggregation by which the process statistics will be calculated (eg: sum, average, minimum, maximum, range, standard deviation)

- ***[Type]*** - the type of statistics used in the calculation

**Output Data Type**: INT, FLOAT, TIME, DATE

## Types of Aggregations

Following are the allowed aggregation types:

- Sum
- Avg
- Min
- Max
- Range
- Stdev

## Types of Statistics

| Name | Description |
| - | - |
| CaseStart | Case start |
| CaseEnd | Case end |
| CaseDuration | Case Duration |
| CaseActiveTime | Case Active Time |
| CaseWaitingTime | Case Waiting Time |
| CaseUtilization | Case Utilization |
| EventCount | Event Count |
