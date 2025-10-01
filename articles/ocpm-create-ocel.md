---
title: Creating an Object‑Centric Event Log (preview)
description: Learn how to create an object-centric event log.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/01/2025
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Creating an Object‑Centric Event Log (preview)

Creating an object‑centric event log (OCEL) is about translating a real‑world process into a structured dataset that accurately reflects the relationships between events and business objects. Unlike traditional case‑centric logs, this approach captures the complexity of scenarios where multiple objects interact within the same event. The goal is to produce a clean, consistent, and analysis‑ready log that supports object‑centric process mining without unnecessary complexity. The following sections outline best practices and a practical workflow to help you build such a log efficiently.

   > [!NOTE]
   > The current **preview version** supports data ingestion **only from a CSV file stored in Azure Data Lake or OneLake**. Ensure your final log is exported to one of these locations before proceeding with ingestion.

## Target CSV Schema

**Required columns**

- `Activity` — human‑readable event name (e.g., *Create Order*, *Pay Invoice*).
- `Timestamp` — event time in `yyyy-MM-dd HH:mm:ss` (24h) or ISO‑8601.
- `Resource` — person/system executing the event.
- **One column per object type** used in your process (e.g., `Order`, `Invoice`, `Payment`, …).
  - If an event touches **multiple** objects of the same type, separate with `|` (e.g., `O1|O2`).
- **Object‑type attributes (optional but recommended)** — columns that hold attributes of an object referenced by the event (e.g., `PaymentAmount` for a `Payment` present in the row).

## Modeling Rules & Naming Conventions

1. **One row = one event**, even if it relates to multiple objects.
2. **Stable, opaque object IDs** across the log (e.g., `O1`, `I1`, `P1`); do not reuse IDs.
3. **Multi‑object delimiter**: use `|` inside object columns (e.g., `O1|O2`).
4. **Avoid attribute duplication**: keep object attributes (e.g., `PaymentAmount`) once per event row if that object is present. If multiple same‑type objects must carry different attribute values, prefer splitting into separate events.
5. **Activity labels**: concise, consistent, and controlled. Avoid embedding high‑cardinality details directly in `Activity`; keep them as attributes.
6. **Timestamps**: single time zone or UTC; ensure logical ordering across lifecycle events.
7. **Sparsity is fine**: leave object columns blank when not relevant to the event.

## General Step‑by‑Step Construction Workflow

1. **Define scope & object types**
   Choose the minimal set of object types (e.g., `Order`, `Invoice`, `Payment`; optionally `SupplierOrder`).
2. **Inventory source events**
   Identify upstream event sources (tables/logs/status changes) and map each source record to
   `Activity`, `Timestamp`, `Resource`, target object columns, and any needed attributes.
3. **Map objects to events**
   Populate object IDs for each event; use `|` when an event touches multiple same‑type objects.
4. **Normalize attributes**
   Standardize timestamps, user IDs, currencies/units; keep attributes only if they’re analytically useful.
5. **Emit CSV**
   Use a stable column order (see header template), UTF‑8 encoding, and quote fields containing commas.

## Example of Event Log Construction

**Process narrative** (as provided on the previous page)

1. A customer places **two orders** (`O1`, `O2`).
2. The store raises **two supplier orders** (`SO1`, `SO2`) to restock items.
3. One supplier order arrives and is unpacked; the other requires an update.
4. The store issues **two invoices** (`I1`, `I2`). One invoice is updated.
5. Policy says **“ship the second customer order only after invoices are paid.”**
6. After **payment** (`P1`) is received, the second order is shipped.

### A) Identify object types

- **Order** (customer orders): `O1`, `O2`
- **SupplierOrder** (stock replenishment): `SO1`, `SO2`
- **Invoice** (billing): `I1`, `I2`
- **Payment**: `P1`

   > [!NOTE]
   > Keep this minimal; extend only if additional objects materially change your analysis.

### B) For each object, gather relevant events (event streams before merging)

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

### C) Identify **cross‑object** events and update object references

Some events naturally touch **multiple objects**:

- **Issue Invoice** links the **Invoice** to the relevant **Order**.
  - Example (one‑to‑one): `Issue Invoice … Order=O1, Invoice=I1`
  - Example (consolidated billing): `Issue/Receive Invoice … Order=O1|O2, Invoice=I1`
- **Pay Invoice** links the **Payment** to the **Invoice** (and indirectly to the **Order** through billing).
  - Example: `Pay Invoice … Invoice=I1, Payment=P1, PaymentAmount=1000`

Update the event rows so that the **object columns** reflect these relationships (use `|` if an event touches multiple same‑type objects).

### D) Merge the event streams into final log

Concatenate all event rows, **retain the shared column set**. Below are three variants:

#### D.1 Minimal variant (objects: Order, Invoice, Payment)

```CSV
Activity,Timestamp,Resource,Order,Invoice,Payment,PaymentAmount

Create Order,2025-01-01 12:35:00,John,O1,,,

Create Order,2025-01-01 12:36:00,Anna,O2,,,

Issue Invoice,2025-01-01 12:37:00,Mary,O1,I1,,

Issue Invoice,2025-01-01 12:37:30,Mary,O2,I2,,

Update Invoice,2025-01-01 12:37:45,Mary,,I2,,

Receive Payment,2025-01-01 12:38:00,John,,I1,P1,1000

Ship Order,2025-01-01 12:39:00,LogOps,O2,,,


```



#### D.2 Alternate variant demonstrating **multi‑order invoice**

If one invoice references both orders, record both Order IDs with `|`:

```CSV
Activity,Timestamp,Resource,Order,Invoice,Payment,PaymentAmount

Create Order,2025-01-01 12:35:00,John,O1,,,

Create Order,2025-01-01 12:36:00,Anna,O2,,,

Receive Invoice,2025-01-01 12:37:00,Mary,O1|O2,I1,,

Receive Payment,2025-01-01 12:38:00,John,,I1,P1,1000

Ship Order,2025-01-01 12:39:00,LogOps,O2,,,
```



#### D.3 Extended variant including **SupplierOrder**, single payment for both invoices and shipment of both orders in one go

(Add a `SupplierOrder` column to the header.)

```CSV
Activity,Timestamp,Resource,Order,Invoice,Payment,PaymentAmount,SupplierOrder

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

- **Object type**
  A category/class of business entities (e.g., *Order*, *Invoice*, *Payment*, *SupplierOrder*).
- **Object**
  A specific instance of an object type (e.g., *Order `O1`*).
- **Object‑level attribute**
  An attribute that describes an object (e.g., *PaymentAmount* for *Payment `P1`*). You can repeat these at event time when the event references that object.
- **Event‑level attribute**
  An attribute that describes the event itself (e.g., *Activity*, *Timestamp*, *Resource*).
