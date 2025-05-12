---
title: Overview of the Control Center
description: Learn how control fits with your environment and within the Automation Kit
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/04/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Overview of the Control Center

The Automation Kit control center has been designed to complement the existing [Monitor desktop flow runs](../../desktop-flows/monitor-desktop-flow-runs.md). The key focus of the control center is an orchestrator view for support analysts and organizations to monitor, take action and alert if necessary.

The control center solution is an optional component can be installed independent or along side the Automation Kit Main or Satellite solutions.

## Key features

Key features of the Automation Kit control center

- [Scheduler](./control-center-desktop-flow-scheduler.md) - Provides a schedule of recurring desktop flows called from a cloud flow.
- [Monitoring](./control-center-desktop-flow-monitoring.md) - Filter by Cloud flow to view and monitor the status and run data
- [Audit](./control-center-desktop-flow-audit-logs.md) - Query and filter Dataverse Audit log data for configured tables
- [Voluminous Data](./control-center-historical-voluminous-data-monitoring.md) - Provide the optional ability to integrate with Data Warehouse to provide data analytics

## Power BI comparison

Compared to the Daily Flow Run Power BI template and the Automation Kit Power BI dashboard the control center is focused on interactive monitoring. The page provides contextual actions to act on the most recent transactional data. The Power BI reports are more focused on analytical use cases where the most recent data isn't always needed or to share with different organizational stakeholders.

## Roadmap

The following items are being considered for the control center:

- Alert notification - The ability to configure notifications for schedules and monitored flows
- Monitoring - Desktop Flow provide actions to act on the data. For example, Run a Cloud / Desktop flow
- Automated Test - Execute and monitor automated test results
- Environment Selection - The ability to select the environment so that the same application can be used across multiple environments
- Work Queue integration - The ability to monitor work queue metrics and schedules
