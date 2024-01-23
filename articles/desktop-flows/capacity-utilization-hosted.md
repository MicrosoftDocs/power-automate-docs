---
title: Hosted RPA Capacity utilization 
description: Hosted RPA Capacity utilization 
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.topic:
ms.reviewer: 
ms.topic: conceptual
---

# Hosted RPA capacity utilization

> [!IMPORTANT]
> - The capacity utilization page is in preview.

<br/>

## Reminder on Hosted RPA capacity 

Within the Power Automate platform, the '**Hosted RPA capacity**' is a purchased item (an [add-on](https://go.microsoft.com/fwlink/?linkid=2258651)) assigned to the environment [(see how to assign capacity to environments)](https://go.microsoft.com/fwlink/?linkid=2258569) which allows to run desktop flows with zero infrastructure. It's allocated to hosted machines or committed to hosted machine groups:
<br/><br/>

|Consuming object|Description|Consumption mode|
|----|--------------------|----|
|[Hosted machine](hosted-machines.md)|To be created, each hosted machine requires a hosted RPA capacity allocated.|Hosted RPA capacity is auto-allocated to hosted machine at its creation.|
|[Hosted machine group](hosted-machine-groups.md)|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot during auto-scaling (= committed bot). This ensures that the necessary resources are always available for processing the desktop flows.|Manual allocation of committed bots on hosted machine group.|

> [!NOTE]
> - The hosted machine group with the committment has a priority of usage over all concurrent hosted machine groups.
> - See [hosted machine group load balancing](hosted-machine-groups.md#load-balance-hosted-machine-group)

<br/>


## Hosted RPA capacity overview

The '**Hosted RPA capacity overview**' pie chart helps the user understand what is their share of hosted capacity consumption within the environment compared to the other makers, let them know if there's still capacity to scale-up in the future and alerts them when their objects are exceeding environment capacity (= overage): 

![Hosted capacity overview](media/capacity-utilization/hosted-capacity-overview.png)

|-|Legend|Description|
|----|--------------------|----|
|![Legend color - Allocated to my hosted machines](media/capacity-utilization/legend-allocated-to-my-hosted-machines.png)|Allocated to my hosted machines|Compliant capacity allocated to hosted machines, which the user owns or which are shared with them.|
|![Legend color - Committed to my hosted machine groups](media/capacity-utilization/legend-committed-to-my-hosted-machine-groups.png)|Committed to my hosted machine groups|Compliant capacity committed to hosted machine groups, which the user owns or which are shared with them.|
|![Legend color - Utilized by other makers](media/capacity-utilization/legend-utilized-by-other-makers.png)|Utilized by other makers|Compliant capacity allocated or committed to objects, which the user doesn't own and which weren't shared with them.|
|![Legend color - Available capacity](media/capacity-utilization/legend-available-capacity.png)|Available capacity|Available capacity for new hosted machines or new committed bots on hosted machine groups.|
|![Legend color - My overage utilization](media/capacity-utilization/legend-my-overage-utilization.png)|My overage utilization|Sum of capacities over-allocated to hosted machines and over-committed to hosted machine groups, which the user owns or which are shared with them|
|![Legend color - Overage by other makers](media/capacity-utilization/legend-overage-by-other-makers.png)|Overage by other makers|Sum of capacities over-allocated and over-committed to objects, which the user doesn't own and which weren't shared with them.|

<br/><br/>

## Hosted RPA capacity insights 

The '**Hosted capacity insights**' card informs the user of operation health and provides them with recommendation if there are compliance issues:

![Hosted capacity insight](media/capacity-utilization/hosted-capacity-insight.png)

|Badge|Message|Insight|
|----|--------------------|----|
|![Badge - Sufficient capacity](media/capacity-utilization/badge-sufficient-capacity.png)|There's available capacity for new hosted machines or new committed bots on hosted machine groups.|Scale-up is possible in the future.|
|![Badge - Fully utilized](media/capacity-utilization/badge-fully-utilized.png)|There's no more capacity for new hosted machines or new committed bots on hosted machine groups.|The capacity utilization rate is optimal at 100% but there's no room for scaling-up.|
|![Badge - Capacity overage](media/capacity-utilization/badge-capacity-overage.png)|User has some over-allocated capacity to their hosted machines or/and some over-committed bots to their hosted machine groups.|Uncompliant capacity usage exceeding environment capacity.|
|![Badge - Sufficient pool](media/capacity-utilization/badge-sufficient-pool.png)|There's a non-empty pool of capacity shared by all hosted machine groups.|All hosted machine groups theoretically have access to at least one bot.|
|![Badge - Empty pool](media/capacity-utilization/badge-empty-pool.png)|The capacity pool shared by all hosted machine groups is empty.|Hosted machine groups can not spin-up bots when needed. All automation based on them are going to fail.|

> [!NOTE]
> - All hosted machine groups share a pool of hosted capacity made of the available capacity and the compliant committed capacity within the environment (which value can be retrieved on the overview pie chart).
> - For example, 1 available capacity (non-allocated to a hosted machine and non-committed to a hosted machine group) is pooled between all the hosted machine groups with a first arrived first served behavior.
> - Having a non-empty pool is not always a guarantee of good health depending on the number of hosted machine groups relying on the pool, the intensity of runs they perform and their relative schedule.

<br/><br/>

## Hosted RPA utilization details

In this section the user can oversee and manage all hosted machines & hosted machine groups they have access to (as owner or through sharing): 

### 1. Hosted Machines

![Hosted machine details](media/capacity-utilization/hosted-details-hostedmachine.png)

> [!NOTE]
> - Every hosted machine gets auto-allocated 1 hosted capacity at creation except for hosted machine based on trial user licenses and hosted machine provisionned with an error
> - Hosted machines can be, when necessary (in case of overage), prioritized based on their attended and unattended runs.


### 2. Hosted Machine Groups

![Hosted machine group details](media/capacity-utilization/hosted-details-hostedmachinegroup.png)

> [!NOTE]
> - The 'Active bots' column refers to machines currently spin-up and consumming hosted capacity from the shared pool.
> - Hosted machine groups can be, when necessary (in case of overage), prioritized based on their unattended runs.

<br/><br/>

## Hosted RPA capacity overage

Capacity overage in an environment occurs when **the capacity utilized by hosted machines and hosted machine groups surpasses the assigned capacity of the environment**. In such instances, specific hosted machines and/or hosted machine groups may be identified as exceeding capacity. To prevent any disruption, it's crucial to promptly rectify the situation:

![Hosted overage](media/capacity-utilization/overage-hosted.png)
<br><br>
### Hosted machine in overage:
Hosted machines identified in overage risk being turned-off after a grace period:<br><br>
![Overage pin-point hosted machine](media/capacity-utilization/overage-pinpoint-HM.png)
<br><br>
### Hosted machine group in overage:
Hosted machine groups do not honor their over-committed bots expected behavior:<br><br>
![Overage pin-point hosted machine group](media/capacity-utilization/overage-pinpoint-HMG.png)
> [!NOTE]
> - A hosted machine group can have a sub-set of its committed bots identified as in overage (= over-committed), in that case, only the compliant committed bots will be honored.

<br><br>

### How to fix hosted capacity overage?
When the user owns some hosted machines or hosted machine groups in overage, the **Fix capacity button** appears in the 'Hosted capacity insight' card, it provides a list of corrective actions: 

|Fix capacity - Corrective actions|
|-------|
|![Hosted fix capacity](media/capacity-utilization/hosted-fix-capacity.png)|

<br><br>
The **Request capacity** action submits a request to the tenant administrator for assignation of capacity to the environment:
<br>

|Fix capacity - Request capacity|
|---------|
|![Hosted request capacity](media/capacity-utilization/hosted-capacity-request.png)|

> [!NOTE]
> - The pre-set value in the request capacity modal is equal to the total overage value in the environment (the user's overage and the other users' overage).
> - This pre-set value ensures that when the additional capacity is assigned to the environment, the user who made the request have their hosted machines or hosted machine groups returned back to compliance.
> - If the user submits a smaller request, when the additional requested capacity is provisioned to the environment, there’s no guarantee that their own hosted machines or hosted machine groups will return to compliance. The extra capacity might be allocated to other in-overage hosted machines / hosted machine groups owned by different users.

<br><br>

### What are the rules governing which objects are identified as in overage?

When the total capacity assigned to an environment is inferior to the combined capacity allocated to hosted machines and committed to hosted machine groups:

- Firstly, the overage is identified on the committed capacity of hosted machine groups, starting from the most recently created committed bot setting to the oldest. 
- Secondly, the overage is identified on the allocated capacity of hosted machines, starting from the most recently created machine to the oldest.

## Permissions to view and edit capacity allocation

To view and edit capacity allocation, a user needs a security role with privileges over the Flow Capacity Assignment entity:

![Flow Capacity Assignment](media/capacity-utilization/flow-capacity-assignment.png)
