---
title: Process map overview (preview)
description: Learn how to use a process map for process mining in the minit desktop application in process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Process map overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

A process map represents the behavior of a process captured in data by means of activities and directed edges.

The displayed process map corresponds with the mining result of the process. It reflects filter settings above the data, and the chosen frequency or time metrics. When you apply filters, mining is performed again, metrics are recalculated, and a new process map is generated.

## Process map nodes

Process map activities/nodes represent a unique activity (or unique values of different selected mining attributes) performed/executed/passed through in the process.

Frequency metric, time metric or finance metric can be displayed for nodes/activities; the system can only display one metric at a time.

The size and color of the highlight (halo effect) expresses the total proportion of the (frequency, time) metric in question in relation to the other nodes in the process map.

:::image type="content" alt-text="Screenshot of process map activities/nodes." source="media/image001-7.png":::

## Process map edges

Chart edges represent transitions between individual events and describe the sequence of activities in the process. A transition between events means that they directly follow one after the other. The thickness of the edge and the number displayed next to it depend on the selected display metric (frequency, time, finance) and its value.

:::image type="content" alt-text="Screenshot of process map edges." source="media/image002-8.png":::

## Start and end node

All nodes/activities starting process instances are connected to the start node. All nodes/activities ending process instances are connected to the end node. These nodes don't represent process nodes/activities, but the input and output points of the process under analysis. Their purpose is to facilitate the identification of the start and end nodes/activities of the process. The display of these nodes and edges related to them can be turned off in the Process Map Display Settings panel.

:::image type="content" alt-text="Screenshot of start and end nodes." source="media/image003-6.png":::


## Start and end identifier

Chart nodes/activities starting and ending process instances contain colored indicators in the right part of the node. The green indicator represents the initial activity (upper right), the red indicator represents the final activity (bottom right) of the process. A node/activity occurs as each start and end in process instances contains both indicators.

:::image type="content" alt-text="Screenshot of start and end identifiers." source="media/image004-4.png":::

## Process map basic view

When you open a project view for the first time, a process map with the default view parameters will be displayed. The structure of the process map and the displayed information vary, depending on your view settings. The default process map typically contains the backbone of the process. It displays the most frequent activities and the most dominant edges. The basic view also includes the start and end nodes.

## Node details

If you select a node, detailed information about the activity is shown.

### Frequency

This section contains the frequency information about a process activity.

### Performance

This section contains information about the duration of an event/activity compared to the entire process under analysis. For example, you can find out the total time or average duration of the activity.

### Rework

This section contains various metrics about activity repetitions within the cases. For example, you can find out how many times the activity has been repeated or how many times the activity was followed by a repeated activity.

### Financial analysis

This section contains finance information about a process activity. For example, you can find out the total costs/incomes about process activity, average values, costs/incomes about the case, etc.

### Custom metrics

This section contains information about the custom metrics. More details can be found on this sub-page [Custom metrics](custom-metrics.md).

### Business rules

This section contains information about the business rules. More details can be found on this sub-page [Business rules](business-rules.md).

### Top attributes

This section provides an overview of the most frequent attributes in the event. If there are more attributes available in the process, you can also add displayed information to the other attributes. In the sample picture, the occurrence of the Resource attribute is shown indicating which five resources have carried out the activity most often.

:::image type="content" alt-text="Screenshot of the most frequent attributes in the event." source="media/image005-v47.png":::

### Advanced panel

To display the advanced panel for a node, select **Advanced Panel** button. This panel displays a list of previous or subsequent activities with a selected attribute and an optional number of attribute values. On this panel, you can only display the attributes that were marked as case-level attributes during the process import. To switch to the list of previous or next activities, select **Predecessor/Successor** button on the top of the panel.

:::image type="content" alt-text="Screenshot of the Advanced details panel." source="media/image006-v47.png":::

## Edge details

If you select an edge, detailed information about the transition is shown.

### Frequency

This section contains the frequency information about an edge/transition in the process.

### Performance

This section contains information about the duration of the transition compared to the entire process under analysis. The duration of the transition represents the waiting time between the end of the previous event and the beginning of the next event.

### Rework

This section contains various metrics about the edge repetitions within cases. For example, you can find out how often the edge/transition is repeated in comparison to the total edge occurrences. You can also compare how many times the starting and ending activities of the edge were repeated.

### Financial analysis

This section contains the information about the costs/incomes of the whole case, given the case-level finance attribute.

### Custom metrics

This section contains information about the custom metrics. More details can be found on this sub-page [Custom metrics](custom-metrics.md).

### Top attributes

This section provides an overview of the most frequently occurring attributes within the given event. If there are multiple attributes within a process, you can add displaying of the information to other attributes as well. Only attributes that were marked as case-level attributes during the process import can be added among the top attributes of this panel. The number of displayed values of the selected attributes is optional.

:::image type="content" alt-text="Screenshot of the most frequently occurring attributes within the given event." source="media/image007-v47.png":::

### Advanced panel

To display the advanced panel for an edge, select **Advanced Panel**. This panel displays the starting and ending activities of the edge with the selected attribute and an optional number of attribute values. On this panel, you can view any attribute imported with the process.

:::image type="content" alt-text="Screenshot of the Advanced panel for an edge." source="media/image008-v47.png":::

### Favorites panel

The user may select the most relevant parameters for work and display them by using the **Favorites** panel. More details can be found on this sub-page [Favorites panel](favorites-panel.md).

## Process map settings

To open the process map settings, select the button on the right side of the screen.

:::image type="content" alt-text="Screenshot of the process map Settings icon." source="media/customizeicon.png":::

All map settings will be accessible when you extend the panel on the right.

:::image type="content" alt-text="Screenshot of the Customize panel." source="media/CustomizedPanel-v54.png":::

A process map can be converted and exported into a BPMN 2.0 compliant format that allows you to work with the map in any standard BPMN modeling tool.

A process or social map can also be exported as:

- PNG image

- XML file containing a list of activities and edges (for processing in any 3rd party tools)

## Change the view of the process

The first setting can be used to choose between the process map or the social graph. Switching between these views will cause mining in the process to start over.

## Process map

Process map provides a view of the activities performed in the process and their sessions.

:::image type="content" alt-text="Screenshot of the process map view." source="media/image011-2.png":::

### Mining attribute selection

By default, the process map is displayed based on the Activity attribute, which is a standard mining attribute - so we can observe the process flow between the executed activities. If the user wants to see how the process flows between values of a different (event level) attribute (for example, Resource, but not in social chart layout; Regions; Departments; Plants; Materials; etc.) a **Mining Attribute Selection** is available just above the slider section of the Customize panel.

:::image type="content" alt-text="Screenshot of the mining attribute selections." source="media/Process-Map-selection.png":::

Mining Attribute Selections shows only relevant event log attributes and by selecting a different attribute, the process map is recalculated including the available metrics used in frequency, performance, finance, or rework analysis.

:::image type="content" alt-text="Screenshot of the process map with the mining attribute selections." source="media/Process-Map.png":::

The selection of the mining attribute has an impact on the process map view and included metrics, but it does not influence the other process view screens, which are still calculated using the Activity attribute.

Variant analysis screen is, however, available also for other mining attributes - but a separate selection must be used (please see section [Variant Mining Attribute](variants.md#variant-mining-attribute) for more details)

### Activities

Use this slider to determine the number of activities to be shown on the process map. It changes the complexity of the process map based on the importance of the activities performed in the process.

### Paths

Use this slider to determine the number of transitions shown on the process map. It changes the amount of detail in the process view with regards to links between activities found in the process.

You can filter displayed edges/transitions using the edge slider. It defines the range of edge metric values which are shown to the user, hiding unimportant edges/transitions. This control doesn't affect the data set but helps to focus on the most relevant aspects of the process map transitions.

:::image type="content" alt-text="Screenshot of the number of transitions on the process map." source="media/image026-v45.png":::

## Map clustering

Map clustering enables the user to visually encapsulate activities in the process map view (or resource in the social chart view) into clusters – nodes are grouped and laid out close to each other and visually bordered by blue dashed rectangles based on the value of the selected clustering attribute.

:::image type="content" alt-text="Screenshot of map clustering." source="media/image024-1.png":::

To cluster the process map/social chart, select the clustering attribute from those available in the Map clustering selection control.

:::image type="content" alt-text="Screenshot of clustering attributes." source="media/image025-1.png":::

Map clustering attribute selection control is populated automatically by Minit. The available attributes must fulfill the following premises:

- In **process map** – each value of the attribute Activity must have exactly one corresponding value of the clustering attribute (it can also be an empty value – in this case, the activity is placed on canvas outside of any cluster); for example, Approval must have always value Management in clustering attribute, PO archival must always have value Accounting, etc.

- In **social chart** – each value of the attribute Resource must have exactly one corresponding value of the clustering attribute (it can also be an empty value – in this case, the resource is placed on canvas outside of any cluster); for example, John Doe must always have the value CostCenter1 in the clustering attribute, Mary Jane must always have the value CostCenter34, etc.

In other words – a specific activity or resource can be included only in one cluster, or outside of any cluster.

The clusters are collapsible/expandable so that you can simplify the process map by hiding the activities/resources in the cluster. To do this, select the blue icon with two arrows in the top right corner of the cluster border. To expand the cluster, select the two arrows icon on the cluster (which is highlighted in blue color).

:::image type="content" alt-text="Screenshot of collapsing/expanding clusters." source="media/image028-v45.png":::

It is also possible to collapse/expand all clusters at the same time using the **Collapse All/Expand All** options in the clustering context menu.

:::image type="content" alt-text="Screenshot of the options in the dropdown menu for clusters." source="media/expandall.png":::

## Hierarchical Process Maps

Hierarchical Process Maps feature uses clustering technique to enable the user to visually encapsulate activities in clusters and groups them into further clusters in the process map view (or resource in the social chart view) – nodes are grouped and laid out close to each other and are visually bordered by blue dashed rectangles based on the value of the selected clustering attributes.

Hierarchical Process Maps allow the user to drill-down into a hierarchy of clusters, analyze aggregated data for individual hierarchy levels and focus only on relevant process parts, even in very complex unstructured processes. Functionality can be used with added value in RPA initiatives to drill down into either UI recording combined with high level IS event logs as well as in bot monitoring scenarios to drill down into bot execution, This is however not the only usage, organizational structure mining, hardware infrastructure, and software system structure are other use cases to name a few.

:::image type="content" alt-text="Screenshot of the hierarchical process map." source="media/hierarchymap.png":::

For further information please visit [Hierarchical Process Maps](hierarchical-process-mining.md) section of this help.

## Process map advanced settings

The following properties can be set in the advanced settings of the process map:

- Display start and end nodes, and edges related to them.

- Store the backbone activities on the same line on the process map.

- Map orientation: Top to bottom or left to right.

- Highlight the activities that go before and after the activity being presently monitored.

:::image type="content" alt-text="Screenshot of advanced settings." source="media/image012-2.png":::

## Social chart

The social chart shows the important parts and parameters of your process through links and dependencies between resources involved in the process.

### Social chart advanced settings

The following properties can be set in the advanced settings of the social graph:

- Display start and end nodes and edges related to them.

- Highlight resources connected to the resource currently monitored.

:::image type="content" alt-text="Screenshot of properties in advanced settings." source="media/image013-2-v56.png":::

### Switch chart layout

Use the switch to switch chart layout according to different algorithms. The option to switch chart layout is especially important for large and complex charts and to make process analysis easier. The layouts are designed to display social graphs with a large number of nodes and edges.

:::image type="content" alt-text="Screenshot of the chart layout buttons." source="media/SocialChartOptions.png":::

The following screenshots show examples of how the same chart is displayed in different layouts.

#### Circular layout

:::image type="content" alt-text="Screenshot of the circular layout." source="media/image015-2.png":::

#### Spring layout

:::image type="content" alt-text="Screenshot of the spring layout." source="media/image016-1.png":::

### Resources

Use this slider to determine the number of resources to be shown in the social chart. It changes the complexity of the chart based on the importance of the resources entering the process.

### Connections

Use this slider to determine the number of connections to be shown in the social graph.

## Viewing frequency, performance, rework or finance

The **Frequency / Performance / Rework / Finance/Custom metrics/Business rules** switch can be used to toggle how information is visualized on the process map or social graph.

:::image type="content" alt-text="Screenshot of view icons." source="media/image027-v52.png":::

#### Frequency

When it is switched to **Frequency**, the map shows frequency information representing how many activities and edges the process contains.

#### Total count

The total frequency of an activity/edge captured in the process data.

#### Total count (%)

The ratio between the frequency of an activity/edge captured in the process data and the total frequency of the events.

#### Case count

The number of process instances in which an activity/edge occurred.

#### Case count (%)

The ratio between the number of process instances in which an activity/edge occurred and the total number of process instances in the event log.

#### Maximum occurrence in case

The maximum number of times an activity/edge is repeated in one process instance.

:::image type="content" alt-text="Screenshot of the dropdown menu for the maximum occurrence in a case." source="media/image018-v52.png":::

## Performance

When you switch to **Performance**, the map shows information about the performance (duration) of the activities and edges. Then you can choose which types of performance-related (duration) information are displayed on the map.

### Total duration

The total duration of an activity/edge captured in the data. Value can also be displayed as a ratio (percentage) between the total duration of an activity/edge captured in the data and the total duration of all cases.

### Mean duration

Mean duration of an activity/edge captured in the data. Value can also be displayed as a ratio (percentage) between the mean duration of an activity/edge captured in the data and the mean case duration.

### Maximum duration

Maximum duration of an activity/edge captured in the data.

### Minimum duration

Minimum duration of an activity/edge captured in the data.

:::image type="content" alt-text="Screenshot of the dropdown menu for the minimum duration of an activity or edge captured in the data." source="media/image019-v52.png":::

## Rework

When you switch to **Rework**, the map shows the information about the rework metrics. To learn more, go to [Rework metrics](rework-metrics.md).

:::image type="content" alt-text="Screenshot of the Rework icon." source="media/image029-v52.png":::

## Financial analysis

When you switch to **Financial analysis**, the map shows information about the finance (costs/incomes) of the activities and whole cases. If you have defined several finance attributes, you can select the requested finance attribute in the drop-down. Then you can choose which types of finance-related (costs/incomes) information are displayed on the map.

### Total

Total costs/incomes of an activity/case captured in the data. Value can also be displayed as a ratio (percentage) between the total costs/incomes of a case captured in the data and the total costs/incomes of all cases in the event log (available for "per case" financial attributes).

### Mean

Mean costs/incomes of an activity/case captured in the data.

### Maximum

Maximum costs/incomes of an activity/case captured in the data.

### Minimum

Minimum costs/incomes of an activity/case captured in the data.

:::image type="content" alt-text="Screenshot of the dropdown menu for the minimum costs or incomes of an activity or case captured in the data." source="media/image020-v52.png":::

## Custom metrics

When you switch to **Custom metrics**, the map shows the information about the custom metrics. To learn more, go to [Custom metrics](custom-metrics.md).

:::image type="content" alt-text="Screenshot of the Custom metrics icon." source="media/image030-v52.png":::

## Business rules

When you switch to **Business rules**, the map shows the information about the business rules. go to [Business rules](business-rules.md).

:::image type="content" alt-text="Screenshot of the Business rules icon." source="media/image031-v52.png":::

## Settings panel legend

In the bottom part of the Settings panel, there's a graphical legend that represents information about frequency, time, and financial values. It shows the color highlight (halo effect) of the activities and the thickness and color of the edges.

:::image type="content" alt-text="Screenshot of the Settings panel legend." source="media/image021-v45.png":::

## Visualization settings for the process map or social graph

In the map settings, you can use the Map preview for faster orientation in the map. Use **Zoom** to zoom in and out of the map view and its elements. Under **Spacing**, you can use sliders to set the horizontal or vertical spacing of nodes to make the map easier to read. The **Reset** button restores the original values of vertical and horizontal spacing.

## Variant panel

The Variant panel contains a list of variants created during the process reconstruction. Variants can be arranged according to the number of process instances they group or by the number of events in case of variants. By selecting each variant in the list, the sequence of one or more variants in the process or social map will be highlighted. The selected variants can be filtered immediately on the filter screen by selecting the filter icon.

When selecting one or more variants to the right of the indicator of the current volume of process instances and events, a coverage indicator of the process instances by the selected variants is displayed at the bottom of the screen. If the complexity of the process map was reduced with the scrolling elements, not all process activities or edges are shown, the number of not shown activities and edges of the selected variants is displayed in the lower right corner.

:::image type="content" alt-text="Screenshot of the Variant panel." source="media/image-12.png":::

## View settings

To define various settings valid only for the current view, the user can open the View settings panel using the icon on bottom-left corner. More details can be found on this sub-page [View settings](view-settings.md).

