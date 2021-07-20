---
title: Monitor desktop flow queues  | Microsoft Docs
description: Monitor desktop flow queues
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: 
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/12/2020
ms.author: marleon
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Monitor desktop flow queues 

As you scale the automations in your business, you may need an easy way to ensure that competing desktop flows are running according to their business priority. Monitor, manage and visualize all your queued desktop flow runs in just one location. Desktop flow queues can be used whether your target device is a machine, machine group, or a gateway.

> [!NOTE]
> Everyone accessing their Desktop flow queues through the **Monitor pivot**, should now navigate under **Machines page > Gateways pivot** to access them.

## Setting a priority

The desktop flows connector actions contains a new priority parameter under the Advanced options section. 

Available priorities are High and Normal (the default value). This value can also be passed dynamically using the custom value parameter. Every time the desktop flow is triggered, it will be executed with the priority that has been set.

  ![Run a desktop flow.](media\monitoring\monitor-desktop-flow-queues-1.png)

When multiple runs are queued, the execution ordering is based on the run priority and enqueued time. Runs with a high priority that have been enqueued first will be executed first.

## View run queue for a machine or machine group


Visit the details page for your machine or machine group, then click on the **Run queue** tab to see the list of queued desktop flow runs.

  ![List of desktop flows on gateways.](media\monitoring\monitor-desktop-flow-queues-3.png)

## Prerequisites
In order to see runs in this list, one of the following must be true:
- You are [running an attended or unattended desktop flow](run-desktop-flow.md) in the current environment
- Another user has [shared their desktop flow](/create-team-flows#share-a-cloud-flow-with-run-only-permissions) with you, which has run in the current environment
- You have [permission](/power-platform/admin/database-security) to see view all data in the environment

> [!TIP]
> To enable a user to view all the desktop flow runs in the current environment, ensure they have been assigned at least a System Administrator or Environment Admin security role for that environment. Learn more about configuring user security to resources in [Configure user security to resources in an environment](https://docs.microsoft.com/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).


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

You can change the priority of a specific run by clicking on the three dots then **Change priority**. You can only change the priority of a run of which you are an owner, or if you are a co-owner on the machine/machine group or admin on the gateway.

Changing the priority only impacts the current run and not any subsequent ones. If you wish to [change the priority of all the upcoming runs](#setting-a-priority), you need to change the priority in the connector action.

## Move to top

The owner of the device or a user with administrator privileges for the machine, machine group, or gateway can override the queue priority by moving an item to the top of the queue. That item will be put at the top of the queue regardless of its original priority and queued time. If multiple runs are moved to top, the last one added will be executed first.

You can cancel moving a run to top. It will revert the run back to its original priority and queued time.

## See parent flow run
If you have permission to access the parent flow, you can use this action to view its run details.

## Cancel parent flow run
If you are the owner of the flow, or have the role System Administrator or Environment Admin, you can cancel the parent flow run instance. This will cancel the current desktop flow as well as all the other action that were used in the parent flow.

## View list of run queues for gateways

Users can view the desktop flow queues for their gateways under the **Machines page > Gateways pivot**. The gateways pivot is only available if you own or have access to a gateway.

  ![List of all desktop flow run queues.](media\monitoring\monitor-desktop-flow-queues-2.png)

From this page you can view all the gateways to which you have access. Each gateway will have its own run queue when used to run desktop flows.

## Using gateways with multiple environments

It is recommended to use a gateway for desktop flows only by one environment. However, gateways can still be used across multiple environments if needed. 

With multiple environments, in some cases no flows may appear to be running even with a full list of queued runs, as the gateway may be running flows in another environment. Run queues are per environment and cannot be prioritized one over the other. A message will be shown to indicate if the gateway is being used in another environment. 

## Known issues
- Machines and machine groups are not available in the Government Community Cloud (GCC), Government Community Cloud - High (GCC High), Department of Defense (DoD), or China regions. You can still view the desktop flow queue for your gateways by visiting the Desktop flow queues page under the Monitor section in the left navigation.

[!INCLUDE[footer-include](../includes/footer-banner.md)]