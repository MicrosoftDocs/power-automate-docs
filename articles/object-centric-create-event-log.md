---
title: Create an Object‑centric event log (preview)
description: Learn how to create an object-centric event log.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/07/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Create an object‑centric event log (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Creating an object‑centric event log (OCEL) is about translating a real‑world process into a structured dataset that accurately reflects the relationships between events and business objects. Unlike traditional case‑centric logs, this approach captures the complexity of scenarios where multiple objects interact within the same event. The goal is to produce a clean, consistent, and analysis‑ready log that supports object‑centric process mining without unnecessary complexity.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

The following sections outline best practices and a practical workflow to help you build such a log efficiently.

Object‑centric process mining (OCPM) uses some general terms. If you're unfamiliar with a term, check out the [Glossary](#glossary) section in this article.

> [!NOTE]
> The current preview version supports data ingestion *only from a CSV file stored in Azure Data Lake or OneLake*. Ensure your final log is exported to one of these locations before proceeding with ingestion.

## Target CSV schema

The following columns are required:

- `Activity`: Human‑readable event name (for example, *Create Order*, *Pay Invoice*).
- `Timestamp`: Event time in `yyyy-MM-dd HH:mm:ss` (24h) or ISO‑8601.
- `Actor`: Person/system executing the event.
- **One column per object type** used in your process (for example, `Order`, `Invoice`, `Payment`, …).
  - If an event touches *multiple* objects of the same type, separate it with `|` (for example, `O1|O2`).
- **Object‑type attributes (optional but recommended)**: Columns that hold attributes of an object referenced by the event (for example, `PaymentAmount` for a `Payment` present in the row).

## Modeling rules and naming conventions

The OECL uses the following modeling rules and naming conventions:

- **One row = one event**, even if it relates to multiple objects.
- **Stable, opaque object IDs** across the log (for example, `O1`, `I1`, `P1`); do not reuse IDs.
- **Multi‑object delimiter**: Use `|` inside object columns (for example, `O1|O2`).
- **Avoid attribute duplication**: Keep object attributes (for example, `PaymentAmount`) once per event row if that object is present. If multiple same‑type objects must carry different attribute values, we prefer that you split them into separate events.
- **Activity labels**: Concise, consistent, and controlled. Avoid embedding high‑cardinality details directly in `Activity`; keep them as attributes.
- **Timestamps**: Single time zone or UTC; ensure logical ordering across lifecycle events.
- **Sparsity is fine**: Leave object columns blank when not relevant to the event.

## General step‑by‑step construction workflow

Use the following steps to create your OECL:

1. **Define scope and object types**<br>
   Choose the minimal set of object types (for example, `Order`, `Invoice`, `Payment`; optionally `SupplierOrder`).
2. **Inventory source events**<br>
   Identify upstream event sources (tables/logs/status changes) and map each source record to
   `Activity`, `Timestamp`, `Actor`, target object columns, and any needed attributes.
3. **Map objects to events**<br>
   Populate object IDs for each event; use `|` when an event touches multiple same‑type objects.
4. **Normalize attributes**<br>
   Standardize timestamps, user IDs, currencies/units; keep attributes only if they’re analytically useful.
5. **Emit CSV**<br>
   Use a stable column order (see header template), UTF‑8 encoding, and quote fields containing commas.

## Example of event log construction

The following steps outline the process narrative:

1. A customer places *two orders* (`O1`, `O2`).
2. The store raises *two supplier orders* (`SO1`, `SO2`) to restock items.
3. One supplier order arrives and is unpacked; the other requires an update.
4. The store issues *two invoices* (`I1`, `I2`). One invoice is updated.
5. Policy says, "ship the second customer order only after invoices are paid."
6. After *payment* (`P1`) is received, the second order is shipped.

### Steps in the process

The following steps 1 through 4 are the steps in the process.

#### 1. Identify object types

- **Order** (customer orders): `O1`, `O2`
- **SupplierOrder** (stock replenishment): `SO1`, `SO2`
- **Invoice** (billing): `I1`, `I2`
- **Payment**: `P1`

Keep this minimal. Extend only if additional objects materially change your analysis.

#### 2. For each object, gather relevant events (event streams before merging)

- **Order**
  - `Create Order` (`O1`), `Create Order` (`O2`)
  - `Ship Order` (`O2`) — subject to “paid‑before‑ship” policy
- **SupplierOrder**
  - `Raise Supplier Order` (`SO1`), `Raise Supplier Order` (`SO2`)
  - `Receive Supplier Order` (`SO1`), `Unpack Supplier Order` (`SO1`)
  - `Update Supplier Order` (`SO2`)
- **Invoice**
  - `Issue Invoice` (`I1` for `O1`)
  - `Issue Invoice` (`I2` for `O2`)
  - `Update Invoice` (`I2`)
- **Payment**
  - `Pay Invoice` (`P1` for `I1`) with `PaymentAmount=1000`

> At this stage you can keep each stream separate (one CSV per object type) or in staging tables/views.

#### 3. Identify cross‑object events and update object references

Some events naturally touch **multiple objects**:

- **Issue Invoice** links the **Invoice** to the relevant **Order**.
  - Example (one‑to‑one): `Issue Invoice … Order=O1, Invoice=I1`
  - Example (consolidated billing): `Issue/Receive Invoice … Order=O1|O2, Invoice=I1`
- **Pay Invoice** links the **Payment** to the **Invoice** (and indirectly to the **Order** through billing).
  - Example: `Pay Invoice … Invoice=I1, Payment=P1, PaymentAmount=1000`

Update the event rows so that the **object columns** reflect these relationships (use `|` if an event touches multiple same‑type objects).

#### 4. Merge the event streams into final log

Concatenate all event rows, **retain the shared column set**. Following are three variants:

#### 4.1 Minimal variant (objects: Order, Invoice, Payment)

```CSV
Activity,Timestamp,Actor,Order,Invoice,Payment,PaymentAmount
Create Order,2025-01-01 12:35:00,John,O1,,,
Create Order,2025-01-01 12:36:00,Anna,O2,,,
Issue Invoice,2025-01-01 12:37:00,Mary,O1,I1,,
Issue Invoice,2025-01-01 12:37:30,Mary,O2,I2,,
Update Invoice,2025-01-01 12:37:45,Mary,,I2,,
Receive Payment,2025-01-01 12:38:00,John,,I1,P1,1000
Ship Order,2025-01-01 12:39:00,LogOps,O2,,,
```

#### 4.2 Alternate variant demonstrating **multi‑order invoice**

If one invoice references both orders, record both Order IDs with `|`:

```CSV
Activity,Timestamp,Actor,Order,Invoice,Payment,PaymentAmount
Create Order,2025-01-01 12:35:00,John,O1,,,
Create Order,2025-01-01 12:36:00,Anna,O2,,,
Receive Invoice,2025-01-01 12:37:00,Mary,O1|O2,I1,,
Receive Payment,2025-01-01 12:38:00,John,,I1,P1,1000
Ship Order,2025-01-01 12:39:00,LogOps,O2,,,
```

#### 4.3 Extended variant including **SupplierOrder**, single payment for both invoices and shipment of both orders in one go

(Add a `SupplierOrder` column to the header.)

```CSV
Activity,Timestamp,Actor,Order,Invoice,Payment,PaymentAmount,SupplierOrder
Create Order,2025-01-01 12:35:00,John,O1,,,, 
Create Order,2025-01-01 12:36:00,Anna,O2,,,, 
Raise Supplier Order,2025-01-01 12:36:30,ProcBot,,,,,,SO1
Raise Supplier Order,2025-01-01 12:36:45,ProcBot,,,,,,SO2
Receive Supplier Order,2025-01-01 12:37:10,Warehouse,,,,,,SO1
Unpack Supplier Order,2025-01-01 12:37:20,Warehouse,,,,,,SO1
Update Supplier Order,2025-01-01 12:37:25,ProcBot,,,,,,SO2
Issue Invoice,2025-01-01 12:37:30,Mary,O1,I1,,, 
Issue Invoice,2025-01-01 12:37:40,Mary,O2,I2,,, 
Update Invoice,2025-01-01 12:37:45,Mary,,I2,,, 
Receive Payment,2025-01-01 12:38:00,John,,I1|I2,P1,1000, 
Ship Order,2025-01-01 12:39:00,LogOps,O1|O2,,,, 
```

## Glossary

- **Event‑level attribute**: An attribute that describes the event itself (for example, *Activity*, *Timestamp*, *Actor*).
- **Object**: A specific instance of an object type (for example, *Order `O1`*).
- **Object‑level attribute**: An attribute that describes an object (for example, *PaymentAmount* for *Payment `P1`*). You can repeat these at event time when the event references that object.
- **Object type**: A category/class of business entities (for example, *Order*, *Invoice*, *Payment*, *SupplierOrder*).


