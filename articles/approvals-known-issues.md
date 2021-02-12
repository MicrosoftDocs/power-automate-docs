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
ms.service: flow
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

**Working with Guest users**

If you assign a guest user to an approval that user will not be able to view or act on the approval by default. The guest user(s) would need to be assigned a valid Power Automate license (Per user license or Office based user license) in order for them to view or respond to the approval.
  
**Adaptive card mismatch in Teams**

There are multiple ways in which you can notify an approver when constructing a flow. By default all approvals send an email notification but you can also choose to send an Adaptive card with the Approval to the user in Teams. If the approver responds to an approval through the email notification or through the approval action center, currently the card in Teams will not auto update. This can lead to situations where there's a mismatch between the status shown on the card and that of the actual approval. 

In order to avoid this you can choose to disable the default notification email that is sent to the user as part of approval creation. 

![Disable default email notification](./media/create-approval-response-options/disable-default-notification.png)

**Abandoned Approvals in the Approval action center**

As part of flow you can send an approval to a user and wait for a response. Today a single flow can only wait in a suspended state for a period of 28 days. If the wait time exceeds 28 days that flow will end up failing. In the current implementation of approvals this only impacts the flow itself, i.e. the approval will continue to exist in the action center. This can lead to cases where there are abandoned approvals in the approval action center which have no flow waiting on them. The requestor or environment admin will need to manually delete these approvals from the action center.