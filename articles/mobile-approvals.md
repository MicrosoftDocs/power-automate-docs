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
   
    ![start the mobile app.](./media/mobile-approvals/open-app.png)
2. Select **APPROVALS** in the upper-right corner.
   
    ![select approvals.](./media/mobile-approvals/select-approvals.png)
3. View all pending approvals:
   
    ![see pending approval requests.](./media/mobile-approvals/show-pending-approval-requests.png)

If you don't have any pending approval requests, create an [approval flow](modern-approvals.md), set yourself as an approver, and then trigger the flow. Approval requests appear in the approval center a few seconds after the flow triggers and sends a request for approval.

## Approve requests and leave an optional comment
1. If you haven't done so, follow the preceding steps to [view pending requests](mobile-approvals.md#view-pending-requests).
2. Select **APPROVE** on the request that you want to approve.
   
    ![select approve.](./media/mobile-approvals/select-approve.png)
3. (Optional) select **Add comment (optional)**.
   
    ![select add a comment.](./media/mobile-approvals/select-add-comment.png)
   
    Enter a comment on the **Add comment** screen.
   
    ![enter your comment.](./media/mobile-approvals/enter-comment-for-approval.png)
4. Select **CONFIRM** in the upper-right corner.
   
    ![confirm you are finished.](./media/mobile-approvals/tap-confirm-button.png)
   
    The success screen displays after the flow records your decision.
   
    ![success screen.](./media/mobile-approvals/approved.png)

## Reject requests and leave an optional comment
Follow the [steps to approve a request](mobile-approvals.md#approve-requests-and-leave-an-optional-comment), but select **REJECT** in the second step.

## Learn more
[Create modern approval flows](modern-approvals.md).



[!INCLUDE[footer-include](includes/footer-banner.md)]
