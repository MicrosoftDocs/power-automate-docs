---
title: Process compare for compliance (preview)
description: Learn how to compare various process views in the minit desktop application in process advisor.
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

# Process compare for compliance (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Comparison of the processes allows an intuitive and efficient comparison of processes. You can compare the processes at the level of the process map, where the generated visualization allows you to identify the differences in the flow and frequency or time metrics. By using the **Detail** panel, you can also compare in detail values of metrics and attributes at the level of activities and edges.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

You can compare the views of various processes or different views generated from a single process (for example, for different periods of time). It's important to remember that you can compare only saved views.

:::image type="content" alt-text="media/image-18.png" source="media/image-18.png":::

You can use the settings panel and the visualization panel of the process map for the comparison map. You can change the complexity of the map, nodes offset or you can export the comparison map.

## Adding views

A view, from which the functionality was displayed, is the basis for comparison. All added views as layers are constantly compared to the view you are currently working on.

Click + to display the panel for adding views or process blueprints in BPMN format. The panel contains the list of processes. When you select a process, the corresponding created views are displayed. Click Add layer to add the selected view.

:::image type="content" alt-text="media/comparison4.png" source="media/comparison4.png":::

To add a BPMN blueprint, click the Add BPMN layer button and select a properly formatted BPMN diagram file from disc. The BPMN diagram will be transformed and compared to the currently open view.

## Changing the view

List of selected layers is shown in the bottom right corner. The individual layers can be switched by pressing the layer number. Click - to remove the layer from the list.

:::image type="content" alt-text="media/comparison2.png" source="media/comparison2.png":::

## Changing comparison visualization

Use the buttons below the displayed map to show or hide activities and edges of the compared views. Use the button in the middle to activate/deactivate the comparison function. Each activity and edge of the layer/view has an associated color. Activities and edges that form an intersection of the compared views are colored as the comparison key.

:::image type="content" alt-text="media/comparison3.png" source="media/comparison3.png":::


