---
title: End events filter (preview)
description: Learn how to restrict cases according to the property of the event that occurred at the beginning or at the end of the case in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# End events filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Use this filter to restrict cases according to the property of the event that occurred at the beginning or at the end of the case.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

The filter shown in the picture will only select the cases starting with the "Start" activity and ending with the "Process End" activity. In the same way you can create a resource-based condition, for example, if you want to select only the cases that Anna started to deal with.

:::image type="content" alt-text="media/image031.png" source="media/image031.png":::

### Selecting an attribute for a rule

Here you choose which attribute is of interest when assessing events.

:::image type="content" alt-text="media/image032.png" source="media/image032.png":::

### Selecting permissible attribute values for the starting event

Here you choose permissible attribute values for the starting event. Only the values that are present in the starting events of the process are available for selection.

If the attribute values of the starting event are of no interest, all values should remain active.

:::image type="content" alt-text="media/image033.png" source="media/image033.png":::

### Selecting permissible attribute values for the finishing event

Here you choose permissible attribute values for the finishing event. Only the values that are present in the finishing events of the process are available for selection.

If the attribute values of the finishing event are of no interest, all values should remain active.

:::image type="content" alt-text="media/image034.png" source="media/image034.png":::


