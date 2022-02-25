---
title: Monitor desktop flow runs | Microsoft Docs
description: Monitor desktop flow runs
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: 
editor: ''
tags: ''

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
# Monitor desktop flow runs


As you scale the automations in your business, you may need an easy way to ensure all your desktop flows are running as expected. Monitor all your desktop flow runs in just one location to keep your automations running smoothly. 

 ![Screenshot of the list with the desktop flow runs.](media\monitoring\monitor-desktop-flow-queues-4.png)

## View list of all desktop flow runs 
1. Sign into Power Automate 
1. Select **Monitor** > **Desktop flow runs**

From this page you can view all your desktop flow runs for the current environment to which you have access. 

## Prerequisites 

In order to see runs in this list, one of the following must be true: 
- You have [run an attended or unattended desktop flow](run-desktop-flow.md) in the current environment 
- Another user has [shared their desktop flow](../create-team-flows.md#share-a-cloud-flow-with-run-only-permissions) with you, which has run in the current environment
- You have [permission](/power-platform/admin/database-security) to view all data in the environment 

> [!TIP]
> To enable a user to view all the desktop flow runs in the current environment, ensure they have been assigned at least a System Administrator or Environment Admin security role for that environment. Learn more about configuring user security to resources. 

> [!NOTE]
> In the actions logs of a run, there is a limit of 10.000 actions for a desktop flow. If there is more than 10.000 actions in your desktop flow, you should divide it in two separated flows if you want to see all action logs online.

 

## Desktop flow run information 

The following information is available on your runs: 

|Property|Description|
|-----|-----|
|Requested|The time in which the desktop flow was requested by the parent flow. This may not be the same as the time when the desktop flow started running on the machine.|
|Desktop flow |The name of the desktop flow which was run.|
|Status|The status of the desktop flow run.|
|Run mode|The mode in which the desktop flow was run.|
|Duration|How long the desktop flow took to run on the machine, excluding any time spent in the run queue.|
|Parent flow|The cloud flow that triggered the desktop flow to run.|

## Customize your view 

You can make changes to your view to narrow the list of runs to only those you are interested in seeing. Click the column name to change the order of items or filter them to specific values. 

## View all runs from the parent flow run 

You may have several desktop flow runs that were triggered by one flow run. Click the three dots next to the desktop flow name, then select See all desktop flow runs in the parent flow. 

  ![Screenshot of the flow runs from a parent flow.](media\monitoring\monitor-desktop-flow-queues-5.png)

## View the run queue for a queued run 

Machines and gateways can be used to run multiple desktop flows. To see the placement of a desktop flow in the run queue, click the three dots next to the name of the desktop flow and select **See desktop flow in run queue**.

![Screenshot of the See desktop flow in run queue option in Desktop flows run.](media\monitoring\monitor-desktop-see-desktop-flow-run-queue.png)

## Live updates 

To keep your desktop flow run information always up to date, you can activate the **Live updates** toggle switch at the top of the page. 

Live updates are only supported for up to fifty desktop flow runs. Loading more runs will deactivate live updates and activating live updates with more than fifty runs will trim the list to the supported amount. 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
