---
title: Custom metrics overview (preview)
description: Learn how to use predefined metrics to define your own metrics in the Minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Custom metrics overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The *custom metrics* (also known as calculated metrics) module allows you to use pre-defined metrics in the application, different aggregations, mathematical, datetime, string, and other operations and functions and constants in a formula editor to define your own custom metrics. It is then possible to visualize them in the process map or according to their context in other parts of the application in a similar way as the static ones.

You define these metrics in the context of the current process. They can be used and evaluated only if they are valid in the particular context.

## Define a custom metric

Definition of the custom metric can be done from the **Process Context** window available from the **Project hub**, using the process context menu. Another option is to use the context menu in the Customize panel directly in the Process Map view - see **Applying to Process Map** section below.

To access the window, please select (**...**) icon to the process name and select the item **Process Context** and tab **Custom Metrics**. The window shows the list of custom metrics and their properties defined in the context of this process. If there is no metric defined yet, you are encouraged to create one by selecting **Create New Custom Metric**. 

:::image type="content" alt-text="Screenshot of the Custom metrics screen." source="media/image-28.png":::

The context menu for each metric allows you to delete the item, enable and disable the metric, or create a duplicate of that metric, modify and save it with a different name.

To define a custom metric, write your formula in the **Metric formula** field. The editor offers full syntax editing features including the following:

- **Syntax highlighting**

- **Intellisense** with function overload hints

- Formula **validation** - syntax errors, datatype issues

- Resulting metrics **data type identification**

:::image type="content" alt-text="Screenshot of the metric formula." source="media/image-29.png":::

Custom metrics can be used in the process map, filters, and statistics. Select the metric type icons to see further details to verify the applicability of the expression for various Minit functions. To learn more about the requirements for using custom metrics for various purposes, go to [Requirements for application](requirements-for-application.md).

:::image type="content" alt-text="Screenshot of metric types." source="media/CM-Editor-Indication-v54.png":::

## Apply a custom metric to a process map

Custom metrics can be accessed and applied to process map view from the **Customize** panel, by selecting the Custom metric option in the metrics visualization switch and then selecting the desired metrics from the available dropdowns. The top dropdown is used for selecting the custom metric on the activities and the bottom one for edges. The link icon in-between will lock the metric for activities and edges to show the same metric for both elements by selecting it from a single dropdown menu.

:::image type="content" alt-text="Screenshot of custom metric dropdown menus." source="media/CustomMetricsSelection-v56.png":::

Context menu available next to the dropdown offers a shortcut to add a new custom metric to process context or edit the formula of the currently selected metric.

The process map visualization will accommodate to the selected metric based on the context and datatype and show the calculated values.

:::image type="content"Screenshot of process map visualization." source="media/5-v56.png":::

## Apply a custom metric to filters

You can use custom metrics for all types of filters except for Timeframe, Edge (conditional), and Variants. To enter a custom metrics formula, select the filter setting you want to define (for example, *holds any of the values*), and go to the **Expression** tab. Select the appropriate operator (for example, *Equal to*) and select **fx** to enter a custom metrics formula in the expression field. The editor supports syntax highlighting, intellisense, and formula validation. Once you enter a valid formula, select the checkmark to apply.

:::image type="content" alt-text="Screenshot of the 'Filters criteria set' screen, Expression tab." source="media/filter.png":::

The formula will become visible directly in the filter settings you have just defined.

:::image type="content" alt-text="Screenshot of a formula in the filter settings." source="media/filter1.png":::

For the metrics filter type, you can also apply custom metrics stored in the Process context or create a new one. To select existing custom metrics, use the metric drop-down menu. Custom metrics are available at the end of the list.

:::image type="content" alt-text="Screenshot of custom metrics." source="media/filter3.png":::

To create a new one, select (**...**) next to the metric drop-down list and select Add. This opens the standard custom metrics editor (see above). You can also edit and delete existing custom metrics here.

:::image type="content" alt-text="Screenshot of adding a new metric." source="media/filter2.png":::

## Use a custom metric in the Statistics view

Once a custom value or case type metric is defined in the process map, it also becomes available in the **Statistics** view as a new column. It also can be visualized in the graph.

:::image type="content" alt-text="Screenshot of the metrics column in the Statistics screen." source="media/image-60.png":::

## Use a custom metric in root cause analysis (RCA)

Custom metrics that return values on case level, can be used in RCA either as a main metric or in the influenced by section. Supported custom metrics are any returning numerical, time or boolean value and metrics returning string values with less than 50 unique values for the data used in RCA.

Custom metrics can be also created in RCA settings screen by selecting (**...**) next to the selection of main metric.

:::image type="content" alt-text="screenshot of custom metrics in RCA." source="media/custom-metrics.png":::


