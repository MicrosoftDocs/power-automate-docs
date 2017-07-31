<properties
    pageTitle="Approve requests on a mobile device | Microsoft Flow"
    description="Use a mobile device to approve requests created in Microsoft Flow."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
    ms.service="flow"
    ms.devlang="na"
    ms.topic="article"
    ms.tgt_pltfrm="na"
    ms.workload="na"
    ms.date="07/20/2017"
    ms.author="deonhe"/>

# Approve requests on your mobile device by using Microsoft Flow

If a flow identifies you as an approver and you've installed the mobile app for Microsoft Flow, you receive a push notification whenever your approval is requested.

This article walks you through a few common scenarios that you’re likely to encounter while you manage approval requests in the mobile app for Microsoft Flow.

>[AZURE.NOTE]The images in this topic are from an Android device; however, the experience on iOS is similar.

## Prerequisites

To complete this walkthrough, you need:

- A device running the mobile app for Microsoft Flow on [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
- To be designated as the approver in an approval flow.
- Pending approval requests.

## View pending requests

1. Open the mobile app for Microsoft Flow.

    ![start the mobile app](./media/mobile-approvals/open-app.png)

1. Select **APPROVALS** in the upper-right corner.

    ![select approvals](./media/mobile-approvals/select-approvals.png)

1. View all pending approvals:

    ![see pending approval requests](./media/mobile-approvals/show-pending-approval-requests.png)

If you don't have any pending approval requests, create an [approval flow](./modern-approvals.md), set yourself as an approver, and then trigger the flow. Approval requests appear in the approval center a few seconds after the flow triggers and sends a request for approval.

## Approve requests and leave an optional comment

1. If you haven't done so, follow the preceding steps to [display all pending approval requests](mobile-approvals.md#view-pending-approval-requests).

1. Select **APPROVE** on the request that you want to approve.

    ![select approve](./media/mobile-approvals/select-approve.png)

1. (Optional) select **Add comment (optional)**.

    ![select add a comment](./media/mobile-approvals/select-add-comment.png)

    Enter a comment on the **Add comment** screen.

    ![enter your comment](./media/mobile-approvals/enter-comment-for-approval.png)

1. Select **CONFIRM** in the upper-right corner.

    ![confirm you are finished](./media/mobile-approvals/tap-confirm-button.png)

    The success screen displays after the flow records your decision.

    ![success screen](./media/mobile-approvals/approved.png)

## Reject requests and leave an optional comment

Follow the [steps to approve a request](mobile-approvals.md#approve-requests-and-leave-an-optional-comment), but select **REJECT** in the second step.

## Learn more

[Create modern approval flows](./modern-approvals.md).
