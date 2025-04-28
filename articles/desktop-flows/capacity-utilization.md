---
title: Capacity utilization within Power Automate
description: Learn how to manage and optimize capacity utilization in Power Automate, including Hosted Process and Process capacities, for efficient automation.
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

# Capacity utilization within Power Automate

The capacity utilization page provides you with insights into how your [Hosted Process capacity](/power-platform/admin/power-automate-licensing/add-ons#hosted-rpa-add-on) capacity, [Process capacity](/power-platform/admin/power-automate-licensing/types), or legacy [Unattended RPA capacity](/power-platform/admin/power-automate-licensing/add-ons#unattended-rpa-add-on) are being used within your environment. Within the Power Automate platform, each capacity is based on a purchased add-on or license. It's [assigned to the environment](/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) and allows specific Power Automate objects to carry out specific operations.

You manage the following capacity within the capacity utilization page:

|Capacity|Consuming Power Automate object|Consumption mode|Operation enabled|
|----|--------------------|----|----|
|Hosted Process capacity|Hosted machine|[Autoallocation](# "Hosted Process capacity is autoallocated to the hosted machine at its creation.")|To be created, each hosted machine requires a Hosted Process capacity allocated.|
|Hosted Process capacity|Hosted machine group|Manual allocation of committed bots|Every Hosted Process capacity committed to a hosted machine group guarantees the availability of a bot during autoscaling.|
|Process capacity (or legacy unattended RPA capacity)|Machine|[Autoallocation](# "Capacity is autoallocated to the machine at unattended desktop flow run time.")|Every capacity allocated to a machine allows it to carry out another unattended desktop flow run simultaneously.|
|Process capacity|Cloud flow|Manual allocation|Every capacity allocated to a cloud flow enables it, along with all its associated cloud flows, to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests (stackable limit).|

> [!NOTE]
>
> We combined Process capacity and Unattended RPA capacity (legacy) into a single pool. Machines can seamlessly use them.

## Capacity utilization overview page

The capacity utilization page offers an overview of the environment-assigned capacities. It details their usage and provides suggestions and insights for more efficient management of automation and the desktop infrastructure.

The overview page provides insights for Hosted Process capacity, Process capacity, or legacy Unattended RPA capacity including:

- A breakdown of each capacity utilization (user's consumption / others' consumption / capacity available / capacity in overage).
- Insights and recommendation on compliance issues.

:::image type="content" source="media/capacity-utilization/capacity-utilization-overview.png" alt-text="A screenshot of the capacity Utilization overview page":::

The two pie charts underscore the point that, within a given environment, capacity is a limited resource that users are sharing, necessitating prioritization of use cases.

## Per-capacity details pages

### Hosted Process capacity utilization

[Hosted Process capacity](capacity-utilization-hosted.md) allows you to run desktop flows with zero infrastructure. It's allocated to hosted machines or committed to hosted machine groups.

### Process (or legacy unattended RPA) capacity utilization

[Process capacity or legacy Unattended RPA capacity](capacity-utilization-process.md) are needed to run desktop flows in unattended mode. Every capacity allocated to a machine allows it to carry out another unattended desktop flow run simultaneously. It can also be allocated to a cloud flow to license it independently from user license.

## Related information

[Process and Unattended RPA capacity utilization](capacity-utilization-process.md)

[Hosted Process capacity utilization](capacity-utilization-hosted.md)
