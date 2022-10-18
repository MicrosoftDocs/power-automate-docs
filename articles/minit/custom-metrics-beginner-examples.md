---
title: Custom Metrics - Beginner Examples
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

# Custom Metrics - Beginner Examples

The following examples shows various calculation methods for custom metrics with focus on proper context/aggregation selection. The examples are done over tiny data example which can be calculated by user manually. ​The examples don't focus on custom metrics operators, so no additional knowledge of specific operators is required. For complete list of supported operators (like statistical, calendar or math functions) please see Custom metrics help pages which contain the full references.​

## ​Dataset Description

​The examples will use the tiny data set. It contains 3 cases, 10 events, there is defined one view – 2 out of 3 cases. For easy manual calculations we assume zero waiting time between events, therefor case duration is simple sum of events duration. Also, there is no parallelism among events.​

:::image type="content" alt-text="media/image-4.png" source="media/image-4.png":::

## 1. Event level aggregation (view)

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration of events in view?**

We are looking for single result for whole data set in actual view.

**Calculation:**

We need to run across all available events in view. Assignment of events to cases is not taken into account. Such calculation provides single result in whole view.​ When we manually sum all event duration we come to the requested result.

**Result: 4:30h**

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-5.pngmedia/image-5.png" source="media/image-5.png":::

Expression in custom metric formula:

:::image type="content" alt-text="media/01-event-level-view.png" source="media/01-event-level-view.png":::

**Usage in Minit desktop application:**

Custom metric editor indicates the result is applicable everywhere in Minit. Why is it?​ Single result is numerical constant which can be used in any expression and any place where metric is displayed. Such metric - returning single value may be displayed in process map, statistics for case overview, statistics for attributes, filters or root cause analysis.

## ​2. Event level aggregation (Process)

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration of events in process?​**

Here we are looking for single global result, but not on scope of view but on scope of complete process data.

**Calculation**:

In this example we need to run across all available events in process regardless cases or any filtering by view.​ Such calculation provides single result in whole view(process).​ When we manually sum all event duration we come to the requested result.

**Result: 8:00h**

:::image type="content" alt-text="media/image-8.png" source="media/image-8.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/02-event-level-process.png" source="media/02-event-level-process.png":::

**Usage in Minit desktop application:**

Result is applicable everywhere in Minit. The same logic for application as for previous example.

## 3. Case events aggregation

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration of events per case?**

We are asking for result per case, so we are not looking for single global result.

**Calculation**:

We need to calculate events duration per single case. As view contains two cases, number of results is 2. Each result is calculated as sum of event duration across the single case.

**Result:****Case1 = 1:30h****; Case2 = 3:00h**

:::image type="content" alt-text="media/image-7.png" source="media/image-7.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/03-case-event-1.png" source="media/03-case-event-1.png":::

Calculation context *CaseEvents* (and *CaseEvents*) is very useful as it allows to create additional case level metric calculated using the case events. User is then able to evaluate the single cases based on calculated value.

**Usage in Minit desktop application:**

As we have single result per each case in current view,​ results are available only in screens with results per single case:​

- Case Metric filter​

- Case Overview Statistic panel

- Root cause analysis

Results for CaseEvents or CaseEdges are not applicable on Process map. Theoretically Process map is able to display results per case, but default aggregation (industry standard) is per activity.



## 4. Attribute aggregation

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration per activities?**

We are interested in evaluation of activities. This is different calculation in compared to previous example.

**Calculation**:

How to calculate results per activity properly? We don't care about distribution of events among cases. All we take into consideration is distribution of events among activities. All events in view are grouped according to activity value. We have activities 'A', 'B' and 'C'. Per each set of events, we calculate result separately - sum of event durations.

**Result: A = 0:50h; B = 0:40h; C = 3:00h **

:::image type="content" alt-text="media/image-9.png" source="media/image-9.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/04-event-per-attribute.png" source="media/04-event-per-attribute.png":::

**Usage in Minit desktop application:**

We have single result per activity in current view.​ Results are available on screens with aggregated events per activity value:​

- Process Map (nodes)

- Statistics – Activities​

- Attribute Conditional filter (see chapter 7)​

Process map and Statistics panels for any attribute (including activity) share the same calculation scope. Despite different visuals, both screens display results grouped by activity value.

Attribute conditional filter contains the attribute aggregation inside the single case. E.g. Case 2 contains two events with activity 'C'. Attribute conditional filter does aggregation over these events and aggregated value is evaluated. More about behavior for this filter in chapter 7.

## 5 Generic attribute aggregation

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration per user?**

What is we care about total time spend not by activities but by users?

**Calculation**:

This example sounds similar to previous one, doesn't it? We again take into consideration distribution of events among one of its attributes. This time is it user attribute. We have users 'Peter', 'Michal' and 'Denis'. Per each set of events, we calculate result separately - sum of event durations.

**Result: Peter = 0:50h; Michal = 0:40h; Denis = 3:00h**

:::image type="content" alt-text="media/image-10-1.png" source="media/image-10-1.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/04-event-per-attribute.png" source="media/04-event-per-attribute.png":::

Why the expression is the same as for previous one? It's simple. The calculation per attribute value is the same for any event attribute. Activity is just a special mandatory event attribute. All metrics calculations are applied in the same way for activity as for any other attribute.

**Usage in Minit desktop application:**

We again have single result per attribute value in current view.​ Results are available on screens with aggregated events per attribute value:​

- Process map (why?)

- Statistics – any attribute

- Attribute Conditional filter (see chapter 7)

If we want to see results per user in Minit desktop application, we need to go to Statistics for user attribute. There are displayed events aggregated by user attribute. What if we open process map or statistic panel for another attribute. In such case the results will be aggregated by selected attribute. E.g., in Process map it is by default activity attribute.

## 6 Attribute by case aggregation

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

**What is total duration of cases processed per user?**

We are again inserted in results per user, but this time we want to know total duration of cases in which users were involved.

**Calculation**:

The calculation logic for this request is very similar to previous one. We group users by value of user attribute. We have users 'Peter', 'Michal' and 'Denis'. Difference is in the values we are going to summarize. Per each event we take duration of case, not duration of event. Easy to understand so far. User 'Denis' worked only on case 2, so answer for him is duration of case 2. Users 'Peter' and 'Michal' were involved in both cases, so the answer is combined duration of case 1 and case 2.

**Result: Peter = 4:30h; Michal = 4:30h; Denis = 3:00h **

:::image type="content" alt-text="media/image-11.png" source="media/image-11.png":::

As you can see we don't care how many events were done by user in case. One or multiple events done by given user, the length of case is not obviously changed. We don't want to take duration of single case multiple times for the same user. Result is calculated per user (attribute value), takes case level metric (duration of case, no duration of events) and takes each case into result once at most.

While this calculation seems odd, it is a very basic calculation used for standard financial case level metrics. Total of invoice is still the same regardless how many events, how many reworks occurred in the case. Invoice total is not multiplied because some events - activities or users occurred multiple times in invoice processing.

Expression in custom metric editor:

:::image type="content" alt-text="media/06-event-per-attribute-case.png" source="media/06-event-per-attribute-case.png":::

****Usage in Minit desktop application:****

Single result is generated per attribute value so all displays for attribute aggregations are available. As we use case level metrics the results are also applicable for edges (both in process map and in statistic):​

- Process map​ (nodes & edges)

- Statistics attribute panels (why not in Case overview?)​

- Attribute/Edge Conditional filters

The results are not calculated per single case, but per attribute value, so Case overview and Case/Event metrics are not usable for such calculations.

## ​7 Bonus: Attribute conditional filter

Attribute conditional filter contains the attribute aggregation inside the single case. This explains the applicability of metrics using aggregation by attribute value in this filter.

:::image type="content" alt-text="This image has an empty alt attribute; its file name is image-4.pngmedia/image-4.png" source="media/image-4.png":::

****How to filter cases with total duration for C activities longer than 1 hour and 30 minutes?****

The number of events with activity C is not important inside the case. The only criteria is total duration for such events.

**Calculation:**

The question requires to evaluate data set by single cases. In each case we look into total duration of all events with activity C and compare it defined limit 1h 30mins. Case may contain zero, one or multiple events with activity C, but it is not relevant.

**Result:** Case2

:::image type="content" alt-text="media/data-cond-filter-selection.png" source="media/data-cond-filter-selection.png":::

Attribute conditional filter is case level filter, it evaluates the single cases. For each case it calculates the result per selected attribute value (activity C in our example) and compares the calculated result to filter requirement (greater than 1h 30mins). As case may contain multiple events which fits the criteria (activity C) these event level values are (have to be) aggregated according to filter requirements (total of all events) to provide single value before comparison to filter requirement.

Filter definition:

:::image type="content" alt-text="media/07-conditional-filter-1.png" source="media/07-conditional-filter-1.png":::

Basically, the filter evaluation at first calculates aggregated result (total) per attribute value(activity C) per case and afterward this result is compared to filter requirements (greater than 1h 30mins). Therefor any standard/custom metric which aggregates the results per attribute value is applicable also in Attribute Conditional filter.


