---
title: Ingest files from Fabric OneLake (preview)
description: Learn how to store and read event log files directly from Fabric OneLake.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 01/17/2025
ms.custom: bap-template
ms.author: michalrosik
ms.reviewer: angieandrews
---

# Ingest files from Fabric OneLake (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Power Automate Process Mining gives you the option to store and read event log data files directly from [Fabric OneLake](/fabric/onelake/onelake-overview) via [Fabric Lakehouse](/fabric/data-engineering/lakehouse-overview). This feature simplifies extract, transform, load (ETL) management by connecting directly to your OneLake.

[!INCLUDE [data-lake-storage](./includes/data-lake-storage.md)]

> [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

- A Fabric workspace that's different from the default **My workspace**.
- The **Admin** role must be attributed to the user performing the initial workspace setup for the environment for the other users in the same environment.
- The Fabric workspace needs to be shared to the **Process Insight Prod service principal with an Admin role**. To register the Process Insights Prod service principal, follow the steps in [Install Azure tools](/power-automate/process-mining-pbi-workspace#install-azure-tools).

  :::image type="content" source="media/process-mining-files-fabric-onelake/one-lake-sp.png" alt-text="Screenshot of the Fabric workspace settings with sharing to Process Insights service principal.":::

- A Fabric Lakehouse must be created in this workspace with the data in supported formats located in the **Files** folder of the Lakehouse.

    :::image type="content" source="media/process-mining-files-fabric-onelake/lakehouse-file-folder.png" alt-text="Screenshot of the Lakehouse File folder.":::

> [!IMPORTANT]
> The following items aren't currently supported:
> - Fabric Lakehouses with Schema support enabled.
> - Delta tables in Lakehouse.

## Connect to Fabric OneLake

1. On the navigation pane to the left, select **Process mining** > **Start here**.
1. In the **Process name** field, enter a name for your process.
1. Under the **Data source** heading, select **Import data** > **OneLake (preview)** > **Continue**.

    :::image type="content" source="media/process-mining-files-fabric-onelake/create-process.png" alt-text="Screenshot of the 'Create a new process' step.":::

1. Select an optional Power BI workspace or select **Skip**.
1. On the **Connection setup** screen, select your **Fabric Workspace** from the dropdown menu. This populates the **Lakehouse** dropdown menu. From the menu, select the lakehouse that contains your data files and select **Next**.

1. Browse the **Lakehouse** folder structure and select the file or folder containing the event log data.

    You can either select a single file or a folder with multiple files. All files must have the same headers and format.
1. Select **Next**.
1. On the **Map your data** screen, map your data to the required schema.

    :::image type="content" source="media/process-mining-files-fabric-onelake/map.png" alt-text="Screenshot of the Map your data screen.":::

1. Complete the connection by selecting **Save and Analyze**.

## Define incremental data refresh settings

You can refresh a process ingested from Fabric OneLake on a schedule, either through a full or incremental refresh. Though there are no retention policies, you can ingest data incrementally using one of the following methods:

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
 
