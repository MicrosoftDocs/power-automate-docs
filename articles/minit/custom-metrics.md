---
title: Custom metrics (preview)
description:
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

# Custom metrics (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Custom Metrics (Calculated Metrics) module allows you to use pre-defined metrics in the application, different aggregations, mathematical, datetime, string and other operations and functions and constants in a formula editor to define your own custom metrics. It is then possible to visualize them for example in the process map or according to their context in other parts of the application in a similar way as the static ones.

These metrics are defined by the users in the context of the current process and of course they can be used and evaluated only if they are valid in the particular context.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Definition

Definition of the custom metric can be done from the **Process Context** window available from the **Project hub**, using the process context menu. Another option is to use the context menu in the Customize panel directly in the Process Map view - see **Applying to Process Map** section below. To access the window, please click the ... icon next to the process name and select the item **Process Context** and tab **Custom Metrics**.

:::image type="content" alt-text="media/image-28.png" source="media/image-28.png":::

The window shows the list of custom metrics and their properties defined in the context of this process. If there is no metric defined yet, you are encouraged to create one by clicking the **Create New Custom Metric** button. Context menu for each metric allows you to **Delete** the item, **Enable/Disable** the metric or **Create a duplicate** of that metric, modify and save it with a different name.

Write your formula in the **Metric formula:** field. The editor offers full syntax editing features including:

- **Syntax highlighting**

- **Intellisense** with function overload hints

- Formula **validation** - syntax errors, datatype issues

- Resulting metrics **data type identification**

:::image type="content" alt-text="media/image-29.png" source="media/image-29.png":::

Custom metrics can be used in the Process map, Filters and Statistics. Click on the metric type icons to see further details to verify the applicability of the expression for various Minit functions. [Click here](requirements-for-application.md) to learn more about the requirements for using custom metrics for various purposes.

:::image type="content" alt-text="media/CM-Editor-Indication-v54.png" source="media/CM-Editor-Indication-v54.png":::

## Applying to Process Map

Custom metrics can be accessed and applied to process map view from the **Customize** panel, by selecting the Custom metric option in the metrics visualization switch and then selecting the desired metrics from the available dropdowns. The top dropdown is used for selecting the custom metric on the activities and the bottom one for edges. The link icon in-between will lock the metric for activities and edges to show the same metric for both elements by selecting it from a single dropdown.

:::image type="content" alt-text="media/CustomMetricsSelection-v56.png" source="media/CustomMetricsSelection-v56.png":::

Context menu available next to the dropdown offers a shortcut to add a new custom metric to process context or edit the formula of the currently selected metric.

The process map visualization will accommodate to the selected metric based on the context and datatype and show the calculated values.

:::image type="content" alt-text="media/5-v56.png" source="media/5-v56.png":::

## Applying to Filters

You can use custom metrics for all types of filters except for Timeframe, Edge (conditional), and Variants. To enter a custom metrics formula, select the filter setting you want to define (e.g. *holds any of the values*), and go to the Expression tab. Select the appropriate operator (e.g. *Equal to*) and click on the **fx** button to enter a custom metrics formula in the expression field. The editor supports syntax highlighting, intellisense, and formula validation. Once you enter a valid formula, click on the checkmark button to apply.

:::image type="content" alt-text="media/filter.png" source="media/filter.png":::

The formula will become visible directly in the filter settings you have just defined.

:::image type="content" alt-text="media/filter1.png" source="media/filter1.png":::

For the Metrics filter type, you can also apply custom metrics stored in the Process context or create a new one. To select existing custom metrics, use the metric drop-down menu. Custom metrics are available at the end of the list.

:::image type="content" alt-text="media/filter3.png" source="media/filter3.png":::

To create a new one, click on ... next to the metric drop-down list and select Add. This opens the standard custom metrics editor (see above). You can also edit and delete existing custom metrics here.

:::image type="content" alt-text="media/filter2.png" source="media/filter2.png":::

## Usage in Statistics

Once a custom value or case type metric is defined in the Process map, it also becomes available in Statistics as a new column and can be also visualized in the graph.

:::image type="content" alt-text="media/image-60.png" source="media/image-60.png":::

## Usage in RCA

Custom metrics that return values on case level, can be used in RCA either as a main metric or in the influenced by section. Supported custom metrics are any returning numerical, time or boolean value and metrics returning string values with less than 50 unique values for the data used in RCA.
Custom metrics can be also created in RCA settings screen by clicking on the three dots next to the selection of main metric.

:::image type="content" alt-text="media/custom-metrics.png" source="media/custom-metrics.png":::


