---
title: Requirements for application (preview)
description: Learn how to see where your metrics are applicable in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date:11/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Requirements for application (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Custom metrics can be applied in Process Map, Statistics, and Filters. You can see where your metrics are applicable directly in the editor window.

:::image type="content" alt-text="media/CM-Editor-Indication-v54-1.png" source="media/CM-Editor-Indication-v54-1.png":::

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

The specific requirements for their application are:

## Process Map

**Node:** Requires aggregation. Uses event context functions. E.g. standard total count metric can be implemented via custom metric expression *COUNT(EventsPerAttribute)*
**Edge:** Requires aggregation and functions valid for edges. It is not possible to access the values of event-level attributes. The standard calculation for total count per edges with custom metric is *Count(EdgesPerAttribute)*

## Statistics

**Event Level Attribute:** Requires aggregation. Uses event context functions. E.g. *AVG(AllInView,DURATION())* - returns the average duration of all activities/edges.
Case Level Attribute: Requires aggregation. Uses case context functions. It is not possible to access the values of event-level attributes. E.g. AVG(CaseEvents, PriceUSD) - returns the average value of the attribute PriceUSD.
Case Duration Influence: Requires aggregation. Uses case context functions. It is not possible to access the values of event-level attributes. E.g. AVG(CasesPerAttribute,DURATION) - returns the average duration of cases for selected case level attribute value.
Case Overview: Aggregation is not needed since Case Overview displays results per individual cases. Uses functions valid for cases. If you want to calculate statistics of all cases and use them in a metric, you need to define the scope of aggregation. E.g. *DURATION()/AVG(ViewCases,DURATION())* - returns the ratio between the specific case duration to the average case duration.
**Edges:** Requires aggregation and functions valid for edges. It is not possible to access the values of event-level attributes. E.g. *AVG(AllInView,START())* - returns the average start date for given edge.

## Filter

**Attribute Conditional (event-level attribute):** The requirements are the same as for **Statistics - Event Level Attribute**.
**Attribute Conditional (case-level attribute):** The requirements are the same as for **Statistics - Case Level Attribute**.
**Edge Conditional:** The requirements are the same as for **Statistics - Edges**.
**Metric:** The requirements are the same as for **Statistics - Case Overview**.

## Root Cause Analysis

**RCA**: The requirements are the same as for Statistics - Case Overview


