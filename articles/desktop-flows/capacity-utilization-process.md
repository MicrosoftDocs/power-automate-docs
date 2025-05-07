---
title: Process capacity utilization
description: Understand how Process and Unattended RPA capacity is utilized in your environment and learn to manage allocations effectively.
author: cvassallo
ms.service: power-automate
ms.subservice: desktop-flow
ms.date: 04/23/2025
ms.author: cvassallo
ms.reviewer: angieandrews
contributors:
  - DanaMartens
ms.topic: article
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/23/2025
---

# Process and Unattended RPA capacity utilization

The Process and Unattended RPA capacity utilization page provides you with insights into how your Process capacity or legacy Unattended RPA capacity is being used within your environment. As a reminder, within the Power Automate portal each Process capacity is based on a purchased [Process license](/power-platform/admin/power-automate-licensing/types) and each legacy Unattended RPA capacity is based on an [Unattended RPA add-on](/power-platform/admin/power-automate-licensing/add-ons#unattended-rpa-add-on). Those capacities are [assigned to the environment](/power-platform/admin/capacity-add-on#allocate-or-change-capacity-in-an-environment) by the admin.

Process capacity or legacy Unattended RPA capacity can be allocated to a machine or to a cloud flow. When allocated to a machine, it becomes an unattended bot. Each unattended bot on a machine can carry one unattended desktop flow run at a time. So if a machine needs to execute multiple unattended runs simultaneously, it needs as many unattended bots as it has simultaneous unattended runs to perform. When allocated to a cloud flow, it becomes a Process plan based on which the cloud flow is licensed to run premium actions independently from the user license.

|Before allocation|Consuming object|After allocation|Description|Allocation mode|
|----|--------------------|----|----|----|
|Process capacity|[Machine](manage-machines.md)|Unattended bot|Every unattended bot on a machine allows it to carry out an additional unattended desktop flow run simultaneously.|Capacity is auto-allocated to the machine at unattended desktop flow runtime, or the user can  manually allocate it.|
|Process capacity|Cloud flow|Process plan|Every Process plan allocated to a cloud flow allows it to run premium actions independently from the user license.|Capacity is manually allocated to the cloud flow by the user.|

> [!NOTE]
>
> Process capacity and Unattended RPA capacity have been combined in a single capacity pool and can be used interchangeably within the Power Automate platform. They have exactly the same value and role.

## Process & Unattended RPA capacity overview

The **Process & Unattended RPA capacity overview** pie chart helps you understand the capacity consumption within the environment, lets you know if there's still capacity to scale-up in the future, and alerts you when the utilized capacity is exceeding environment capacity (= overage).

![Process capacity overview](media/capacity-utilization/unattended-capacity-overview.png)

|-|Legend|Description|
|----|--------------------|----|
|![Legend color - Allocated as unattended bots to my machines](media/capacity-utilization/legend-used-by-unattended-machines.png)|Allocated as unattended bots to my machines|Compliant capacity allocated to machines, which the user owns or which are shared with them.|
|![Legend color - Allocated to my cloud flows](media/capacity-utilization/legend-allocated-to-my-cloud-flows.png)|Allocated to my cloud flows|Compliant capacity allocated to cloud flows, which the user owns or which are shared with them.|
|![Legend color - Utilized by other makers](media/capacity-utilization/legend-utilized-by-other-makers.png)|Utilized by other makers|Compliant capacity allocated to objects, which the user doesn't own and which weren't shared with them.|
|![Legend color - Available capacity](media/capacity-utilization/legend-available-capacity.png)|Available capacity|Available capacity for new unattended bots on machines and new process plan on cloud flows.|
|![Legend color - My overage utilization](media/capacity-utilization/legend-my-overage-utilization.png)|My overage utilization|Sum of capacities over-allocated to machines or/and to cloud flows, which the user owns or which are shared with them.|
|![Legend color - Overage by other makers](media/capacity-utilization/legend-overage-by-other-makers.png)|Overage by other makers|Sum of capacities over-allocated to objects, which the user doesn't own and which weren't shared with them.|

## Process and Unattended RPA capacity insights

The **Process and Unattended RPA capacity insights** card informs you of operation health and gives recommendations when there are compliance issues.

![Unattended capacity insight](media/capacity-utilization/unattended-capacity-insight-2.png)

|Badge|Message|Insight|
|----|--------------------|----|
|**Sufficient capacity**|There's available capacity for new unattended machines or for new process plans on cloud flows.|Scale-up possible in the future.|
|**Fully utilized**|There's no more capacity for new unattended bots or for new process plans on cloud flows.|The capacity utilization rate is optimal at 100% but there's no room for scaling-up.|
|**Capacity overage**|User has over-allocated capacity to their machines or/and to their cloud flows.|Uncompliant capacity usage exceeding environment capacity.|

## Process and Unattended RPA utilization details

In this section, you learn how to oversee and manage all machines you have access to (as owner or through sharing).

![Process utilization details - Machine list](media/capacity-utilization/process-details-machines-2.png)

> [!NOTE]
>
> By selecting a machine, you can edit its unattended bots setting and its auto-allocation setting.
> Machines can be, when necessary (in case of overage), prioritized based on their unattended runs.
> Cloud flows using process capacity will be added to the page in a future release

## Capacity overage

Capacity overage in an environment occurs when the capacity utilized by the unattended bots on machines and the process plans on cloud flows surpasses the assigned capacity of the environment. In such instances, specific machines and/or cloud flows might be identified as exceeding capacity. To return to compliance, it's important to promptly rectify the situation.

![Process overage](media/capacity-utilization/overage-unattended-2.png)

> [!NOTE]
>
> - Process capacity overage is only possible in an environment where some Process capacity or Unattended RPA capacity has been allocated
> - Process capacity overage is also possible in an environment where some Hosted RPA capacity has been allocated

### Machine in overage

Machines identified in overage aren't compliant.

![Machine overage](media/capacity-utilization/machine-overage.png)

> [!NOTE]
>
> A machine can have a subset of its unattended bots identified as in overage (= uncompliant)

### How to fix Process and Unattended RPA capacity overage

When some unattended machines are in overage, the **Fix capacity** button appears in the **Process & Unattended RPA capacity insights** card.

![Fix process capacity button](media/capacity-utilization/fix-process-capacity-button-2.png)

The card provides potential corrective actions.

![Process fix capacity actions](media/capacity-utilization/unattended-fix-capacity-2.png)

The **Request capacity** action submits a request to the tenant administrator for the consideration of assigning capacity to the environment.

![Process request capacity](media/capacity-utilization/unattended-capacity-request-2.png)

> [!NOTE]
>
> - The preset value in the request capacity modal dialog is equal to the total overage value in the environment (the user's overage and the other users' overage).
> - This preset value ensures that when the additional capacity is assigned to the environment, the user who made the request have their machines or returned back to compliance.
> - If the user submits a smaller request, when the additional requested capacity is provisioned to the environment, there’s no guarantee that their own machines will return to compliance. The extra capacity might be allocated to other in-overage machines owned by different users.

### What are the rules governing which objects are identified as in overage?

When the total Process capacity assigned to an environment is inferior to the combined capacity allocated to machines and cloud flows: the overage is identified, on machines and cloud flows indistinctively, starting from the most recently created allocation to the oldest.

## Permissions required to view and edit capacity allocation

To view and edit capacity allocation, you need a security role with privileges to the **Flow Capacity Assignment** table. For example, the Environment Maker role can view and edit allocation of hosted capacity.

![Flow Capacity Assignment](media/capacity-utilization/flow-capacity-assignment.png)

## Related information

[Capacity utilization within Power Automate](capacity-utilization.md)
