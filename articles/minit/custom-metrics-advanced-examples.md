---
title: Advanced examples (preview)
description: Get complex examples of custom operators in the Minit desktop application.
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

# Advanced examples (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Due to  complex examples, this article uses some specific custom operators like DURATIONCALENDAR or FIRSTIF. No specific knowledge of these operators is required.

For easy examples of how to create custom metrics, go to [Basic examples](custom-metrics-beginner-examples.md).

## ​Recapitulation of previous examples

The following table provides descriptions and examples of custom metrics.

| Description  | Example    | Image    |
| --- | --- | --- |
| Aggregation per Attribute value<br/>(For example, result per activity = all events with the same activity value) | AVG(Duration())​<br/>AVG(EventsPerAttribute, Duration())​<br/>AVG(EdgesPerAttribute, Duration())​<br/>| :::image type="content" alt-text="Screenshot of aggregation per attribute value." source="media/aggregation-per-attribute-value.png" ::: |
| Aggregation within cases<br/>(result per single case) | AVG(CaseEvents, Duration()) | :::image type="content" alt-text="Screenshot of aggregation within cases." source="media/aggregation-within-cases.png" ::: |
| Aggregation over cases​<br/>(aggregation per attribute value, case is taken into calculation one time) | SUM(CasesPerAttribute, invoTotal)​<br/>AVG(CasesPerAttribute, Duration()) | :::image type="content" alt-text="Screenshot of aggregation over cases." source="media/aggregation-over-cases.png" ::: |
| Global aggregation​<br/>(over all elements in view/process/business rule) | COUNTIF(ProcessEvents, user == "Peter")​<br/>AVG(ProcessEvents, Duration()) | :::image type="content" alt-text="Screenshot of global aggregation." source="media/global-aggregation.png" ::: |

## ​Dataset description

Following is an example of the dataset description.

:::image type="content" alt-text="Screenshot of the dataset description." source="media/image-14.png":::

New tiny data set for easy calculation for remaining examples. Contains 4 cases, 12 events.​

​For easy manual calculations, we assume zero waiting time between events. Therefore, case duration is simple sum of events duration. Also, there is no parallelism among events.​

In total, we have five attributes - activity, start, end, user and county. Country is case level attribute; the other attributes are event level.

## 1 Event level non-aggregation

:::image type="content" alt-text="Screenshot of event level non-aggregation." source="media/image-15.png":::

**How to filter out via CM events with positive duration?**

Evaluate single events and remove the ones with corrupted timestamps.

**Calculation**:

​Run and evaluate each event one by one.​ Generate a single result per event. No aggregation operation is required. Compare end and start attribute values in each event.

**Result:** Per each event **1x False;** **11x True**

:::image type="content" alt-text="Screenshot of the result for event level non-aggregation." source="media/image-16.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression for event level non-aggregation." source="media/image-6.jpg":::

**Usage in Minit desktop application:**

As we have single result per each event in current view,​ results are available only in screens that display/process event metric:

- Event Metric filter

- Case Metric filter​ (why?)

The event metric filter is the obvious option, as it allows you to filter events based on attribute or metric values. Case metric filter by default uses case level metrics, but also allows you to select event metric filter with additional specification if all or at least one event in the case has to meet event metric. This switch allows the case level metric filter to switch to event level metrics.

:::image type="content" alt-text="Screenshot of event level metrics." source="media/01-case-metric-filter.png":::

Note: Event attribute values are displayed also in Variant Cases Table panel, but this view does display only event attributes and does not display event metrics.

### 1.1 Event level non-aggregation (alternative)

:::image type="content" alt-text="Screenshot of event level non-aggregation." source="media/image-15.png":::

**Alternative: How to filter out via CM events with negative duration?**

Instead of using attributes 'end' and 'start' write the expression using generic metrics.

**Best practice:**
Use generic metrics instead of process attributes.​

- Better performance​

- Portability​

- One formula fits more applications (case overview, RCA)​

- Aggregated form works with case/event/edge​

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression in the editor." source="media/image-7.jpg":::

## 2 Case level non-aggregation

:::image type="content" alt-text="Screenshot of case level non-aggregation." source="media/02-data-set.png":::

**How to filter out cases with empty (zero) duration?**

After we removed corrupted events, we need get rid of invalid cases. Remove complete cases with zero duration.

**Calculation**:

​Run and evaluate each case one by one.​ Generate single result per case. As there is operator `Duration()`, which is applied on case level, no aggregation operation is required.

**Result:** Per each event **Case 1 - true ;** **Case 2 - true;** **Case 3 - true;** **Case 4 - false**

:::image type="content" alt-text="Screenshot of the result for a single run per case." source="media/image-17.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression metric formula." source="media/image-8.jpg":::

**Usage in Minit desktop application:**

As we have single result per case,​ results are available only in screens that display results per case:

- Case Metric Filter

- Statistics Case Overview

- Root Cause Analysis

- Event Metric Filter (why?)

Usage of case level metric (aggregated or non-aggregated) in Statistics Case Overview, Root Cause Analysis or Case Metric Filter is no surprise.

Why there is indication for usage for Event Metric Filter? Event metric filter does not offer any advanced setting to switch to case level. The answer isn't hidden in options inside Event metric filter but in expression formula, which uses `Duration()` operator. Minit desktop application offers the same operator *Duration()* on event and on case level. Therefore, the same expression is applicable on both case and event level.

## 3 Edge aggregation

:::image type="content" alt-text="Screenshot of edge aggregation." source="media/03-data-set.png":::

**What is the number of user changes per path (edge)?**

Now instead of looking on events values we ask for changes occurred between events. So we are looking for result per edge.

Edge (path) - transition between two directly followed events.

**Calculation:**

We're evaluating how often user has changed when case was progressing though events. We want to identify on which transitions (edges) occurs user switching. First, identify set of edges in our data. For case 1, there are two edges A->B and B->C. In case 2 we have A->C and C->C. For case 3, we only one edge C->C. In total, we have 4 unique edges (based on activity values) - A->B, B->C, A->C and C->C. Per each of these edges, we need to aggregate number of user changes. For example, we have only one instance of edge B->C where user Michal on starting event and also on the on ending event so there is no user change for this edge at all.

**Result:A->B = 1;B->C = 0;A->C = 1;C->C = 2**

:::image type="content" alt-text="Screenshot of the result per edge." source="media/image-18.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression." source="media/image-9.jpg":::

Operators *TARGET()* and *SOURCE()* returns values of requested attribute for ending and starting node to actual edge.

**Usage in Minit desktop application:**

Defined custom metrics generates result per edge (attribute) value, so it is applicable everywhere when aggregated results per edge are used:

- Process Map - edges

- Statistics Edges

- Edge conditional filter

## 4 Case events aggregation II

In the previous part, we've had a simple example of using *CaseEvents* aggregation. Here we take another example with more complex formula.

:::image type="content" alt-text="Screenshot of case events aggregation II complex formula." source="media/03-data-set-1.png":::

**What is duration from first C start and last C end activity in cases?**

We are looking for result per case and to do some conditional aggregation over case events.

​**Calculation:**

Run across all available events within its case. Get the first and last activity 'C' in a case and measure the duration between start of first one and end of last one.

**Result:Case 1 =1h00m;Case 2 = 1h20m;Case 3 = 2h00m;**

:::image type="content" alt-text="Screenshot of results for case aggregation II." source="media/image-19.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of the expression for case aggregation II." source="media/image-10.jpg":::

This time the expression is little more complicated but shows how to combine multiple aggregations into single formula. Operators FIRSTIF() and LASTIF() are aggregation operators, which return first/last event based on input criteria over defined calculation scope (this time *CaseEvents*).

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for single case aggregation (regardless complexity of expression).

## 4.1 Case events aggregation II (alternative)

:::image type="content" alt-text="Screenshot of case events aggregation II." source="media/03-data-set-3.png":::

**What is duration from first C start and last C end activity, but calculated only over working hours?**

The example is the same as the previous one, but here we want to calculate time difference only over working hours. Previously simple difference between timestamp values was enough.

**Calculation:**

Run across all available events within its case. Get the first and last activity 'C' in a case and measure the duration between start of first one and end of last one. For measuring the duration, use working hours defined in the applied calendar.

**Result:Case 1 = ???;Case 2 = ???;Case 3 = ???**
Exact values can't be calculated we the calendar properties aren't defined. But it's not important here.

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for case aggregation II." source="media/image-21.png":::

To calculate duration over working hours, the `DURATIONCALENDAR()` operators have been used. Operators to find first and last events are used operator arguments creating nested expression. Notice the complexity of expression does not affect or modifies selected calculation scopes.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for single case aggregation (regardless complexity of expression).

## 5 Categorical vs. quantitative results

:::image type="content" alt-text="Screenshot of categorical versus quantitative results." source="media/03-data-set-2.png":::

**Does case contain C->C path?**

This is simple question, when we need to categorize single cases based on existence edge C->C.

**Calculation:**

Run across all available edges within its case. If case contains C->C edge, it passes the criteria. Results are generated per case. Count of such edges is not important.

**Result:Case 1 = False;Case 2 = True;Case 3 = True**  ​

:::image type="content" alt-text="Screenshot of results for quantitative results." source="media/image-22.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for quantitative results." source="media/image-11.jpg":::

Operator *ANY()* returns boolean true/false value when at least one element in given context meets the criteria. See also operator `ALL()`*k, which returns true value when all elements in given context meets the criteria.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for single case aggregation: ​

- Case Metric filter

- Root Cause A​nalysis

- Case Overview Statistic panel​

## 5.1 Categorical vs. quantitative results (alternative)

:::image type="content" alt-text="Screenshot of categorical versus quantitative results alternative." source="media/03-data-set-1.png":::

**How many C->C paths are within case?**

Change the previous question from if case contains edge C->C to how many such edges are there.

​**Calculation:**

Run across all edges within its case. Count any edges C->C found. If no such edge is found, count is zero for given case.

**Result:Case 1 =0;Case 2 = 1;Case 3 = 2**

:::image type="content" alt-text="Screenshot of result for quantitative result alternative." source="media/image-22.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for quantitative result alternative." source="media/05_1-case-edges.png":::

In compare to previous formula we have just replaced operator *ANY()* with *COUNTIF()*.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for single case aggregation.

## 6 Event/Edge-case aggregation

Event/edge aggregation using case-wide context.

:::image type="content" alt-text="Screenshot of event and edge case aggregation using case-wide context." source="media/03-data-set-1.png":::

**How many cases in DE contains edge C->C?**

This request contains two values. The first one is value of country attribute 'DE' and second one is value for edge 'C->C'.

Limitation for 'C->C' edge describe domain requirement, why country 'DE' is one of attribute values. Why not to calculate the result for all countries?
​
**Calculation:**

At first, re-think the original question. It's possible to generate results per attribute value (for example, for attribute country), but there's no way (except for business rules, skip in this series) to create calculation for single attribute value. Knowing this, update original question to generic form:

How many cases contains C->C edge per country?

Now the calculation consists of two steps. At first, run though each case and check existence of 'C->C' edges. The exact number of 'C->C' edges in case is not important. After it, in second step, aggregate the results per single case according to value of case level attribute country. There are two values 'DE' and 'SK' so there will be two results.

Both cases for country attribute 'SK' contains 'C->C' edge so result for 'SK' is 2. Total number of edges is 3, but we don't count number of edges.

**Result:DE = 0;SK = 2**

:::image type="content" alt-text="Screenshot of result for event and edge case aggregation." source="media/06-data-set-result.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for event and edge case aggregation." source="media/06-event-case-context.png":::

The nested formula contains two step aggregation. Inner one runs over all edges within case. Outer one aggregates cases by attribute value. The outer aggregation uses context *CasesPerAttribute* because result per case is included exactly one. (Context *EventsPerAttribute *also groups result per attribute value, but it may involve the same case multiple times - per each involved event - into result).

**Usage in Minit desktop application:**

Custom metric is applicable on every screen where values are displayed per attribute value. Attribute value may be grouped using event level (*EventsPerAttribute*) or case level (*CasesPerAttribute*) context. These two calculation contexts provide different calculation, but share the same applicability of calculation (custom metric):

- Process map (both nodes & edges)

- All statistics except for Case overview, which requires results per case

- Attribute and Edge conditional filters

For expression with nested aggregations, the most outer aggregation context determines the application in Minit.

## 6.1 Event/Edge-case aggregation (alternative)

Let convert previous example from categorical evaluation to quantitative.

:::image type="content" alt-text="Screenshot of event and edge case aggregation alternative." source="media/image-aggregation-alt-aa.png":::

**How many C->C edges are in cases in DE?**

Let convert question to generic form:
How many C->C edges are in cases per country?

​**Calculation:**

Again, the calculation consists of two steps. At first, run though each case and count 'C->C' edges. After it, in second step, aggregate the results per single case according to value of case level attribute country. There are two values 'DE' and 'SK' so there will be two results.

Both cases for country attribute 'SK' contains 'C->C' edges. Result for 'SK' and total count for these edges is 3 (1 + 2).

**Result:DE =0;SK = 3**

:::image type="content" alt-text="media/06-data-set-result.png" source="media/06-data-set-result.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/06_1-event-case-context.png" source="media/06_1-event-case-context.png":::

The expression again contains two step (nested) aggregation. Inner one runs over all edges within case, outer one aggregates cases by attribute value.

**Usage in Minit desktop application:**

Custom metric is applicable on every screen where values are displayed per attribute value.

## 7 Switch from event to case context

:::image type="content" alt-text="Screenshot of switching from event to case context." source="media/03-data-set-1.png":::

**What is average activity duration to case duration?**

How much time do we spend in average in activities is one of standard performance metrics.

But what if we need to calculate average ratio how much time we spend in activities in compare to case duration. Where we spend relatively the most time? Is it over the threshold?

**Calculation:**

What exactly are we going to calculate. We want result per activity, so we get results per 'A', 'B' and 'C'.  Activity 'B' is only in case 1. Case 1 duration is 90 minutes, activity 'B' duration is 20 minutes. Result for case 1 and activity 'B' is  20/90 = ~ 0.22. Because 'B' is not included in other cases, this is also the final result for 'B'.

Do the calculation for activity 'A', for case 1 the ratio is 10/90, for case 2 the ratio is 40/120, with average value 0.22 (0.11 + 0.33 divided by 2). In the same manner, we calculate 6 individual results per each of events 'C' and make the average.

In terms of aggregation, it's nothing new. We generate results per attribute value, but for calculation, we used metric (value) from case.

**Result:A =0.21;B = 0.22;C = 0.39**

:::image type="content" alt-text="media/07-data-set-result.png" source="media/07-data-set-result.png":::

Expression in custom metric editor:

:::image type="content" alt-text="media/07-case-operator.png" source="media/07-case-operator.png":::

The expression is simple, but uses the important operator `CASE()`, which allows you to switch context for case level. This is the only way how to calculate event level metrics and ask for metrics (values) from its case.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for aggregation per attribute value. Because expression uses *Duration()* and not attribute value, it is also applicable on edges (both in process map and statistics).

## 8 Event-case-event aggregation

Generic relation between events inside case.

:::image type="content" alt-text="Screenshot of event-case-event aggregation." source="media/03-data-set-1.png":::

**How many events done by Michal were in cases touched by Peter?**

Image 'Peter' is senior team member who is usually involved only in some troubles. We want to know how many times 'Peter' had to perform action when another user 'Michal' was involved in the same case.

​Change question to generic form:
How many events per user were done in cases with Peter?

**Calculation:**

Event is valid for this question, if it's within case, where there's at least one event done by user 'Peter'. Evaluate each event and group results per attribute user value - 'Michal', 'Peter', and 'Denis'.

**Result:Michal = 1;Peter = 2;Denis = 3**

:::image type="content" alt-text="Screenshot of result for event-case-event aggregation." source="media/image-19.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for event-case-event aggregation." source="media/08-event-case-event.png":::

Expression is short but requires some knowledge to understand it.  The most inner part *Any(CaseEvents, user=="Peter")* is simple result per single case. It evaluates if case contains user 'Peter' or not. The most outer part *COUNTIF()* does simple aggregation by attribute value. The requirement is to do aggregation on event level attribute user, but the calculated value is case level metric. Switch between these two contexts is done by *CASE()* operator in the middle.

>[!NOTE]
>
>In this example, the *EventsPerAttribute* context is not specified. Custom metric then applied implicit calculation context.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for aggregation per attribute value.

## 8.1 Event-case-event conditional aggregation

Relation between two event level attributes within case with condition.

:::image type="content" alt-text="Screenshot of event-case-event conditional aggregation." source="media/03-data-set-1.png":::

**How many times Michal worked on repeated C with Peter in case?**

Similar question to previous one, but there is added conditional.

Convert question to generic one:
How many times Michal (per user) worked on repeated C in cases with Peter?

​**Calculation:**

Evaluate each event and group results per attribute user value - 'Michal', 'Peter' and 'Denis' like in previous example. But event evaluation is more complicated as there is limitation only for repeated activities 'C'.

In case 1 there are not repeated activities 'C', in case 2 is one repeated activity 'C' done by 'Michal' and in case 3 are two repeated activities 'C' done by 'Denis'.

**Result:Michal = 1;Peter = 0;Denis = 2**

:::image type="content" alt-text="Screenshot of result for event-case-event conditional aggregation." source="media/08_1-data-set-result.png":::

Expression in custom metric editor:

:::image type="content" alt-text="Screenshot of expression for event-case-event conditional aggregation." source="media/08_1-event-case-event.png":::

Two step (nested) aggregation - inner one evaluates the single case, the outer one group results per attribute value. Conditions are also separated between these to aggregation. The inner one handle case requirement - if contains user 'Peter'. The outer one groups events so contains the event related condition - if activity is 'C' and if it is repeated.

Operator *OCCURRENCE()* returns occurrence index of a given event attribute value within the case.

**Usage in Minit desktop application:**

Application of custom metric follows the standard requirements for aggregation per attribute value.

## 9 Extra: Value specific custom metrics

It is possible to avoid operator *CASE()*? Is there way to simplify the expressions? Yes, it is, but there are tradeoffs. See the following example.

:::image type="content" alt-text="Screenshot of extra value specific custom metrics." source="media/03-data-set-1.png":::

**How many events done by Michal (per user) were in cases with Peter?**

The same question like in [8 Event-case-event aggregation](#8-event-case-event-aggregation).

It is possible to answer question without using *CASE()* operator?​

**Generic solution using *CASE()* operator**

:::image type="content" alt-text="Screenshot of generic solution." source="media/09-case-operator.png":::

It is possible to skip *CASE()* operator at cost of creating value specific custom metric. In such custom metric we have to specify requested custom value 'Michal' and have drop calculations for other attribute values (per user) and grouping by another attributes.

**Custom metric limited to specific custom value**

:::image type="content" alt-text="Screenshot of custom metric limited to a specific custom value." source="media/09-custom-value-operator.png":::

Reasoning behind the latter one:

1. Select cases with ‘Peter' (operator *ANY()*)

1. Convert boolean result to numeric zero or one (operator *IF()*)

1. Count number of activities with requirement (operator *COUNTIF()*)

1. Apply result per cease per each case exactly once (calculation context *CasesPerAttribute*)

1. At last Sum count of events per case (operator *SUM()*)

The custom metric without *CASE()* operator is maybe easier to read by humans, but it brings some disadvantages.

- per each resulting attribute value ("Michal"), we need a separate custom metrics, for other attribute values the metric returns zero

- Operator `COUNTIF()` is locked for user attribute. Results grouped by another attribute, for example, country requires change of condition to specific country code, for example, `COUNTIF(CaseEvents, country == "DE")`.
