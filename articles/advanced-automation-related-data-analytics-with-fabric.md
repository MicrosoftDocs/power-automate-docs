---
title: Automation-related data analytics with the Dataverse - Fabric integration
description: Learn how to configure Dataverse shortcuts in Microsoft Fabric to build advanced automation-related queries, reports, and alerts at scale. 
ms.topic: conceptual
ms.date: 11/06/2024
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Automation-related data analytics with Fabric

Power Automate provides a comprehensive built-in monitoring and troubleshooting experience that allows organizations to manage their day-to-day operations, view trends, and access recommendations through features like the [Automation Center](/articles/automation-center-overview.md) and [Desktop Flow Activity](/articles/desktop-flows/desktop-flow-activity.md).

However, your organization may have more advanced or custom monitoring, reporting, and analysis needs that aren't covered within the product today. This is one of the key strengths of the Power Platform; through its native integrations with other low-code tooling and platforms, such as Power BI, Microsoft Fabric, as well as with Azure, organizations can develop highly sophisticated, scalable, and compliant analytics solutions using data from Power Automate and many other sources.

## Microsoft Fabric as your analytics platform

[Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) is an end-to-end analytics and data platform designed for enterprises that require a unified solution. It encompasses data movement, processing, ingestion, transformation, real-time event routing, and report building. It offers a unified suite of analytical services including Data Engineering, Data Science, Real-Time Analytics, Data Warehousing with advanced data governance and security control.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png":::

## Dataverse direct link to Microsoft Fabric

The Link to Microsoft Fabric feature built into Power Platform makes all your Dynamics 365, Power Apps and Power Automate data available in [Microsoft OneLake](/fabric/onelake/onelake-overview), the built-in data lake for Microsoft Fabric. Key benefits of the Dataverse direct link:

- No need to export data, build extract, transform, load (ETL) pipelines, or use our partner integration tools.
- With shortcuts from Dataverse directly into OneLake, your data stays in Dataverse while authorized users get to work with data in Fabric.
- Link data from all Dynamics 365 apps, including Dynamics 365 Finance and Operations apps.
- Build Power Apps and automations to drive action from insights in OneLake.

## Get started

In the following guide, we'll walk you through the process of using Dataverse shortcuts within Microsoft Fabric to create powerful data analytics solutions. By the end of this guide, you'll have the foundational skills and architectural understanding needed to build sophisticated data queries, generate insightful reports, design interactive dashboards, and set up proactive alerts to seamlessly monitor your data at scale.

> [!NOTE]
>
> **Disclaimer:** The scenarios, code examples, and data used in this tutorial are fictional, may include errors and intended solely for demonstration purposes. They do not represent product or analysis recommendations.

## Prerequisites

Before you continue, ensure you meet the following prerequisites:

1. Have a basic understanding of data modeling, Power Automate, Dataverse, and the Fabric ecosystem.
2. Have access to a Dataverse environment (in the same region as your Fabric capacity) with a Power Automate premium license, (ideally) existing cloud, and desktop flow runs, and System Administrator role in this environment.
3. Ensure that you meet the [**prerequisites**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#prerequisites) before linking your Dataverse environment with Fabric.
4. Follow [**these steps**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#link-to-microsoft-fabric) to link your Dataverse environment with Microsoft Fabric. After the environment has been linked, you will see a Lakehouse, a semantic model, and an SQL analytics endpoint. These are prefixed with "dataverse," followed by your environment name and a unique environment suffix, such as ` dataverse_contosousap_cds2_workspace_unq111111111111111111111111`.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png" alt-text="Screenshot of Fabric workspace showing a Dataverse-related lakehouse and other artifacts." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png":::
5. If you plan to follow the advanced section for [Desktop flow action log-level analytics](#desktop-flow-action-log-level-analytics), ensure that [**Desktop Flow Logs V2**](/articles/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in that environment and you have existing desktop flow runs.

## List of tables are automation-related

The following table includes automation-related tables that are frequently used for reporting and observability use cases.

| Display name | Object name       |   Purpose                                             |
|--------------------|------------------|-------------------------------------------------------|
| [Process](/power-apps/developer/data-platform/reference/entities/workflow) | workflow         | Contains desktop flows and solution-based cloud flows (along with other workflow types). |
| [Flow Session](/power-apps/developer/data-platform/reference/entities/flowsession) | flowsession | Contains desktop flow run-related data such as start, durations, status, machine, robot account, parent flow context etc.     |
| [Flow Run](/power-apps/developer/data-platform/reference/entities/flowrun) | flowrun  | Contains cloud flow run-related data such start, end, duration, parent flow context etc. |
| [Flow Log](/power-apps/developer/data-platform/reference/entities/flowlog) | flowrun  | Contains cloud flow run-related data such start, end, duration, parent flow context etc. |
| [Flow Machine](/power-apps/developer/data-platform/reference/entities/flowmachine) | flowmachine  | Contains machine and hosted machine-related info. |
| [Flow Machine Group](/power-apps/developer/data-platform/reference/entities/flowmachinegroup) | flowmachinegroup | Contains machine group and hosted machine group-related info.  |
| [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue) | workqueue  | Represents an instance of a workflow execution.  |
| [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueueitem)  | workqueueitem  | Contains information about each run of a workflow.|
| [User](/power-apps/developer/data-platform/reference/entities/systemuser)   | systemuser | Represents an instance of a workflow execution. |

### Simplified table relationship diagram

The image includes only relations to tables that are included above and automation-relevant.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png":::

## Creating automation-related queries

### Performance-related query examples

### Governance-related query examples

## Creating reports in Fabric

### Creating real-time alerts

## Persisting telemetry data in a Fabric Warehouse

### Creating a Dataflow Gen2 to ingest data to a warehouse

### Desktop flow action log-level analytics

> [!NOTE]
>
> Before you continue with this section, ensure that [**Desktop Flow Logs V2**](/articles/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in your environment and that you have existing desktop flow runs.

## Closing
