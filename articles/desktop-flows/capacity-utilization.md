---
title: Capacity utilization within Power Automate
description: apacity utilization within Power Automate
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.reviewer: 
---

# Capacity utilization within Power Automate

> [!IMPORTANT]
> - This feature is in preview.
> - In the January 2024 release, the capacity utilization page only details hosted RPA capacity utilization
> - Later in Q1 2024, a detailed breakdown of the Process capacity / Unattended RPA capacity utilization will be added to the page

<br/>

## Reminder on capacity within Power Automate

Within the Power Automate platform, a <b>‘Capacity’</b> is a purchased item (that can be a license or an add-on) assigned to an the environment [(see how to assign capacity to environments)](https://learn.microsoft.com/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) that can be utilized by a specific Power Automate object allowing it to carry out premium operation. 
<br/><br/>
Currently, there are 3 types of capacity that can be utilized by Power Automate objects : 
<br/><br/>

|Capacity|Power Automate object|Consumption mode|Premium operation enabled|
|----|--------------------|----|----|
|Hosted RPA capacity|Hosted machine|[Auto-allocation](# "Hosted RPA capacity is auto-allocated at hosted machine creation.")|To be created, each hosted machine requires an hosted RPA capacity allocated.|
|Hosted RPA capacity|Hosted machine group|Manual commitment|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot when required.|
|Process capacity / Unattended RPA capacity (legacy)|Machine|Manual allocation & [auto-allocation](# "Capacity can be auto-allocated at unattended desktop flow run time.")|Every capacity allocated to a machine allows it to carry out an extra unattended desktop flow run concurrently.|
|Process capacity / Unattended RPA capacity (legacy)|Cloud flow|Manual allocation & [auto-allocation](# "Capacity can be auto-allocated at cloud flow save time for service principal owned cloud flow")|Every capacity assigned to a cloud flow enables it, along with all its associated cloud flows, to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests (stackable limit).|



> [!NOTE]
> - The Process capacity and the Unattended RPA capacity (legacy) have been combined in a single pool. They can seamlessly be utilized by machines or cloud flows.
> - Although the Per Flow Plan is a capacity that can be allocated to a cloud flow, it is not incorporated into the capacity utilization page. It is indeed being phased out in favor of the Process capacity.

<br/>

## Overview page

The capacity utilization page offers an overview of the environment capacity, detailing their usage and providing suggestions and insights for more efficient management of automations and the desktop infrastructure.

The overview page provides:
- A breakdown of each capacity utilization (my consumption / others' consumption / capacity available / capacity in overage)
- Insights and recommendation over compliance issues

<br/>

![Capacity Utilization overview page](media/capacity-utilization/capacity-utilization-MVP-overview.png)
<br/><br/>

The 2 pie charts underscore the crucial point that, within a given environment, capacity is a <b>limited resource that users may compete for</b>, necessitating priorization of use cases.<br/><br/>


## Hosted RPA capacity

#### Hosted RPA capacity overview

The hosted RPA capacity overview pie chart helps the user understand what's his share of hosted capacity consumption within the environment compared to the other makers, let him known if there is still capacity to scale-up in the future and alerts him when his objects are exceeding environment capacity (= overage): 

||Legend|Description|
|----|--------------------|----|
|![Legend color - Allocated to my hosted machines](media/capacity-utilization/legend-allocated-to-my-hosted-machines.png)|Allocated to my hosted machines|Compliant capacity allocated to hosted machines that the user own or which are shared with him.|
|![Legend color - Committed to my hosted machine groups](media/capacity-utilization/legend-committed-to-my-hosted-machine-groups.png)|Committed to my hosted machine groups|Compliant capacity committed to hosted machine groups that the user own or which are shared with him.|
|![Legend color - Utilized by other makers](media/capacity-utilization/legend-utilized-by-other-makers.png)|Utilized by other makers|Compliant capacity allocated or committed to objects which the user do not own and were not shared with him.|
|![Legend color - Available capacity](media/capacity-utilization/legend-available-capacity.png)|Available capacity|Available capacity for new hosted machines or new committed bots on hosted machine groups.|
|![Legend color - My overage utilization](media/capacity-utilization/legend-my-overage-utilization.png)|My overage utilization|Sum of capacity over-allocated to hosted machines and over-committed to hosted machine groups which the user own or are shared with him|
|![Legend color - Overage by other makers](media/capacity-utilization/legend-overage-by-other-makers.png)|Overage by other makers|Sum of capacity over-allocated and over-committed to objects which the user do not own and were not shared with him.|

#### Hosted RPA capacity insights 

The hosted RPA capacity insights informs the user of operation health and gives him recommendation in case of compliance issues:

|Badge||Description|
|----|--------------------|----|
|![Badge - Sufficient capacity](media/capacity-utilization/badge-sufficient-capacity.png)|Available ||
|![Badge - Fully utilized](media/capacity-utilization/badge-fully-utilized.png)|Allocated to my hosted machines||
|![Badge - Capacity overage](media/capacity-utilization/badge-capacity-overage.png)|Allocated to my hosted machines||
|![Badge - Sufficient pool](media/capacity-utilization/badge-sufficient-pool.png)|Allocated to my hosted machines||
|![Badge - Empty pool](media/capacity-utilization/badge-empty-pool.png)|Allocated to my hosted machines||





