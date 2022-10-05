---
title: Variants filter (preview)
description: Learn how to restrict the mining in the process only to the cases following a certain scenario in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Variants filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use this filter to restrict the mining in the process only to the cases following a certain scenario (variant).

In the center, there is the visualization of the dependence of the number of variants on the number of cases falling in each variant.

:::image type="content" alt-text="media/image-59.png" source="media/image-59.png":::

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

## Variant Mining Attribute

Variants may be calculated using activity (default one) or any mining attribute (any non-case level attribute). Choosing variant mining attribute in filters does not depend on, nor modifies the selected mining attribute on the process map.

The process map can be calculated using the activity attribute, while data may be filtered by the most common variants (scenarios) based on the resource attribute.

:::image type="content" alt-text="media/variant-mining-attribtue.png" source="media/variant-mining-attribtue.png":::

## Variant Selection

Variants can be selected by marking them on the chart in the center part of the filter. The chart can be used to distinguish variants with high case count from variants with low case count. The height of chart bars depends on the number of variants with equal case count.

The selection in the first picture results in 50 variants containing 3% of all cases in the process.

:::image type="content" alt-text="media/image019-1.png" source="media/image019-1.png":::

The selection in the second picture results in 1 variant containing 50% of all cases in the process.

:::image type="content" alt-text="media/image020-1.png" source="media/image020-1.png":::

To select a discontinuous group of variants or to select variants by their number, you can select specific variants on the right. Click a variant to select/remove it from the list. To make the selection of variants easier, you can use the selection buttons to select all variants, to cancel the selection of all variants, and to invert the selected variants.


