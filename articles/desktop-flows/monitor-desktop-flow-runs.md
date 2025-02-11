---
title: Monitor desktop flow runs
description: Monitor desktop flow runs
services: ''
suite: flow
documentationcenter: na
author: mattp123
editor: ''
tags: ''
ms.subservice: desktop-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/11/2025
ms.author: kenseongtan
ms.reviewer: matp
contributors:
- rpapostolis
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---
# Monitor desktop flow runs

As you scale the automations in your business, you might need an easy way to ensure all your desktop flows are running as expected. Monitor all your desktop flow runs in just one location to keep your automations running smoothly.

 ![Screenshot of the list with the desktop flow runs.](media\monitoring\monitor-desktop-flow-queues-4.png)

## View list of all desktop flow runs

1. Sign into Power Automate
1. Select **Monitor** > **Desktop flow runs**

From this page, you can view all your desktop flow runs for the current environment to which you have access. 

## Prerequisites

In order to see runs in this list, one of the following items must be true:

- You [ran an attended or unattended desktop flow](run-desktop-flow.md) in the current environment
- Another user [shared their desktop flow](../create-team-flows.md#share-a-cloud-flow-with-run-only-permissions) with you, which ran in the current environment
- You have [permission](/power-platform/admin/database-security) to view all data in the environment

> [!IMPORTANT]
>
> - For cloud-initiated desktop flows based on [desktop flow log V1](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version), there's a maximum action log capacity of 32 MB, which equates to approximately 50,000 to 80,000 action log entries. Once this limit is reached, any subsequent actions aren't recorded in the log. If you encounter this limitation, you can either split your flow into smaller, separate flows or switch to [desktop flow log V2](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version). Desktop flow log V2 provides significantly more log capacity and includes [near-real-time logging](./monitor-run-details.md#progressive-action-logging) while the flow is running.
> - Desktop flows launched within the Power Automate desktop designer don't collect action logs.

## Desktop flow run information

The following information is available on your runs:

|Property|Description|
|-----|-----|
|Requested|The time when the desktop flow was requested by the parent flow. This value might not be the same as the time when the desktop flow started running on the machine.|
|Desktop flow |The name of the desktop flow which was run.|
|Status|The status of the desktop flow run.|
|Run mode|The mode in which the desktop flow was run.|
|Duration|How long the desktop flow took to run on the machine, excluding any time spent in the run queue.|
|Parent flow|The cloud flow that triggered the desktop flow to run.|

## Customize your view

You can make changes to your view to narrow the list of runs to only the runs you're interested in seeing. Select the column name to change the order of items or filter them to specific values.

## View all runs from the parent flow run

You might have several desktop flow runs that were triggered by one flow run. Select the three dots next to the desktop flow name, then select See all desktop flow runs in the parent flow.

  ![Screenshot of the flow runs from a parent flow.](media\monitoring\monitor-desktop-flow-queues-5.png)

## View the run queue for a queued run

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated. This feature is no longer supported from June 30, 2023, and for China regions from September 30, 2023. [Learn more](manage-machines.md#switch-from-gateways-to-direct-connectivity)

Machines and gateways can be used to run multiple desktop flows. To see the placement of a desktop flow in the run queue, select the three dots next to the name of the desktop flow and select **See desktop flow in run queue**.

![Screenshot of the See desktop flow in run queue option in Desktop flows run.](media\monitoring\monitor-desktop-see-desktop-flow-run-queue.png)

## Auto refresh

To keep your desktop flow run information always up to date, you can activate the **Auto refresh** toggle switch at the top of the page.

Auto refresh is only supported for up to 50 desktop flow runs. Loading more runs deactivates live updates and activating live updates with more than 50 runs trims the list to the supported amount.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
