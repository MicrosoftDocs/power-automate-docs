---
title: Calculation Context
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

# Calculation Context

Calculation context in aggregation functions defines the data scope which is used as the source for a given aggregation function. In Minit, there are several different data calculation modes which are well described in [**Custom metrics requirements for application**](requirements-for-application.md).

Custom Metrics also support nested aggregations, i.e. aggregations used within an expression. For example expression AVG(DURATION()/AVG(AllInView,DURATION())) returns the average of ratios between activities'/edges' durations versus average of duration over all activities/edges.

## List of available contexts

| CONTEXT | DESCRIPTION |
| - | - |
| **Implicit** | Default context (no need to specify). Aggregation is calculated for each unique value (eg. activity/edge in the map). |
| **AllInView** | Aggregation is calculated for all values in actual view. |
| **ViewCases** | Aggregation is calculated for all cases in actual view. |
| **ViewEvents** | Aggregation is calculated for all events in actual view. |
| **ViewEdges** | Aggregation is calculated for all edges in actual view. |
| **AllInProcess** | Aggregation is calculated for all values in process. |
| **ProcessCases** | Aggregation is calculated for all cases in process. |
| **ProcessEvents** | Aggregation is calculated for all events in process. |
| **ProcessEdges** | Aggregation is calculated for all edges in process. |
| **AllInBR** | Aggregation is calculated for all values in business rule scope. |
| **BRCases** | Aggregation is calculated for all cases in business rule scope. |
| **BREvents** | Aggregation is calculated for all events in business rule scope. |
| **BREdges** | Aggregation is calculated for all edges in business rule scope. |
| **EventsPerAttribute** | Aggregation is calculated for all events with the same value for selected attribute. |
| **EdgesPerAttribute** | Aggregation is calculated for all edges with the same value for selected attribute. |
| **CasesPerAttribute** | Aggregation is calculated for actual cases, each case is taken into calculation one time. |
| **CaseEvents** | Non-aggregated evaluation of events within single case. |
| **CaseEdges** | Non-aggregated evaluation of edges within single case. |


## Example of using different calculation contexts

**AVG(DURATION())** - returns the average duration of activity/edge X (when visualized in the process map, the value differs for different activities/edges, in other words it is calculated in the context of the activity/edge for which it is visualized).

:::image type="content" alt-text="media/example1.png" source="media/example1.png":::

**AVG(AllInView, DURATION())** - returns the average duration of all activities/edges in the actual view; when visualized in the process map, one value is used for all activities and one for all edges (i.e. two different values).

:::image type="content" alt-text="media/example2.png" source="media/example2.png":::

**AVG(ProcessCases, DURATION())** - returns the average duration of all cases in the process (regardless of the view filters); the value, when visualized in the process map, is the same for all activities and edges (one value for all activities and edges).

:::image type="content" alt-text="media/example3.png" source="media/example3.png":::

**AVG(ViewEvents, DURATION())** - returns the average duration of all events in the view; the value, when visualized in the process map, is the same for all activities and edges (one value for all activities and edges).

:::image type="content" alt-text="media/example5.png" source="media/example5.png":::

**AVG(ViewEdges, DURATION())** - returns the average duration of all edges in the actual view; the value, when visualized in the process map, is the same for all activities and edges (one value for all activities and edges).

:::image type="content" alt-text="media/example6.png" source="media/example6.png":::

**AVG(CasesPerAttribute,DURATION())** - returns the average duration of all cases which flow across the activities and edges. It is the same value for all activities and edges, which contain the same set of cases.

:::image type="content" alt-text="media/casesperattribute.png" source="media/casesperattribute.png":::

**AVG(CasesPerAttribute,DURATION())** - the same metric as the one above, now used in the Statistics Case level attribute. It returns the average duration of all cases (in the actual view) whith the same value for attribute Supplier.City, while each such case is taken into the calculation once. See the last column CasessPerAttribute-Avg).

:::image type="content" alt-text="media/casesperattributestats.png" source="media/casesperattributestats.png":::

**AVG(EventsPerAttribute,DURATION())** - returns the average duration of all events (in the actual view) with the same activity value. This is a standard metric in the Performance view - Mean Duration. Notice that this metric is unavailable for edges, as the calculation context is limited to events only.

:::image type="content" alt-text="media/eventsperattribute.png" source="media/eventsperattribute.png":::

**AVG(EventsPerAttribute,DURATION())** - the same metric as the previous one, now used in the Statistics Event level attribute. It returns the average duration of all events (in the actual view) with the same value for the attribute Resource (see last column EventsPerAttribute-Avg).

:::image type="content" alt-text="media/eventsperattributestats.png" source="media/eventsperattributestats.png":::

**AVG(EdgesPerAttribute,DURATION())** - returns the average duration of all edges (in the actual view) per a process map path. This is the a standard metric in the Performance view - Mean Duration on edges. Notice this metric is unavailable for events, as the calculation context is limited to edges only.

:::image type="content" alt-text="media/edgesperattribute.png" source="media/edgesperattribute.png":::


