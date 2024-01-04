---
title: Capacity utilization within Power Automate
description: apacity utilization within Power Automate
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.reviewer: 
---

# Hosted RPA Capacity utilization

> [!IMPORTANT]
> - The capacity utilization page is in preview.

<br/>

## Reminder on Hosted RPA capacity 

Within the Power Automate platform, the <b>‘Hosted RPA capacity’</b> is a purchased item (an add-on) assigned to the environment [(see how to assign capacity to environments)](https://learn.microsoft.com/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) which allows to run desktop flows with zero infrastructure. It is allocated to hosted machine or committed to hosted machine groups :
<br/><br/>

|Consumming object|Description|Consumption mode|
|----|--------------------|----|
|Hosted machine|To be created, each hosted machine requires an hosted RPA capacity allocated.|Hosted RPA capacity is auto-allocated to hosted machine at its creation.|
|Hosted machine group|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot during auto-scaling (= committed bot). This ensures that the necessary resources will always be available for processing your flows.|Manual commitment on hosted machine group.|

> [!NOTE]
> - A committed capacity to an hosted machine group is still part of the common pool available to all hosted machine group
> - The hosted machine group with the committment just has the priority of usage over all concurrent hosted machine groups

<br/>


## Hosted RPA capacity overview

The hosted RPA capacity overview pie chart helps the user understand what's his share of hosted capacity consumption within the environment compared to the other makers, let him known if there is still capacity to scale-up in the future and alerts him when his objects are exceeding environment capacity (= overage): 

![Hosted capacity overview](media/capacity-utilization/hosted-capacity-overview.png)

||Legend|Description|
|----|--------------------|----|
|![Legend color - Allocated to my hosted machines](media/capacity-utilization/legend-allocated-to-my-hosted-machines.png)|Allocated to my hosted machines|Compliant capacity allocated to hosted machines that the user own or which are shared with him.|
|![Legend color - Committed to my hosted machine groups](media/capacity-utilization/legend-committed-to-my-hosted-machine-groups.png)|Committed to my hosted machine groups|Compliant capacity committed to hosted machine groups that the user own or which are shared with him.|
|![Legend color - Utilized by other makers](media/capacity-utilization/legend-utilized-by-other-makers.png)|Utilized by other makers|Compliant capacity allocated or committed to objects which the user do not own and were not shared with him.|
|![Legend color - Available capacity](media/capacity-utilization/legend-available-capacity.png)|Available capacity|Available capacity for new hosted machines or new committed bots on hosted machine groups.|
|![Legend color - My overage utilization](media/capacity-utilization/legend-my-overage-utilization.png)|My overage utilization|Sum of capacity over-allocated to hosted machines and over-committed to hosted machine groups which the user own or are shared with him|
|![Legend color - Overage by other makers](media/capacity-utilization/legend-overage-by-other-makers.png)|Overage by other makers|Sum of capacity over-allocated and over-committed to objects which the user do not own and were not shared with him.|

<br/><br/>
## Hosted RPA capacity insights 

The hosted RPA capacity insights informs the user of operation health and gives him recommendation in case of compliance issues:

![Hosted capacity insight](media/capacity-utilization/hosted-capacity-insight.png)

|Badge|Message|Insight|
|----|--------------------|----|
|![Badge - Sufficient capacity](media/capacity-utilization/badge-sufficient-capacity.png)|There is available capacity for new hosted machines or committed bots on hosted machine groups.|Scale-up possible in the future|
|![Badge - Fully utilized](media/capacity-utilization/badge-fully-utilized.png)|There is no more capacity for new hosted machines or committed bots on hosted machine groups.|The capacity utilization rate is optimal at 100% but there is no room for scaling-up.|
|![Badge - Capacity overage](media/capacity-utilization/badge-capacity-overage.png)|User has some over-allocated capacity to his hosted machines or/and over-committed bots to his hosted machine groups.|Uncompliant capacity usage exceeding environment capacity.|
|![Badge - Sufficient pool](media/capacity-utilization/badge-sufficient-pool.png)|There is a non-empty pool of capacity shared by all hosted machine groups.|All hosted machine groups theoratically have access to at least 1 bot.|
|![Badge - Empty pool](media/capacity-utilization/badge-empty-pool.png)|The capacity pool shared by all hosted machine groups is empty.|Hosted machine groups won’t be able to spin-up bots when needed. All automation based on them will fail.|

> [!NOTE]
> - All hosted machine groups share a pool of hosted capacity made of the available capacity and the compliant committed capacity within the environment (which value can be retrieved on the overview pie chart).
> - For example 1 available capacity (non-allocated to a hosted machine and non-committed to an hosted machine group) will be pooled between all the hosted machine groups with a first arrive first served behavior.
> - Having a non-empty pool is not always a guarantee of good health depending on the number of hosted machine groups relying on it and the intensity of runs they perform. 



