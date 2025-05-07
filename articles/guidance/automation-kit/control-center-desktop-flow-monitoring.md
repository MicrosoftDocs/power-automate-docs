---
title: Control Center desktop flow monitoring
description: Learn how to use control center desktop flow monitoring.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/08/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Control Center desktop flow monitoring

In the Automation Kit, the Control Center offers comprehensive desktop flow monitoring capabilities, allowing users to check the health of all running processes. This monitoring feature provides users with the option to view the overall status of processes at a general level and the ability to drill down to individual process details.

:::image type="content" source="./media/control-center-desktop-flow-monitoring.png" alt-text="Screenshot of Automation Kit Control Center desktop flow monitoring.":::

## Security

To see desktop flows monitoring data, the following must be set up:

1. The Cloud flow and desktop flow must be part of a solution
1. The user be an owner or have the had the flow shared with them
1. Belong to a Security role like the **System Customizer** to see all flows in the environment

## Access desktop flow monitoring

To access the desktop flow monitoring features, follow these steps:

1. On in the Control Center interface, select the **Monitoring** tab.

1. Select **Desktop Flows** to access the monitoring dashboard specifically for desktop flow processes.

## Detailed run log and transactional data

The monitoring dashboard provides detailed run logs and transactional data for all desktop flow processes. Users can visualize the performance and status of each process, including the number of successful and failed executions.

## Default data loaded for last 1 day

By default, the monitoring dashboard loads data for the last one day. Users can easily analyze the recent performance of their desktop flow processes without the need to manually adjust the date range.

## Auto refresh with 60-second cadence

The monitoring dashboard supports an autorefresh feature with a cadence of 60 seconds. This feature allows users to stay up-to-date with real-time data, ensuring they have the latest insights into the performance of their desktop flow processes.

## Visualize and filter at individual process level

With the Control Center's desktop flow monitoring, users can easily visualize and filter data at the individual process level. This capability enables users to focus on specific processes and gain in-depth insights into their performance.

Overall the desktop flow monitoring feature, users can efficiently manage and optimize their desktop flow processes, ensuring smooth and reliable automation within their organization.
