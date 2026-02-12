---
title: Filtering overview in Process Intelligence Studio (preview)
description: Learn how to use persistent and temporary filters in Process Intelligence Studio to narrow down and focus on specific process data during analysis.
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

# Filtering Overview (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Filters allow you to narrow down and focus on specific data within your process analysis. By applying filters, you can view only the cases, events, and process paths that match your selected criteria.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Types of Filters

There are two types of filters in Process Intelligence Studio:

### Persistent Filters (Grey)

Persistent filters are defined at design time by the dashboard creator. These filters:
- Appear as **grey chips** in the filter bar
- Are configured when creating or editing the dashboard layout
- Apply to all users viewing the dashboard
- Remain active across sessions
- Define the baseline view for the dashboard

Dashboard creators add persistent filters to establish a specific context or focus for the dashboard, such as filtering to a specific region, time period, or process variant.

### Temporary Filters (Blue)

Temporary filters are added by dashboard users during analysis. These filters:
- Appear as **blue chips** in the filter bar
- Can be added on top of persistent filters
- Are specific to the user's current session
- Are **lost when the session expires**
- Allow users to explore data without affecting the dashboard design

Users can add temporary filters to further narrow down the data for their specific analysis needs.

## Filter Bar

The filter bar is located below the tab navigation at the top of the analysis view. It displays all currently active filters (both persistent and temporary) and provides a button to add new filters.

### Active Filters Display

Active filters appear as chips in the filter bar:
- **Grey chips**: Persistent filters (design time)
- **Blue chips**: Temporary filters (session only)

Each filter chip shows:
- The filter type and its value (for example, "SupplierState: Falkland Isl..." or "Variant: 55, Variant 15...")
- An **X button** to remove the filter (only available for temporary filters)

When multiple values are selected for a single filter type, they are displayed together in one chip, separated by commas.

## How to Add Temporary Filters

Dashboard users can add temporary filters to further refine their analysis:

1. Click the **Add Filters** button in the filter bar
1. Select from the available filter types:
   - **Timeframe** - Filter by date or time range
   - **Attribute** - Filter by case or event attributes
   - **Variant** - Filter by specific process variants
   - **Edge** - Filter by specific paths or connections in the process
1. Configure the filter criteria based on the selected type

Once added, the filter appears as a **blue chip** in the filter bar and is immediately applied to your analysis. This temporary filter works in combination with any existing persistent filters.

> [!NOTE]
> Temporary filters are not saved and will be lost when your session expires.

## How to Remove Temporary Filters

To remove a temporary filter:

- Click the **X button** on the blue filter chip you want to remove

The filter is immediately removed, and the analysis view updates accordingly.

> [!NOTE]
> Only temporary filters (blue chips) can be removed by users. Persistent filters (grey chips) are part of the dashboard design and cannot be removed during analysis. To modify persistent filters, you must edit the dashboard layout.
