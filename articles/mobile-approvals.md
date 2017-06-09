<properties
    pageTitle="Use mobile devices to approve requests | Microsoft Flow"
    description="Use mobile devices to approve requests created in Microsoft Flow"
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
    ms.date="06/10/2017"
    ms.author="deonhe"/>

# Mobile approvals with Microsoft Flow

When you create an [approval flow](./modern-approvals.md), it sends approval requests:

- [Via email](./modern-approvals.md/#from-email).
- To the [approval center](./modern-approvals.md/#from-the-approvals-center).
- To the Microsoft Flow mobile app.

You can use any of the preceding methods to manage your approval requests. However, this article focuses on using the Microsoft Flow mobile app to manage approval requests.

>[AZURE.NOTE]The images presented here are from an Android phone, however, the experience on iOS and Windows Phone is similar.

## Prerequisites

To complete this walkthrough, you need:

- A mobile device running the Microsoft Flow [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) mobile app.
- To be designated as the approver in an approval flow.
- At least two pending approval requests.

## Mobile approvals

The mobile app's approval center is similar to the [approval center](https://flow.microsoft.com/manage/approvals/received) on the Microsoft Flow [website](https://flow.microsoft.com). Use the approval center from your mobile device to view, approve, or reject approval requests.

# View pending approval requests

1. Open the Microsoft Flow mobile app.

    ![](./media/mobile-approvals/open-app.png)

1. Select **APPROVALS** from the top right corner of the screen.

    ![](./media/mobile-approvals/select-approvals.png)

1. View all pending approvals:

   ![see pending approval requests](./media/mobile-approvals/show-pending-approval-requests.png)

If there aren't any pending approval requests, create an approval flow, set yourself as an approver, and then trigger the flow. Approval requests appear in the approval center a few seconds after the flow triggers and sends a request for approval.

# Approve request and leave an optional comment

1. Follow the preceding steps to [display all pending approval requests](./mobile-approvals.md/#View-pending-approval-requests).

1. Select **APPROVE** on the request you want to approve.

    ![select approve](./media/mobile-approvals/select-approve.png)

1. (Optional) select **Add comment (optional)**.

    ![select add a comment](./media/mobile-approvals/select-add-comment.png)

    Enter a comment on the **Add comment** screen.

    ![enter your comment](./media/mobile-approvals/enter-comment-for-approval.png)

1. Select **CONFIRM** in the top right corner of the screen.

    ![confirm your are finished](./media/mobile-approvals/tap-confirm-button.png)

The success screen displays after the flow records your decision.

## Reject request and leave an optional comment

Follow the steps to approve a request, but select **REJECT** in the second step.

## Learn more

- Learn to [create modern approval flows](./modern-approvals.md).
- Install the Microsoft Flow mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
