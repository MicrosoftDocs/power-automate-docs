---
title: Operator role for Power Automate
description: Assign an operator role for robust monitoring capabilities without granting full administrative or maker permissions.
ms.topic: article
ms.date: 07/14/2026
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

- **Centralized control room**: Operators can use the automation center to monitor scheduled runs and desktop flow activity.
- **Compliance friendly**: Operators don't have edit rights on flows, reducing risk while enabling operational oversight.

## Known limitations

The operator role provides visibility into cloud flow run metadata through the Dataverse [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) table. However, be aware of the following limitations.

### Cloud flow run details (action inputs and outputs)

The operator role doesn't grant access to the detailed cloud flow run history served by the Power Automate runtime. Specifically, operators **can't**:

- View per-action inputs and outputs within a flow run.
- See expression evaluation results or retry details.
- Access the full trigger payload (inputs and outputs).
- Resubmit or cancel a cloud flow run.

Operators **can** see the following details for each run through the FlowRun table:

- Run status (Success, Failed, Cancelled).
- Start time and end time.
- Run duration.
- Error code and error message (summary level).
- Trigger type (Automated, Scheduled, Manual).
- Parent and child flow relationship.

> [!IMPORTANT]
> To investigate the root cause of a cloud flow failure at the action level, the flow owner must share the flow with the operator as a **co-owner** or **run-only user**. Learn more at [Share a cloud flow](create-team-flows.md).

### Solution flows only

The FlowRun table is populated only for cloud flows that are part of a [Dataverse solution](/power-apps/maker/data-platform/solutions-overview). Non-solution cloud flows don't write run metadata to Dataverse. Operators have no visibility into executions of non-solution cloud flows through this role.

### Desktop flows aren't affected

This limitation applies only to cloud flows. For desktop flows, the operator role provides full session-level detail through Dataverse tables, including machine and queue status, run duration, and error details.

## Workarounds

If your organization requires operators to have full cloud flow run detail access, consider the following options.

| Approach | Trade-off |
|----------|-----------|
| Share specific flows as **co-owner** with the operator | Grants edit permissions, which reduces separation of duties. |
| Share flows as **run-only user** | Grants run and view-run-history access without edit permissions. |
| Use the **Power Automate Management connector** in a monitoring flow | Requires a Premium-licensed service account. Can export action-level details to a shared location. |

## Related information

- [Manage cloud flow run history in Dataverse](dataverse/cloud-flow-run-metadata.md)
- [Share a cloud flow](create-team-flows.md)
- [Automation center overview](automation-center-overview.md)

