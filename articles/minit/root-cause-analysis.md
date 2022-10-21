---
title: Root cause analysis (preview)
description: Learn how to find hidden connections in your data in the init desktop application in process advisor.
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

# Root cause analysis (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Root cause analysis allows you to find hidden connections in your data.

Have you ever wondered why some cases take longer time to complete than other? Or why some cases get stuck in reworks and others go smoothly through the process? Root Cause Analysis (RCA) will show you the key differences between such cases.

## What data do I need?

RCA can use all your case level attributes, metrics and custom metrics and find connections between them and a metric of your choosing.

Best way is to include all data you can as a case level attribute and let RCA do the choosing of which attribute actually influences the metric and which does not.

## How does RCA work?

RCA is a custom implementation of one of the most used machine learning algorithm, the Decision Tree.

The algorithm will compute a tree structure where each node will split the dataset into two smaller parts based on one variable where it finds the best correlation between that variable split and the target metric. From this, you can see the hidden connections in the data, where it will tell you which combination of attributes will influence the case in which way.

### Simple show case

"Let's say we want to see the root cause behind the Case Duration. In the data, we have case level attributes *supplier country*, *supplier city*, *material*,*total amount* and *cost center* and the average Case Duration is 46 hours.

By looking at each value of each attribute separately, we can say that the highest influencer of case duration is when *supplier city* is *Graz* which on average increases the duration of the case by additional 15 hours. From this initial analysis, we can see that the other values of attributes influence the target metric far less. However, when we compute the tree model, we can see that the computation above is misleading. as in the following screenshot.

The tree structure looks like this: 

- First split the data along the **material** variable, with **aluminium** on one side and all **other** materials on the other side.

- Now the **aluminium** branch is split further by **supplier country** into **Germany** and **Austria**. 

- In **Austria**, the branch continues with split by **supplier city**, with **Graz** on one side and **Vienna** on the other.

- In the node **Graz**, the average case was 36 hours slower than the overall average duration of 46 hours.

In the same tree, we can see that if we have another material than aluminium, it also splits by the variable **supplier city**, where on one side is **Graz** and on the other is Vienna, Munich or Frankfurt. But here, the values are the opposite. **Graz** has much better statistics than Vienna or any German city, with average case in Graz being 15 hours faster than the overall average for all cases.

From this, we can see that the initial statistics is misleading because Graz is performing poorly when the material is aluminium, but is performing above average when the material is other than aluminium and it's completely opposite for other cities.

Case Duration Influencer takes into account only one value and therefore can be sometimes misleading. RCA takes into account combinations of them to give you more insights into your process.

:::image type="content" alt-text="Screenshot of the case duration influencer." source="media/rca-basic-model.png":::

### How does RCA find the best split?

First, we generate hundreds to thousands of combinations of possible splits. Then we try each split, how well will it actually split the dataset into two parts. We calculate the variance of main metric in each part of the split and calculate score for each split as
***score<sub>split_x</sub> = variance<sub>left</sub> * number of cases<sub>left</sub> + variance<sub>right</sub> * number of cases<sub>right</sub>***
Then we sort all splits by this score and the best splits are taken from the beginning, with the lowest score.
For categorical main metric (string) we calculate Gini impurity instead of variance.

## How to use RCA

### Analysis creation

To create new RCA, do the following:

1. In the left navigation tab, select **RCA**.

1. Select a metric.

1. Select which attributes you think are important for that metric.

   If you're not sure which attributes should be influencing your metric, choose all of them and the algorithm will find the best one.

1. Select **ANALYZE**.

Be aware that if you choose a main metric, you can't choose the same metric in **Influenced by**. It is also advisable to not choose similar metrics in **Influenced by** as the main metric, as the algorithm will choose those metrics on every split. For example, if your main metric is **Case duration**, don't select **Case Active Time** in the **Influenced by** section, as this will provide you no new information.

:::image type="content" alt-text="Screenshot of analysis creation." source="media/image-42.png":::

### **Understanding analysis**

Nodes are connected by arches (rules). Each node is a collection of data filtered by the rules in the arches connecting it to the root node.

:::image type="content" alt-text="Screenshot of node arches." source="media/image-43.png":::

Every node can be expanded to see additional information about that part of the data.

:::image type="content" alt-text="Screenshot of expanded nodes." source="media/image-44.png":::

If the split that is chosen as the best one by the algorithm is on an attribute which you don't want to use at that point, you can choose another split from the list. In the list, there is best split for each selected attribute in the analysis.

:::image type="content" alt-text="Screenshot of the available splits dropdown menu." source="media/image-45.png":::

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

To learn more about custom metrics, go to [Custom metrics](other-operations.md).

