---
title: Basic examples
description: Get examples of various calculation methods for custom metrics with a focus on proper context and aggregation selection in Power Automate Process Mining.
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik

ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Basic examples

The following examples show various calculation methods for custom metrics with a focus on proper context/aggregation selection. For a complete list of supported operators (like statistical, calendar or math functions), go to [Custom metrics](custom-metrics.md).​

## ​Dataset description

​The examples use a tiny data set. It contains three cases, 10 events, and there's one view defined&mdash;two out of three cases. For easy manual calculations, we assume zero waiting time between events; therefore, case duration is a simple sum of events duration. Also, there's no parallelism among events.​

## 1. Event level aggregation (view)

*What's the total duration of events in the view?* We're looking for a single result for the whole data set in actual view.

:::image type="content" alt-text="Screenshot of the event level aggregation." source="media/image-4.png":::

### Calculation for example 1

We need to run across all available events in the view. Assignment of events to cases isn't taken into account. Such calculation provides single result in the whole view.​ When we manually sum all event duration, we arrive at the requested result.

### Result for example 1

 4:30 hours (events in case 1 = 90 minutes + events in case 2 = 180 minutes = 270 minutes, in total 4:3 hours)

:::image type="content" alt-text="Screenshot of the 4:30 result." source="media/image-5-angie.png":::

**Expression in the custom metric formula**

:::image type="content" alt-text="Screenshot of an expression in a custom metric formula." source="media/01-event-level-view.png":::

### Usage for example 1

The custom metric editor indicates the result is applicable everywhere in the Power Automate Process Mining desktop app. The reason is that a single result is a numerical constant, which can be used in any expression and any place where the metric is displayed. Such metric - returning single value may be displayed in process map, statistics for case overview, statistics for attributes, filters, or root cause analysis.

## ​2. Event level aggregation (process)

*What's the total duration of events in the process?​* We're looking for a single global result, but not on scope of view, but on scope of complete process data.

:::image type="content" alt-text="Screenshot of event level aggregation." source="media/image-4.png":::

### Calculation for example 2

In this example, we need to run across all available events in process regardless cases or any filtering by view.​ Such calculation provides single result in whole view (process).​ When we manually sum all event duration, we arrive at the requested result.

### Result for example 2

8:00 hours (events in case 1 = 1 hour 30 minutes + events in case 2 = 3 hours + events in case 3 = 3 hours 30 minutes, in total 8:00 hours)

:::image type="content" alt-text="Screenshot of the 4:30 result." source="media/image-5-angie.png":::

**Expression in the custom metric editor**

:::image type="content" alt-text="Screenshot of an expression in the custom metric editor." source="media/02-event-level-process.png":::

### Usage for example 2

Result is applicable everywhere in the Process Mining desktop app. The same logic for application as for previous example.

## 3. Case events aggregation

*What's the total duration of events per case?* We're asking for the result per case, not a single global result.

:::image type="content" alt-text="Screenshot of case events aggregation." source="media/image-4.png":::

### Calculation for example 3

We need to calculate events duration per single case. As the view contains two cases, the number of results is two (2). Each result is calculated as sum of event duration across the single case.

### Result for example 3

The result is *per case*. It's calculated by events in case1 and events in case2, but most important is that the result is per case.

- Case 1 = 1:30 hours (events in case 1)
- Case 2 = 3:00 hours (events in case 2)

:::image type="content" alt-text="Screenshot of the result for case 1." source="media/image-7.png":::

**Expression in the custom metric editor**

:::image type="content" alt-text="Screenshot of the expression in the custom metric editor." source="media/03-case-event-1.png":::

Calculation context *CaseEvents* (and *CaseEvents*) is very useful as it allows to create additional case level metric calculated using the case events. User is then able to evaluate the single cases based on calculated value.

### Usage for example 3

As we have single result per each case in current view,​ results are available only in screens with results per single case:​

- Case Metric filter​

- Case Overview Statistic panel

- Root cause analysis

Results for CaseEvents or CaseEdges are not applicable on Process map. Theoretically Process map is able to display results per case, but default aggregation (industry standard) is per activity.

## 4. Attribute aggregation

*What's the total duration per activities?* We're interested in evaluation of activities. This is a different calculation compared to previous example.

:::image type="content" alt-text="Screenshot of attribute aggregation" source="media/image-4.png":::

### Calculation for example 4

How do you calculate results per activity properly? We're not concerned with the distribution of events among cases. All we take into consideration is distribution of events among activities. All events in view are grouped according to activity value. We have activities 'A', 'B' and 'C'. Per each set of events, we calculate result separately - sum of event durations.

### Result for example 4

- A = 50 minutes
- B = 40 minutes
- C = 3 hours

:::image type="content" alt-text="Screenshot of the calculation result." source="media/imsge-9-angie.png":::

**Expression in the custom metric editor**

:::image type="content" alt-text="Screenshot of the expression in the custom metric editor per activity." source="media/04-event-per-attribute.png":::

### Usage for example 4

We have single result per activity in current view.​ Results are available on screens with aggregated events per activity value:​

- Process Map (nodes)

- Statistics – Activities​

- Attribute conditional filter (To learn more, go to [​7 Bonus: Attribute conditional filter](#7-bonus-attribute-conditional-filter).)​

Process map and Statistics panels for any attribute (including activity) share the same calculation scope. Despite different visuals, both screens display results grouped by activity value.

Attribute conditional filter contains the attribute aggregation inside the single case.  For example, Case 2 contains two events with activity 'C'. Attribute conditional filter does aggregation over these events and aggregated value is evaluated. To learn more about behavior for this filter go to [​7 Bonus: Attribute conditional filter](#7-bonus-attribute-conditional-filter).

## 5 Generic attribute aggregation

*What's the total duration per user?* What we care about is the total time spend, not by activities but by users.

:::image type="content" alt-text="Screenshot of a generic attribute aggregation." source="media/image-4.png":::

### Calculation for example 5

This example is similar to previous one. We again take into consideration distribution of events among one of its attributes. This time, it's user attribute. We have users 'Peter', 'Michal' and 'Denis'. Per each set of events, we calculate result separately - sum of event durations.

### Result for example 5

- Peter = 50 minutes (Events in case 1 =10 minutes + events in case 2 = 40 minutes, in total 50 minutes)
- Michal = 2:20 hours (events in case 1 =1:20 hours + events in case 2 = 1 hour, in total 2:20 hours)
- Denis = 1:20 hours (Events in case 2 = 1:20 hours)

:::image type="content" alt-text="Screenshot of the result per user attribute." source="media/image-10-1.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression metric formula." source="media/04-event-per-attribute.png":::

Why the expression is the same as for previous one? It's simple. The calculation per attribute value is the same for any event attribute. Activity is just a special mandatory event attribute. All metrics calculations are applied in the same way for activity as for any other attribute.

### Usage for example 5

We again have single result per attribute value in current view.​ Results are available on screens with aggregated events per attribute value:​

- Process map (why?)

- Statistics – any attribute

- Attribute Conditional filter ((To learn more, go to [​7 Bonus: Attribute conditional filter](#7-bonus-attribute-conditional-filter).)

If you want to see results per user in the Process Mining desktop app, go to Statistics for user attribute. There are displayed events aggregated by user attribute. What if we open process map or statistic panel for another attribute. In such case the results will be aggregated by selected attribute. For example, in **Process map**, it's by default activity attribute.

## 6 Attribute by case aggregation

*What's the total duration of cases processed per user?* We're again interested in results per user, but this time we want to know total duration of cases in which users were involved.

:::image type="content" alt-text="Screenshot of an attribute by case aggregation." source="media/image-4.png":::

### Calculation for example 6

The calculation logic for this request is very similar to previous one. We group users by value of user attribute. We have users 'Peter', 'Michal' and 'Denis'. The difference is in the values we are going to summarize. Per each event, we take duration of *case*, not duration of event. User 'Denis' worked only on case 2, so the answer for him is duration of case 2. Users 'Peter' and 'Michal' were involved in both cases, so the answer is combined the duration of case 1 and case 2.

### Result for example 6

- Peter = 4 hours 30 minutes
- Michal = 4 hours 30 minutes
- Denis = 3 hours

:::image type="content" alt-text="Screenshot of the result per duration of cases." source="media/image-11a.png":::

As you can see, we don't care how many events were done by user in case. One or multiple events done by given user, the length of case isn't obviously changed. We don't want to take duration of single case multiple times for the same user. Result is calculated per user (attribute value), takes case level metric (duration of case, no duration of events), and takes each case into result once at most.

While this calculation seems odd, it is a very basic calculation used for standard financial case level metrics. Total of invoice is still the same regardless how many events, how many reworks occurred in the case. Invoice total is not multiplied because some events - activities or users occurred multiple times in invoice processing.

**Expression in the custom metric editor**

:::image type="content" alt-text="Screenshot of the expression for standard financial case level metrics." source="media/06-event-per-attribute-case.png":::

### Usage for example 6

Single result is generated per attribute value so all displays for attribute aggregations are available. As we use case level metrics the results are also applicable for edges (both in process map and in statistic):​

- Process map​ (nodes & edges)

- Statistics attribute panels (why not in Case overview?)​

- Attribute/Edge Conditional filters

The results are not calculated per single case, but per attribute value, so Case overview and Case/Event metrics are not usable for such calculations.

## ​7 Bonus: Attribute conditional filter

Attribute conditional filter contains the attribute aggregation inside the single case. This explains the applicability of metrics using aggregation by attribute value in this filter.

*How do I filter cases with total duration for C activities longer than 1 hour and 30 minutes?* The number of events with activity C is not important inside the case. The only criteria is total duration for such events.

:::image type="content" alt-text="Screenshot of the bonus attribute conditional filter." source="media/image-4.png":::

### Calculation for example 7

The question requires to evaluate data set by single cases. In each case, we look into total duration of all events with activity C and compare it defined limit 1 hour 30 minutes. Case may contain zero, one, or multiple events with activity C, but it isn't relevant.

### Result for example 7

Case 2

:::image type="content" alt-text="Screenshot of the Case2 result." source="media/data-cond-filter-selection.png":::

Attribute conditional filter is case level filter, it evaluates the single cases. For each case it calculates the result per selected attribute value (activity C in our example) and compares the calculated result to filter requirement (greater than 1 hour 30 minutes). As case may contain multiple events, which fits the criteria (activity C), these event level values are (have to be) aggregated according to filter requirements (total of all events) to provide single value before comparison to filter requirement.

### Filter definition

The filter evaluation at first calculates aggregated result (total) per attribute value (activity C) per case and afterward this result is compared to filter requirements (greater than 1 hour 30 minutes). Therefore, any standard or custom metric that aggregates the results per attribute value is applicable also in attribute conditional filter.


