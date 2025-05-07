---
title: Variants filter
description: Learn how to restrict the mining in the process only to the cases following a certain scenario in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Variants filter

Use this filter to restrict the mining in the process only to the cases following a certain scenario (variant).

In the **Values** pane, there's the visualization of the dependence of the number of variants on the number of cases falling in each variant.

:::image type="content" alt-text="Screenshot of the variants on Variants filter." source="media/variants-filter.png":::

## Variant mining attribute

Variants may be calculated using activity attribute (default one) or any mining attribute (any non-case level attribute). Choosing a variant mining attribute in filters doesn't depend on, nor modifies the selected mining attribute on the process map.

The process map can be calculated using the activity attribute, while data may be filtered by the most common variants (scenarios) based on the resource attribute.

## Variant selection

Variants can be selected by marking them on the chart in the center part of the filter. The chart can be used to distinguish variants with high case count from variants with low case count. The height of chart bars depends on the number of variants with equal case count.

The following example show the results of 50 variants containing 3% of all cases in the process.

:::image type="content" alt-text="Screenshot of many variants selected." source="media/variant-filter-example-1.png":::

The following example show the results of one variant containing 50% of all cases in the process.

:::image type="content" alt-text="Screenshot of one variant selected." source="media/variant-filter-example-2.png":::

To select a discontinuous group of variants or to select variants by their number, you can select specific variants on the right. Select a variant to select and remove it from the list. To make the selection of variants easier, use the selection buttons to select all variants, and to cancel the selection of all variants.

