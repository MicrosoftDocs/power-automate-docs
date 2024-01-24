---
title: Capacity utilization within Power Automate
description: Capacity utilization within Power Automate
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.reviewer: 
ms.topic: conceptual
---

# Capacity utilization within Power Automate (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](actions-reference/includes/cc-beta-prerelease-disclaimer.md)]

The **Capacity utilization page** provides you with insights into how your hosted RPA capacity and Process capacity (or legacy Unattended RPA capacity) is being used within your environment. As a reminder, within the Power Automate platform each capacity is based on a purchased add-on or license which is [assigned to the environment](/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) and allows specific Power Automate objects to carry out specific operations. 

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

You can manage the following capacity within the capacity utilization page: 

|Capacity|Consuming Power Automate object|Consumption mode|Operation enabled|
|----|--------------------|----|----|
|Hosted RPA capacity|Hosted machine|[Auto-allocation](# "Hosted RPA capacity is auto-allocated to the hosted machine at its creation.")|To be created, each hosted machine requires a hosted RPA capacity allocated.|
|Hosted RPA capacity|Hosted machine group|Manual allocation of committed bots|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot during auto-scaling.|
|Process capacity (or legacy Unattended RPA capacity)|Machine|[Auto-allocation](# "Capacity is auto-allocated to the machine at unattended desktop flow run time.")|Every capacity allocated to a machine allows it to carry out an additional unattended desktop flow run simultaneously.|
|Process capacity|Cloud flow|Manual allocation|Every capacity allocated to a cloud flow enables it, along with all its associated cloud flows, to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests (stackable limit).|

> [!NOTE]
> 
> - The Process capacity and the Unattended RPA capacity (legacy) have been combined in a single pool. They can seamlessly be utilized by machines (and coming in Q2 2024, by cloud flows).
> - The detailed allocation of those capacities (to machines and cloud flows) will be incorporated in the capacity utilization page in Q2 2024.

## Capacity utilization overview page

The capacity utilization page offers an overview of the environment-assigned capacities. It details their usage and provides suggestions and insights for more efficient management of automations and the desktop infrastructure.

The overview page provides for 1) **Hosted RPA capacity** and 2) **Process capacity (or legacy Unattended RPA capacity)** : 
- A breakdown of each capacity utilization (user's consumption / others' consumption / capacity available / capacity in overage)
- Insights and recommendation on compliance issues

![Capacity Utilization overview page](media/capacity-utilization/capacity-utilization-MVP-overview.png)

The 2 pie charts underscore the point that, within a given environment, capacity is a <b>limited resource that users are sharing</b>, necessitating priorization of use cases.

## Per-capacity details pages

### 1. [Hosted RPA capacity utilization](capacity-utilization-hosted.md)

The Hosted RPA capacity allows a user to run desktop flows with zero infrastructure. It's allocated to hosted machines or committed to hosted machine groups. 

### 2. [Process (or legacy Unattended RPA) capacity utilization](capacity-utilization-process.md)

The Process capacity (or legacy Unattended RPA capacity) is needed to run desktop flows in unattended mode. Every capacity allocated to a machine allows it to carry out an additional unattended desktop flow run simultaneously.






