---
title: Process capacity
description: Learn how to allocate process capacity in Power Automate to machines or cloud flows for efficient unattended RPA and premium action execution.
author: cvassallo
ms.service: power-automate
ms.subservice: desktop-flow
ms.date: 04/23/2025
ms.author: cvassallo
ms.reviewer: angieandrews
contributors:
  - DanaMartens
ms.topic: conceptual
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/23/2025
---

# How to use process capacity

> [!NOTE]  
> Process capacity and Unattended RPA capacity have been combined in a single capacity pool and can be used interchangeably within the Power Automate platform. They have exactly the same value and role.

Within the Power Automate portal:

- Process capacity is based on a purchased [Process license](/power-platform/admin/power-automate-licensing/types).  
- Legacy Unattended RPA capacity is based on an [Unattended RPA add-on](/power-platform/admin/power-automate-licensing/add-ons#unattended-rpa-add-on).

Process capacity or legacy Unattended RPA capacity can be allocated to a machine or to a cloud flow.  

## Allocate Process capacity to a machine

When Process capacity is allocated to a machine, it becomes an *unattended bot*. Each unattended bot on a machine can carry one unattended desktop flow run at a time. So if a machine needs to execute multiple unattended runs simultaneously, it needs as many unattended bots as it has simultaneous unattended runs to perform.

To allocate Process capacity to a machine, go to the machine details page and select **Settings**.

:::image type="content" source="media/capacity-utilization/machine-page-0-bot.png" alt-text="Screenshot of the machine page showing no unattended bot allocated.":::

Use the **Unattended bots** slider to allocate some process capacity to the machine and save.

:::image type="content" source="media/capacity-utilization/machine-page-setting-1-bot-2.png" alt-text="Screenshot of the machine page settings with one unattended bot added.":::

You now have a machine that can perform unattended RPA.

> [!NOTE]
> - **Machine max bot supported** depends on your machine and its OS. The maximum value this parameter can reach is 10 (for some Windows Servers).  
> - **Available capacity in the environment** shows how many unattended bots can still be created. Keep in mind that the process capacity is a shared resource between all users within an environment and so use only what you need.  
> - **Enable auto-allocation** lets unattended bots be automatically allocated to a machine when an unattended run requires it. Multiple unattended bots can be auto-allocated for simultaneous unattended runs. Once auto-allocated, the unattended bots remain on the machine until manually deallocated.  
> - For a global overview of how process capacity is used within the environment, select the **Manage capacity utilization** link. It also provides an option to request more capacity.  

## Allocate process capacity to a cloud flow

When a process capacity is allocated to a cloud flow, it becomes a *Process plan*. This plan licenses the cloud flow to run premium actions independently from the user license, with a daily limit of 250,000 [Power Platform requests](/power-platform/admin/api-request-limits-allocations#Request-limits-in-power-automate).

To allocate process capacity to a cloud flow, go to the cloud flow details page and select **Edit**.

:::image type="content" source="media/capacity-utilization/cloud-flow-details-page-planChange2.png" alt-text="Screenshot of the cloud flow details page showing the option to change the plan.":::

> [!NOTE]
> At creation, a cloud flow is by default based on the user plan.

Change the plan used by the flow to **Process plan** and save.

:::image type="content" source="media/capacity-utilization/cloud-flow-process-allocation.png" alt-text="Screenshot of the cloud flow page settings showing the process plan allocation.":::

The cloud flow is now independent from the user license.

> [!NOTE]
> - Only solution flows (flows that are in a solution) can become process flows.
> - Stacking multiple process capacities on a single cloud flow isn't enabled yet.

## Related information

[Process capacity utilization](capacity-utilization-process.md)