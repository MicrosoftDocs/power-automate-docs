---
title: Process capacity
description: How to use process capacity
author: cvassallo
ms.subservice: desktop-flow
ms.date: 03/20/2024
ms.author: cvassallo
ms.reviewer: matp
contributors:
- DanaMartens
ms.topic: conceptual
---

# How to use process capacity

> [!NOTE]
>
> Process capacity and Unattended RPA capacity have been combined in a single capacity pool and can be used interchangeably within the Power Automate platform. They have exactly the same value and role.

Within the Power Automate portal:

- Process capacity is based on a purchased [Process license](/power-platform/admin/power-automate-licensing/types).
- Legacy Unattended RPA capacity is based on an [Unattended RPA add-on](/power-platform/admin/power-automate-licensing/add-ons#unattended-rpa-add-on).

Process capacity or legacy Unattended RPA capacity can be allocated to a machine or to a cloud flow.

## Allocate Process capacity to a machine

When Process capacity is allocated to a machine, it becomes an *unattended bot*. Each unattended bot on a machine can carry one unattended desktop flow run at a time. So if a machine needs to execute multiple unattended runs simultaneously, it needs as many unattended bots as it has simultaneous unattended runs to perform.

To allocate Process capacity to a machine, go to the machine details page and select **Settings**.

![Machine page - No unattended bot](media/capacity-utilization/machine-page-0-bot.png)

Use the **Unattended bots** slider to allocate some process capacity to the machine and save.

![Machine page - Settings - Add one unattended bot](media/capacity-utilization/machine-page-setting-1-bot-2.png)

You now have a machine that can perform unattended RPA.

> [!NOTE]
>
> - **Machine max bot bot supported** depends on your machine and its OS. The maximum value this parameter can reach is 10 (for some Windows Servers).
> - **Available capacity in the environment** shows how many unattended bots can still be created. Keep in mind that the process capacity is a shared resources between all users within an environment and so use only what you need.
> - **Enable auto-allocation** allows unattended bots to automatically be allocated to a machine when an unattended run requires it. Multiple unattended bots can be auto-allocated in case of simultaneous unattended runs. Once auto-allocated, the unattended bots remain on the machine until manually deallocated.
> - For a global overview on how Process capacity is used within the environment, use the **Manage capacity utilization** link. It also provides the option to request more capacity.

## Allocate Process capacity to a cloud flow

When Process capacity is allocated to a cloud flow, it becomes a *Process plan* based on which the cloud flow is licensed to run premium actions independently from the user license with a 250k Power Platform Request daily limit.

To allocate a Process capacity to a cloud flow, go to the cloud flow details page and select **Edit**.

![Cloud flow page - User plan](media/capacity-utilization/cloud-flow-user-plan.png)

> [!NOTE]
>
> At creation, a cloud flow is by default based on the user plan.

Change the plan used by the flow to **Process plan** and save.

![Cloud flow page - Settings - Process plan](media/capacity-utilization/cloud-flow-process-allocation.png)

The cloud flow is now independent from the user license.

> [!NOTE]
>
> Stacking multiple Process capacity on a single cloud flow is not yet enabled.

## Related information

[Process capacity utilization](capacity-utilization-process.md)
