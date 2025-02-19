---
title: Control center desktop flow audit logs
description: Learn how to setup and use control center desktop flow audit logs
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/04/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Control Center desktop flow audit logs

The Control Center desktop flow audit logs feature allows you to retrieve audit data for Power Automate desktops. You can configure audit logs for specific Microsoft Dataverse tables. Doing this provides valuable insights into activities related to Power Automate desktop flows.

Use audit log monitoring to observe changes to the following Dataverse tables: [Flow Session](/power-apps/developer/data-platform/reference/entities/flowsession), [Flow Machine](/power-apps/developer/data-platform/reference/entities/flowmachine), [Flow Machine Group](/power-apps/developer/data-platform/reference/entities/flowmachinegroup), [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue), [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueue), [Desktop Flow Module](/power-apps/developer/data-platform/reference/entities/desktopflowmodule), [Desktop Flow Binary](/power-apps/developer/data-platform/reference/entities/desktopflowbinary), [Flow Machine Image](/power-apps/developer/data-platform/reference/entities/flowmachineimage), [Flow Machine Image Version](/power-apps/developer/data-platform/reference/entities/flowmachineimageversion) and [Flow Machine Network](/power-apps/developer/data-platform/reference/entities/flowmachinenetwork).

:::image type="content" source="./media/aa-control-center-desktop-flow-audit-logs.png" alt-text="Screenshot of Automation Kit Control Center desktop flow audit logs.":::

## Prerequisites

Before using Control Center Desktop Flow Audit Logs, make sure to complete the following prerequisites:

- **Configure Audit for an Environment**: To set up auditing, follow the instructions in the [Microsoft documentation](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment).

- **Configure Auditing for Tables and Columns in Power Apps**: To enable auditing for specific tables and columns in Power Apps, refer to the [Microsoft documentation](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-one-or-more-tables-and-columns-in-power-apps).

- **Add Users to Desktop Flows Support Analyst Role**: The Control Center installs a new role called **Desktop Flows Support Analyst**. Users need to be added to this custom security role to get access to the provision of new Audit logs.

## Default audit logs data

By default, the Audit Logs load data for the last one week. However, you have the flexibility to filter logs based on specific dates and view all changed attributes.

## Learn more

To learn more about configuring auditing and utilizing Control Center desktop flow audit logs, check out the following Microsoft documentation:

- [Configure auditing for an environment](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment)
- [Configure auditing for one or more tables and columns in Power Apps](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-one-or-more-tables-and-columns-in-power-apps)

With Control Center Desktop flow audit logs, you can gain valuable insights into your Power Automate desktops' activities and ensure better traceability and compliance.
