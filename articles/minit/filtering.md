---
title: Filtering overview
description: Learn how to adjust which cases will be included in the process analysis in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Filtering overview

Use filters to adjust which cases will be included in the process analysis. For example, you can use filters to define only a certain time period, only specific resources or scenarios in the process, or modify cases by excluding activities that aren't important for the current analytical problem. Filtering can also be helpful in identifying and focusing on the problematic parts of the process.

## Filter components

A filter is a rule or a set of rules determining which cases and/or events from the process will be later included in process mining. There are two groups of filters available in the Power Automate Process Mining desktop app: event level and case level. To learn more about each filter, select the link.

### Event level filters

Event level filters modify cases by removing events based on the applied filter criteria.

Event level filter types:

- [Event attributes](event-attributes-filter.md)

- [Subprocess](subprocess-filter.md)

- [Event metrics](event-metrics-filter.md)

### Case level filters

Case level filters are always applied to complete cases in the process.

Case level filter types:

- [Timeframe](timeframe-filter.md)
- [Case attributes](case-attributes-filter.md)
- [Attributes (conditional)](case-attributes-conditional-filter.md)
- [Edge (conditional)](edge-conditional-filter.md)
- [Variants](variants-filter.md)
- [Case metrics](case-metrics-filter.md)
- [Sequence](sequence-filter.md)
- [End events](end-events-filter.md)
- [Conflict of interests](conflict-of-interests-filter.md)

Case and event level filters can be combined to form a single combined filtering criteria in a view. There are filters that have the same syntax, but different semantics based on the type. For example, the **Event attributes** filter can be applied on the event and case level.

The combined filter criteria order is defined as criteria are added. The order is modifiable inside of the filter category by using drag-and-drop. Filters are evaluated in the final defined top-down order. Input for the first filter is the whole data set. Its output&mdash;filtered data set&mdash;serves as input for the next filter. The output (filtered) data set from the last filter in the order defines the process view.

> [!NOTE]
>
> Event filters are always applied first, before any case filter is applied to the resulting dataset. You can't mix order between event level and case level filters. Ordering is modifiable only within its group.

Filters can be exported and imported to be re-used in different views or processes. To learn more, go to [Export and import filters](filters-export-import.md).

## Add a filter

A filter is a convenient tool in a process analysis, as we can use it to focus only on certain parts of the process in analysis. For example, it can be used to define only a certain time period, only specific resources or scenarios in the process, or modify cases by excluding activities that aren't important for the current analytical problem. It can also be helpful in identifying and focusing on the problematic parts of the process.

To add a filter:

1. In the open view, select **Filter** in the lower-left corner below the menu.

1. On the menu at the top, select the **Add filter** dropdown menu.

1. Select a filter.

1. On the **Filtering** screen, select the options for the filter.

1. If you want to give the filter another name, select (double-click) the filter in the filter list column in the left panel, enter the new name in the **Filter name** field, and select **Save**.

1. Select **Apply**.

    :::image type="content" alt-text="Screenshot of the Timeframe filter." source="media/timeframe-filter.png":::

## Customize your filters

The following table lists common actions that you can use in the filtering screen to customize your filtering experience.

|Action                         |Description  |
|-------------------------------|-------------|
|Show details                    | To see the filter configuration details for all filters, turn on **Show details** at the top of the screen.    |
|Delete a filter                | Select the filter you want to delete and then select **X**.    |
|Delete all filters in the list | On the menu at the top of the screen, select the **Remove all filters**.         |
|Disable a filter temporarily   | If you don't want to delete a filter completely from the list, but prefer to disable it temporarily, turn off **Enable filter** next to the selected filter.     |
|Invert a filter                | Some filtering rules may be difficult to express. It's often more convenient to define the rule in an inverted form and then to invert the filter. An inverted filter also changes how the filtering results are calculated. Particularly for more complex rules and large-scale processes, inverted rules might simplify and speed up the calculation of the filtering results.<br/><br/>To invert a filter, use the filter rule by changing the **Filter result** option (includes/does not include) in the center panel.        |
|Apply filters                   | After the filters have been configured, select **Apply**. The new mining of the process will start only after the filters are applied.        |
|Combine filters                 | Filters are applied in the order in which they are defined in the list of filters. However, event level filters are always evaluated before case level filters. It's possible to change the order in the respective category using drag-and-drop. The final filtering result consists of the cases that fulfill the criteria of all active filters applied in the order.      |

## Filtering indicators

When analyzing the process by means of filters, you can see the size of the data set you're working with.

Data size indicators provide information about the data set, like the number of filtered events and cases. The indicators are located on the bottom of the application on each screen of an open view.

:::image type="content" source="media/filtering-indicators.png" alt-text="Screenshot of the filtering indicators.":::