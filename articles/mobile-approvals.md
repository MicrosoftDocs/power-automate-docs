---
title: Approve requests on a mobile device
description: Use a mobile device to approve requests created in Power Automate.
suite: flow
author: DBEKI
contributors:
  - DBEKI
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 04/15/2025
ms.author: dbekirop
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Approve requests on your mobile device by using Power Automate

If a cloud flow identifies you as an approver and the mobile app for Power Automate is installed on your device, you receive a push notification when your approval is requested.

This article walks you through common scenarios that you’re likely to encounter while you manage approval requests in the mobile app for Power Automate.

> [!NOTE]
> The screenshots in this article are from an Android device; however, the experience on iOS is similar.

## Prerequisites

To complete this tutorial, you need:

* An [Android](https://aka.ms/flowmobiledocsandroid) or [iOS](https://aka.ms/flowmobiledocsios) device running the mobile app for Power Automate.
* To be designated as the approver in an approval flow.
* Pending requests for approval.

## View pending requests

To view pending requests, follow these steps.

1. Sign in to Power Automate on your [Android](https://aka.ms/flowmobiledocsandroid) or [iOS](https://aka.ms/flowmobiledocsios) device.

    :::image type="content" source="./media/mobile-approvals/launch_power_automate.png" alt-text="Screenshot of the mobile app.":::

1. On the bottom right corner, select **Approvals**. A list of pending approvals opens.

    :::image type="content" source="./media/mobile-approvals/select_approvals.jpg" alt-text="Screenshot of the 'Approvals' icon.":::

    If you don't have any pending approval requests and you want to test the functionality, create an [approval flow](modern-approvals.md), set yourself as an approver, and then trigger the flow. Approval requests appear in the approval center a few seconds after the flow triggers and sends a request for approval.

## Approve or reject requests and leave an optional message

You can approve or reject requests and leave an optional message. To do this, follow these steps.

1. (Optional) Navigate to the **Comment** field and enter a message to send with your reply.
1. Select **Approve** or **Reject**.

    :::image type="content" source="./media/mobile-approvals/approve_or_reject_cropped.png" alt-text="Screenshot of the 'Accept' and 'Reject' buttons and a field to enter an optional message.":::

1. After the process completes, a notification stating that the approval was submitted successfully appears.

    :::image type="content" source="./media/mobile-approvals/approval_submitted.png" alt-text="Screenshot of the 'Approval submitted successfully' message.":::

## Related information

[Create and test an approval workflow](modern-approvals.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
