---
title: Use Optimized data structure in Power BI report
description: Learn how to use the optimized data structure and leverage the attributes and custom metrics created in desktop app in Power BI report.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 12/20/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Use Optimized data structure in Power BI report

## Why New Optimized Data Structure

The new optimized data structure leads to faster and more memory efficient analysis of processes. By saving on memory, customers can analyze larger processes as well as save on costs by using smaller Power BI capacities to perform analysis. 
As well as this, a more intuitive Power BI Model Data Structure has been utilized allowing customers to dig deeper into their insights with less time and effort. This new data model is described in more detail in the [Power Bi Data Model Structure](#power-bi-data-model-structure) section below. 

   > [!IMPORTANT]
   > New optimized data structure will replace the previous structure completely and the previous data structure will be deprecated. Visit process details page, where a warning banner will inform you of the date and necessary steps.
 
## Requirements 

### Enable XMLA Read/Write setting.
By default, Premium capacity or Premium Per User semantic model workloads have the XMLA endpoint property setting enabled for read-only. To use the optimized data structure the XMLA Endpoint property must be enabled for read-write. 

   > [!IMPORTANT]
   > Enabling XMLA can only be done by the capacity admin.

To enable read-write for a *Premium capacity*
1.	Select **Settings** > **Admin portal**.
2.	In the Admin portal, select **Capacity settings** > **Power BI Premium** > capacity name.
3.	Expand **Workloads**. In the **XMLA Endpoint** setting, select **Read Write**. The XMLA Endpoint setting applies to *all workspaces and semantic models* assigned to the capacity.

:::image type="content" source="media/process-mining-pbi-data-structure/XMLAEndpoint.png" alt-text="Screenshot of the XMLA endpoint settings.":::

To enable read-write for *Premium Per User*
1.	Select **Settings** > **Admin portal**.
2.	In the Admin portal, select **Premium Per User**.
3.	Expand **Semantic model workload** settings. In the **XMLA Endpoint** setting, select **Read Write**.

### Enable using Optimized Data Structure
By default, for all new processes that use a custom workspace, the optimized data structure is set true. To enable it or confirm it is enabled, perform the following steps:
1. Go to the process details page and click the **Edit** button (highlighted in red in the image below)

:::image type="content" source="media/process-mining-pbi-data-structure/Enable1.png" alt-text="Screenshot of the Settings panel."::: 

2. Select a custom workspace by clicking the dropdown under the **Power Bi Workspace (optional)** field if you have not done so already.
3. Confirm that the **Use optimized data structure** field (highlighted in red in the image below) is enabled to **On**. If not, click the toggle to enable the **Use optimized data structure** field.

:::image type="content" source="media/process-mining-pbi-data-structure/Enable3.png" alt-text="Screenshot of the Settings panel.":::
 
4. Save the changes by pressing the **Save** button if enabled. If the save button is not enabled that means the value of the **Use optimized data structure** field was already set to **On**, thus you can skip this step.
 
## Power Bi Data Model Structure
By default, when a process is published to Power Bi, a default data source and a corresponding report is created. The structure of the dataset in the published data source in Power Bi looks as following:

:::image type="content" source="media/process-mining-pbi-data-structure/DataModel.png" alt-text="Diagram of Optimized data model.":::
 
### Relationships
All relationships necessary for filtering and interconnectivity of visuals are pre-defined in the published data model. There is no need to manually create any additional relationships unless other data sources are connected – for this scenario, use the Power BI composite data model and build any relationships on top of that model.

### Data Model Summary
From a logical perspective the data model consists of several entity subsets as depicted in the picture above:
1.	**Process Data** – all process related data without filtering and calculated measures.
2.	**View Data** – entities giving the process data into the context of the created process analytical view – applied filters, calculated measures, and custom metrics.
3.	**Visuals data** – entities providing pre-calculated data necessary for process mining custom visuals to display.
4.	**Helping entities** – other entities needed by Power BI.

Below is the brief description of the subsets and included entities.

#### Process Data
Content of process data entities changes only in few specific scenarios:
1.	When process model data is refreshed
2.	When a new view is created
Working with these entities allows you to access the “raw” process data not influenced by the applied filters.

|Entity|Description|
|------|-----------|
|Cases|List of all cases in the process. Each case contains a unique case identifier index, Case ID display, and values for each of the **case attributes** (as defined in the mapping setup step)|
|Events|List of all events in the process. Each event references a case into which it belongs using Case_ID, has a unique event identifier Index, and values for each of the **event attributes** (as defined in the mapping setup step).|
|AttributesMetadata|Entity holds the definition of all case/event-level attributes as defined in the import of event log data into process model. It includes its datatype, attribute type and attribute level being either case or event.|
|MiningAttributeLabels|Holds values of all available mining attributes. A process view can be set up to look at the process from different perspective (based on the selected mining attribute). If no other mining attribute is available, the entity holds the values of Activity attribute.|
|CustomMetricsMetadata|Includes definition of all available custom metrics created in the Desktop application. Based on the context in which the metric is available, several entries might exist for the same custom metric, having a different Type. It also includes custom metric result data type that can be used for conversion or formatting of the values.|
|Views|List of all available (published) views created in Desktop application. Only public process views are published to the data set. Entries can be used to filter report / report page / visual to visualize only data from the specific process view.|

#### View Data

Content of view data entities changes in scenarios when:
1.	User changes the filtering definition in any process view
2.	When a new custom metric is created

View data entities allow you to access process data influenced by the applied filters and access the measures calculated based on the applied filters. As both case and event level filters can be used in the definition of a process view, it is recommended to work with View data entities as the influence on the resulting dataset might be significant.

|Entity|Description|
|------|-----------|
|ViewCases|Entity holds information on which cases are included in which view. On top of that, it includes the information which variant is the case following as well as pre-calculated measures for the case. If a case is included in several views, the entity holds a record for each case-view combination. This is important as some of the values of calculated case measures depend on the filtering criteria set in the view. It also holds any pre-calculated **custom metric values (if defined in process context and valid on case level)**. The case record is uniquely identified by column Index.|
|ViewEvents|Entity holds information on which events are included in which view and which case they are connected to (event level process view filters might modify the events included in the case). On top of that, it includes pre-calculated measures for the event. If an event is included in several views, the entity holds a record for each event-view combination. This is important as some of the values of calculated event measures depend on the filtering criteria set in the view. It also holds any pre-calculated **custom metric values (if defined in process context and valid on event level)**. The event record is uniquely identified by column Index.|
|ViewTransitions|Entity holds information on which transitions are included in which view. On top of that, it includes pre-calculated measures for the transition. If a transition is included in several views, the entity holds a record for each transition-view combination. This is important as some of the values of calculated transition measures depend on the filtering criteria set in the view. It also holds any pre-calculated **custom metric values (if defined in process context and valid on transition / edge level)**. The transition record is uniquely identified by column Index. |
|ViewParallelTransitions|Entity holds a record for a combination of transition and case, when that transition is considered parallel in that case in a particular view.|
|Variants|Entity holds the relations between variants and process views. A record is included if a particular variant is included in a view after the filtering criteria are taken into account.|

#### Visuals Data

Visuals data entities are recalculated only when there is a data refresh for the process model.

|Entity|Description|
|------|-----------|
|ProcessMapMetrics|Aggregated measures for all nodes and transitions in the process model, that are needed for visualization in process map custom visual.|
|VariantDNA|Aggregated measures and relations to events and attributes, that are needed for visualization in variant DNA custom visual.|

#### Other entities

|Entity|Description|
|------|-----------|
|LocalizationTable|Internal table used for localization purpose.|
|LocalizationMeasures|Internal table used for localization purpose.|
|ReportMeasures|Pre-created and pre-formatted most frequent measures that can be used for summary KPIs in the process report. Their evaluation might be subject to filtering and interactive selection in Power BI report.|



## Power BI composite data model
In a scenario where:
- Additional data sources are needed,
- Additional entities should be created,
- Additional relationships are needed,
- Custom DAX queries are needed.

It is strongly recommended to use Power BI composite data model on top of the data model published by Power Automate Process Mining and create all necessary modifications there. ([learn more about creating Power BI composite data models](/power-bi/transform-model/desktop-composite-models))
