---
title: Process compare for compliance (preview)
description: Learn how to compare various process views in the Minit desktop application in process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Process compare for compliance (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Comparison of the processes allows an intuitive and efficient comparison of processes. You can compare the processes at the level of the process map, where the generated visualization allows you to identify the differences in the flow and frequency or time metrics. By using the **Detail** panel, you can also compare in detail values of metrics and attributes at the level of activities and edges.

You can compare the views of various processes or different views generated from a single process (for example, for different periods of time). It's important to remember that you can compare only saved views.

:::image type="content" alt-text="Screenshot of the 'Process compare' screen." source="media/image-18.png":::

You can use the settings panel and the visualization panel of the process map for the comparison map. You can change the complexity of the map, nodes offset or you can export the comparison map.

## Adding views

A view, from which the functionality was displayed, is the basis for comparison. All added views as layers are constantly compared to the view you are currently working on.

Select (**+**) to display the panel for adding views or process blueprints in BPMN format. The panel contains the list of processes. When you select a process, the corresponding created views are displayed. Select **ADD LAYER** to add the selected view.

To add a BPMN blueprint, select **ADD BPMN LAYER** and select a properly formatted BPMN diagram file from disc. The BPMN diagram will be transformed and compared to the currently open view.

:::image type="content" alt-text="Screenshot of the panel for adding views." source="media/comparison4.png":::

## Changing the view

List of selected layers is shown in the bottom right corner. The individual layers can be switched by pressing the layer number. Select (**-**) to remove the layer from the list.

:::image type="content" alt-text="Screenshot of changing the view." source="media/comparison2.png":::

## Changing comparison visualization

Use the buttons below the displayed map to show or hide activities and edges of the compared views. Use the button in the middle to activate/deactivate the comparison function. Each activity and edge of the layer/view has an associated color. Activities and edges that form an intersection of the compared views are colored as the comparison key.

:::image type="content" alt-text="Screenshot of changing the visualization comparison." source="media/comparison3.png":::


