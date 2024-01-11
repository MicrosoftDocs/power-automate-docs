---
title: Use the optimized data structure in a Power BI report (preview)
description: Learn how to use the optimized data structure and leverage the attributes and custom metrics created in the desktop app in a Power BI report.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 01/09/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Use the optimized data structure in a Power BI report (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

The new optimized data structure leads to faster and more memory efficient analysis of processes. By saving on memory, customers can analyze larger processes and save on costs by using smaller Power BI capacities to perform analysis.

In addition, a more intuitive Power BI model data structure is used, which allows customers to dig deeper into their insights with less time and effort. To learn more about this data model, go to the [Power BI data model structure](#power-bi-data-model-structure) section this article.

> [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Previous optimized structure to deprecate soon

The new optimized data structure will replace the previous structure completely and the previous data structure will be deprecated. To find out the date and necessary steps, go to the banner in the process details page.

<**MICHAL: I think this message is important enough to make the note its own section and expand on it.**
**ANGIE: I thought the visual difference that the !IMPORTANT section makes will make it pop up more than just a new section. But I am ok with this one as well.

- **Does it make sense to say when first paragraph will take place here, or is it necessary for users to go the Details page?**
  ANGIE: yes
- **If they must go to the Details page, let's give the steps on how to get there, or link to them if they already exist in the docs.**
  ANGIE: I don't think this is really necessary - this is a special thing and people doing this know the Details page, we have the same approach in other parts of the documentation
- **Please confirm: Deprecation hasn't happened yet, but users can use this structure now.**
  ANGIE: correct
- **How can users tell the difference between the old structure and new structure?**
  ANGIE: it is happening on the background, so they will see it only in the resulting model as described below>
  

## Enable XMLA read/write setting

To use the optimized data structure, the XMLA endpoint property must be enabled for read-write. The write connection allows you to apply changes to the dataset, for example, adding calculation groups or object-level security to the Power BI dataset. **<MICHAL: Please confirm accuracy of my new sentence.>**

By default, Premium capacity or Premium Per User semantic model workloads have the XMLA endpoint property setting enabled for read-only.

   > [!IMPORTANT]
   > Enabling XMLA can only be done by the capacity admin.

### To enable read-write for a Premium capacity semantic model workload:

1. **<MICHAL: Where is the starting point? Desktop? I want to test this but don't know where to begin. ANGIE: the starting point is in the web.>**
1. Select **Settings** > **Admin portal**.
1. In the Admin portal, select **Capacity settings** > **Power BI Premium** > *capacity name*.
1. Expand **Workloads**.
1. In the **XMLA Endpoint** setting, select **Read Write**.

    The XMLA Endpoint setting applies to all workspaces and semantic models assigned to the capacity.

    :::image type="content" source="media/process-mining-pbi-data-structure/XMLAEndpoint.svg" alt-text="Screenshot of the XMLA endpoint settings.":::

### To enable read-write for a Premium Per User semantic model workload:

1. Select **Settings** > **Admin portal**.
1. In the Admin portal, select **Premium Per User**.
1. Expand **Semantic model workload** settings.
1. In the **XMLA Endpoint** setting, select **Read Write**.

### Enable using the optimized data structure

For all new processes that use a custom workspace, the optimized data structure is set to **true** by default. To enable it or confirm it is enabled, perform the following steps:

1. Go to the process details page and select **Edit**.

    :::image type="content" source="media/process-mining-pbi-data-structure/Enable1.svg" alt-text="Screenshot of the Settings panel."::: 

1. Select a custom workspace by selecting the dropdown menu under the **Power Bi Workspace (optional)** field.
1. Confirm that the **Use optimized data structure** toggle is **On**. If it's off, select the toggle to enable it.

    :::image type="content" source="media/process-mining-pbi-data-structure/Enable3.svg" alt-text="Screenshot of the Settings panel.":::

1. To save the changes, select **Save** if the button is enabled.

    If it's not enabled, that means the value of the **Use optimized data structure** field was already set to **On**, thus you can skip this step.

## Power BI data model structure

When a process is published to Power BI, a default data source and a corresponding report are created. The following screenshot is an example of the structure of the dataset in the published data source in Power BI.

:::image type="content" source="media/process-mining-pbi-data-structure/DataModel2.svg" alt-text="Diagram of Optimized data model.":::

### Relationships

Relationships necessary for filtering and interconnectivity of visuals are pre-defined in the published data model. There isn't a need to manually create additional relationships unless other data sources are connected. For this scenario, use the Power BI composite data model and build relationships on top of that model.

### Data model summary

From a logical perspective the data model consists of many entity subsets as depicted in the first paragraph of this section.

- **Process Data** – all process related data without filtering and calculated measures.
- **View Data** – entities giving the process data into the context of the created process analytical view – applied filters, calculated measures, and custom metrics.
- **Visuals data** – entities providing pre-calculated data necessary for process mining custom visuals to display.
- **Helping entities** – other entities needed by Power BI.

Following is the brief description of the subsets and included entities.

#### Process Data

The content of process data entities changes in specific scenarios.

- When process model data is refreshed.
- When a new view is created.

Working with these entities allows you to access the raw process data not influenced by the applied filters.

|Entity|Description|
|------|-----------|
|Cases|List of all cases in the process. Each case contains a unique case identifier index, Case ID display, and values for each of the *case attributes*, as defined in the mapping setup step.|
|Events|List of all events in the process. Each event references a case into which it belongs using `Case_ID`, has a unique event identifier index, and values for each of the *event attributes*, as defined in the mapping setup step.|
|AttributesMetadata|Entity holds the definition of all case/event-level attributes as defined in the import of event log data into process model. It includes its datatype, attribute type, and attribute level being either case or event.|
|MiningAttributeLabels|Holds values of available mining attributes. A process view can be set up to look at the process from different perspective based on the selected mining attribute. If no other mining attribute is available, the entity holds the values of `Activity` attribute.|
|CustomMetricsMetadata|Includes the definition of custom metrics created in the Process Mining desktop app. Based on the context in which the metric is available, many entries might exist for the same custom metric, having a different `Type`. It also includes the custom metric result data type that can be used for conversion or formatting of the values.|
|Views|List of available (published) views created in the Power Automate desktop app. Only public process views are published to the data set. Entries can be used to filter report / report page / visual **(MICHAL: what do the slashes indicate?)** to visualize only data from the specific process view.|

#### View Data

The content of view data entities changes in the following scenarios.

- When a user changes the filtering definition in any process view.
- When a new custom metric is created.

View data entities allows you to access process data influenced by the applied filters and accesses the measures calculated based on the applied filters. As both case and event level filters can be used in the definition of a process view, it is recommended to work with view data entities, as the influence on the resulting dataset might be significant.

|Entity|Description|
|------|-----------|
|ViewCases|Entity holds information on which cases are included in which view. In addition, it includes the information for which variant the case is following and pre-calculated measures for the case. If a case is included in several views, the entity holds a record for each case-view combination. This is important, as some of the values of calculated case measures depend on the filtering criteria set in the view. It also holds any pre-calculated custom metric values (if defined in process context and valid on case level). The case record is uniquely identified by the **Index** column.|
|ViewEvents|Entity holds information on which events are included in which view and which case they are connected to (event level process view filters might modify the events included in the case). In addition, it includes pre-calculated measures for the event. If an event is included in several views, the entity holds a record for each event-view combination. This is important, as some of the values of calculated event measures depend on the filtering criteria set in the view. It also holds any pre-calculated custom metric values (if defined in process context and valid on event level). The event record is uniquely identified by the **Index** column.|
|ViewTransitions|Entity holds information on which transitions are included in which view. In addition, it includes pre-calculated measures for the transition. If a transition is included in several views, the entity holds a record for each transition-view combination. This is important, as some of the values of calculated transition measures depend on the filtering criteria set in the view. It also holds any pre-calculated custom metric values (if defined in process context and valid on transition / edge level). The transition record is uniquely identified by the **Index** column. |
|ViewParallelTransitions|Entity holds a record for a combination of transition and case, when that transition is considered parallel in that case in a particular view.|
|Variants|Entity holds the relations between variants and process views. A record is included if a particular variant is included in a view after the filtering criteria are taken into account.|

#### Visuals data

Visuals data entities are recalculated only when there is a data refresh for the process model.

|Entity|Description|
|------|-----------|
|ProcessMapMetrics|Aggregated measures for all nodes and transitions in the process model that are needed for visualization in process map custom visual.|
|VariantDNA|Aggregated measures and relations to events and attributes that are needed for visualization in variant DNA custom visual.|

#### Other entities

|Entity|Description|
|------|-----------|
|LocalizationTable|Internal table used for localization purpose.|
|LocalizationMeasures|Internal measures used for localization purpose.|
|ReportMeasures|Pre-created and pre-formatted most frequent measures that can be used for summary KPIs in the process report. Their evaluation might be subject to filtering and interactive selection in Power BI report.|

## Power BI composite data model

We recommend that you use the Power BI composite data model on top of the data model published by Power Automate Process Mining and create necessary modifications there for the following scenarios.

- When additional data sources are needed.
- When additional entities should be created.
- When additional relationships are needed.
- When custom DAX queries are needed.

To learn more about creating Power BI composite data models, go to [Use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models).


