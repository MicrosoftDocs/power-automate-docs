---
title: Use filters in OCPM analysis (preview)
description: Learn how to apply filters in OCPM analysis.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/07/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Use filters in OCPM analysis (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Filters are essential tools in object-centric process mining (OCPM) that allow analysts to focus on specific subsets of data by narrowing down events, objects, or object types based on defined criteria. Unlike case-centric event log filtering, object-centric filters must account for multiple interconnected object types and their relationships, enabling more nuanced analysis of complex business processes. By applying filters strategically, you can isolate bottlenecks, compare different process paths, analyze specific customer segments, or exclude outliers—ultimately transforming large, unwieldy datasets into meaningful insights.

OCPM in Power Automate Process Mining supports the following filter types:

- **Object Type** filter
- **Object Proximity** filter
- **Object Attribute** filter
- **Timeframe** filter

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Manage filters

Filters are managed in the filter toolbar at the top of the active tab. Filters are applied to all visuals and widgets in the active tab.

:::image type="content" source="media/object-centric-filters/object-centric-filter-toolbar.png" alt-text="Screenshot of the filter toolbar in Process Intelligence Studio for OCPM.":::

### Add a filter

To add a filter, navigate to the **Add filter** button in the toolbar and select the desired filter type. A configuration panel for the selected filter opens. To confirm the filter criteria, select **Apply**.

The actual filter setting appears in the filter toolbar as a new button.

### Change a filter

To change a filter setting, select the button with the actual filter criteria. A configuration panel for the selected filter opens. To confirm the filter criteria changes, select **Apply**.

The filter setting reflects the changes in the filter toolbar.

### Remove a filter

To remove the filter, select **X** on the specific filter button.

To remove all currently set filters at once, select **Clear filters** in the filter toolbar.

## Object type filter

Object Type filters allow you to select which specific object types to include or exclude from your analysis, enabling you to focus on particular entities within your process ecosystem. For example, in an order-to-cash process, you might filter to show only "Orders" and "Customers" while temporarily excluding "Items" to simplify the process view and concentrate on customer-level behavior.

:::image type="content" source="media/object-centric-filters/object-centric-filter-object-type.png" alt-text="Screenshot of the OCPM object type filter configuration panel.":::

In the configuration panel, select (or search and select):

**Object Type**: Checked object types are included into the analysis.

## Object proximity filter

Object proximity filters enable you to analyze events based on the distance or degree of separation between different objects in the process. This allows you to focus on directly related objects (for example, orders that contain specific items) or expand your view to include indirectly connected objects (for example, customers linked through shared products), helping you understand the ripple effects and dependencies across your object-centric process network.

Proximity level used in the filter defines the degree of separation between objects:

- 1 level: Select object.
- 2 levels: Directly connected objects (via common events) including the objects of the same object type.
- 3 and more levels: Recursively add indirectly connected objects related to the objects identified in the previous level.

:::image type="content" source="media/object-centric-filters/object-centric-filter-object-proximity.png" alt-text="Screenshot of the OCPM object proximity filter configuration panel.":::

In the configuration panel, select (or search and select):

- **Object Type**: Values for the selected object type are loaded.
- **Objects**: Checked objects are included in the analysis.
- **Proximity level**: Choose the separation level for filtering.

## Object attribute filter

Object attribute filters allow you to select objects based on specific characteristics or properties, such as customer region, order value, product category, or any other attribute associated with an object type. By filtering on attributes, you can segment your analysis to compare different cohorts, investigate specific scenarios (for example, high-value orders or premium customers), or isolate cases that meet particular business criteria relevant to your analysis goals.

:::image type="content" source="media/object-centric-filters/object-centric-filter-object-attribute.png" alt-text="Screenshot of the OCPM object attribute filter configuration panel.":::

In the configuration panel, select (or search and select):

- **Object Type**: Attributes for the selected object type are loaded.
- **Attribute**: Values for the selected attribute are loaded.
- **Proximity level**: Choose the separation level for filtering.
- **Attribute values**: Objects of the selected object type that comply with the checked attribute values are included into the analysis.

## Timeframe filter

Timeframe filters enable you to restrict your analysis to objects active within a specific time period, such as a particular quarter, month, or custom date range. This is essential for comparing process performance across different periods, analyzing seasonal trends, focusing on recent data for operational monitoring, or excluding historical data that might no longer reflect current process behavior.

:::image type="content" source="media/object-centric-filters/object-centric-filter-timeframe.png" alt-text="Screenshot of the OCPM timeframe filter configuration panel.":::

In the configuration panel, select (or search and select):

- **Object Type**: Objects of the selected object type are analyzed whether they're active in the selected timeframe.
- **Proximity level**: Choose the separation level for filtering.
- **Timeframe**: Select the timeframe from predefined values or set a custom timeframe.
