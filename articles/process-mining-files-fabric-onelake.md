---
title: Ingest data from Fabric OneLake
description: Learn how to store and read event log data directly from Fabric OneLake.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/25/2025
ms.custom: bap-template
ms.author: michalrosik
ms.reviewer: angieandrews
---

# Ingest data from Fabric OneLake

Power Automate Process Mining gives you the option to store and read event log data directly from [Fabric OneLake](/fabric/onelake/onelake-overview) through [Fabric Lakehouse](/fabric/data-engineering/lakehouse-overview). This feature simplifies extract, transform, load (ETL) management by connecting directly to your OneLake.

[!INCLUDE [data-lake-storage](./includes/data-lake-storage.md)]

## Prerequisites

- Ensure that [Users can access data stored in OneLake with apps external to the Fabric](/fabric/admin/service-admin-portal-onelake#users-can-access-data-stored-in-onelake-with-apps-external-to-fabric) option is switched on in the OneLake tenant settings.
- A Fabric workspace that's different from the default **My workspace**.
- The **Admin** role must be attributed to the user performing the initial workspace setup for the environment for the other users in the same environment.
- The Fabric workspace needs to be shared to the Process Insight Prod service principal with an **Admin** role. To register the Process Insights Prod service principal, follow the steps in [Install Azure tools](/power-automate/process-mining-pbi-workspace#install-azure-tools).

  :::image type="content" source="media/process-mining-files-fabric-onelake/one-lake-sp.png" alt-text="Screenshot of the Fabric workspace settings with sharing to Process Insights service principal.":::

- A Fabric Lakehouse must be created in this workspace with the data in supported formats.

> [!IMPORTANT]
> The following item isn't currently supported: Fabric Lakehouses with Schema support enabled.

- CSV data in your Lakehouse should meet the following CSV file format requirements:
    - **Compression type**: None
    - **Column delimiter**: Comma (,)
    - **Row delimiter**: Default and encoding. For example, Default (\r,\n, or \r\n)

    :::image type="content" source="media/process-mining-byo-azure-data-lake/csv.png" alt-text="Screenshot of the File format settings screen.":::

- All data must be in final event log format and meet the requirements listed in [Data requirements](process-mining-processes-and-data.md#data-requirements). Data should be ready to be mapped to the process mining schema. No data transformation is available post ingestion.
- The size (width) of the header row is currently limited to 1 MB.

> [!IMPORTANT]
> Ensure that the time stamp represented in your CSV file follows the ISO 8601 standard format (for example, `YYYY-MM-DD HH:MM:SS.sss` or `YYYY-MM-DDTHH:MM:SS.sss`).

## Connect to Fabric OneLake

1. On the navigation pane to the left, select **Process mining** > **Start here**.
1. In the **Process name** field, enter a name for your process.
1. Under the **Data source** heading, select **Import data** > **OneLake** > **Continue**.

    :::image type="content" source="media/process-mining-files-fabric-onelake/create-process-ga.png" alt-text="Screenshot of the 'Create a new process' step.":::

1. Select an optional Power BI workspace or select **Skip**.
1. On the **Connection setup** screen, select your **Fabric Workspace** from the dropdown menu. This populates the **Lakehouse** dropdown menu. From the menu, select the lakehouse that contains your data and select **Next**.
1. Browse the **Lakehouse** folder structure and select the Delta table, file, or folder containing the event log data.

    You can either select a single Delta table, a single file, or a folder with multiple files. All files must have the same headers and format.

1. Select **Next**.
1. On the **Map your data** screen, map your data to the required schema.

    :::image type="content" source="media/process-mining-files-fabric-onelake/map.png" alt-text="Screenshot of the Map your data screen.":::

1. Complete the connection by selecting **Save and Analyze**.

## Define incremental data refresh settings

You can refresh a process ingested from Fabric OneLake on a schedule, either through a full or incremental refresh. Though there are no retention policies, you can ingest data incrementally using one of the following methods:

If you selected a *single Delta table* in the previous section, append more data to the selected table.

If you selected a *single file* in the previous section, append more data to the selected file.

If you selected a *folder* in the previous section, add incremental files to the selected folder.

> [!IMPORTANT]
> When you add incremental files to a selected folder or subfolder, make sure you indicate the increment order by naming files with dates such as **YYYMMDD.csv** or **YYYYMMDDHHMMSS.csv**.

To refresh a process:

1. Go to the **Details** page of the process.
1. Select **Refresh Settings**.
1. On the **Schedule refresh** screen, complete the following steps:

    1. Turn on the **Keep data up to date** toggle switch.
    1. In the **Refresh data every** dropdown lists, select the frequency of the refresh.
    1. In the **Start at** fields, select the date and time of the refresh.
    1. Turn on the **Incremental refresh** toggle switch.
 
