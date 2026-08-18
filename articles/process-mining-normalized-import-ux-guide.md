---
title: Create a process from normalized schema
description: Create a Process Mining process using normalized schema ingestion in Power Automate. Discover how to import event logs with a JSON config and map attributes easily.
#customer intent: As a process analyst, I want to start a new process from a normalized schema config file, so that I can ingest event logs that are already laid out across multiple tables.
ms.date: 08/17/2026
author: rosikm
ms.author: michalrosik
ms.reviewer: angieandrews
ms.topic: how-to
ai-usage: ai-assisted
---

# Create a process from normalized schema

This article walks you through importing event data laid out as a **star schema** (one Event table + optional Case table + lookup tables) into Power Automate Process Mining, from the UX side. You can find details about authoring the JSON configuration that drives the ingestion in [Normalized schema JSON authoring](process-mining-normalized-import-authoring-guide.md).

## Prerequisites

Make sure you have:

- A Power Automate environment where Process Mining is enabled, and a user account with rights to create processes in it.
- Respective prerequisites are met:
  - **OneLake**: Learn more in [Ingest data from Fabric OneLake](process-mining-files-fabric-onelake.md#prerequisites)
  - **ADLS Gen2**: Learn more in [Bring your own Azure Data Lake Storage Gen2](process-mining-byo-azure-data-lake.md#prerequisites) or [Bring your own network isolated Azure Data Lake Storage Gen2](process-mining-byo-azure-data-lake-private.md#prerequisites)
- Your event data is already published as tables or files in one of the supported sources:
  - **OneLake / Microsoft Fabric**: A lakehouse with managed Delta tables, or loose Parquet or CSV files under the `Files/` area.
  - **Azure Data Lake Storage Gen2**: A container with CSV, Parquet, or Delta-Parquet folders.
- A **JSON config file** describing your tables and how they map to Process Mining attributes. Learn how to write it in [authoring guide](process-mining-normalized-import-authoring-guide.md).

  The JSON also carries the storage backend details (workspace/lakehouse IDs for OneLake, or subscription/resource group/storage account/container for ADLS Gen2). You don't pick the backend in the UI&mdash;it's read from the JSON.

## Step 1: Open Process Mining and start a new process

1. Go to [make.powerautomate.com](https://make.powerautomate.com) and sign in.
1. Choose your environment from the environment picker (top right).
1. In the left navigation, select **Process mining**.
1. On the Process mining home page, select **+ Start from blank**.

The **New Process** dialog opens.

## Step 2: Fill in the New Process dialog

Perform the steps in this section in the **New Process** window.

:::image type="content" source="media/process-mining-normalized-import-ux-guide/normalized-schema-new-process.png" alt-text="Screenshot of New Process dialog with Case ID process mining and Normalized schema data source selected.":::

1. **Process type**: Select **Case ID process mining**. 
1. **Data source**: Select **Normalized schema (preview)**.

   As soon as you select this option, the dialog shows a **Choose normalized schema config file** field with a **Browse** button.

1. **Choose normalized schema config file**: Select **Browse** and select the `.json` file you authored. Only the JSON file is required here&mdash;the storage backend, the file format, the dataset paths, and the attribute roles all come from inside it.
1. **Process name**: Give the process a clear, identifying name.
1. (Optional) **Description**: Short context about what this process tracks.
1. Select **Continue**.

The service parses the JSON and runs the normalized-schema validator end-to-end before continuing. This step takes a few seconds.

If the JSON fails to load, fix the JSON locally, browse the corrected file again, and select **Continue**. The full validation checklist is in [Normalized schema JSON authoring](process-mining-normalized-import-authoring-guide.md#validation-checklist).

## Step 3: Review and adjust the attribute mapping

When the JSON passes validation, the **Mapping** screen opens. It's prepopulated from your JSON&mdash;every entry in `miningMetadata.ImportConfiguration.Attributes` becomes a row here, already paired with its physical column (either a direct column or one surfaced through a join's `ExportName`).

Use this screen to **review and adjust** the mapping.

If you find something that you can't fix here, cancel out, fix the JSON, and restart from [Step 1: Open Process Mining and start a new process](#step-1-open-process-mining-and-start-a-new-process).

## Step 4: Save and analyze

When the mapping looks correct, select **Save and analyze**.

Get details on a field or error in the corresponding section of [Normalized schema JSON authoring](process-mining-normalized-import-authoring-guide.md).
