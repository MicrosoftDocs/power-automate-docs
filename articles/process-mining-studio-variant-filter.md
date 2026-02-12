---
title: Filter by variant in Process Intelligence Studio (preview)
description: Learn how to use the variant filter in Process Intelligence Studio to select and analyze specific process variants in your process mining data.
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

# Filter by variant in Process Intelligence Studio (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

The variant filter allows you to select specific variants to include in your view or analysis.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

:::image type="content" source="media/process-mining-studio-variant-filter/variant-filter-settings.png" alt-text="Screenshot of the variant filter settings panel.":::

## Selection counter

The title displays **Filter by variant** followed by a counter in parentheses that shows the number of currently selected variants. For example, **(0)** indicates no variants are selected, while **(5)** indicates five variants are selected.

## Search functionality

To quickly find specific variants by name, use the search bar at the top of the filter dialog. This is useful when working with a large number of variants. To filter the list and locate the desired variant, type in the search box.

## Select all / Clear all

Two quick action buttons are available above the variant list:

- **Select all**: Checks all variants in the list, selecting them for filtering.
- **Clear all**: Unchecks all variants, removing all selections.

> [!NOTE]
> **Select all** is available only on a list with a maximum of 100 values. If the list is longer, use the search functionality to limit the list of values.

## Checkbox selection

Each variant in the scrollable list has an individual checkbox. Select the checkbox next to any variant name to select or deselect it. You can select multiple variants simultaneously by checking multiple checkboxes.

## Apply and Cancel

Once you make your selections:

- **Apply**: Confirms your variant selections and applies the filter.

    Changes take effect only when you select **Apply**.

- **Cancel**: Closes the dialog without applying any changes to your variant filter.
