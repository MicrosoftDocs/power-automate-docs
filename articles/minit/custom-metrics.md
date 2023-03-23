---
title: Custom metrics overview
description: Learn how to use predefined metrics to define your own metrics in minit.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 03/31/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Custom metrics overview

Custom metrics (also known as calculated metrics) allow you to use the following to define your own custom metrics:

- Pre-defined metrics in the application.

- Different aggregations, mathematical, datetime, string, and other operations.

- Functions and constants in a formula editor.

It's then possible to visualize them in the process map or according to their context in other parts of the application in a similar way as the static ones.

If you already have custom metrics defined, you see a list in the **Process context** screen. To view the formula for a custom metric, select the right arrow next to its name.The arrow turns into a down arrow.

  :::image type="content" alt-text="Screenshot of the metric formula when you select the arrow." source="media/custom-metrics-predefined.png":::

## Define a custom metric

Define custom metrics in the context of the current process. They can be used and evaluated only if they're valid in the particular context.

1. In the **Processes** screen, select a process.

1. On any screen selected from the left panel, select **Process context** on the menu at the top-right.

1. Select **Create new custom metric**.

1. In the **Custom metric name** field, enter a name.

1. In the **Metric formula** field, write your formula.

    The editor offers full syntax editing features including the following:

    - **Syntax highlighting**

    - **Intellisense** with function overload hints

    - Formula **validation** - syntax errors, datatype issues

    - Resulting metrics **data type identification**

1. Select **Save**.

    :::image type="content" alt-text="Screenshot of the metric formula in the Metric formula field." source="media/create-custom-metric.png":::

Select a **Metric type** to see further details to verify the applicability of the expression for various minit functions.

To learn more about the requirements for using custom metrics for various purposes, go to [Requirements for application](requirements-for-application.md).

:::image type="content" alt-text="Screenshot of metric types." source="media/metric-type.png":::

## Apply a custom metric to a process map

The process map visualization will adjust to the selected metric based on the context and datatype you select, and show the calculated values.

1. On the panel to the right, select the **Customize** (the first icon).

1. On the toolbar in the **Customize** panel, select **Custom** (the *fx* icon). 

1. Below the toolbar, select the desired metrics from the dropdown menus.

    :::image type="content" alt-text="Screenshot of custom metric dropdown menus." source="media/custom-metrics-select.png":::

     The top dropdown menu is used for selecting the custom metric on the activities and the bottom one for edges. The link icon in between will lock the metric for activities and edges to show the same metric for both elements.

    Use the ellipses (**...**) next to the dropdown menu to add a new custom metric to process context, edit the formula of the selected metric, or delete it.

## Apply a custom metric to filters

You can use custom metrics for all types of filters except for **Timeframe**, **Edge (conditional)**, and **Variants**.

To enter a custom metrics formula

1. Select or add a filter in the **Add filter** dropdown menu.

1. Select the filter setting you want to define (for example, for the **Attributes** filter, select the **holds any of the values** field, and open the **Expression** tab. 

1. Select the appropriate operator (for example, select **Equal to** and then select **fx** to enter a custom metrics formula in the expression field.

    The editor supports syntax highlighting, intellisense, and formula validation.

    :::image type="content" alt-text="Screenshot of the custom metric expression." source="media/custom-metric-filter.png":::
    ![filter-cm-pic](https://user-images.githubusercontent.com/117361449/227269627-a86b34f8-4700-4cc5-a84b-268be185c1b1.png)


For the **Metrics** filter type, you can also apply custom metrics stored in the process context or create a new one. To select existing custom metrics, use the metric dropdown menu. Custom metrics are available at the end of the list.

To create a new one, select (**...**) next to the metric drop-down list and select Add. This opens the standard custom metrics editor (see above). You can also edit and delete existing custom metrics here.

:::image type="content" alt-text="Screenshot of adding a new metric." source="media/filter2.png":::
![filter-metric-cm](https://user-images.githubusercontent.com/117361449/227300413-23780665-d9a8-46b3-85d4-3e1c86be3178.png)


## Use a custom metric in the Statistics view

Once a custom value or case type metric is defined in the process map, it also becomes available in the **Statistics** view as a new column. It also can be visualized in the graph.

:::image type="content" alt-text="Screenshot of the metrics column in the Statistics screen." source="media/image-60.png":::
![statistics-cm](https://user-images.githubusercontent.com/117361449/227301933-bd51b41f-c712-4fac-b82d-a3df101f5e85.png)


## Use a custom metric in root cause analysis (RCA)

Custom metrics that return values on case level, can be used in RCA either as a main metric or in the influenced by section. Supported custom metrics are any returning numerical, time or boolean value and metrics returning string values with less than 50 unique values for the data used in RCA.

Custom metrics can be also created in RCA settings screen by selecting (**...**) next to the selection of main metric.

:::image type="content" alt-text="screenshot of custom metrics in RCA." source="media/custom-metrics.png":::
![rca-cm](https://user-images.githubusercontent.com/117361449/227302474-b96dd27c-6fb3-4b01-8c12-a9965d525b52.png)


