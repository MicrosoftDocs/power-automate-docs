---
title: Known issues and limitation | Microsoft Docs
description: Known issues and limitations when working with Approvals
services: ''
suite: flow
documentationcenter: na
author: hamenon 
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/09/2022
ms.author: tatn
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Known issues

**Working with guest users**

If you assign a guest user to an approval, that user won't be able to view or act on the approval by default. The guest user must be assigned a valid Power Automate license (Per user license or Microsoft 365-based user license) to view or respond to the approval.
  
**Adaptive Cards mismatch in Microsoft Teams**

There are multiple ways in which you can notify an approver when a flow runs. By default, all flows that handle approvals send an email notification. You can also send an Adaptive Card with the approval to users in Microsoft Teams. If the approver responds through the email notification or through the approval action center, the card in Microsoft Teams will not auto update. This can lead to situations where there's a mismatch between the status shown on the Adaptive Card and that of the flow. 

To avoid this, you can choose to disable the default notification email that is sent to the user as part of approval creation. 

![Disable default email notification.](./media/create-approval-response-options/disable-default-notification.png)

**Abandoned approvals in the approval action center**

As part of the flow you can send an approval request to a user and wait for a response. Today, an approval flow can wait for 28 days. If the wait time exceeds 28 days, that flow will fail. This only impacts the flow itself, meaning that the approval continues to exist in the action center. This can lead to cases where there are abandoned approvals in the approval action center, which have no flow waiting on them. The requestor or environment admin will need to manually delete these approvals from the action center.

**Anchors**

Anchor links are not supported. Unexpected results will occur if you use anchors.

**Data Templating**

Data templating isn't fully supported for adaptive cards in Power Automate. As a workaround, use actions like compose, filter, select, and apply to each to manually construct the card within your flows.

**Approvals with Custom responses set to Everyone must Approve**

Approvals that rely on custom responses can fail if they're sent to many users with the type set to "Everyone must approve". This failure is due to data size limitations of the results field.

**Power Apps V2 trigger limitation**

The Power Apps V2 trigger doesn't support non-open API flows. Therefore, if you update your Power Apps V1 trigger to the Power Apps V2 trigger, your flow will break with a connection error. As a workaround, after you update your flow to the Power Apps V2 trigger, remove and then re-add the flow, then save the app.

**Splitting create and wait actions**
It is possible to create flows using the approval connector where you use the "Create an approval" and "Wait for an approval" as independant actions. If a user immediatly responds to an approval before the flow has a chance to reach the wait action it is possible for the flow to be stuck in the wait stage. To avoid this please ensure that create and wait are called as close together within the flow as feasible or alternately to change the status of the approval in Dataverse before calling the wait action. 

**Using approval outcomes in loops**
When using approvals with Do until loops, users need to account for all possible outcomes of a flow. If not the flows could be stuck in infinite loops. For basic and await all approvals the final states can be Approved, Rejected or Cancelled. For custom approvals its based on what the user chose to have as the options for the approval. It is recommended to use a condition or switch statement with Approvals instead of do until loops.