---
title: Filter by attribute values in Process Intelligence Studio
description: Learn how to use the attribute filter in Process Intelligence Studio to filter process data by selecting specific values from case or event attributes.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 02/03/2026
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Filter by Attribute Values

:::image type="content" source="media/process-mining-studio/attribute-filter-settings.png" alt-text="Screenshot of the attribute filter settings panel.":::

The attribute filter allows you to filter data by selecting specific values from an attribute.

## Configuration

### Attribute Name

Select the attribute you want to filter by from the dropdown menu. In the example, "Activity" is selected.

### Search

Use the search box to quickly find specific attribute values in the list. This is helpful when working with long lists of values.

### Select All / Clear All

- **Select all**: Checks all checkboxes in the list to include all attribute values
- **Clear all**: Unchecks all checkboxes to remove all selections

> [!NOTE]
> Select all is available only on a list with a maximum of 100 values. If the list is longer, use the search functionality to limit the list of values.

### Checkbox Selection

Select individual attribute values by checking the corresponding checkboxes. You can select multiple values at once.

## Selection Counter

The title displays a counter showing how many attribute values are currently selected: "Filter by attribute values (0)". The number updates as you select or deselect values.

When no values are selected, the counter shows "(0)".

## Apply and Cancel

Once you've made your selections:

- **Apply**: Confirms your variant selections and applies the filter
- **Cancel**: Closes the dialog without applying any changes to your variant filter

Changes only take effect when you click Apply.
