---
title: Share Process license capacity with flow groups
description: Learn how flow groups let multiple Power Automate cloud flows share Process license capacity, with up to 25 flows per group.
author: radioblazer
ms.subservice: cloud-flow
ms.topic: concept-article
ms.date: 07/31/2026
ms.author: matow
ms.reviewer: angieandrews
ai-usage: ai-assisted
search.audienceType:
  - maker
  - admin
---

# Share Process license capacity with flow groups

A *flow group* lets you share the capacity of a Power Automate Process license across multiple cloud flows, instead of dedicating a license to each flow separately. A group can contain up to *25 solution-aware cloud flows*. Parent and child flows are separate group members; adding a parent flow to a group doesn't add its child flows automatically.

## Why use flow groups

- **Reduce cost**: Share one Process license across up to 25 flows instead of buying one per flow.
- **Improve utilization**: Reclaim unused capacity from flows that don't individually need 250,000 actions per day.
- **Simplify management**: Treat related flows (for example, all flows for one business process) as a single licensed unit.

## How capacity works

A Process license provides 250,000 actions per day. When you assign it to a flow group, all flows in the group share that 250,000-action daily pool. Consumption is measured against the group total, not per individual flow.

Only flows that you explicitly add to the group use its shared Process capacity. If a group member calls a child flow, add the child flow to the same group separately if you want it to use the shared capacity. The child flow doesn't inherit the group's Process capacity from its parent.

License stacking (assigning multiple Process licenses for higher capacity) isn't available for flow groups. If a flow needs more than 250,000 actions per day, assign Process licenses directly to that individual flow instead.

## Prerequisites

- A Power Automate Process license with available capacity in the environment. (You must have available Process capacity to assign when you create the group in [Power Automate](https://make.powerautomate.com).)
- Cloud flows **stored in a solution** (solution-aware).
- Power Automate **maker permissions**.

## What's eligible

| Eligible | Not eligible |
|:----------:|--------------|
| Solution-aware parent and child cloud flows that you explicitly add to the group | Cloud flows not in a solution |
|n/a | Desktop flows (RPA) |
|n/a| Business process flows |
|n/a | Flows already covered by a per-user Power Automate plan |

## Limits

| Limit | Value |
|-------|-------|
| Flows per group | 25 total flow members. Each parent or child flow you add to the group counts separately. |
| Process licenses per group | 1 (250,000 actions per day). Stacking isn't available for flow groups. |
| Scope | Single environment |
| Group membership | A flow can belong to only one group at a time |

## Related information

- [Create and manage a flow group](create-flow-group.md)
- [Power Automate licensing](/power-platform/admin/power-automate-licensing/types)
