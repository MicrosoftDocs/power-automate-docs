---
title: Create a Process from Normalized Schema
description: Create a Process Mining process using normalized schema ingestion in Power Automate. Discover how to import event logs with a JSON config and map attributes easily.
#customer intent: As a process analyst, I want to start a new process from a normalized schema config file, so that I can ingest event logs that are already laid out across multiple tables.
ms.date: 06/03/2026
author: rosikm
ms.author: michalrosik
ms.reviewer: angieandrews
ms.topic: how-to
---

# Create process using normalized schema ingestion

This guide walks you through importing event data laid out as a **star schema** (one Event table + optional Case table + lookup tables) into Power Automate Process Mining, from the UX side. For details about authoring the JSON config that drives the ingestion, see the companion article *[Ingest event logs from a normalized schema](process-mining-normalized-import-authoring-guide.md)*.

---

## Before you begin

Make sure you have:

- A Power Automate environment where Process Mining is enabled, and a user account with rights to create processes in it.
- Respective pre-requisites are met:
  - **OneLake:** learn more about them in [Ingest data from Fabric OneLake](process-mining-files-fabric-onelake#prerequisites)
  - **ADLS Gen2:** learn more about them in [Bring your own Azure Data Lake Storage Gen2](process-mining-byo-azure-data-lake#prerequisites) or [Bring your own network isolated Azure Data Lake Storage Gen2](process-mining-byo-azure-data-lake-private#prerequisites)
- Your event data is already published as tables/files in one of the supported sources:
  - **OneLake / Microsoft Fabric** — a lakehouse with managed Delta tables, or loose Parquet/CSV files under the `Files/` area.
  - **Azure Data Lake Storage Gen2** — a container with CSV, Parquet, or Delta-Parquet folders.
- A **JSON config file** describing your tables and how they map to Process Mining attributes. See the [authoring guide](process-mining-normalized-import-authoring-guide.md) for how to write it

  The JSON also carries the storage backend details (workspace/lakehouse IDs for OneLake, or subscription/resource group/storage account/container for ADLS Gen2). You don't pick the backend in the UI — it's read from the JSON.

---

## 1. Open Process Mining and start a new process

1. Go to [make.powerautomate.com](https://make.powerautomate.com) and sign in.
1. Choose your environment from the environment picker (top right).
1. In the left navigation, select **Process mining**.
1. On the Process mining home page, select **+ Start from blank**.

The **New Process** dialog opens.

---

## 2. Fill in the New Process dialog

In the **New Process** dialog

:::image type="content" source="media/process-mining-normalized-import-ux-guide/normalized-schema-new-process.png" alt-text="Screenshot of New Process dialog with Case ID process mining and Normalized schema data source selected.":::

1. **Process type** — select **Case ID process mining**. 

1. **Data source** — choose **Normalized schema (preview)**.

   As soon as you pick this option, the dialog shows a **Choose normalized schema config file** field with a **Browse** button.

1. **Choose normalized schema config file** — select **Browse** and pick the `.json` file you authored. Only the JSON file is required here — the storage backend, the file format, the dataset paths and the attribute roles all come from inside it.

1. **Process name** — give the process a clear, identifying name. 

1. **Description** *(optional)* — short context about what this process tracks.

1. Select **Continue**.

The service parses the JSON and runs the normalized-schema validator end-to-end before continuing. This takes a few seconds.

If the JSON fails to load, fix the JSON locally, browse the corrected file again, and select **Continue**. The full validation checklist is in the [authoring guide](process-mining-normalized-import-authoring-guide.md#10-validation-checklist).

---

## 3. Review and adjust the attribute mapping

When the JSON passes validation, the **Mapping** screen opens. It's pre-populated from your JSON — every entry in `miningMetadata.ImportConfiguration.Attributes` becomes a row here, already paired with its physical column (either a direct column or one surfaced through a join's `ExportName`).

Use this screen to **review and adjust** the mapping.

If you spot something that can't be fixed here, cancel out, fix the JSON, and restart from Step 1.

---

## 4. Save and analyze

When the mapping looks right, select **Save and analyze**.

For deeper detail on any field or error, jump to the corresponding section of the [authoring guide](process-mining-normalized-import-authoring-guide.md).
