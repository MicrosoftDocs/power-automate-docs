---
title: Export OCPM Semantic Model to Fabric Workspace (preview)
description: Learn how to export object-centric process mining (OCPM) data into a Fabric workspace and build powerful Power BI reports on DirectLake semantic model.
#customer intent: As a business analyst, I want to understand the predefined relationships in the OCPM semantic model, so that I can use them correctly when building visuals.
ms.date: 05/15/2026
author: rosikm
ms.author: michalrosik
ms.topic: article
ms.service: power-automate
ms.subservice: process-advisor
search.audienceType:
- enduser
---

# Export OCPM semantic model into Fabric workspace (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

The new optimized DirectLake semantic model leads to faster and more memory-efficient analysis of processes and is now available also for object centric processes.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Semantic model description

When a process is published to Fabric workspace, it creates a new Directlake semantic model and an empty Power BI report connected to the semantic model. The semantic model is created on top of Fabric Lakehouse delta tables.

The following screenshot is an example of a semantic model structure published to Fabric.

:::image type="content" source="media/object-centric-semantic-model/ocpm-semantic-model.png" alt-text="Screenshot of OCPM Directlake semantic model structure." lightbox="media/object-centric-semantic-model/ocpm-semantic-model.png":::

### Column naming

Naming of semantic model columns corresponds to the naming of the columns in your ingested dataset, including spaces and other special characters. The naming is subject to Power BI semantic model limitations. The limitations of naming in the Fabric Lakehouse delta tables, however, are larger (for example, spaces aren't allowed) and thus, Power Automate Process Mining does validation and sanitization before the export to Fabric workspace is triggered.

Allowed characters include:

- ```a-z``` → lowercase English letters
- ```A-Z``` → uppercase English letters
- ```0-9``` → digits
- ```_``` → underscore

All other characters are replaced with underscore (_) as part of the sanitization process.

This might result in rare situations where export isn't successful, as the ingested data source includes two columns that result in identical names after sanitization&mdash;**Customer_Name** and **Customer Name**. The export will be interrupted and user will be notified with specific error message.

Lakehouse delta table columns therefore use the sanitized column names, whereas semantic model columns use the original column names.

### Relationships

Relationships necessary for filtering and interconnectivity of visuals are predefined in the published data model. There isn't a need to manually create more relationships unless other data sources are connected. For such as scenario, use the Power BI composite semantic model and build relationships on top of that model.

As visible in the model, some realtionships are hidden - this is due to the limitations of smenatic models, where only a single relationship between the same two tables can be active. It is however possible to use the inactive relationships, if needed, using the corresponding DAX functions. 

### Data model summary

From a logical perspective, the data model consists of

- **Object and Event Data**: Data related to objects and events
- **Visuals data**: Data related to summarizing items derived from objects and events, usually used for visualization purposes
- **Process execution data**: Data related to identified process executions (process instances) based on a leading object

Following is the brief description of the subsets and included entities.

#### Object and Event Data

The content of process data entities changes when process model data is refreshed.

Working with these entities allows you to:

- Access the raw process data
- Access the measures calculated based on the process data

| Entity               | Description                                                  |
|----------------------|--------------------------------------------------------------|
| Object Types         | List of all types of objects in the process.                 |
| Objects              | List of all objects in the process with reference to object type, lifecycle of the object and relevant object level attributes as additional columns (when ingested). |
| Events               | Entity holds list of all events in the process with reference to particular node in the `Nodes` table and ingested event level attributes as additional columns. |
| EventObjectRelations | Entity holds all relationships between `Events` and `Objects` “touched” by the execution of an event. |

#### Visuals data

Visuals data entities are recalculated only when there's a data refresh for the process model. They include items derived from the raw data by process mining algorithms and serve usually visualization purposes.

| Entity            | Description                                                  |
|-------------------|--------------------------------------------------------------|
| Mining Attributes | Holds values of available mining attributes - perspectives to look at the objects. By default the entity holds the values of `Activity` attribute. |
| Edges             | Entity holds all edges identified between nodes with reference to particular object, nodes and including the relevant calculated measures. |
| Nodes             | Entity holds all nodes with reference to specific object and including the relevant claculated measures. |

#### Process execution data

Process execution data entities are calculated as process instances of interconnected objects based on a leading object type.

| Entity                  | Description                                                  |
|-------------------------|--------------------------------------------------------------|
| ProcessExecutions       | List of process executions, given a leading object type including throughput time of the whole execution and start and end time of the process execution instance. |
| ProcessExecutionObjects | Object referenced by a particular process execution.         |

## Power BI composite model

We recommend that you use the Power BI composite model on top of the semantic model published by Power Automate Process Mining and create the necessary modifications there for these scenarios:

- You need to create more data sources
- You need to create more entities
- You need to create more relationships
- You need to create more custom DAX (Data Analysis Expressions) queries

> [!IMPORTANT]
> The semantic model is created in DirectLake access mode, but its option is set to **Automatic**. This setting means that using nonoptimal DAX queries or incorrectly setting a composite model might result in fallback to DirectQuery mode. This means that your report doesn't break, but you might experience lower performance.

To learn more about creating Power BI composite data models on top of DirectLake semantic models, go to: [Building a composite models on a semantic model or model](/power-bi/transform-model/desktop-composite-models#building-a-composite-model-on-a-semantic-model-or-model).

## Semantic model refresh

By default, the semantic model provided by Power Automate Process Mining automatically kept up to date.

For large datasets, data refresh of underlying tables in OneLake might take longer. This can cause potential inconsistencies in the report. Although there's eventual consistency at the end of data refresh (semantic model is explicitly refreshed), you might want to remove the potential intermediate inconsistencies by turning off **Keep your Direct Lake data up to date** flag in the **Settings** screen of the semantic model.

Before you update this screen, you need to take ownership of the semantic model by selecting **Take over** at the top of the **Settings** screen.

:::image type="content" source="media/process-mining-fabric-semantic-model/FabricSemanticModelSettings.png" alt-text="Screenshot of the 'Take over' button and Keep your Direct Lake data up to date option in the semantic model Settings screen.":::
