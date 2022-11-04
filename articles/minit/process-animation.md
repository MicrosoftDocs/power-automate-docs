---
title: Process animation (preview)
description: Learn how to visualize the development of the process over time in the Minit desktop application in process advisor.
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

# Process animation (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

*Process animation* is used to visualize the development of the process over time. The animation is always shown over the displayed process map or social graph. The instructions displayed on the Process map screen equally apply to the process map and social chart settings.

Animation settings are found in the right part of the screen under the **Animation** heading or the button.

:::image type="content" alt-text="Screenshot of Animation setting button." source="media/image001-v53-1.png":::

## Animation Controls

### Playback

The animation playback control is located in the bottom part of the screen, and you can use it to start the animation, pause it, or skip to any position in the process.

The information about the actual time in the process is shown on the left.

:::image type="content" alt-text="Screenshot of the playback time." source="media/image002-9.png":::

### Animation Speed

You can use the **Animation speed** slider to adjust the animation playback speed. The information displayed in the animation frame remains unchanged.

### Simulation Speed

You can use the **Simulation speed** slider to adjust the process simulation speed which the displayed animation information is based on. The simulation speed change has an impact on the degree of detail in the displayed process dynamics. Depending on the nature of the process in question, its duration, and the objective of the analysis, dynamics with a higher or lower degree of detail may be preferred.

However, if we have a long-lasting process and we need a detailed analysis of dynamics over a shorter period, it is suitable to use a filter to restrict the process under analysis only to the period in question.

### Hide Inactive Connections

This setting can be used to hide the connections that are not presently active to make the animation less cluttered.

## Function of Animation Elements

### Instant Animation Level

Setting the animation level to **Immediate** means that actual dynamics in the process will be shown during playback.

:::image type="content" alt-text="Screenshot of an instant animation level." source="media/image003-7.png":::

 The following sections explain the purpose of the animation elements.

### Number and Color Highlight of the Node

:::image type="content" alt-text="Screenshot of the number and color highlight of the node." source="media/image004-5.png":::

The number at the chart node represents how many events of the given activity are currently in progress. The color highlight makes it possible to easily distinguish how many events are dealing with the activity at the moment. During the animation, it can be easily seen, which activities often take place in parallel.

To learn more about color highlighting, go to [Display the significance of values](#display-the-significance-of-values) in this topic.

### Number and Color Highlight of the Edge

The number at the chart edge represents how many transitions between activities are currently in progress or, in other words, how many pending cases are waiting for the next event to take place. The color highlight of the edge allows to easily identify if there are too many cases concurrently waiting for an activity to take place.

To learn more about color highlighting, go to [Display the significance of values](#display-the-significance-of-values) in this topic.

:::image type="content" alt-text="Screenshot of the number and color highlight of the edge." source="media/image005-3.png":::


### Activity Progress

The following example shows the highlighted progress indicator for an activity in the process. This indicates the proportion of the count of already performed events of the activity compared to the total count of events of this activity in the process. If all events of the given activity being present in the process in question have already been played back in the animation, the indicator will fill the entire circle.

:::image type="content" alt-text="Screenshot of the progress indicator." source="media/image006-2.png":::

### Aggregated Animation Level

Setting the animation level to **Aggregated** means that during playback the process dynamics aggregated in the time period around the currently monitored time point will be shown. The length of the time period used to aggregate information for the current view is part of process mining. It depends on the duration of the process and the simulation speed setting. For example, the higher the simulation speed, the longer the time period is aggregated.

:::image type="content" alt-text="Screenshot of the aggregated animation level." source="media/image003-8.png":::

## Display the significance of values

The value significance display switch can be used to set the mode with the color highlighting of edges and nodes in the animation.

### Globally

With this setting, the current value will be highlighted in color in chart edges and nodes compared to all values of all nodes and edges in the entire simulated process. Thus, the thickest edge or the most highlighted node represents the global maximum for the whole duration of the process.

A node is highlighted if the number of currently incoming events is significant compared to the global maximum of all events ongoing at the same time or in the aggregated interval in one node.

An edge is highlighted if the number of its currently ongoing transitions is significant compared to the global maximum of all transitions ongoing at the same time or in the aggregated interval in one edge.

### Locally

With this setting, the current value will be highlighted in color in chart edges and nodes compared to the current values of all nodes and edges in the simulated process. Thus, the thickest edge or the most highlighted node represents the local maximum for the present moment.

A node is highlighted if the number of currently incoming events is significant compared to the current maximum of events ongoing at the same time or in the aggregated interval in one node.

An edge is highlighted if the number of its currently ongoing transitions is significant compared to the current maximum of transitions ongoing at the same time or in the aggregated interval in one edge.


