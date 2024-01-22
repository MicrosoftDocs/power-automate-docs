---
title: Monitor desktop flow queues
description: Monitor desktop flow queues
services: ''
suite: flow
documentationcenter: na
author: georgiostrantzas
editor: ''
tags: ''
ms.devlang: na
ms.subservice: desktop-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/24/2022
ms.author: kenseongtan
ms.reviewer: gtrantzas
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Monitor desktop flow queues 

> [!IMPORTANT]
> Gateways for desktop flows are no longer supported. Switch to our machine-management capabilities. Learn more about [switching from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

As you scale the automations in your business, you may need an easy way to ensure that competing desktop flows are running according to their business priority. Monitor, manage and visualize all your queued desktop flow runs in just one location. Desktop flow queues can be used whether your target device is a machine, machine group, or a gateway.

> [!NOTE]
> Everyone accessing the run queues for their gateways from the **Desktop flow queues** page should now navigate to the **Gateways** pivot in the **Machines** page to access them.

## Setting a priority

The desktop flows connector actions contains a new priority parameter under the Advanced options section. 

Available priorities are High and Normal (the default value). This value can also be passed dynamically using the custom value parameter. Every time the desktop flow is triggered, it will be executed with the priority that has been set.

  ![Screenshot of a cloud flow using the Run a flow built with Power Automate Desktop action.](media\monitoring\monitor-desktop-flow-queues-1.png)

When multiple runs are queued, the execution ordering is based on the run priority and enqueued time. Runs with a high priority that 's been enqueued first will be executed first.

## View run queue for a machine or machine group


Visit the details page for your machine or machine group, then select on the **Run queue** tab to see the list of queued desktop flow runs.

  ![Screenshot of a list of desktop flows on gateways.](media\monitoring\monitor-desktop-flow-queues-3.png)

## Prerequisites
In order to see runs in this list, one of the following situations must be true:
- You're [running an attended or unattended desktop flow](run-desktop-flow.md) in the current environment
- Another user has [shared their desktop flow](../create-team-flows.md#share-a-cloud-flow-with-run-only-permissions) with you, which has run in the current environment
- You have [permission](/power-platform/admin/database-security) to see view all data in the environment

> [!TIP]
> To enable a user to view all the desktop flow runs in the current environment, ensure they have been assigned at least a System Administrator or Environment Admin security role for that environment. Learn more about configuring user security to resources in [Configure user security to resources in an environment](/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).

## Queue Status
A run in a queue can have the following status:
- Running
- Queued
- Next to run

## Actions on a run
Four actions are available when clicking on the three dots next to the desktop flow name:
- Change priority
- Move to top
- See parent flow run
- Cancel parent flow run

## Change priority

You can change the priority of a specific run by clicking on the three dots then **Change priority**. You can only change the priority of a run of which you're an owner, or if you're a co-owner on the machine/machine group or admin on the gateway.

Changing the priority only impacts the current run and not any subsequent ones. If you wish to [change the priority of all the upcoming runs](#setting-a-priority), you need to change the priority in the connector action.

## Move to top

The owner of the device or a user with administrator privileges for the machine, machine group, or gateway can override the queue priority by moving an item to the top of the queue. That item will be put at the top of the queue regardless of its original priority and queued time. If multiple runs are moved to top, the last one added will be executed first.

You can cancel moving a run to top. It will revert the run back to its original priority and queued time.

## See parent flow run
If you have permission to access the parent flow, you can use this action to view it's run details.

## Cancel parent flow run
If you're the owner of the flow, or have the role System Administrator or Environment Admin, you can cancel the parent flow run instance. This will cancel the current desktop flow and all the other action that were used in the parent flow.

## Machine-assignment logic of a run queue

> [!NOTE]
> - A run can only be processed by a machine if the user session it needs to open (the connexion credentials) is not already opened on the machine​.
> - The setting ‘Extended queue priorization’ can only be enabled if the machine supports multi-session (for single machines) or if some machines in the machine group support multi-session​ (for machines groups)

### With disabled ‘extended queue priorization’ : 
The machine-assignment algorithm will always wait for the first run in queue (Next to run status) to be assigned to a machine before considering the next one.

**Logic :** A run becomes ‘Next to run’, its connexion user is user Y :​
1. ​Filter: The algorithm selects all machines which are connected & usable (not in maintenance etc.)
2. Filter: The algorithm selects all available machines (= machines which have at least one session available)
3. Filter: the algorithm discards the machines which already have a session opened by user Y
4. Allocation : The algorithm assignes the run at random to the remaining machines.

If no machine is remaining after the last filter, the run waits until one becomes available.

> [!TIP]
> - With disabled ‘Extended queue priorization’, the run queue can be blocked by the first run in queue unable to be assigned to a machine eventhough other queued runs could be processed immediately.
> - Enabling 'Extended queue priorization' unblocks the run queue in that situation

### With enabled ‘extended queue priorization’ :  
The machine-assignment algorithm will be able to change the order of the run queue if the first run in the queue cannot be processed due to its targeted user session being already in use on all available machines.

**Logic :** A run becomes ‘Next to run’, its connexion user is user Y :​
1. Filter: The algorithm selects all machines which are connected & usable (not in maintenance etc.)
2. Filter: The algorithm selects all available machines (= machines which have at least one session available) 
3. Filter: the algorithm discards the machines which already have a session opened by user Y :
   - if some machines remain : step 5
   - if no machine remains : step 4

4. Look for next processable run : ​
- The algorithm considers the next run in the queue
- The algorithm reapply filter 1, 2 & 3 ​
- If some assignable machines remain after filtering, go to step 5​
- If no machine remains, restart step 4​

​5. Allocation : When a run with assignable machines is found, the algorithm changes its status to “Next to run” & the run is assigned at random to one of the assignable machines.

## View list of run queues for gateways

Users can view the desktop flow queues for their gateways under the **Machines page > Gateways pivot**. The gateways pivot is only available if you own or have access to a gateway.

  ![Screenshot of a list of all desktop flow run queues.](media\monitoring\monitor-desktop-flow-queues-2.png)

From this page you can view all the gateways to which you have access. Each gateway will have its own run queue when used to run desktop flows.

## Using gateways with multiple environments

It's recommended to use a gateway for desktop flows only by one environment. However, gateways can still be used across multiple environments if needed. 

With multiple environments, in some cases no flows may appear to be running even with a full list of queued runs, as the gateway may be running flows in another environment. Run queues are per environment and can't be prioritized one over the other. A message will be shown to indicate if the gateway is being used in another environment. 

## Known issues
- Microsoft recommends that you limit the number of short (~under 1 min) desktop flows that you queue in large machine groups.
- Machines and machine groups aren't available in China regions. You can still view the desktop flow queue for your gateways by visiting **Desktop flow queues** under the **Monitor** section in the left navigation.
- Desktop flow queues are designed using a best-effort FIFO (first-in, first-out) approach to process runs in the order in which they were received, with the oldest execution running first. However, due to the way runs are prepared and processed internally, it's possible that runs added to the queue a few seconds later will be started before the previous one already in the queue, to optimize the use of machines.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
