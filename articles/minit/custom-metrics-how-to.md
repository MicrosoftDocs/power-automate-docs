---
title: Custom Metrics - How to
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

# Custom Metrics - How to

### Introduction

This documentation is intended for users who are already familiar with the basic functionality of the Minit desktop application and understand the basics of process mining.

This series does not serve as a reference manual for individual custom metrics operations but offers a methodical introduction to the calculation methods after which the attentive user will be able to correctly define the desired calculation scope.

### Metrics in Minit Desktop application

Minit desktop application offers a wide set of predefined - standard metrics - e.g. number of events, number of cases, average duration of cases, number of variants and so on. These metrics may be separated in two basic groups: ​

- aggerated metrics - most common result - displays calculated values grouped by selected context across Minit desktop application.

- non-aggreated metrics - displays values per individual data element like event, edge or case.

### **Aggregated metrics**

Aggregation or calculation is done over certain calculation scope or ‘context'.  Scope is defined by different analytical views in Minit.​ Let use Process map as example.

Process map is the most common type of display for process mining analysis. Each element of the map - node(activity) or path(edge) displays an aggregated value for all events with the same activity value. In the example below we see the representation of two activities - 'Get lowest approval level' and 'Approving on specific level'. For both nodes the displayed value represents 95 single events in data set and displays the aggregated value (for all) of it. In this case it is the total number of events.

:::image type="content" alt-text="media/process-map-detail-1.png" source="media/process-map-detail-1.png":::

Selecting another metric - maximum duration in the right panel - process map displays maximum duration which occurred among 95 events with activity 'Get lowest approval level' and maximum duration among 95 events with activity 'Approving on specific level'. Even if maximum value '3s' represents value of single event, here it is result of aggregation over the set of events.

:::image type="content" alt-text="media/process-map-detail-duration-max.png" source="media/process-map-detail-duration-max.png":::

Statistics panel per single attributes uses the same aggregation as Process map - aggregates the results per attribute value. If you have resource - user attribute in Statistic panel you are able to see result per each ​user occurred in actual view.

Minit desktop application display aggregated results in three main categories:

- **Single result** - usually single global value per actual data set, e.g., number of cases. Input is whole data set and output is single result.

- **Aggregation per single case** - in Statistics - Case overview panel results are calculated per single case. Calculation scopes for such aggregations are case events or case edges. Input is set of events or edges within case and output is set of results, single result per single case.

- **Aggregation per attribute value** - most common calculation scope, represented by Process map or Statistics panel for any attribute. Input is set of events or edges with the same value of selected attribute and output is set of results, single result per each attribute value. Default Process map uses attribute Activity to calculate results per each set of events with the same Activity value.

Have a look at total event count in Minit desktop application. In Statistic Case overview panel we can see a global single result for total count of all events in view.

:::image type="content" alt-text="media/total-event-count.png" source="media/total-event-count.png":::

In the same panel, there is list of all case. In a table of case there is also column 'Event count'. This time the value represents number of events in case. This grouping is called aggregation by single case.

:::image type="content" alt-text="media/event-count-per-case.png" source="media/event-count-per-case.png":::

In Statistics Activity panel, there is list of all activities. Table of activities contains column 'Event frequency', this time the event count is calculated per each activity. This grouping is called aggregation by attribute value.

:::image type="content" alt-text="media/event-count-per-atr-value.png" source="media/event-count-per-atr-value.png":::

As you remember we have seen value 95 for activities 'Get lowest approval level' and 'Approving on specific level' in Process map earlier.

Calculation for all three metrics is the same, the only difference is calculation scope. While first example uses all view events and calculates single result, the second one generates result per single case and uses per each result only events within given case. The last one generates result per each activity and uses per each result only events with the given activity value.

### **Non-aggregated metrics **

The major difference to aggregated metrics is that calculation is done per single element – either case, event or edge.  For example, if event has assigned Resource attribute or if case duration is outside defined working hours. There are only a few places where non-aggregated metrics (and attribute values) and displayed and available to user:

-  Statistics panel for case overview where values per single case are displayed. Be aware, the displayed metrics are result of aggregation per single case (over events within given case), but from case level perspective these are non-aggregated metrics as represents single case.

- Case/event metric filters are among a few places where non-aggregated values are displayed and available to user.​

Event metric filter is good example of display where duration of single events is displayed and evaluated. Event filters take each event individually and evaluate its attribute or metric value as it is. All other standard visualizations in Minit desktop application display event duration in somehow aggregated way - mean, total, minimum or maximum.

:::image type="content" alt-text="media/event-metric-filter.png" source="media/event-metric-filter.png":::

### Custom Metrics

Custom metric is named calculation formula defined by user per Process. This custom metric is applied by the standard ways how Minit desktop application displays the data. Minit desktop application displays standard metrics in aggregated and non-aggregated way. Custom metrics must follow the same rule. Therefore, there are two main different types of custom metrics:

1. **Scalar (non-aggregated) formulas​ - calculation over single element like case, edge or event.**

:::image type="content" alt-text="media/image-2.png" source="media/image-2.png":::

Simple scalar formulas don't contain aggregation operation in its formula. In more complex examples it is possible to use aggregation as part of nested expression (e.g., compare event duration to average duration of all events), but we skip this option for now. The important rule is the result of scalar formula is generated per single case, edge or event. Individual results are not further grouped nor processed by application into aggregated results.

**2. Aggregated formulas​ - calculation over certain calculation scope or ‘context'. User can alternate context in formula.**

:::image type="content" alt-text="media/image-3.png" source="media/image-3.png":::

Aggregated formulas contain aggregation operator (e.g. AVG) at a top evaluation level. Minit Desktop application offer set of standard aggreation operators - see Custom metrics help for reference. Aggregation operation as first argument takes calculation scope. This determines two properties:

- Input set of data taken into account

- Grouping or granularity of the results

**Input set of data** - this is quite intuitive as user determines what part of data set is taken into calculation. In example above all view events are taken into calculation. In contrary calculation of average event duration for process map requires to take into calculation only events which belong to the same activity.

**Grouping or granularity of the result** - another aspect of calculation scope is to determine the granularity of result. Average event duration in the whole view is a single number, the count of results is exactly one. But calculating values for process map requires number of results to match number of nodes (e. g. activities) in process map. We already know there are 3 main categories how results are grouped - 1) single global result, 2) aggregation per single case and 3) aggregation per attribute value.

## Generic form for custom metric formulas

Let's have a generic overview of (aggregated) metrics in Minit. Consider the following task:​

​Calculate **average** **revenue per hour for invoice processing** in cases when **order number was entered manually, and invoice status was never rejected.**

**Logical breakdown: **

| **Aggregation**​ | Aggregation converts multiple results (e.g. per case) into single value.​If the aggregation part is missing, we have scalar, non-aggregated metric.​ |
| **Calculation​** | Standard calculations in Minit are: Total (sum), Mean(avg), min, max.​Advanced calculations like ratio of two attributes need to be done via custom metric.​ |
| **Data filtration​** | Filtration in Minit can be done via: Filters, CM with conditional operators or Business rules with filters.​                                                                                                                                                                |


The given example shows possibility to perform advanced filtering in custom metrics. To make example easier let simplify the filtering part so we can focus on aggregation & calculation part. When we create view filters which fit the requirements of **"order number was entered manually, and invoice status was never rejected" **we may simplify the task.​

**The simplified task:​**
Calculate **average** **revenue per hour for invoice processing **for cases **in actual view**.​

**​Logical breakdown:​**

| **Aggregation​** | Aggregation converts multiple results (e.g. per case) into a single value. Scope of aggregation is defined by context definition.​​ |
| **Calculation​** | Standard calculations in Minit are: Total (sum), Mean(avg), min, max.​Advanced calculations like ratio of two attributes need to be done via custom metric.​ |
| **Data filtration​** | Simplified filtering here basically means scope/context definition.​ |


​Generic formula for aggregated custom metrics:​

**Aggregation**([**Data filtration/scope**], **calculation**)​

Replace the generic placeholders with actual operators and expressions:

**​​Avg**(**ViewCases**,** 1.0 * InvoiceTotalAmountWithoutVAT / TOTALHOURS(Duration()**))​

Aggregation part is represented by simple average operator (avg).

Calculation scope is the first part to define in the formula itself. We are looking for a single global result using all cases in the view. This is easily achieved by selection of *ViewCases *value for context definition. Other types of using aggregated results - per single case or per attribute value have no use in this example.

Core calculation is completely done via expression which contains 4 elements:**​**

- conversion to float ("1.0 *") ​

- attribute specification ("InvoiceTotalAmountWithoutVAT")​

- (case) duration converted to time unit ‘hour'​ (TOTALHOURS)

- division to calculate ratio

As you may see for proper calculation is crucial to select the correct data context. The following parts will lead you through all available data contexts in series of simple examples.


