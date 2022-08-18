---
title: Known issues and limitation | Microsoft Docs
description: Known issues and limitations when working with Approvals
services: ''
suite: flow
documentationcenter: na
author: hamenon 
manager: tapanm
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/16/2022
ms.author: tatn
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Known issues

## Working with guest users

If you assign a guest user to an approval, that user won't be able to view or act on the approval by default. The guest user must be assigned a valid Power Automate license (Per user license or Microsoft 365-based user license) to view or respond to the approval.
  
## Adaptive Cards mismatch in Microsoft Teams

There are multiple ways in which you can notify an approver when a flow runs. By default, all flows that handle approvals send an email notification. You can also send an Adaptive Card with the approval to users in Microsoft Teams. If the approver responds through the email notification or through the approval action center, the card in Microsoft Teams won't auto update. This can lead to situations where there's a mismatch between the status shown on the Adaptive Card and that of the flow.

To avoid this, you can choose to disable the default notification email that is sent to the user as part of approval creation. 

![Disable default email notification.](./media/create-approval-response-options/disable-default-notification.png)

## Abandoned approvals in the approval action center

As part of the flow, you can send an approval request to a user and wait for a response. Today, an approval flow can wait for 28 days. If the wait time exceeds 28 days, that flow will fail. This only impacts the flow itself, meaning that the approval continues to exist in the action center. This can lead to cases where there are abandoned approvals in the approval action center, which have no flow waiting on them. The requestor or environment admin will need to manually delete these approvals from the action center.

## Anchors

Anchor links aren't supported. Unexpected results will occur if you use anchors.

## Data Templating

Data templating isn't fully supported for adaptive cards in Power Automate. As a workaround, use actions like compose, filter, select, and apply to each to manually construct the card within your flows.

## Approvals with Custom responses set to Everyone must Approve

Approvals that rely on custom responses can fail if they're sent to many users with the type set to "Everyone must approve". This failure is due to data size limitations of the results field.

**Power Apps V2 trigger doesn't support non-open API flows**

If you update your Power Apps V1 trigger to the Power Apps V2 trigger, your flow receive a connection error. To workaround this issue, update your flow to the Power Apps V2 trigger, remove and re-add the flow, and then save the app.

**Updating Power Apps v2 trigger to invoker connection**

The Power Apps V2 trigger supports both embedded and invoker connections. When you update the connections in your Power Apps V2 trigger to invoker connections, you must refresh or remove and re-add the flow in the app and save the app. 

To learn more, go to [Known issues with Power Apps V2 trigger](/troubleshoot/power-platform/power-automate/known-issues-power-apps-v2-trigger).

## Splitting create and wait actions

It's possible to create flows with the approval connector where you use the *Create an approval* and *Wait for an approval* as independent actions. If a user immediately responds to an approval request before the flow reaches the wait action, it's possible for the flow to become stuck in the wait stage. To avoid getting the flow stuck, ensure that the 'create' and 'wait' actions are called close together within the flow. Alternately, change the status of the approval in Dataverse before you call the 'wait' action.

## Using approval outcomes in loops

When you use approvals with *do until* loops, users need to account for all possible outcomes of a flow. If not, the flows could be stuck in infinite loops. For 'basic' and 'await all approvals', the final states can be *Approved*, *Rejected*, or *Cancelled*. For custom approvals, it's based on what the user chooses to have as the options for the approval. Use a condition or switch statement with approval flow instead of *do until* loops.
