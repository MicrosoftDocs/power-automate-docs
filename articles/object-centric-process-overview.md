---
title: OCPM process overview (preview)
description: Learn how to analyze process in object-centric process mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 11/03/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# OCPM process overview (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

This article describes the key elements of the **Process Overview** page generated after ingesting an object-centric event log (OCEL). The page provides a high-level visualization and analysis of the end-to-end process based on objects such as purchase orders, requisitions, quotations, goods receipts, invoices, payments, and materials.

:::image type="content" source="media/object-centric-ingest-event-log/object-centric-process-overview.png" alt-text="Screenshot of the 'Process overview' tab.":::

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Page header

The header section contains the following elements:

- **Process Name and Path**: Shows the name of the process and navigation breadcrumbs.
- **Refresh Data**: Button to reload and refresh the displayed analytics with the most recent data (this action triggers the full ingestion and creation of the process model).
- **Last Updated Timestamp**: Indicates when the data was last processed and updated.

## Tabs and filter bar

The tabs and filter bar contain the following elements:

- **Process Overview (Preview)**: Denotes that the current tab is showing the overview of the process.

    In the preview of this feature, only the **Process overview** tab is available.

- **View Selector**: Allows switching between different saved process views.

    In the preview of this feature, only the **Default** view is available.

- **Add Filter / Clear Filters**: Options to refine the analysis by applying filters.
- All visuals in the Process overview react to the selected filter criteria. Learn more on  [available filters and their usage](object-centric-filters.md).

## Process map (left section)

The Process Map is a central visualization showing the process flow across multiple objects:

- **Nodes (Activities)**: Represent process steps such as creating purchase requisition, order approval, issuing goods receipt, invoice creation, and payment execution. Some activities, so called *object touchpoints* are related to more than one object type. They're depicted with several object type touch points on the left side of the node.

  :::image type="content" source="media/object-centric-process-overview/object-centric-activity-node.png" alt-text="Screenshot of the detail of an activity.":::

- **Edges (Relations)**: Show dependencies between activities and the control flow per object type (for example, Create purchase order leading to an Approve purchase order). The edges are color coded per object type.

  :::image type="content" source="media/object-centric-process-overview/object-centric-edge.png" alt-text="Screenshot of the detail of an edge.":::

- **Color Coding by Object Type**: Each object type is represented with a distinct color, for example.
- **Object Creation/Disposal nodes**: Artificially added nodes that show the start and end of the object type existence or involvement in the process.

  :::image type="content" source="media/object-centric-process-overview/object-centric-object-create-dispose.png" alt-text="Screenshot of the detail of a creation and disposal node.":::

- **Labels on Activities and Edges**: Indicate the selected metric value of edge or activity, for example, how many times a certain activity occurred in the process. Color coding per object type is used to identify the relation of the metric to a specific object type.

  :::image type="content" source="media/object-centric-process-overview/object-centric-activity-node.png" alt-text="Screenshot of the detail of an activity with frequency metrics displayed.":::

The toolbar in the bottom left corner of the process map allows you to:

- **Zoom the map in and out**: You can use a mouse scroll wheel or touchpad two finger swipe to do the same.
- **Fit the map to screen**.
- **Toggle a minimap**: Helpful to navigate better in complex maps with high zoom level.

### Process map customization

Selecting the **Settings** icon in the top right corner of the process map visual opens a panel, where you can modify the map configuration.

:::image type="content" source="media/object-centric-process-overview/object-centric-process-map-settings.png" alt-text="Screenshot of the Settings panel of a Process Map visual.":::

- **Selected metric**: Allows you to change the metric visualized at the activities and edges.
- **Activities settings** slider: Allows you to increase or decrease the complexity of the process map by showing or hiding the activity nodes based on their frequency in the process.
- **Paths settings** slider: Allows you to increase or decrease the complexity of the process map by showing or hiding the edges based on their frequency in the process.

Activities and paths can be configured using a common slider, which is valid for all object types in the map, or using **detailed set of sliders**, which allows you to set individual settings per object type. You can access these by selecting the left pointing arrow icon next to **Activities settings** and **Paths settings**.

The process map shows the backbone of the process by default, meaning that both the**Activities settings** and **Paths settings** sliders are set to minimum.

:::image type="content" source="media/object-centric-process-overview/object-centric-process-map-settings-expanded.png" alt-text="Screenshot of the detail view of Settings panel of a Process Map visual with detailed sliders.":::

To confirm the configuration, select **Apply**.

## Objects count (top-right panel)

Objects Count is a donut chart that summarizes the distribution of all objects in the event log.

- **Total Objects**: Displays the total number of objects.
- **Breakdown by Type**: Percentage and absolute count (via tooltip) for each object type.
  
This helps to identify which object types dominate the process.

## Process analysis (right panel)

Process analysis provides detailed statistical analysis based on the leading object and an optional path:

- **Leading object**: Defines which object type is used as the main reference point = from the viewpoint of which object a process execution is identified (for example, purchase order).
- **Process executions**: Total number of end-to-end process instances from a viewpoint of a leading object.

> [!IMPORTANT]
> A *process execution* is defined as a subgraph in interrelated objects using an algorithm that starts from a single instance of a leading object and recursively looks at other objects related in multi-object-type events. The recursion is stopped when either another instance of a leading object type is identified, or another instance of already investigated object type is identified and the distance from the leading object type instance is longer than the previously identified one.
  
- **Duration metrics**:
  - Minimum duration
  - Mean duration
  - Maximum duration

The widget gives insight into process cycle time variability.

### Process analysis customization

To customize process analysis, select **Settings** in the top right corner of the widget. A panel opens where you can configure the widget.

:::image type="content" source="media/object-centric-process-overview/object-centric-process-analysis-settings.png" alt-text="Screenshot of the Settings panel of a Process Analysis widget.":::

- **Leading object** allows you to select a different object type for process analysis perspective (process execution identification)
- Selecting the **Add path** button allows you to define specific **From** and **To** activities in the process. For each, you need to define if you want to analyze the **first** or **last occurrence** of that activity.
  
    > [!IMPORTANT]
    > If a path is added, the duration metrics show the throughput time between those activities. If a path isn't added, the duration metrics depict the throughput time for whole process executions.

- To focus back on the complete process execution, select **Remove path**.

To confirm the configuration, select **Apply**.

## Average object duration (right panel)

*Average object duration* is a bar chart that shows the average time each object type remains active in the process.

- Highlights object types that persist longest in the process lifecycle.
- Bar chart is ordered by average duration descending.
- Useful for identifying long-lived objects that might introduce bottlenecks.

## Average duration of edges (bottom-right panel)

*Average duration of edges* shows the average time taken between connected activities (edges in the process map).

- Indicates delays between dependent process steps.
- Uses object type color coding and is ordered by average duration descending.
- Helps pinpoint inefficiencies and potential improvement opportunities.
