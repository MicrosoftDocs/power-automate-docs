---
title: Requirements for application
description: Learn where your metrics are applicable in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 04/16/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Requirements for application

Custom metrics can be applied in **Process map**, **Statistics**, and **Filtering**. You can see where your metrics are applicable directly on the editor screen.

The sections in this article list the specific requirements for their application.

## Process map

Following are the requirements for the process map metric type:

- **Node:** Requires aggregation. Uses event context functions. For example, standard total count metric can be implemented via custom metric expression `COUNT(EventsPerAttribute)`

- **Edge:** Requires aggregation and functions valid for edges. It's not possible to access the values of event-level attributes. The standard calculation for total count per edges with custom metric is `Count(EdgesPerAttribute)`

## Statistics

Following are the requirements for the statistics metric type:

- **Event Level Attribute:** Requires aggregation. Uses event context functions. For example, `AVG(AllInView,DURATION())` returns the average duration of all activities/edges.

- **Case Level Attribute:** Requires aggregation. Uses case context functions. It's not possible to access the values of event-level attributes. For example, `AVG(CaseEvents, PriceUSD)` returns the average value of the attribute **PriceUSD**.

- **Case Duration Influence:** Requires aggregation. Uses case context functions. It's not possible to access the values of event-level attributes. For example, `AVG(CasesPerAttribute,DURATION())` returns the average duration of cases for selected case level attribute value.

- **Case Overview:** Aggregation isn't needed since  **Case Overview** displays results per individual cases. Uses functions valid for cases. If you want to calculate statistics of all cases and use them in a metric, you need to define the scope of aggregation. For example, `DURATION()/AVG(ViewCases,DURATION())` returns the ratio between the specific case duration to the average case duration.

- **Edges:** Requires aggregation and functions valid for edges. It's not possible to access the values of event-level attributes. For example, `AVG(AllInView,START())` returns the average start date for a given edge.

## Filter

Following are the requirements for the filter metric type:

- **Attribute Conditional (event-level attribute):** The requirements are the same as for **Statistics - Event Level Attribute**.

- **Attribute Conditional (case-level attribute):** The requirements are the same as for **Statistics - Case Level Attribute**.

- **Edge Conditional:** The requirements are the same as for **Statistics - Edges**.

- **Metric:** The requirements are the same as for **Statistics - Case Overview**.

## Root Cause Analysis

Following are the requirements for the process root cause analysis metric type:

**RCA**: The requirements are the same as for Statistics - Case Overview in the [Statistics](#statistics) section in this article.

