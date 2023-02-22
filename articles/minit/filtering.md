---
title: Filtering overview
description: Learn how to adjust which cases will be included in the process analysis in the Power Automate Process Mining desktop app.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 03/15/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Filtering

Use filters to adjust which cases will be included in the process analysis.

For example, it can be used to define only a certain time period, only specific resources or scenarios in the process, or modify cases by excluding activities that are not important for the current analytical problem. It can also be helpful in identifying and focusing on the problematic parts of the process.

## What's a filter?

A filter is a rule or a set of rules determining which cases and/or events from the process will be later included in process mining. There are two groups of filters available in Minit:

- Event-level filters – These filters are modifying cases by removing events based on the applied filter criteria. Event level filters are:- Event Attributes

- Subprocess

- Event metrics

- Case-level filters – These filters are always applied to** complete cases** in the process. List of case-level filter types:- Timeframe

- Case attributes

- Attributes (conditional)

- Edge (conditional)

- Variants

- Case metrics

- Sequence

- End events

- Conflict of interests



Details about mentioned filter types can be found in its respective subpages.

Case and event-level filters can be combined to form a single combined filtering criteria in a view. There are filters that have the same syntax, but different semantics based on the type (for example, Attributes filter can be applied on the event as well as case level).

The combined filter criteria order is defined as criteria are added. The order is modifiable inside of the filter category by using drag-and-drop. Filters are evaluated in the final defined top-down order. Input for the first filter is the whole data set and its output - filtered data set – serves as input for the next filter. Output (filtered) data set from the last filter in the order defines the process view.

**However, event filters are always applied first, before any case filter is applied to the resulting dataset**. The user is not able to mix order between event- and case-level filters. Ordering is modifiable only within its group.

Filters can be exported and imported to be re-used in different views or processes. More details can be found on this sub-page [Filter Export/Import](filters-export-import.md).

### Use filters in process analysis

A filter is a very convenient tool in a process analysis as we can use it to focus only on certain parts of the process in analysis. For example, it can be used to define only a certain time period, only specific resources or scenarios in the process, or modify cases by excluding activities that are not important for the current analytical problem. It can also be helpful in identifying and focusing on the problematic parts of the process.

## Filter screen

On the left side of the screen, there is a list of filters. Details of the currently selected filter are shown on the right. The bottom left part of the screen indicates what percentage of cases and events from the process will enter process mining **after the filter is applied**.

In the bottom right part of the screen, there are buttons to apply or cancel filters. To apply filters, it is always necessary to press the **Apply** button.

:::image type="content" alt-text="Screenshot of the Filtering screen, Apply button." source="media/image-19.png":::

### Add a filter

To add a new filter, select (**+**) in the list of filters and select the filter type you want to add.

:::image type="content" alt-text="Screenshot of the dropdown menu with filter types." source="media/filters_list.png":::

### Name the filter

To give the filter a more convenient name, select the title of the selected filter and specify the new name.

### Filter Info

To see the actual filter configuration details, select the **Info** icon at the top of the list to reveal additional filter details:

:::image type="content" alt-text="Screenshot of the attributes in the Filters criteria set screen." source="media/filter_info.png":::

### Delete a filter

To delete a filter, select the filter you want to delete and select **X**.

### Delete all filters in the list

To delete all filters in the list, select the **X-All** button.

### Disable a filter temporarily

If you don't want to delete a filter completely from the list, but prefer to disable it temporarily, use the **Enable filter** switch next to the selected filter.

:::image type="content" alt-text="Screenshot of disabling a filter." source="media/image003.png":::

### Invert a filter

Some filtering rules may be difficult to express – therefore it is often more convenient to define the rule in an inverted form and then to invert the filter. The use of the inverted filter also changes how the filtering results are calculated. Particularly for more complex rules and large-scale processes, the use of inverted rules may simplify and speed up the calculation of the filtering results.

To invert a filter, use the **Inverse** button next to the selected filter.

A filter can also be inverted directly in the filter rule by changing the first option – "The result of the filter includes/does not include ...".

:::image type="content" alt-text="Screenshot of inverting a filter." source="media/image004.png":::

Filter inversion samples are in the following pictures – in the end, the filtering results are the same.

:::image type="content" alt-text="Screenshot of filter inversion with the 'includes' result." source="media/image005.png":::

:::image type="content" alt-text="Screenshot of filter inversion with the 'Does not include' result." source="media/image006.png":::

### Apply filters

After the filters have been configured, they need to be applied by pressing the **Apply** button. Only after the filters are applied, the new mining of the process will start.

### Combine filters

Filters are applied in the order in which they are defined in the list of filters.

However, event-level filters are always evaluated before case-level filters. It is possible to change the order in the respective category using drag-and-drop.

The final filtering result consists of the cases that fulfill the criteria of **all** active filters applied in the order.

If necessary, the same filter type can be used multiple times (such as a filter for attributes). However, for some filters, their multiple use does not make sense or it leads to an empty result set (such as combining several variant or timeframe filters).

## Information about applied filters

When analyzing the process by means of filters, you can always see the size of the data set you are working with.

Data size indicators provide information about the data set. Hovering over the indicators provides more precise values.

:::image type="content" alt-text="Screenshot of the data size indicators." source="media/image046.png":::

## Switch to the Filters screen

When you select the data size indicator, a message appears describing the filters currently applied. Select any item in the list of applied filters to automatically switch to the Filters screen showing the details of the item by default.

By means of this message, you can select items in the list of filters on the **Filter**s** screen.

:::image type="content" alt-text="Screenshot of filters for the data size indicator." source="media/image047.png":::
