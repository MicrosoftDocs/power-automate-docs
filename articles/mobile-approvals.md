---
title: Approve requests on a mobile device | Microsoft Docs
description: Use a mobile device to approve requests created in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/20/2017
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Approve requests on your mobile device by using Power Automate

If a cloud flow identifies you as an approver and you've installed the mobile app for Power Automate, you receive a push notification whenever your approval is requested.

This article walks you through a few common scenarios that you’re likely to encounter while you manage approval requests in the mobile app for Power Automate.

> [!NOTE]
> The images in this topic are from an Android device; however, the experience on iOS is similar.
> 
> 

## Prerequisites
To complete this walkthrough, you need:

* An [Android](https://aka.ms/flowmobiledocsandroid) or [iOS](https://aka.ms/flowmobiledocsios) device running the mobile app for Power Automate.
* To be designated as the approver in an approval flow.
* Pending requests for approval.

## View pending requests
1. Open the mobile app for Power Automate.
   
    ![start the mobile app.](./media/mobile-approvals/launch_power_automate.png)
2. Select **APPROVALS** in the bottom-right corner and you will see a list of pending approvals if any exist.
   
    ![select approvals.](./media/mobile-approvals/select_approvals.jpg)

If you don't have any pending approval requests and you would like to test the functionality, create an [approval flow](modern-approvals.md), set yourself as an approver, and then trigger the flow. Approval requests appear in the approval center a few seconds after the flow triggers and sends a request for approval.

## Approve or reject requests and leave an optional message
1. Navigate to the **add a message along with your reply** to input a custom message if required, then select **APPROVE**, or **REJECT** on the request.
   
    ![select approve or reject and enter an optional message.](./media/mobile-approvals/approve_or_reject_cropped.png)
   
2. A notification stating **approval submitted successfully** will appear once the process is completed.
   
    ![aproval submitted successfully.](./media/mobile-approvals/approval_submitted.png)


## Learn more
[Create modern approval flows](modern-approvals.md).



[!INCLUDE[footer-include](includes/footer-banner.md)]
