---
title: Operator role for Power Automate
description: Assign an operator role for robust monitoring capabilities without granting full administrative or maker permissions
ms.topic: article
ms.date: 11/17/2025
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: quseleba
ms.collection: conceptual
ms.custom: ignite-2025
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Operator Role 

## What is the Operator Role?
The **Operator role** is a dedicated security role designed for organisations that need robust monitoring capabilities without granting full administrative or maker permissions. It addresses a common scenario where:

- Makers typically **cannot access production environments** for compliance and governance reasons.
- Organisations still need visibility into automation performance and the ability to act on operational issues.

This new role enables a clear separation of duties: **operators monitor and manage runs**, while makers focus on building flows.

---

## Key Responsibilities of an Operator
Operators are **not makers**—they cannot create or edit flows—but they have extended visibility and control over operational aspects:

- **Monitor Automations**
  - View all flows and their run history across environments.
  - Check success/failure status and identify error causes.
  - Export logs for auditing or troubleshooting.

- **Observability & Reporting**
  - Access dashboards and logs for operational insights.
  - Communicate issues or escalate to decision-makers.

---

## Permissions Overview

| **Object/Table**       | **Environment Admin** | **Operator** |
|------------------------|------------------------|--------------|
| Flow (Create/Edit/Delete) | 🟡 (Own) | ❌ |
| Flow Run (Create/Read)    | 🟡 (Own) | ✅ (Global) |
| Machine, Queue, Credential (Read) | 🟡 (Own) | ✅ (Global) |
| Export Logs               | 🟡 (Own) | ✅ (Global) |

---

## How to Assign a Dataverse Role

To assign the Operator role (or any Dataverse security role) to a user:

1. Navigate to **Power Platform Admin Centre**.
2. Select the **Environment** where you want to assign the role.
3. Go to **Settings > Users + Permissions > Users**.
4. Choose the user and click **Manage Roles**.
5. Select **Power Automate Operator** from the list and save.


---

## Implications for Monitoring
- **Centralized Control Room**: Operators can use the Automation Center to monitor all scheduled runs and desktop flow activity.
- **Compliance-Friendly**: Operators do not have edit rights on flows, reducing risk while enabling operational oversight.

``

