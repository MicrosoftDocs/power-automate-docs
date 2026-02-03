---
title: Filter by edge in Process Intelligence Studio
description: Learn how to use the edge filter in Process Intelligence Studio to filter cases based on specific transitions between activities in your process flow.
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

# Edge filter

:::image type="content" source="media/process-mining-studio/edge-filter-settings.png" alt-text="Screenshot of the edge filter settings panel.":::

The edge filter lets you filter cases based on specific edges (transitions between activities) in your process. An edge represents a path from one activity to another in your process flow.

## How it works

The edge filter displays edges in the format "Source activity -> Target activity". You can select which edges to filter by using checkboxes. The filter title shows how many edges are currently selected: "Filter by Edge values (N)".

## Configure the filter

### Attribute name

Choose which attribute to use for displaying edges. The default is "Activity". Select from the dropdown to use a different attribute.

### Search for edges

Use the search box to quickly find specific edges in the list. Type any part of the source or target activity name to filter the edge list.

### Select edges

- Check the boxes next to the edges you want to include in your filter
- Use **Select all** to check all edges at once
- Use **Clear all** to uncheck all edges

> [!NOTE]
> Select all is available only on a list with a maximum of 100 values. If the list is longer, use the search functionality to limit the list of values.

## Apply and Cancel

Once you've made your selections:

- **Apply**: Confirms your variant selections and applies the filter
- **Cancel**: Closes the dialog without applying any changes to your variant filter

Changes only take effect when you click Apply.
