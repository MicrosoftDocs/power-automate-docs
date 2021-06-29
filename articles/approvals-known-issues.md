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
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 2/12/2021
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

![Disable default email notification](./media/create-approval-response-options/disable-default-notification.png)

**Abandoned approvals in the approval action center**

As part of the flow you can send an approval request to a user and wait for a response. Today, an approval flow can wait for 28 days. If the wait time exceeds 28 days, that flow will fail. This only impacts the flow itself, meaning that the approval continues to exist in the action center. This can lead to cases where there are abandoned approvals in the approval action center which have no flow waiting on them. The requestor or environment admin will need to manually delete these approvals from the action center.

**Anchors**

Anchor links are not supported. Unexpected results will occur if you use anchors.

**Data Templating**

Data templating isn't fully supported for adaptive cards in Power Automate. As a workaround, use actions like compose, filter, select, and apply to each to manually construct the card within your flows.
