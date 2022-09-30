---
title: Activities (event level) statistics
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Activities (event level) statistics

These statistics refer to activities or event-level attributes in the process undergoing analysis, and they display their various properties. All event-level attributes (including activities) share the same event-level statistics.

### Statistical chart

The following metrics are available in the chart:

#### Case frequency

This item displays the total number of case occurrences of each activity in the process.

#### Case frequency (%)

This item displays the percentage of case occurrences of each activity in the process relative to all cases in the process.

#### Event frequency

This item displays the total number of occurrences of each activity in the process.

#### Event frequency (%)

This item displays the percentage of occurrences of each activity in the process relative to all activities.

#### Maximum repetitions

This item displays the largest number of activity repetitions in process instances.

#### Total duration

This item displays the total duration of each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Total duration (%)

This item displays the percentage of the total duration of each activity in the process relative to the total duration of all cases.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Mean duration

This item displays the average duration of each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Mean duration (%)

This item displays the percentage of each activity's average duration in the process relative to the average duration of all cases in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Minimum duration

This item displays the shortest duration of each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Maximum duration

This item displays the longest duration of each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Duration range

This item displays the difference between the longest and shortest duration of the occurrence of each activity for each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Duration std. dev.

This item displays the standard deviation of each activity in the process.

This chart is available if there are two timestamps recorded in the data and imported with the process.

#### Self-loop count

This item displays the number of self-loops on an activity.

#### Self-loop (%)

This item displays the percentage of self loops on an activity relative to the total occurrence of that activity in the process.

#### Loop count

This item displays the number of involvements of an activity in the loop.

#### Loop (%)

This item displays the percentage of involvements of an activity in the loop relative to the total occurrence of that activity in the process.

#### Rework count

This item displays the number of involvements of an activity in rework. For more detailed information on Rework-related metrics, please refer to the [Rework section](rework-metrics.md) of this Help.

#### Rework (%)

This item displays the percentage of involvements of an activity in rework relative to the total occurrence of that activity in the process.

#### Loop inflow

This item displays the value of loop inflow of an activity in the process.

#### Loop inflow (%)

This item displays the percentage of loop inflow of an activity relative to the total occurrence of that activity in the process.

#### Loop outflow

This item displays the value of loop outflow of an activity in the process.

#### Loop outflow (%)

This item displays the percentage of loop outflow of an activity relative to the total occurrence of that activity in the process.

#### Net Loop Gain

This item displays the value of net loop gain of an activity in the process.

#### Net Loop Gain (%)

This item displays the percentage of net loop gain of an activity relative to the total occurrences of that activity in the process.

Besides these standard statistics, the list contains all defined Event-level custom metrics with the continuous output data type.

### Summary header and table of activities (attribute values)

The summary provides an overview of standard metrics provided by Minit. The list of these metrics is not configurable and no additional metrics can be included in this summary row. The table of activities (or attribute values) contains standard event-level metrics, and custom metrics applicable on the event level. In the table, all event-level custom metrics are available regardless of their discrete or continuous output data type.

:::image type="content" alt-text="media/event-table.png" source="media/event-table.png":::

The summary header contains the following metrics:

#### Activities (Values)

The total number of unique values for activities or event-level attributes. Activity attribute is defined in process import/configuration and is not affected by the selection of mining attribute on the process map.

#### Minimum frequency

The minimal number of occurrences of a given activity (attribute value) in a single case.

#### Maximum frequency

The maximum number of occurrences of a given activity (attribute value) in a single case.

#### Median frequency

The median number of occurrences of a given activity (attribute value) in a single case.

#### Mean frequency

The mean number of occurrences of a given activity (attribute value) in a single case.

#### Count std. deviation

Standard deviation of activity (attribute value) occurrences in a view.

#### Minimum duration, Maximum duration

The global minimum and maximum duration of a single event.

#### Mean duration

The average duration of events.

#### Duration std. deviation

Standard deviation of activity (attribute value) durations in a view.

#### Self-loop events

Shows the percentage of events in self-loops relative to the total number of events in the view.

#### Loop events

Shows the percentage of events in loops relative to the total number of events in the view.

#### Rework events

Shows the percentage of events in rework relative to the total number of events in the view.


