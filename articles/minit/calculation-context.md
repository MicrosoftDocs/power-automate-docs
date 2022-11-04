---
title: Calculation context (preview)
description: Learn how to define the data scope that's used as the source for an aggregation function in the Minit desktop application for Microsoft Power Automate process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/01/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Calculation context (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

In aggregation functions, the calculation context defines the data scope that's used as the source for the aggregation. Minit provides several data calculation modes, which are described in [Requirements for application](requirements-for-application.md).

Custom metrics can include nested aggregations, or aggregations used in an expression. For example, the expression `AVG(DURATION()/AVG(AllInView, DURATION()))` returns the ratio of the average duration of certain activities or edges to the average duration of all activities or edges.

## Available contexts

| Context | Description |
| ----- | ---- |
| Implicit | Default context; no need to specify. Aggregation is calculated for each unique value; that is, for each activity or edge in the map. |
| AllInView | Aggregation is calculated for all values in the view. |
| ViewCases | Aggregation is calculated for all cases in the view. |
| ViewEvents | Aggregation is calculated for all events in the view. |
| ViewEdges | Aggregation is calculated for all edges in the view. |
| AllInProcess | Aggregation is calculated for all values in the process. |
| ProcessCases | Aggregation is calculated for all cases in the process. |
| ProcessEvents | Aggregation is calculated for all events in the process. |
| ProcessEdges | Aggregation is calculated for all edges in the process. |
| AllInBR | Aggregation is calculated for all values in the business rule scope. |
| BRCases | Aggregation is calculated for all cases in the business rule scope. |
| BREvents | Aggregation is calculated for all events in the business rule scope. |
| BREdges | Aggregation is calculated for all edges in the business rule scope. |
| EventsPerAttribute | Aggregation is calculated for all events with the same value for the selected attribute. |
| EdgesPerAttribute | Aggregation is calculated for all edges with the same value for the selected attribute. |
| CasesPerAttribute | Aggregation is calculated for actual cases, with each case calculated one time. |
| CaseEvents | Non-aggregated evaluation of events in a single case. |
| CaseEdges | Non-aggregated evaluation of edges in a single case. |

## An example of using different calculation contexts

**AVG(DURATION())**: Returns the average duration of a specific activity or edge. When visualized in the process map, the value differs for different activities or edges. In other words, the average duration is calculated in the context of the activity or edge that's visualized.

:::image type="content" alt-text="Screenshot of the AVG(DURATION()) calculation context." source="media/example1.png":::

**AVG(AllInView, DURATION())**: Returns the average duration of all activities or edges in the view. When visualized in the process map, one value is used for all activities and a different value is used for all edges. In other words, there are two different values.

:::image type="content" alt-text="Screenshot of the AVG(AllInView, DURATION()) calculation context." source="media/example2.png":::

**AVG(ProcessCases, DURATION())**: Returns the average duration of all cases in the process, regardless of the view filters. When visualized in the process map, the value is the same for all activities and edges. In other words, there's one value for all activities and edges.

:::image type="content" alt-text="Screenshot of the AVG(ProcessCases, DURATION()) calculation context." source="media/example3.png":::

**AVG(ViewEvents, DURATION())**: Returns the average duration of all events in the view. When visualized in the process map, the value is the same for all activities and edges. In other words, there's one value for all activities and edges.

:::image type="content" alt-text="Screenshot of the AVG(ViewEvents, DURATION()) calculation context." source="media/example5.png":::

**AVG(ViewEdges, DURATION())**: Returns the average duration of all edges in the view. When visualized in the process map, the value is the same for all activities and edges. In other words, there's one value for all activities and edges.

:::image type="content" alt-text="Screenshot of the AVG(ViewEdges, DURATION()) calculation context." source="media/example6.png":::

**AVG(CasesPerAttribute, DURATION())**: Returns the average duration of all cases that flow across the activities and edges. It's the same value for all activities and edges that contain the same set of cases.

:::image type="content" alt-text="Screenshot of the AVG(CasesPerAttribute, DURATION()) calculation context." source="media/casesperattribute.png":::

**AVG(CasesPerAttribute, DURATION())**: The same metric as the one above, now used in the Statistics case-level attribute. It returns the average duration of all cases in the view that have the same value for the attribute Supplier.City, with each case calculated once. Refer to the last column, CasesPerAttribute-Avg.

:::image type="content" alt-text="Screenshot of the AVG(CasesPerAttribute, DURATION()) calculation context in the Statistics case-level attribute." source="media/casesperattributestats.png":::

**AVG(EventsPerAttribute, DURATION())**: Returns the average duration of all events in the view that have the same activity value. This is a standard metric in the Performance view - Mean Duration. This metric is unavailable for edges. The calculation context is limited to events only.

:::image type="content" alt-text="Screenshot of the AVG(EventsPerAttribute, DURATION()) calculation context." source="media/eventsperattribute.png":::

**AVG(EventsPerAttribute, DURATION())**: The same metric as the previous one, now used in the Statistics event-level attribute. It returns the average duration of all events in the view that have the same value for the attribute Resource. Refer to the last column, EventsPerAttribute-Avg.

:::image type="content" alt-text="Screenshot of the AVG(EventsPerAttribute, DURATION()) calculation context in the Statistics event-level attribute." source="media/eventsperattributestats.png":::

**AVG(EdgesPerAttribute, DURATION())**: Returns the average duration of all edges in the view for a process map path. This is the standard metric in the Performance view - Mean Duration on edges. This metric is unavailable for events. The calculation context is limited to edges only.

:::image type="content" alt-text="Screenshot of the AVG(EdgesPerAttribute, DURATION()) calculation context." source="media/edgesperattribute.png":::
