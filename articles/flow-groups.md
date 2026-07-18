---
title: Share Process license capacity with flow groups
description: Learn how flow groups let multiple Power Automate cloud flows share Process license capacity, with up to 25 flows per group.
author: radioblazer
ms.subservice: cloud-flow
ms.topic: concept-article
ms.date: 07/17/2026
ms.author: matow
ms.reviewer: angieandrews
ai-usage: ai-assisted
search.audienceType:
  - maker
  - admin
---

# Share Process license capacity with flow groups

A *flow group* lets you share the capacity of a Power Automate Process license across multiple cloud flows, instead of dedicating a license to each flow separately. A group can contain up to *25 cloud flows* and their child flow runs.

## Why use flow groups

- **Reduce cost**: Share one Process license across up to 25 flows instead of buying one per flow.
- **Improve utilization**: Reclaim unused capacity from flows that don't individually need 250,000 actions per day.
- **Simplify management**: Treat related flows (for example, all flows for one business process) as a single licensed unit.

## How capacity works

A Process license provides 250,000 actions per day. When you assign it to a flow group, all flows in the group share that 250,000-action daily pool. Consumption is measured against the group total, not per individual flow.

License stacking (assigning multiple Process licenses for higher capacity) isn't available for flow groups. If a flow needs more than 250,000 actions per day, assign Process licenses directly to that individual flow instead.

## Prerequisites

- A Power Automate Process license with available capacity in the environment. (You must have available Process capacity to assign when you create the group in [Power Automate](https://make.powerautomate.com).)
- Cloud flows **stored in a solution** (solution-aware).
- Power Automate **maker permissions**.

## What's eligible

| Eligible | Not eligible |
|:----------:|--------------|
| Solution-aware cloud flows and their child flow runs | Cloud flows not in a solution |
|n/a | Desktop flows (RPA) |
|n/a| Business process flows |
|n/a | Flows already covered by a per-user Power Automate plan |

## Limits

| Limit | Value |
|-------|-------|
| Flows per group | 25 (includes child flow runs) |
| Process licenses per group | 1 (250,000 actions per day). Stacking isn't available for flow groups. |
| Scope | Single environment |
| Group membership | A flow can belong to only one group at a time |

## Related information

- [Create and manage a flow group](create-flow-group.md)
- [Power Automate licensing](/power-platform/admin/power-automate-licensing/types)
