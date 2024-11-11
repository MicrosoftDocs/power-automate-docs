---
title: Automation-centric data analytics with the Dataverse - Fabric integration
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

# Automation-centric data analytics with Fabric

Power Automate provides a comprehensive built-in monitoring and troubleshooting experience that allows organizations to manage their day-to-day operations, view trends, and access recommendations through features like the [Automation Center](automation-center-overview.md) and [Desktop Flow Activity](./desktop-flows/desktop-flow-activity.md).

However, your organization likely has more advanced or custom monitoring, reporting, and analysis needs that aren't covered within the product today. This is one of the key strengths of the Power Platform; through its native integrations with other low-code tooling and platforms, such as Power BI, Microsoft Fabric, as well as with Azure, organizations can develop highly sophisticated, scalable, and compliant analytics solutions using data from Power Automate and many other sources.

## Microsoft Fabric as your analytics platform

[Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) is an end-to-end analytics and data platform designed for enterprises that require a unified solution. It encompasses data movement, processing, ingestion, transformation, real-time event routing, and report building. It offers a unified suite of analytical services including Data Engineering, Data Science, Real-Time Analytics, Data Warehousing with advanced data governance and security control.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png" alt-text="Infographic showing different components of the Fabric data platform." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png":::

## Dataverse direct link to Microsoft Fabric

The Link to Microsoft Fabric feature built into Power Platform makes all your Dynamics 365, Power Apps and Power Automate data available in [Microsoft OneLake](/fabric/onelake/onelake-overview), the built-in data lake for Microsoft Fabric. Key benefits of the Dataverse direct link:

- No need to export data, build extract, transform, load (ETL) pipelines, or use our partner integration tools.
- With shortcuts from Dataverse directly into OneLake, your data stays in Dataverse while authorized users get to work with data in Fabric.
- Link data from all Dynamics 365 apps, including Dynamics 365 Finance and Operations apps.
- Build Power Apps and automations to drive action from insights in OneLake.

## Get started

In this guide, we'll walk you through the process of using Dataverse shortcuts within Microsoft Fabric to create powerful data analytics solutions. By the end of this guide, you'll have the foundational skills and architectural understanding needed to build sophisticated data queries, generate insightful reports, design interactive dashboards, and set up proactive alerts to seamlessly monitor your data at scale.

## Prerequisites

Before you continue, ensure you meet the following prerequisites:

1. Have a basic understanding of data modeling, Power Automate, Dataverse, and the Fabric ecosystem.
2. Have access to a Dataverse environment (in the same region as your Fabric capacity) with a Power Automate premium license, (ideally) existing cloud, and desktop flow runs, and System Administrator role in this environment.
3. Ensure that you meet the [**prerequisites**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#prerequisites) before linking your Dataverse environment with Fabric.
4. Follow [**these steps**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#link-to-microsoft-fabric) to link your Dataverse environment with Microsoft Fabric. After the environment has been linked, you will see a Lakehouse, a semantic model, and an SQL analytics endpoint. These are prefixed with "dataverse," followed by your environment name and a unique environment suffix, such as `dataverse_contosousap_cds2_workspace_unq111111111111111111111111`.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png" alt-text="Screenshot of Fabric workspace showing a Dataverse-related lakehouse and other artifacts." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png":::
5. (Optional) Select Lakehouse settings and rename your Lakehouse to a more meaningful name, such as "contoso_westus_accounts_payable," and provide a brief description. This will help others quickly identify the specific automations and data being processed in the Lakehouse.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png" alt-text="Screenshot of the Fabric interface with details such as name, description, location, and ownership of a lakehouse." lightbox="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png":::
6. (Optional) Link additional Dataverse environments within the same geographical region to Fabric to create cross-environment analytical solutions.
7. (Optional) If you plan to follow the advanced section for [Desktop flow action log-level analytics](automation-analytics-with-fabric-queries.md#governance-related-query-examples-for-v2-action-logs), ensure that [**Desktop Flow Logs V2**](./desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in that environment and you have existing desktop flow runs.

## What's next

> [!div class="nextstepaction"]
> [Crafting automation-related queries with Fabric](automation-analytics-with-fabric-queries.md)

## Learn more

- [Crafting automation-related queries with Fabric](automation-analytics-with-fabric-queries.md)
- [Building custom Power BI reports for data insights in Fabric](automation-analytics-with-fabric-reports.md)
- [Designing an automation-centric Fabric warehouse](automation-analytics-with-fabric-warehouse.md)
- [Setting up real-time alerts with Reflex for proactive monitoring](automation-analytics-with-fabric-alerts.md)
