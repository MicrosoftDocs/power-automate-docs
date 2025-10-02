---
title: Overview of Object‑Centric Process Mining (preview)
description: Learn about object-centric process mining and comparison to case-centric process mining.
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

# Overview of Object‑Centric Process Mining (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

**Object‑centric process mining (OCPM)** analyzes processes by following the *real objects that interact*—such as orders, deliveries, invoices, and payments—rather than forcing every event into a single “case ID.” It lets you see the true web of interactions across multiple objects and lifecycles, so you can uncover bottlenecks and dependencies that case‑centric process mining often hides.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Importance of object‑centric process mining

Real business processes rarely flow as a single, linear “instance.” Events routinely touch **several objects of different types at the same time** (for example, creating an invoice for a specific order, or shipping a package that contains items from multiple orders). OCPM models that reality directly by recording events that relate to **many objects and object types** in one process, preserving their relationships end‑to‑end.

   > [!NOTE]
   > **Key idea:** Instead of “one case → one sequence of activities,” OCPM lets **one event** belong to **multiple objects** (and object types), keeping the full context intact.

## Business process example

Consider a simple retail scenario:

1. A customer places **two orders** (O1, O2).
2. The store raises **two supplier orders** (SO1, SO2) to restock items.
3. One supplier order arrives and is unpacked; the other requires an update.
4. The store issues **two invoices** (I1, I2). One invoice is updated.
5. The store policy says **“ship the second customer order only after invoices are paid.”**
6. After **payment (P1)** is received, the second order is shipped.

We’ll use this same flow to compare OCPM with case‑centric process mining.

## How OCPM models this process

With OCPM, each **event** (for example, *Create invoice*, *Receive goods*, *Ship order*, *Record payment*) can link to **the objects it touched** at that moment (e.g., Order O1, Invoice I1, Supplier Order SO1, Payment P1). The analytics surface then renders an **object‑centric process map** that shows:

- **Object lifecycles**, using start/end (creation/disposal) markers per object type
- **Activity nodes**, which can belong to one or multiple object types
- **Object‑flow edges** between activities, often color‑coded by object type, so you can follow (say) the *Order* flow and, on the same map, see how *Invoice* and *Payment* flows intersect with it.

This preserves the critical dependency—*“ship O2 only after invoices are paid”*—because the *Ship order* event is explicitly related to **Order O2** and **Payment P1** through the invoice(s), all on the same map.

## How case‑centric process mining models the same process

Traditional (case‑centric) process mining groups events under a **single case notion**—for example, “Order ID.” That’s powerful and often sufficient, but in our scenario it creates trade‑offs:

- If the case is **Order**, invoice and payment events must be *duplicated or flattened* to fit the order’s timeline, potentially inflating counts or obscuring which invoice truly gated shipping.
- If the case is **Invoice** or **Shipment**, you lose part of the **order** story and cross‑object dependencies (e.g., the “ship only after payment” rule spanning *Order → Invoice → Payment*).

In short, **forcing a single case type can hide or distort multi‑object relationships**, whereas OCPM keeps them explicit. For a general primer on case‑centric process mining, see the product overview.

## Side‑by‑side: OCPM vs. case‑centric

| Question                                                     | Case‑centric (case = Order)                                  | Object‑centric (OCPM)                                        |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Can I see which **invoice(s)** and **payment(s)** gated shipping of O2? | Possible, but requires joins/flattening and can double‑count or lose context. | **Yes.** Events link to Order, Invoice, Payment simultaneously; gating logic is evident on one map. |
| How do I analyze **supplier restocking** vs. customer orders on one canvas? | You’d switch case notions (Order vs. Supplier Order) or merge views offline. | **Native.** Show both object types (Order, Supplier Order) and their touchpoints on the same model. |
| What about **policy rules** that span objects (e.g., “ship only after payment”)? | Harder to verify end‑to‑end without stitching logs.          | **First‑class.** Cross‑object dependencies are visible where flows intersect. |
| Data shape                                                   | One case per instance; events must fit that case.            | **Events can belong to multiple objects/types**(object‑centric event data). |

## Benefits of OCPM

- **No loss of context:** You keep the full relationship between *Order–Invoice–Payment–Shipment* without duplicating events or flattening data.
- **Multi‑object bottleneck analysis:** See where delays occur when flows converge (for example, *Order* waiting on *Invoice* or *Supplier Order*).
- **Clear governance and compliance checks across objects:** Validate policies that inherently span multiple entities (e.g., financial clearance before shipping).

## When to use OCPM vs. case‑centric

**Use OCPM when…**

- **Events routinely touch multiple objects** (like our *Order–Invoice–Payment* chain), and you need to see their interactions on a single map.
- **Dependencies across object types drive outcomes** (e.g., shipments conditioned on payments, replenishment conditioned on supplier deliveries).
- **Counting and performance must reflect reality** (avoid duplicated events/edges that arise from flattening multi‑object events into one case).

**Stay with case‑centric when…**

- A **single case notion is well‑defined** (for example, a tightly scoped ticketing workflow), and cross‑object dependencies are minimal.
- You want a **straightforward, sequential “X‑ray”** of one process instance type (e.g., an *Order* from creation to delivery) and the data naturally fits that view.

Many teams mix the two: start case‑centric for a crisp, single‑instance view; move to OCPM when important insights hinge on **how objects relate**.

## A closer look at the data

In OCPM, you’ll work with **object‑centric event data** where each row is an *event* (with activity and timestamp) and has one or more columns listing the **object IDs per object type** that the event touched (for example, `Order=O2`, `Invoice=I1`). This format preserves links between events and objects—exactly what makes the object‑centric view possible.

## Glossary

- **Object / Object type:** The business entity (e.g., an **Order**) and its category (e.g., *orders*, *invoices*, *payments*).
- **Object creation / disposal nodes:** Markers that denote an object’s lifecycle start/end on an OCPM map.
- **Object‑flow edge:** A connection showing how objects of a given type typically move between activities (often color‑coded by object type).
- **Process execution**: Subgraph in interrelated objects using algorithm that starts from a single instance of a leading object and recursively looks at other objects related in multi-object-type events. The recursion is stopped when either another instance of a leading object type is identified or another instance of already investigated object type is identified and the distance from the leading object type instance is longer than the previously identified one.

## Summary

OCPM gives you a **faithful picture of complex processes** by following the actual objects that interact. In the one example above, OCPM makes it obvious that **shipping O2 depends on payment**, while case‑centric views must choose a single case notion and risk losing that cross‑object dependency. Use OCPM whenever **multi‑object interactions** define success, and use case‑centric views when a **single case** tells the story best.
