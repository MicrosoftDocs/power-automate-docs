---
title: Filter by attribute values in process intelligence studio
description: Learn how to use the attribute filter in process intelligence studio to filter process data by selecting specific values from case or event attributes.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 02/17/2026
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Filter by attribute values in process intelligence studio

The attribute filter in *process intelligence studio* allows you to filter data by selecting specific values from an attribute.

:::image type="content" source="media/process-mining-studio-attribute-filter/attribute-filter-settings.png" alt-text="Screenshot of the attribute filter settings panel.":::

## Configuration

### Attribute name

From the dropdown menu, select the attribute you want to filter by. In the example, **Activity** is selected.

### Search

To quickly find specific attribute values in the list, use the **Search** field. This feature is helpful when working with long lists of values.

### Select all / Clear all

- **Select all**: Checks all checkboxes in the list to include all attribute values
- **Clear all**: Unchecks all checkboxes to remove all selections

> [!NOTE]
> Select all is available only on a list with a maximum of 100 values. If the list is longer, use the search functionality to limit the list of values.

### Checkbox selection

Select individual attribute values by checking the corresponding checkboxes. You can select multiple values at once.

## Selection counter

The title displays a counter showing how many attribute values are currently selected: **Filter by attribute values (0)**. The number updates as you select or deselect values.

If you don't select any values, the counter shows **(0)**.

## Apply and Cancel

Once you make your selections, select one of the following options:

- **Apply**: Confirms your variant selections and applies the filter.

    Changes take effect only when you select **Apply**.

- **Cancel**: Closes the dialog without applying any changes to your variant filter.

