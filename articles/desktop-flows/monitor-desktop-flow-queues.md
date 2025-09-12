---
title: Monitor desktop flow queues
description: Monitor desktop flow queues
services: ''
suite: flow
documentationcenter: na
author: mattp123
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/07/2024
ms.author: kenseongtan
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- RPApostolis
- V-Camille
search.audienceType: 
  - flowmaker
  - enduser
---

# Monitor desktop flow queues

As you scale the automations in your business, you might need an easy way to ensure that competing desktop flows are running according to their business priority. Monitor, manage, and visualize all your queued desktop flow runs in just one location. Desktop flow queues can be used whether your target device is a machine or machine group.

## Setting a priority

The desktop flows connector actions contains a new priority parameter under the Advanced options section.

Available priorities are High and Normal (the default value). This value can also be passed dynamically using the custom value parameter. Every time the desktop flow is triggered, it's executed with the priority that has been set.

  ![Screenshot of a cloud flow using the Run a flow built with Power Automate Desktop action.](media\monitoring\monitor-desktop-flow-queues-1.png)

When multiple runs are queued, the execution ordering is based on the run priority and enqueued time. Runs with a high priority that's been enqueued first are executed first.

## View run queue for a machine or machine group

Visit the details page for your machine or machine group, then select on the **Run queue** tab to see the list of queued desktop flow runs.

  ![Screenshot of a list of desktop flows on gateways.](media\monitoring\monitor-desktop-flow-queues-3.png)

## Prerequisites

In order to see runs in this list, one of the following situations must be true:

- You're [running an attended or unattended desktop flow](run-desktop-flow.md) in the current environment
- Another user [shared their desktop flow](../create-team-flows.md#share-a-cloud-flow-with-run-only-permissions) with you, which ran in the current environment
- You have [permission](/power-platform/admin/database-security) to see view all data in the environment

> [!TIP]
> - To enable a user to view all the desktop flow runs in the current environment, ensure they have been assigned at least a System Administrator or Environment Admin security role for that environment. Learn more about configuring user security to resources in [Configure user security to resources in an environment](/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).
> - If you encounter errors related to the desktop flow run queue, go to [Troubleshoot desktop flow run queue errors](/troubleshoot/power-platform/power-automate/desktop-flows/troubleshoot-desktop-flow-run-queue-errors).

## Queue status

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

You can change the priority of a specific run by clicking on the three dots then **Change priority**. You can only change the priority of a run of which you're an owner, or if you're a co-owner on the machine/machine group.

Changing the priority only impacts the current run and not any subsequent ones. If you wish to [change the priority of all the upcoming runs](#setting-a-priority), you need to change the priority in the connector action.

## Move to top

The owner of the device or a user with administrator privileges for the machine or machine group can override the queue priority by moving an item to the top of the queue. That item is put at the top of the queue regardless of its original priority and queued time. If multiple runs are moved to the top, the last one added is executed first.

You can cancel moving a run to top. It reverts the run back to its original priority and queued time.

## See parent flow run

If you have permission to access the parent flow, you can use this action to view it's run details.

## Cancel parent flow run

If you're the owner of the flow, or have the role System Administrator or Environment Admin, you can cancel the parent flow run instance. This cancels the current desktop flow and all the other actions that were used in the parent flow.

## Extended queue prioritization

The extended queue prioritization is a machine and machine group setting, which optimizes the machine-assignment logic of a run queue.

Enabling this feature means that extended queue prioritization is applied on machines with multi-session support, such as Windows Server operating systems with RDS enabled. This optimizes the default run queue prioritization by extending the current first-in-first-out (FIFO) logic with user prioritization. This feature is enabled automatically when multi-session support is detected, but you can opt out at any time by disabling it.

### With disabled extended queue prioritization

Principle. The machine-assignment algorithm always waits for the first run in queue **Next to run** status to be assigned to a machine before considering the next one.

Step-by-step logic for an attended run. The first run in queue is an attended run. Its connection user is user **Y**:​

1. *​Filter*: The algorithm selects all machines, which are connected and ready to process runs (not in maintenance, and so on).
2. *Filter*: The algorithm selects all machines, which have an opened session of user **Y**.
3. *Allocation*: The algorithm assigns the run to one of the remaining machines (randomly). If no machine is remaining after the last filter, the run is failed.

Step-by-step logic for an unattended run. The first run in queue is an unattended run. Its connection user is user **Y**:​

1. *​Filter*: The algorithm selects all machines, which are connected and ready to process runs (not in maintenance, and so on).
2. *Filter*: The algorithm selects all available machines (that is, machines that have at least one session available).
3. *Filter*: The algorithm discards the machines, which already have a session opened by user **Y**.
4. *Allocation*: The algorithm assigns the run to one of the remaining machines (randomly). If no machine is remaining after the last filter, the run is failed.

> [!NOTE]
>
> - An unattended run can only be processed by a machine if the user session targeted, which is recorded on the desktop flow connection, isn't already in-use on the same machine​.
> - In both attended and unattended run scenarios, if no machines are left after the final filter, but there are some eligible machines currently offline (that were discarded in step 1), the run waits for the offline machines to come back online before marking the run as failed.

> [!TIP]
>
> - With disabled **Extended queue prioritization**, if no machine is available to execute the first run in queue, it is either failed or it waits for an offline machine to get back online, blocking the run queue in the meantime.
> - Enabling **Extended queue prioritization** allows the algorithm to reprioritize the queue when the first run in queue can't be processed.

### With enabled extended queue prioritization

Principle. The machine-assignment algorithm is able to consider the other runs in the queue if the first run in the queue can't be processed for the following reasons:

- Its targeted user session is currently not active on any machine (for attended runs).
- Its targeted user session being already in use on all available machines (for an unattended run).

Step-by-step logic for an attended run: The first run in queue is an attended run, its connection user is user **Y**:​

1. *Filter*: The algorithm selects all machines, which are connected and ready to process runs (not in maintenance, and so on).
2. *Filter*: The algorithm selects all machines, which have an opened session of user **Y**:
   - If some machines remain, the algorithm moves to step 4 (allocation).
   - If no machine remains, the algorithm moves to step 3 (reprioritization).
3. *Reprioritization*: The algorithm reprioritizes the queue by considering the next run in queue until a run is assignable to a machine.
4. *Allocation*: The algorithm assigns the run to one of the remaining machines (randomly).

Step-by-step logic for an unattended run. The first run in queue is an unattended run. Its connection user is user **Y**:​

1. *Filter*: The algorithm selects all machines, which are connected and ready to process runs (not in maintenance, and so on).
2. *Filter*: The algorithm selects all available machines (= machines, which have at least one session available).
3. *Filter*: The algorithm discards the machines, which already have a session opened by user **Y**:
   - If some machines remain, the algorithm moves to step 5 (allocation).
   - If no machine remains, the algorithm moves to step 4 (reprioritization).
4. *Reprioritization*: The algorithm reprioritizes the queue by considering the next run in queue (until a run is assignable to a machine).
5. *Allocation*: The algorithm assigns the run to one of the remaining machines (randomly)

## Known issues

- Microsoft recommends that you limit the number of short (~under 1 min) desktop flows that you queue in large machine groups.
- Desktop flow queues are designed using a best-effort FIFO (first-in, first-out) approach to process runs in the order in which they were received, with the oldest execution running first. However, due to the way runs are prepared and processed internally, it's possible that runs added to the queue a few seconds later are started before the previous one already in the queue, to optimize the use of machines.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
