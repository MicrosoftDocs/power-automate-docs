---
title: Compare process views for compliance
description: Learn how to compare various process views in minit.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/31/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Compare process views for compliance

Comparison of the processes allows an intuitive and efficient comparison of processes. You can compare the processes at the level of the process map, where the generated visualization allows you to identify the differences in the flow and frequency, or time metrics.

You can also change the complexity of the map, nodes offset, or export the comparison map in the **Customize** and **Visualize** icons on the far right. <!--I don't see export.-->

:::image type="content" alt-text="Screenshot of the panel for adding views." source="media/process-compare.png":::

You can compare in detail values of metrics and attributes at the level of activities and edges. You can also compare the views of various processes or different views generated from a single process (for example, for different periods of time) by selecting a process in the **Compare** box. You can compare only saved views. <!--Is this true? Where do you do this?--> 

## Add views

A view, from which the functionality was displayed, is the basis for comparison. All added views as layers are constantly compared to the view you're currently working on.

To add a layer:

1. On the **Compare** box, select **Add layer**.

1. In the **Views** dropdown menu, select a process.

1. (If your process is in a blueprint format) Select **BPMN** and then select a properly formatted BPMN diagram. The BPMN diagram will be transformed and compared to the currently open view.

<!--I don't see the next two sections:

## Changing the view

List of selected layers is shown in the bottom right corner. The individual layers can be switched by pressing the layer number. Select (**-**) to remove the layer from the list.

:::image type="content" alt-text="Screenshot of changing the view." source="media/comparison2.png":::

## Changing comparison visualization

Use the buttons below the displayed map to show or hide activities and edges of the compared views. Use the button in the middle to activate/deactivate the comparison function. Each activity and edge of the layer/view has an associated color. Activities and edges that form an intersection of the compared views are colored as the comparison key.

:::image type="content" alt-text="Screenshot of changing the visualization comparison." source="media/comparison3.png":::

-->
