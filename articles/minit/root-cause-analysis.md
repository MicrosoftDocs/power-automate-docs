---
title: Find hidden connections
description: Learn how to find hidden connections in your data in the minit desktop application.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/15/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

## Find hidden connections

Find hidden connections in your data with root cause analysis (RCA) in minit desktop application.

To create a new RCA, create an analysis.

1. On the **Processes** screen, select **Root cause analysis** on the left panel.

1. In the **Metric** dropdown menu, select a metric.

1. On the **Influenced by** panel, select which attributes you think are important for that metric.

   If you're not sure which attributes should be influencing your metric, choose all of them and the algorithm will find the best one. To select all attributes, select the circle to the left of the **Metric name** heading.

1. Select **Analyze**. The **Analysis** tab opens.

If you choose a main metric, you can't choose the same metric in **Influenced by**. Also, don't choose similar metrics in **Influenced by** as the main metric, as the algorithm will choose those metrics on every split. For example, if your main metric is **Case duration**, don't select **Case Active Time** in the **Influenced by** section, as this will provide you no new information.

### **Understand analysis**

Nodes are connected by arches (rules). Each node is a collection of data filtered by the rules in the arches connecting it to the root node.

To expand or collapse a node, select the plus or minus sign. The expanded view allows you to see more information about that part of the data.

:::image type="content" alt-text="Screenshot of the Analysis tab." source="media/rca-analysis-tab.png":::

If the split that is chosen as the best one by the algorithm is on an attribute which you don't want to use at that point, you can choose another split from the list. In the list, there is a best split for each selected attribute in the analysis.

To open the available splits you can choose from, select the down arrow in the node heading.




If the tree is too large and can not be navigated easily, you can open the Diagram preview and use it to navigate around the tree. You can also change the layout as you wish.

:::image type="content" alt-text="Screenshot of the Diagram preview." source="media/image-46.png":::

### **Acting upon analysis**

When you find the right part of dataset that you need to explore further, you can convert the rules that lead up to that node into a set of filters. Beware that if you do this, the original analysis becomes view only, as the data underlying has changed (filters applied).

:::image type="content" alt-text="Screenshot of converting rules." source="media/image-47.png":::

### Using categorical main metric

If you want to explore why some cases have gone one way or another, its easy to analyze this with RCA using a custom metric returning string values.

For example, if you want to analyze why some cases end in some activities and other in different ones, you can use the formula **LAST(CaseEvents, Activity)** as your custom metric.

:::image type="content" alt-text="Screenshot of RCA using a custom metric." source="media/image-48.png":::

For other use cases, we might want to explore why cases that went through an activity X are then going to one of direct descendants of activity X. For this we can use custom metric **FIRSTIF(CaseEvents, Activity == "Process start", NEXT(Activity))** that returns the name of the activity after activity "Process start". If a case goes through this activity multiple times, it will only take into account the first pass. If we want the last one, we can use **LASTIF **instead of **FIRSTIF.**
The same can be achieved with **FIRSTIF(CaseEvents, Activity == "Check order numbers", MOVE(1, Activity))**, where you can specify the number of events that it has to move down the case.

For other similar use cases, we can use custom metrics to get event attributes on a case level so it can be used in RCA. To do this, we can get the value of an event attribute Y at an activity X. This is done by using custom metric **FIRSTIF(CaseEvents, Activity== "X", Y)**.

All of these metrics, can be also used in influenced by.

To learn more about custom metrics, go to [List of other operations](other-operations.md).

### See also

[Root cause analysis overview](root-cause-analysis-overview.md)