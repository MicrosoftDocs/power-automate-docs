---
title: Capacity utilization within Power Automate
description: Capacity utilization within Power Automate
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.reviewer: 
---

# Capacity utilization within Power Automate (preview)

> [!IMPORTANT]
> - The capacity utilization page is in preview.
> - In the current release, the capacity utilization page details only hosted RPA capacity utilization.
> - A future release in Q2 2024 will incoporate the Process license utilization by machines and cloud flows

<br/>

## Reminder on capacity within Power Automate

Within the Power Automate platform, a **‘Capacity’** is a purchased item (that can be a license or an add-on) assigned to an the environment [(see how to assign capacity to environments)](https://learn.microsoft.com/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) that can be utilized by a specific Power Automate object allowing it to carry out specific operations. 
<br/><br/>
You can manage the following capacity within the capacity utilization page: 
<br/><br/>

|Capacity|Consuming Power Automate object|Consumption mode|Operation enabled|
|----|--------------------|----|----|
|Hosted RPA capacity|Hosted machine|[Auto-allocation](# "Hosted RPA capacity is auto-allocated to the hosted machine at its creation.")|To be created, each hosted machine requires an hosted RPA capacity allocated.|
|Hosted RPA capacity|Hosted machine group|Manual allocation of committed bots|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot during auto-scaling.|
|Process capacity (or legacy Unattended RPA capacity)|Machine|[Auto-allocation](# "Capacity is auto-allocated to the machine at unattended desktop flow run time.")|Every capacity allocated to a machine allows it to carry out an additional unattended desktop flow run concurrently.|
|Process capacity|Cloud flow|Manual allocation|Every capacity allocated to a cloud flow enables it, along with all its associated cloud flows, to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests (stackable limit).|

> [!NOTE]
> - The Process capacity and the Unattended RPA capacity (legacy) have been combined in a single pool. They can seamlessly be utilized by machines (and coming in Q2 2024, by cloud flows).
> - The detailed allocation of those capacities (to machines and cloud flows) will be incorporated in the capacity utilization page in Q2 2024.

<br/>

## Capacity utilization overview page

The capacity utilization page offers an overview of the environment-assigned capacities, detailing their usage and providing suggestions and insights for more efficient management of automations and the desktop infrastructure.

The overview page provides for 1) **Hosted RPA capacity** and 2) **Unattended RPA capacity** : 
- A breakdown of each capacity utilization (user's consumption / others' consumption / capacity available / capacity in overage)
- Insights and recommendation over compliance issues

<br/>

![Capacity Utilization overview page](media/capacity-utilization/capacity-utilization-MVP-overview.png)
<br/><br/>

The 2 pie charts underscore the point that, within a given environment, capacity is a <b>limited resource that users are sharing</b>, necessitating priorization of use cases.<br/><br/>


## Per-capacity details pages

### 1. [Hosted RPA capacity utilization](capacity-utilization-hosted.md)

The Hosted RPA capacity allows to run desktop flows with zero infrastructure. It is allocated to hosted machines or committed to hosted machine groups. 

### 2. [Process (or legacy Unattended RPA) capacity utilization](capacity-utilization-process.md)

The Process capacity (or legacy Unattended RPA capacity) is needed to run desktop flows in unattended mode. Every capacity allocated to a machine allows it to carry out an additional unattended desktop flow run concurrently.

<br/><br/>






