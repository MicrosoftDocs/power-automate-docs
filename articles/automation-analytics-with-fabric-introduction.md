---
title: Automation-centric data analytics with the Dataverse - Fabric integration
description: Learn how to configure Dataverse shortcuts in Microsoft Fabric to build advanced automation-related queries, reports, and alerts at scale. 
ms.topic: conceptual
ms.date: 12/19/2024
ms.author: appapaio
ms.reviewer: dmartens
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Automation-centric data analytics with Fabric

Power Automate offers built-in monitoring and troubleshooting to help organizations manage operations, view trends, and access recommendations through features like the [Automation Center](automation-center-overview.md) and [Desktop Flow Activity](desktop-flows/desktop-flow-activity.md).

However, your organization likely has more advanced or custom monitoring, reporting, and analysis needs that aren't covered within the product today. One key strength of the Power Platform is its native integrations with other low-code tools and platforms like Power BI, Microsoft Fabric, and Azure. Organizations can develop sophisticated, scalable, and compliant analytics solutions using data from Power Automate and other sources.

## Microsoft Fabric as your analytics platform

[Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) is an end-to-end analytics and data platform designed for enterprises that require a unified solution. It encompasses data movement, processing, ingestion, transformation, real-time event routing, and report building. It offers a unified suite of analytical services, including data engineering, data science, real-time analytics, and data warehousing with advanced data governance and security control.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png" alt-text="Infographic showing different components of the Fabric data platform." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png":::

## Dataverse direct link to Microsoft Fabric

The Link to Microsoft Fabric feature built into Power Platform makes all your Dynamics 365, Power Apps and Power Automate data available in [Microsoft OneLake](/fabric/onelake/onelake-overview), the built-in data lake for Microsoft Fabric. Key benefits of the Dataverse direct link:

- No need to export data, build extract, transform, load (ETL) pipelines, or use our partner integration tools.
- With shortcuts from Dataverse directly into OneLake, your data stays in Dataverse while authorized users get to work with data in Fabric.
- Link data from all Dynamics 365 apps, including Dynamics 365 Finance and Operations apps.
- Build Power Apps and automations to drive action from insights in OneLake.

## Get started

This guide explains how to use Dataverse shortcuts within Microsoft Fabric to create powerful data analytics solutions. By the end of this guide, you have the skills to understand automation-centric data models, and build sophisticated data queries to generate insightful reports.

> [!NOTE]
>
> According to [this documentation](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric), it can take up to **60 minutes** to update data in OneLake, including the conversion to delta parquet format. If you select a table that contains a lot of data, the initial load time can take longer. When you open Fabric lakehouse, the links appear as **unidentified** until the initial sync is completed. More information: [Troubleshooting common issues](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#troubleshooting-common-issues)

## Prerequisites

Before you continue, ensure you meet the following prerequisites:

1. Understand data modeling, Power Automate, Dataverse, and the Fabric ecosystem.
1. Have access to a Dataverse environment (in the same region as your Fabric capacity) with a Power Automate premium license, (ideally) existing cloud, and desktop flow runs, and System Administrator role in this environment.
1. Ensure that you meet the [**prerequisites**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#prerequisites) before linking your Dataverse environment with Fabric.
1. Follow [**these steps**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#link-to-microsoft-fabric) to link your Dataverse environment with Microsoft Fabric. After linking the environment, you see a Lakehouse, a semantic model, and a SQL analytics endpoint. These items are prefixed with "Dataverse," followed by your environment name and a unique environment suffix, such as `dataverse_contosousap_cds2_workspace_unq111111111111111111111111`.

    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png" alt-text="Screenshot of Fabric workspace showing a Dataverse-related lakehouse and other artifacts." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png":::

1. (Optional) Select Lakehouse settings and rename your Lakehouse to a meaningful name, such as "contoso_westus_accounts_payable," and provide a brief description. This change helps others quickly identify the specific automations and data processed in the Lakehouse.

    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png" alt-text="Screenshot of the Fabric interface with details such as name, description, location, and ownership of a lakehouse." lightbox="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png":::

1. (Optional) Link other Dataverse environments within the same geographical region to Fabric to create cross-environment analytics solutions.
1. (Optional) If you plan to follow the advanced section for [Desktop flow action log-level analytics](automation-analytics-with-fabric-queries.md#governance-related-query-examples-for-v2-action-logs), ensure that [**Desktop Flow Logs V2**](/power-automate/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) is enabled in that environment and you have existing desktop flow runs.

## What's next

> [!div class="nextstepaction"]
> [Create automation-related queries with Fabric](automation-analytics-with-fabric-queries.md)
