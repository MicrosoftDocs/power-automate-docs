---
title: Normalized Schema JSON Authoring Guide
description: Author a normalized schema JSON config for Process Mining ingestion. Walk through event, case, and lookup tables with working CSV and Delta examples.
#customer intent: As a data engineer, I want to ingest event data from multiple related tables so that I can use Process Mining without flattening everything into one wide table.
ms.date: 06/03/2026
author: rosikm
ms.author: michalrosik
ms.reviewer: angieandrews
ms.topic: how-to
---

# Authoring guide to a normalized schema ingestion

Power Automate Process Mining can ingest event data that is **not** stored as a single wide table. Instead of asking you to flatten everything in your lakehouse into one CSV, you can point Process Mining directly at a **star schema**: a thin event table plus optional case and lookup tables, linked by foreign keys.

This guide walks you through writing the JSON file that drives that ingestion. It starts with the simplest working example and grows from there.

> [!NOTE]
> Normalized import is **JSON-only today** — there is no in-product editor yet. You author one file and upload it to the service.
>
> If your source is **Fabric**, there is a community widget that gives you a more user-friendly UI for generating the JSON: [Normalized Schema Generator](https://github.com/rosikm/normalized-schema-generator).

---

## Contents

1. [When to use normalized import](#1-when-to-use-normalized-import)
1. [How the JSON is organized](#2-how-the-json-is-organized)
1. [Your first config — minimal CSV example](#3-your-first-config--minimal-csv-example)
1. [Adding a case table](#4-adding-a-case-table)
1. [Adding lookup (dimension) tables](#5-adding-lookup-dimension-tables)
1. [Adding finance metrics and custom attributes](#6-adding-finance-metrics-and-custom-attributes)
1. [Switching the data source — OneLake/Fabric and Delta tables](#7-switching-the-data-source--onelakefabric-and-delta-tables)
1. [Field reference](#8-field-reference)
1. [Enum reference](#9-enum-reference)
1. [Validation checklist](#10-validation-checklist)
1. [Common pitfalls](#11-common-pitfalls)

---

## 1. When to use normalized import

Use **normalized import** when your source data already lives as multiple related tables — for example, Delta tables or files in OneLake/Fabric Lakehouse or files in ADLS Gen2 — and you want Process Mining to read them as-is.

Use the **standard (denormalized) import** (the in-product UI) when you have a single wide CSV export where every event row already carries its case attributes and dimension values.

| Option       | Standard                                           | Normalized                                                 |
|--------------|----------------------------------------------------|------------------------------------------------------------|
| Authoring    | In-product UI                                      | JSON config                                                |
| Layout       | One flat table                                     | Event + (optional) Case + N lookup tables, joined by FK/PK |
| Best for     | Single CSV/Excel exports                           | Lakehouse data (OneLake, Fabric), ADLS Gen2                |
| File formats | CSV, Parquet, Delta-Parquet                        | CSV, Parquet, Delta-Parquet                                |
| Storage cost | Higher (every event repeats case/dimension values) | Lower (dimensions stored once)                             |

The resulting Process Mining model is identical regardless of which import path fed it.

---

## 2. How the JSON is organized

Every normalized config has two cooperating halves wrapped in a single `inputDataBinding`:

```json
{
  "inputDataBinding": {
    "dataSource":      { /* physical layout: where the files live + which columns each table exposes */ },
    "miningMetadata": {
      "ImportConfiguration": { /* logical model: which column plays which role */ }
    }
  }
}
```

- **`dataSource`** answers *"where is the data and what does it look like on disk?"*
  It declares the storage backend (ADLS Gen2 or OneLake), the file format (CSV / Parquet / Delta-Parquet), and a list of **datasets**. Each dataset is one physical table.
- **`miningMetadata.ImportConfiguration.Attributes`** answers *"what does each column mean to Process Mining?"*
  It maps physical columns (or joined columns from lookup tables) to logical roles: case id, activity, start timestamp, end timestamp, resource, finance metric, custom dimension, ...

Every logical attribute name must trace back to a physical column produced by some dataset (either directly in `Columns`, or via a join's `ExportName`). If it doesn't, validation fails before any data is read.

### The three kinds of datasets

Process Mining recognizes exactly three kinds of tables in your star schema:

| `Kind` | Role | How many |
|---|---|---|
| `0` — **Event** | The fact table. One row per event, with timestamps and foreign keys to the other tables. | Exactly **1** required |
| `1` — **Case** | One row per case, carrying case-level attributes (customer, invoice total, segment, …). | At most **1** allowed |
| `2` — **Join** | Lookup/dimension table (activity dictionary, resource directory, …). | Any number |

The next sections build up an example using all three.

---

## 3. Your first config — minimal CSV example

Let's start with the simplest possible normalized config: a single Event table, no joins, stored as CSV in ADLS Gen2. (This intentionally looks a lot like a standard import — once it works, we'll add normalization piece by piece.)

The way you build up the JSON is the **same for Fabric / OneLake sources** — only the `dataSource` connection block and the dataset `Path` values differ. See [Switching the data source — OneLake/Fabric and Delta tables](#7-switching-the-data-source--onelakefabric-and-delta-tables) for those differences.

### The data

`events/events.csv`

```csv
CaseID,Activity,StartTimestamp,EndTimestamp
1001,Create Invoice,2025-01-15T09:00:00,2025-01-15T09:15:00
1001,Review Invoice,2025-01-15T09:20:00,2025-01-15T09:35:00
1001,Approve Invoice,2025-01-15T10:00:00,2025-01-15T10:05:00
1002,Create Invoice,2025-01-15T11:00:00,2025-01-15T11:10:00
```

### The config

```json
{
  "inputDataBinding": {
    "dataSource": {
      "dataSourceSchemaType": 1,        // 1 = Normalized (always for this flow)
      "dataSourceType": 1,              // 1 = ADLS Gen2
      "dataSourceFileType": 0,          // 0 = CSV
      "azureDataLakeConnectionSetupProperties": {
        "subscriptionId":   "11111111-2222-3333-4444-555555555555",
        "resourceGroupName": "rg-process-mining",
        "storageAccountName": "contosopmstorage",
        "containerName":     "process-mining"
      },
      "datasets": [
        {
          "Kind": 0,                    // 0 = Event
          "Name": "Events",
          "Path": "events",             // folder under the container root
          "Columns": [
            { "Name": "CaseID" },
            { "Name": "Activity" },
            { "Name": "StartTimestamp" },
            { "Name": "EndTimestamp" }
          ],
          "Join": null
        }
      ]
    },
    "miningMetadata": {
      "ImportConfiguration": {
        "Attributes": [
          { "Name": "CaseID",         "SourceDataType": "Integer", "ImportType": "Case",     "Level": "Event", "FinanceImportType": "None" },
          { "Name": "Activity",       "SourceDataType": "String",  "ImportType": "Activity", "Level": "Event", "FinanceImportType": "None" },
          { "Name": "StartTimestamp", "SourceDataType": "Date",    "ImportType": "Start",    "Level": "Event", "FinanceImportType": "None" },
          { "Name": "EndTimestamp",   "SourceDataType": "Date",    "ImportType": "End",      "Level": "Event", "FinanceImportType": "None" }
        ]
      }
    }
  }
}
```

### What's going on

- **`dataSourceSchemaType: 1`** tells the service to use the normalized parser. This is always `1` here.
- **`dataSourceType: 1`** + **`azureDataLakeConnectionSetupProperties`** point to a customer-owned ADLS Gen2 container. (We'll switch to OneLake in §7.)
- **`dataSourceFileType: 0`** says these are CSV files.
- The `datasets` array has one entry of `Kind: 0` (Event) at the folder `events/`. Process Mining reads every CSV in that folder (alphabetical order, all files must share the same header).
- `Columns[]` lists every physical column we want to surface to the mining model.
- `Join: null` — the property is required, but here there are no joins yet.
- Each `Attributes[]` entry maps one physical column name to a logical role:
  - exactly **one** column is the `Case` (case id),
  - exactly **one** is the `Activity` (activity name),
  - `Start` and `End` mark the timestamps, and they must live on the Event dataset.

### CSV file requirements

CSV reader options are fixed and cannot be changed from the config:

| Setting | Value |
|---|---|
| Delimiter | comma `,` |
| Quote character | double quote `"` |
| Header row | required — first row is the column header |
| Encoding | auto-detected (UTF-8 with/without BOM, UTF-16 LE/BE, …). UTF-8 recommended. |
| Line endings | CRLF or LF |
| Date format | parsed using the workspace culture |

If a dataset folder holds multiple CSV files (e.g. monthly partitions), they're processed in alphabetical order and **must share the same header**.

---

## 4. Adding a case table

So far every event row had to repeat its case attributes. Let's move case-level data into its own table.

### The data

`events/events.csv`

```csv
CaseID,Activity,StartTimestamp,EndTimestamp
1001,Create Invoice,2025-01-15T09:00:00,2025-01-15T09:15:00
1001,Review Invoice,2025-01-15T09:20:00,2025-01-15T09:35:00
1002,Create Invoice,2025-01-15T11:00:00,2025-01-15T11:10:00
```

`cases/cases.csv`

```csv
CaseID,CustomerSegment
1001,Enterprise
1002,SMB
```

### The config (delta from §3)

Add a second dataset of `Kind: 1` (Case), and add a join from the Event dataset that points at it:

```json
"datasets": [
  {
    "Kind": 0,
    "Name": "Events",
    "Path": "events",
    "Columns": [
      { "Name": "Activity" },
      { "Name": "StartTimestamp" },
      { "Name": "EndTimestamp" }
    ],
    "Join": [
      {
        "SourceColumnName": "CaseID",       // FK on the Event row
        "TargetColumnName": "CaseID",       // PK on the Case row
        "TargetDatasetName": "Cases",
        "JoinKeyType": "Integer"
      }
    ]
  },
  {
    "Kind": 1,                              // Case dataset
    "Name": "Cases",
    "Path": "cases",
    "Columns": [
      { "Name": "CaseID" },
      { "Name": "CustomerSegment" }
    ],
    "Join": null
  }
]
```

And in the attributes list, mark `CustomerSegment` as a case-level attribute:

```json
{ "Name": "CustomerSegment", "SourceDataType": "String", "ImportType": "Other", "Level": "Case", "FinanceImportType": "None" }
```

### Rules to keep in mind

- The `CaseID` column lives on the **Case** dataset (it's the PK there), not on the Event dataset. The Event dataset reaches it through the join.
- A column must not appear in both `Columns` and a `Join.SourceColumnName` of the same dataset — that's why `CaseID` is removed from `Events.Columns` in this version.
- `JoinKeyType` is either `"Integer"` or `"String"`. The physical column type must match.
- Use `Level: "Case"` for attributes that have a single value per case (like `CustomerSegment`). Use `Level: "Event"` for attributes that can vary per row.

---

## 5. Adding lookup (dimension) tables

Now let's normalize `Activity` and `Resource` into their own dictionary tables — the typical lakehouse shape.

### The data

`events/events.csv`

```csv
CaseID,Activity_id,Resource_id,StartTimestamp,EndTimestamp
1001,1,1,2025-01-15T09:00:00,2025-01-15T09:15:00
1001,2,2,2025-01-15T09:20:00,2025-01-15T09:35:00
1001,3,1,2025-01-15T10:00:00,2025-01-15T10:05:00
1002,1,3,2025-01-15T11:00:00,2025-01-15T11:10:00
```

`activity/activity.csv`

```csv
Activity_id,Activity
1,Create Invoice
2,Review Invoice
3,Approve Invoice
```

`resource/resource.csv`

```csv
Resource_id,Resource
1,Alice
2,Bob
3,Carol
```

### The config

Each lookup table becomes a dataset of `Kind: 2` (Join). The Event dataset gets one join per lookup:

```json
"datasets": [
  {
    "Kind": 0,
    "Name": "Events",
    "Path": "events",
    "Columns": [
      { "Name": "StartTimestamp" },
      { "Name": "EndTimestamp" }
    ],
    "Join": [
      {
        "SourceColumnName": "CaseID",
        "TargetColumnName": "CaseID",
        "TargetDatasetName": "Cases",
        "JoinKeyType": "Integer"
      },
      {
        "SourceColumnName": "Activity_id",
        "TargetColumnName": "Activity_id",
        "TargetDatasetName": "Activity",
        "JoinKeyType": "Integer",
        "ExportName": "Activity_id"        // also surface the FK itself as a logical attribute
      },
      {
        "SourceColumnName": "Resource_id",
        "TargetColumnName": "Resource_id",
        "TargetDatasetName": "Resource",
        "JoinKeyType": "Integer"
      }
    ]
  },
  {
    "Kind": 1,
    "Name": "Cases",
    "Path": "cases",
    "Columns": [
      { "Name": "CaseID" },
      { "Name": "CustomerSegment" }
    ],
    "Join": null
  },
  {
    "Kind": 2,                              // Lookup
    "Name": "Activity",
    "Path": "activity",
    "Columns": [ { "Name": "Activity" } ],
    "Join": null
  },
  {
    "Kind": 2,
    "Name": "Resource",
    "Path": "resource",
    "Columns": [ { "Name": "Resource" } ],
    "Join": null
  }
]
```

And the attributes list now references columns coming both from direct `Columns` and from joins:

```json
"Attributes": [
  { "Name": "CaseID",          "SourceDataType": "Integer", "ImportType": "Case",     "Level": "Event", "FinanceImportType": "None" },
  { "Name": "Activity_id",     "SourceDataType": "Integer", "ImportType": "Other",    "Level": "Event", "FinanceImportType": "None" },
  { "Name": "Activity",        "SourceDataType": "String",  "ImportType": "Activity", "Level": "Event", "FinanceImportType": "None" },
  { "Name": "StartTimestamp",  "SourceDataType": "Date",    "ImportType": "Start",    "Level": "Event", "FinanceImportType": "None" },
  { "Name": "EndTimestamp",    "SourceDataType": "Date",    "ImportType": "End",      "Level": "Event", "FinanceImportType": "None" },
  { "Name": "Resource",        "SourceDataType": "String",  "ImportType": "Resource", "Level": "Event", "FinanceImportType": "None" },
  { "Name": "CustomerSegment", "SourceDataType": "String",  "ImportType": "Other",    "Level": "Case",  "FinanceImportType": "None" }
]
```

### `ExportName` — what it is and when to set it

By default, a joined column shows up to the mining model under the **target table's** column name (`Activity`, `Resource`). When you set `ExportName` on a join (as we did for `Activity_id`), the FK itself is also surfaced as a logical attribute under that name.

Use `ExportName` whenever:

- You want the FK value (not just the human-readable label) available to the mining model, **or**
- You'd otherwise get a name collision between several joined columns.

### Structural rules for joins

| Rule | Why |
|---|---|
| The Event dataset can join to **at most one Case** dataset, plus any number of Join lookups. | A process has one case context. |
| The Event dataset cannot self-reference or join to another Event. | Avoids cycles. |
| The Case dataset can join only to **Join** lookups (not to Event, not to another Case). | Avoids cycles. |
| A **Join** (lookup) dataset cannot itself contain joins. Set its `Join` to `null`. | No nested/chained joins. |
| `TargetDatasetName` must match a real dataset entry's `Name`. | Catches typos. |
| The physical type of the FK and the PK columns must match the declared `JoinKeyType`. | Catches type mismatches. |
| Don't put the same column in both `Columns` and a `Join.SourceColumnName` of the same dataset. Use the join's `ExportName` if you need to expose the FK. | The validator rejects this. |

---

## 6. Adding finance metrics and custom attributes

Numeric columns can be flagged as finance metrics so Process Mining treats them as currency in the report.

### Custom dimension

A custom dimension is any column you want to keep around for filtering and analysis. Use `ImportType: "Other"`:

```json
{ "Name": "Department", "SourceDataType": "String", "ImportType": "Other", "Level": "Event", "FinanceImportType": "None" }
```

### Per-case finance metric

A currency value that's constant per case (e.g. invoice total). Add the column to the Case dataset's `Columns`, then:

```json
{
  "Name": "InvoiceTotalAmountWithoutVAT",
  "SourceDataType": "Float",
  "ImportType": "Other",
  "Level": "Case",
  "FinanceImportType": "PerCase"
}
```

### Per-event finance metric

A currency value attached to each event (e.g. step cost). Add the column to the Event dataset, then:

```json
{
  "Name": "EventCost",
  "SourceDataType": "Float",
  "ImportType": "Other",
  "Level": "Event",
  "FinanceImportType": "PerEvent"
}
```

> [!IMPORTANT]
> A `FinanceImportType` other than `None` is only valid when `SourceDataType` is `Integer` or `Float`. Anything else fails validation.

### Nullable attributes

By default, every value must be present. To allow nulls on a specific attribute, add `"IsNullable": true`:

```json
{ "Name": "ApproverComment", "SourceDataType": "String", "ImportType": "Other", "Level": "Event", "FinanceImportType": "None", "IsNullable": true }
```

---

## 7. Switching the data source — OneLake/Fabric and Delta tables

Everything above used CSV in ADLS Gen2. To read from OneLake/Fabric or to use Parquet / Delta-Parquet instead, you only change three fields in `dataSource` (the `datasets` and `Attributes` arrays stay the same).

### OneLake / Fabric instead of ADLS Gen2

```json
"dataSourceType": 2,                        // 2 = OneLake
"oneLakeConnectionSetupProperties": {
  "workspaceId":  "eb5b82ad-3bfe-4976-9830-107e982eb72f",
  "lakehouseId":  "2de91b1d-28a0-4bbb-839c-3ba65414497a"
}
```

Replace the `azureDataLakeConnectionSetupProperties` block from  step 3 with the OneLake block above. Then in each dataset, point `Path` at the lakehouse location:

- For a **managed Delta table:** `/<lakehouseId>/Tables/<schema>/<table>` (Fabric uses `dbo` as the default schema)
- For **loose files** under the Files area: `/<lakehouseId>/Files/<your-folder>/<dataset-folder>`

### Delta-Parquet (recommended for lakehouse data)

```json
"dataSourceFileType": 2,                    // 2 = DeltaParquet
```

Point each dataset's `Path` at the **table root** (the folder that contains `_delta_log/`), not at `_delta_log/` itself and not at an individual data file. The importer parses `_delta_log/` and only reads live data files.

### Plain Parquet

```json
"dataSourceFileType": 1,                    // 1 = Parquet (loose .parquet files only)
```

Use this **only** when the dataset folder contains plain `.parquet` files. **Never** use `1` for a Delta table — see [Common pitfalls](#11-common-pitfalls).

### Worked OneLake + Delta example

```json
{
  "inputDataBinding": {
    "dataSource": {
      "dataSourceSchemaType": 1,
      "dataSourceType": 2,                  // OneLake
      "dataSourceFileType": 2,              // DeltaParquet
      "oneLakeConnectionSetupProperties": {
        "workspaceId":  "eb5b82ad-3bfe-4976-9830-107e982eb72f",
        "lakehouseId":  "2de91b1d-28a0-4bbb-839c-3ba65414497a"
      },
      "datasets": [
        {
          "Kind": 0, "Name": "Events",
          "Path": "/2de91b1d-28a0-4bbb-839c-3ba65414497a/Tables/dbo/events",
          "Columns": [
            { "Name": "StartTimestamp" },
            { "Name": "EndTimestamp" }
          ],
          "Join": [
            { "SourceColumnName": "CaseID",      "TargetColumnName": "CaseID",      "TargetDatasetName": "Cases",    "JoinKeyType": "Integer" },
            { "SourceColumnName": "Activity_id", "TargetColumnName": "Activity_id", "TargetDatasetName": "Activity", "JoinKeyType": "Integer", "ExportName": "Activity_id" },
            { "SourceColumnName": "Resource_id", "TargetColumnName": "Resource_id", "TargetDatasetName": "Resource", "JoinKeyType": "Integer" }
          ]
        },
        {
          "Kind": 1, "Name": "Cases",
          "Path": "/2de91b1d-28a0-4bbb-839c-3ba65414497a/Tables/dbo/cases",
          "Columns": [
            { "Name": "CaseID" },
            { "Name": "InvoiceTotalAmountWithoutVAT" }
          ],
          "Join": null
        },
        {
          "Kind": 2, "Name": "Activity",
          "Path": "/2de91b1d-28a0-4bbb-839c-3ba65414497a/Tables/dbo/activity",
          "Columns": [ { "Name": "Activity" } ],
          "Join": null
        },
        {
          "Kind": 2, "Name": "Resource",
          "Path": "/2de91b1d-28a0-4bbb-839c-3ba65414497a/Tables/dbo/resource",
          "Columns": [ { "Name": "Resource" } ],
          "Join": null
        }
      ]
    },
    "miningMetadata": {
      "ImportConfiguration": {
        "Attributes": [
          { "Name": "CaseID",                       "SourceDataType": "Integer", "ImportType": "Case",     "Level": "Event", "FinanceImportType": "None" },
          { "Name": "Activity_id",                  "SourceDataType": "Integer", "ImportType": "Other",    "Level": "Event", "FinanceImportType": "None" },
          { "Name": "Activity",                     "SourceDataType": "String",  "ImportType": "Activity", "Level": "Event", "FinanceImportType": "None" },
          { "Name": "StartTimestamp",               "SourceDataType": "Date",    "ImportType": "Start",    "Level": "Event", "FinanceImportType": "None" },
          { "Name": "EndTimestamp",                 "SourceDataType": "Date",    "ImportType": "End",      "Level": "Event", "FinanceImportType": "None" },
          { "Name": "Resource",                     "SourceDataType": "String",  "ImportType": "Resource", "Level": "Event", "FinanceImportType": "None" },
          { "Name": "InvoiceTotalAmountWithoutVAT", "SourceDataType": "Float",   "ImportType": "Other",    "Level": "Case",  "FinanceImportType": "PerCase" }
        ]
      }
    }
  }
}
```

---

## 8. Field reference

### `inputDataBinding`

| Field | Type | Required | Notes |
|---|---|---|---|
| `dataSource` | object | yes | Physical layout. See below. |
| `miningMetadata.ImportConfiguration` | object | yes | Logical model. See below. |

### `dataSource`

| Field | Type | Required | Notes |
|---|---|---|---|
| `dataSourceSchemaType` | int enum | yes | Always `1` (Normalized) for this flow. |
| `dataSourceType` | int enum | yes | `1` ADLS Gen2, `2` OneLake. |
| `dataSourceFileType` | int enum | yes | `0` CSV, `1` Parquet, `2` DeltaParquet. |
| `azureDataLakeConnectionSetupProperties` | object | required when `dataSourceType=1` | See below. |
| `oneLakeConnectionSetupProperties` | object | required when `dataSourceType=2` | See below. |
| `datasets` | array | yes | One entry per physical table. |

### `azureDataLakeConnectionSetupProperties` (ADLS Gen2)

| Field | Type | Required |
|---|---|---|
| `subscriptionId` | GUID | yes |
| `resourceGroupName` | string | yes |
| `storageAccountName` | string | yes |
| `containerName` | string | yes |

### `oneLakeConnectionSetupProperties` (OneLake / Fabric)

| Field | Type | Required |
|---|---|---|
| `workspaceId` | GUID | yes — Fabric workspace id |
| `lakehouseId` | GUID (string) | yes — Lakehouse id |

### `datasets[]`

| Field | Type | Required | Notes |
|---|---|---|---|
| `Kind` | int enum | yes | `0` Event, `1` Case, `2` Join. |
| `Name` | string | yes | Logical name. Unique across all datasets. |
| `Path` | string | yes | Path to the file or folder. For Delta tables, point at the table root, not `_delta_log/` or an individual data file. |
| `Columns` | array | optional | Direct columns surfaced from this dataset. |
| `Join` | array | yes (use `null` if none) | Foreign-key links to other datasets. |

### `datasets[].Columns[]`

| Field | Type | Required | Notes |
|---|---|---|---|
| `Name` | string | yes | Physical column name as it appears in the source file. |
| `ExportName` | string | optional | Logical name visible to the mining model. Defaults to `Name`. Must match an `Attributes[].Name`. |

### `datasets[].Join[]`

| Field | Type | Required | Notes |
|---|---|---|---|
| `SourceColumnName` | string | yes | FK column on this dataset. |
| `TargetColumnName` | string | yes | PK column on the referenced dataset. |
| `TargetDatasetName` | string | yes | Name of a dataset in the same `datasets` array. |
| `JoinKeyType` | string enum | yes | `"Integer"` or `"String"`. |
| `ExportName` | string | optional | Logical name to expose the FK as. When set, this is the name used in `Attributes`. |

### `miningMetadata.ImportConfiguration.Attributes[]`

| Field | Type | Required | Notes |
|---|---|---|---|
| `Name` | string | yes | Must equal a physical column's `ExportName` (or `Name` when no `ExportName` is set), or a join's `ExportName`. |
| `SourceDataType` | string enum | yes | `String` \| `Integer` \| `Float` \| `Boolean` \| `Date`. |
| `ImportType` | string enum | yes | `Activity` \| `Start` \| `End` \| `Case` \| `Resource` \| `Other`. |
| `Level` | string enum | yes | `Event` \| `Case`. |
| `FinanceImportType` | string enum | yes | `None` \| `PerCase` \| `PerEvent`. Non-`None` requires `Integer` or `Float`. |
| `IsNullable` | bool | optional | Allow null values during import. |

---

## 9. Enum reference

### `dataSourceSchemaType`

| Value | Name | Meaning |
|---|---|---|
| `0` | Denormalized | Legacy single-table format (use the UI). |
| `1` | Normalized | This guide's flow. |

### `dataSourceType`

| Value | Name | Meaning |
|---|---|---|
| `1` | ByolDatalakeFolder | Customer-owned ADLS Gen2 container. |
| `2` | OneLake | Microsoft Fabric OneLake / Lakehouse. |

### `dataSourceFileType`

| Value | Name | Meaning |
|---|---|---|
| `0` | Csv | One or more CSV files in the dataset folder. |
| `1` | Parquet | Loose `.parquet` files. **Do not use for Delta tables.** |
| `2` | DeltaParquet | Delta Lake table. The importer parses `_delta_log/` and reads only live data files. |

### `Kind` (dataset)

| Value | Name | Role |
|---|---|---|
| `0` | Event | Activity fact table. Exactly one required. |
| `1` | Case | Case-level attributes (1 row per case). At most one. |
| `2` | Join | Lookup table joined via FK/PK. Cannot have nested joins. |

### `JoinKeyType`

| Value | Notes |
|---|---|
| `"Integer"` | Recommended for synthetic surrogate keys. |
| `"String"` | Use when the key is a natural string identifier. |

Only these two values are accepted today.

### `SourceDataType`

| Value | Underlying type |
|---|---|
| `String` | string |
| `Integer` | long (CSV) / int family (Parquet) |
| `Float` | double |
| `Boolean` | bool |
| `Date` | DateTime / DateTimeOffset |

### `ImportType`

| Value | Meaning |
|---|---|
| `Activity` | Activity name. Exactly one attribute. |
| `Case` | Case id. Exactly one attribute. |
| `Start` | Event start timestamp. Must be a direct column of the Event dataset. |
| `End` | Event end timestamp. Must be a direct column of the Event dataset. |
| `Resource` | Resource / actor. |
| `Other` | Any custom dimension or metric. |

### `Level`

| Value | Meaning |
|---|---|
| `Event` | Attribute varies per row in the event log. |
| `Case` | Attribute is constant per case. |

### `FinanceImportType`

| Value | Meaning |
|---|---|
| `None` | Not a finance metric. |
| `PerCase` | Currency amount associated with the case as a whole. |
| `PerEvent` | Currency amount associated with each event. |

Only `Integer` and `Float` attributes may use a non-`None` finance type.

---

## 10. Validation checklist

Before submitting your config, walk this list. The server runs every check below before opening a single byte of data.

- [ ] Dataset `Name` values are unique.
- [ ] `Columns[].Name` values are unique across all datasets.
- [ ] Exactly **one** dataset has `Kind = 0` (Event).
- [ ] At most **one** dataset has `Kind = 1` (Case).
- [ ] Every `Kind = 2` (Join) dataset has `Join: null` (no nested joins).
- [ ] Event-dataset joins point only at Case or Join targets — no self-reference, no Event-to-Event.
- [ ] Case-dataset joins point only at Join targets.
- [ ] No column appears in both `Columns` and a `Join.SourceColumnName` of the same dataset.
- [ ] `JoinKeyType` is `"Integer"` or `"String"` (nothing else is supported).
- [ ] Each FK / PK column type matches its declared `JoinKeyType`.
- [ ] `Attributes` contains exactly one `ImportType: "Activity"` and exactly one `ImportType: "Case"`.
- [ ] Every `Start` / `End` attribute maps to a direct column of the Event dataset (not pulled in via a join).
- [ ] Every attribute name resolves to either a `Columns[].ExportName ?? Columns[].Name` or a `Join[].ExportName`.
- [ ] Every declared column physically exists in the source file's schema (CSV header / Parquet schema).
- [ ] Every attribute with `FinanceImportType` ≠ `None` has `SourceDataType` of `Integer` or `Float`.

---

## 11. Common pitfalls

### Using `dataSourceFileType = 1` (Parquet) for a Delta Lake table

This is the most frequent authoring mistake. With `dataSourceFileType: 1`, the importer recursively lists every `.parquet` file under the dataset path — including `_delta_log/00000000000000000000.checkpoint.parquet`. Because `_` sorts before `p`, the checkpoint file becomes the alphabetically first file, and the schema validator reads *its* schema instead of your real data's. You'll see `"column not found in physical columns list"` errors for your real attributes, while the reported "physical columns" contain Delta internals like `modificationTime`, `deltaVersion`, `numRecords`.

**Fix:** For any Delta Lake table, set `dataSourceFileType: 2` (DeltaParquet) and point `Path` at the table root (e.g. `Tables/<schema>/<table>`).

### Exposing a FK column twice

If the same physical column needs to be both joined on and used as a custom attribute, expose it **only** through the join's `ExportName`. Putting the same name in both `Columns` and `Join.SourceColumnName` of the same dataset is rejected by the validator.

### Finance attribute on a non-numeric type

`FinanceImportType` set to anything other than `None` requires `SourceDataType` to be `Integer` or `Float`. Other types do not pass the validation.

### OneLake path conventions

For a managed Delta table on OneLake, the `Path` looks like `/<lakehouseId>/Tables/<schema>/<table>` (`dbo` is the Fabric default schema). Pointing at a deeper file, or at `_delta_log/`, will fail.

### Timestamps not on the Event dataset

`Start` and `End` attributes must come from a column physically present on the Event dataset (a direct `Columns` entry) — not pulled in through a join. Otherwise the validation is not passed.

### Missing `Join: null`

The `Join` property is required on every dataset. When a dataset has no joins, set `"Join": null` explicitly — omitting the property is a shape error.

### Mismatched attribute name

Every `Attributes[].Name` must resolve to a physical column or join export somewhere in `datasets`. If it doesn't, validation fails. Remember: when a join sets `ExportName`, the FK is surfaced under that name — not under `SourceColumnName`.
