---
title: Use process maps in Process Intelligence Studio
description: Learn how to configure and use process map visualizations in Process Intelligence Studio to display your process flow with activities, transitions, and performance metrics.
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

# Process map

:::image type="content" source="media/process-mining-studio/process-map-customization.png" alt-text="Screenshot of the process map customization panel.":::

The process map visualizes your process as a flow diagram with activities (nodes) and transitions (edges).

## Customize a process map

To customize a process map, select the card context menu and choose **Customize card**.

### Chart type

The chart type is **Process map**.

### Label

Enter a custom name for your process map card in the **Label** field. The default label is "Process map".

### Data settings

#### Activities

Use the **Activities** slider to control how many activities are displayed in the process map. Moving the slider adjusts the complexity of the visualization.

#### Paths

Use the **Paths** slider to control how many paths (edges) are displayed in the process map. Moving the slider adjusts the number of transitions shown.

#### Use auto sliders settings

Enable **Use auto sliders settings** to automatically adjust the Activities and Paths sliders for optimal visualization. This option is enabled by default.

#### Metric type

Select the **Metric type** to determine what kind of metric is displayed on the process map:
- **Frequency**: Show metrics related to how often activities and paths occur
- **Performance**: Show metrics related to duration and timing
- **Rework**: Show metrics related to repeated activities
- **Finance**: Show metrics related to cost

#### Metric at node

Select what metric to display on activity nodes from the **Metric at node** dropdown. The available options depend on the selected metric type. The default is "Total count".

#### Linked

Enable **Linked** to synchronize the metric selection between nodes and edges. When enabled, changing the metric at node will automatically update the metric at edge. This option is enabled by default.

#### Metric at edge

Select what metric to display on transition edges from the **Metric at edge** dropdown. The available options depend on the selected metric type. The default is "Total count".

#### Show terminal nodes

Enable **Show terminal nodes** to display the start and end nodes in the process map. This option is enabled by default.
