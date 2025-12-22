---
title: Operator role for Power Automate
description: Assign an operator role for robust monitoring capabilities without granting full administrative or maker permissions.
ms.topic: article
ms.date: 11/18/2025
ms.author: quseleba
ms.reviewer: angieandrews
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

# Operator role

The *operator role* is a dedicated security role designed for organizations that need robust monitoring capabilities without granting full administrative or maker permissions. It addresses a common scenario where:

- Makers typically can't access production environments for compliance and governance reasons.
- Organizations still need visibility into automation performance and the ability to act on operational issues.

The operator role enables a clear separation of duties: *operators* monitor and manage runs, and *makers* focus on building flows.

## Key responsibilities of an operator

Operators aren't makers&mdash;they can't create or edit flows&mdash;but they have extended visibility and control over operational aspects.

- **Monitor automations**
  - View all flows and their run history across environments.
  - Check success/failure status and identify error causes.
  - Export logs for auditing or troubleshooting.

- **Observability and reporting**
  - Access dashboards and logs for operational insights.
  - Communicate issues or escalate to decision makers.

## Permissions overview

| Object/Table       | Environment admin | Operator |
|------------------------|------------------------|--------------|
| Flow (create/edit/delete) | 🟡 (Own) | ❌ |
| Flow run (create/read)    | 🟡 (Own) | ✅ (Global) |
| Machine, queue, credential (read) | 🟡 (Own) | ✅ (Global) |
| Export logs               | 🟡 (Own) | ✅ (Global) |

## Assign a Dataverse role

To assign the Operator role (or any Dataverse security role) to a user:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane to the left, select **Manage**.
1. In the **Environment** column, select the environment name for which you want to assign the role.
1. On the command bar at the top, select **Settings**.
1. On the **Settings** page, select **Users + permissions** > **Users**.
1. Select the user, and then select the **Manage security roles** tab.
1. Select **Power Automate Operator** > **Save**.

## Implications for monitoring
`
- **Centralized control room**: Operators can use the automation center to monitor scheduled runs and desktop flow activity.
- **Compliance friendly**: Operators don't have edit rights on flows, reducing risk while enabling operational oversight.

