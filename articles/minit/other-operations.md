---
title: List of other operations (preview)
description: Get a list of operations and what they return in the minit desktop application in process advisor.
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

# List of other operations (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## attributeName

returns the event/case attribute value

**Output Data Type**: BOOL, INT, STRING, FLOAT, TIME, DATE

**Example**:


```
MAX(eventCost)
```


Metric applicable on process map calculates the maximum cost of the event per activity. Attribute name - eventCost - is case insensitive, valid formats are also for example EVENTCost, eventcost, or EventCOST.



## GETVALUE([attributeName])

returns the event/case attribute value

**Parameters:**

- ***[attributeName]*** - attributeName
Data type: STRING (only fixed string is allowed)

**Output Data Type**: BOOL, INT, FLOAT, TIME, DATE

**Example**:


```
GetValue("ivoice total")
```


If the attribute contains space in the name, it is not possible to write it directly as part of the custom metric expression. In such cases use the operator GetValue to access the value of a given attribute.



## IF([condition],[valueIfTrue],[valueIfFalse])

returns the first or second value based on the condition

**Parameters:**

- ***[condition]*** - boolean value or expression
Data type: BOOL

- ***[valueIfTrue]*** - value to be matched in input string
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[valueIfFalse]*** - returned value if condition is not met
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
IF(EventCount() > 10, "Complex", "Simple")
```


Metric applicable on case overview statistics screen. If the case contains more than 10 events, the returned value is "Complex", otherwise "Simple".



## SOURCE([operation])

changes the context of the operation to initial event path (only allowed for paths)

**Supported context:** edge


**Parameters:**

- ***[operation]*** - value to be returned from the initial event path
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
SUM(SOURCE(Duration())+Duration())
```


Metric applicable on process map calculates the sum of the initial event duration in the path and the path duration itself.



## TARGET([operation])

changes the context of the value to ending event path (only allowed for paths)

**Supported context:** edge


**Parameters:**

- ***[operation]*** - input string
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
SUM(SOURCE(Duration())+TARGET(Duration()))
```


Metric applicable on process map calculates total duration of path's starting and ending events for each path.



## CASE([operation])

changes the context of the operation to case event/path (only allowed for events and paths)

**Supported context:** event, edge


**Parameters:**

- ***[operation]*** - value to be calculated on the case level of a current event or edge
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIM

**Example**:


```
Duration() / CASE(Duration())
```


Metric applicable on event-level filter calculates the ratio of event duration to case duration.



## FIRSTEVENT([operation])

changes the context of the operation to the first event case (only allowed for cases)

**Supported context:** case


**Parameters:**

- ***[operation]*** - value to be calculated on the context of the first event in the case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
FIRSTEVENT(Duration())
```


Metric applicable on case overview statistic calculates the duration of the first case's event per each case.



## LASTEVENT([operation])

changes the context of the operation to the end event case (only allowed for cases)

**Supported context:** case


**Parameters:**

- ***[operation]*** - value to be calculated on the context of the last event in the case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
LASTEVENT(Duration())
```


Metric applicable on case overview statistic calculates the duration of the last case's event per each case.



## PROCESS([operation])

changes the context of the operation to a process.

**Supported context:** process, case, event, edge


**Parameters:**

- ***[operation]*** - value to be calculated in the context of the actual process
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
PROCESS(EventCount())
```


Metric applicable for any custom metric usage within the application. Returns total number of events in the current process (in actual view).



## IN([operation], value1, value2, value3, ...., valueN)

returns TRUE if the operation is equal to any of given values. It is a shortened version of the logical operation OR.

**Parameters:**

- ***[operation]*** - value to be calculated in the context of the actual process
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[value1], [value2], .., [value3]*** - list of values for compare. All values need to be the same data type and the same data type as the operation
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL

**Example**:


```
COUNTIF(IN(userName, "Peter", "Martin", "Laura"))
```


Metric applicable on process map for activities. Returns the total count of events with users named "Peter" or "Martin" or "Laura" per activity.



## NEXT([value],[default])

returns value of the next event in the case. If next event does not exist, returns default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[value]*** - value to be calculated in the context of the next event within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no next event in the actual case.
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
NEXT(eventCost, 0)
```


Metric applicable on filter metrics. Returns event cost of the next event in the case. If the current event is the last event in the case, returns zero.



## NEXTIF([condition], [value], [default])

returns value of the first next event in the case which met the condition. If no such next event exists, returns default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[condition]*** - the condition which needs to be met for the event selection
Data type: BOOL

- ***[value]*** - value to be calculated in the context of the first next event which matches the [condition] within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no next event in the actual case which matches the condition
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
NEXTIF(userName == "Laura", eventCost, 0)
```


Metric applicable on any custom metric usage within the application. Returns total number of events in the current process (in the actual view).



## PREVIOUS([value], [default])

returns value of the previous event in the case. If previous event does not exist, returns default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[value]*** - value to be calculated in the context of the previous event within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no previous event in the actual case.
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
PREVIOUS(userName, "n/a")
```


Metric applicable on metrics filter. Returns value of userName attribute for the previous event in the case. If the previous event does not exist (e.g. for the first event in case), it returns "n/a".



## PREVIOUSIF([condition], [value], [default])

returns value of the first previous event in the case which met the condition. If no such previous event exists, returns the default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[condition]*** - the condition which needs to be met for the event selection
Data type: BOOL

- ***[value]*** - value to be calculated in the context of the first previous event which matches the [condition] within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no previous event in the actual case which matches the condition
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
PREVIOUSIF(eventCost > 0, userName, "n/a")
```


Metric applicable on metrics filter. Returns value of userName attribute for the first previous event in the case with the eventCost greater than zero. If no such previous event exists, it returns "n/a".



## MOVE([offset], [value], [default])

returns value of the event in the case retrieved by the offset. Offset 1 means next event, offset -1 previous, offset 0 current. If the event does not exist on the given offset, it returns the default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[offset]*** - offset to current event
Data type: INT

- ***[value]*** - value to be calculated in the context of the specified event within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no such event in the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
SUM(MOVE(2, eventCost, 0) + MOVE(1, eventCost, 0))
```


Metric applicable on the process map. Returns the sum of event cost for the next two (subsequent) events calculated per activity.



## MOVEIF([offset], [condition], [value], [default])

returns value of the event satisfying the condition retrieved by the offset. Offset 1 means the next following fulfilling event, offset -1 the nearest previous fulfilling event, offset 0 the current fulfilling event. If such an event does not exist, it returns the default value.

**Supported context:** case (implicit)


**Parameters:**

- ***[offset]*** - event offset
Data type: INT

- ***[condition]*** - the condition which needs to be met for the event selection
Data type: BOOL

- ***[value]*** - value to be calculated in the context of the specified event within the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

- ***[default]*** - default value to be returned if there is no such event in the actual case
Data type: BOOL, INT, FLOAT, STRING, DATE, TIME

**Output Data Type**: BOOL, INT, FLOAT, STRING, DATE, TIME

**Example**:


```
MOVEIF(3, userName == "Laura", eventCost, 0)
```


Metric applicable on metrics filter. Returns event cost for the 3rd next event which was done by the user "Laura" in the current case.






