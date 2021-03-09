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
ms.service: flow
ms.devlang: na
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

[This topic is pre-release documentation and is subject to change.]

As you scale the automations in your business, you may need an easy way to ensure that competing desktop flows are running according to their business priority. Monitor and manage all your queued desktop flow runs in just one location.

## Setting a priority

The desktop flows connector actions contains a new priority parameter under the Advanced options section. 

Available priorities are High and Normal (the default value). This value can also be passed dynamically using the custom value parameter. Every time the desktop flow is triggered, it will be executed with the priority that has been set.

  ![Run a desktop flow](media\monitoring\monitor-desktop-flow-queues-1.png)

When multiple runs are queued, the execution ordering is based on the run priority and enqueued time. Runs with a high priority that have been enqueued first will be executed first.

## View list of all desktop flow run queues
1. Sign into Power Automate
1. Select **Monitor** > **Desktop flow queues**

  ![List of all desktop flow run queues](media\monitoring\monitor-desktop-flow-queues-2.png)

From this page you can view all the gateways to which you have access. Each gateway will have its own run queue when used to run desktop flows.

## View list of queued desktop flow runs for a specific gateway
Click on a gateway to see the details of the desktop flow runs that are being processed and queued.


  ![List of desktop flows on gateways](media\monitoring\monitor-desktop-flow-queues-3.png)

## Prerequisites
In order to see runs in this list, one of the following must be true:
- You are [running an attended or unattended desktop flow](run-desktop-flow.md) in the current environment
- Another user has shared their desktop flow (add documentation link) with you, which has run in the current environment
- You have [permission](/power-platform/admin/database-security) to see view all data in the environment

> [!TIP]
> To enable a user to view all the desktop flow runs in the current environment, ensure they have been assigned at least a System Administrator or Environment Admin security role for that environment. Learn more about configuring user security to resources.

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
You can change the priority of a specific run by clicking on the three dots then **Change priority**. You can only change the priority of a run of which you are an owner or if you are an admin on the gateway.
Changing the priority only impacts the current run and not any subsequent ones. If you wish to change the priority of all the upcoming runs, you need to change the priority in the connector action (see Set priority – Link to section).

## Move to top
The owner of gateway or a user with administrator privileges for the gateway can override the queue priority by moving an item to the top of the queue. That item will be put at the top of the queue regardless of its original priority and queued time. If multiple runs are moved to top, the last one added will be executed first.
You can cancel moving a run to top. It will revert the run back to its original priority and queued time.

## See parent flow run
If you have permission to access the parent flow, you can use this action to view its run details.

## Cancel parent flow run
If you are the owner of the flow, or have the role System Administrator or Environment Admin, you can cancel the parent flow run instance. This will cancel the current desktop flow as well as all the other action that were used in the parent flow.

## Using a gateway queue across multiple environments
It is recommended to use a gateway for desktop flows only by one environment. However, gateways can still be used across multiple environments if needed. With multiple environments, in some cases no flows may appear to be running even with a full list of queued runs, as the gateway may be running flows in another environment. Run queues are per environment and cannot be prioritized one over the other.
A message will be shown to indicate if the gateway is being used in another environment.

## Known issues
- The gateway status of an offline gateway may still appear as available

[!INCLUDE[footer-include](../includes/footer-banner.md)]