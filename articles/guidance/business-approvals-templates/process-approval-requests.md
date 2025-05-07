---
title: Process approval requests 
description: Learn how to process approval requests.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: how-to
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Process approval requests

There are multiple options to process approval requests and multiple results to choose from.

The approvals kit has standard approve and decline options and several other options to accommodate complex approval scenarios. Review this content to understand how the system handles the approval request based on results.

## Approve from Microsoft Teams

You can respond directly to an approval request from Microsoft Teams. A notification is sent in Teams if you receive a request. You can also respond by checking the Teams Approvals app.

More information: [Respond to an approval in Microsoft Teams](../../teams/respond-to-approvals-in-teams.md#approve-or-reject-a-request-in-teams)

## Approve from Outlook

You can approve requests directly from Outlook or Outlook online. When an approval request is received, a request is sent to the approver.

## Approve from Power Automate mobile app

If you would like to make approvals while you are on the go, you can use Power Automate mobile app. To install, go to the [Power Automate mobile website](https://flow.microsoft.com/mobile/download/).

Once you download the app:

1. Open Power Automate mobile app.

1. Select **Activity**.

1. Select **Approvals**.

1. Select the approval request you would like to address.

>[!NOTE]
> The screens on Android, iOS and Windows Phone may differ slightly; however, the functionality is the same on all devices.

## Approve from Power Automate approvals center

You can approve a request from Power Automate approvals center. To make an approval, following the following steps:

1. Go to [Power Automate website](https://flow.microsoft.com/).

2. Select **Action items**.

3. Select **Approvals**.

4. Select the approval request you would like to address.

5. Choose your response.

6. Select **Confirm**.

:::image type="content" source="media/power-automate-approval.png" alt-text="A screenshot of the Power Automate approval response panel.":::

## Approvals status reference

The Business Approval Management app uses icons as a visual guide to approval status.

|Icon|Status|Description|
|----|------|-----------|
|:::image type="content" source="media/approval-request-approved.png" alt-text="Icon for Approval request approve.":::|Approve|Approves the request. Approvals Kit will automatically request the next approval for approval, or will complete the approval with status set to Approved.|
|:::image type="content" source="media/approval-request-approved-with-condition.png" alt-text="Icon for Request approve with condition.":::|Approve with condition|Approves the request with condition. Approvals Kit will automatically request the next approval for approval, or will complete the approval with status set to Approved with condition.|
|:::image type="content" source="media/approval-request-reject.png" alt-text="Icon for Approval request reject.":::|Reject|Declines the request. The Approvals Kit automatically terminates the approval request, and sets the approval statues to Declined|
|:::image type="content" source="media/approval-request-send-back.png" alt-text="Icon for Approval request send back.":::|Send back|Sends back the request to the previous approver. Approvals Kit sets the current approval request status back to Not Started, and look up the previous approval request to override existing result to Pending again for the previous approval to look at the request again. If two or more requests occur in the previous step simultaneously, all of the previous steps are processed in the same way.|
||Reassign|Reassigns the approval request to whoever you specify. Approval request remains to be Pending|

In addition to your decisions, there are also three other statuses that can be shown in the approval status.

|Icon|Status|Description|
|----|------|-----------|
|:::image type="content" source="media/approval-request-not-started.png" alt-text="Icon for Approval request not started.":::|Not Started|This status means that the approval request hasn't started, and is awaiting previous request to complete.
|:::image type="content" source="media/approval-request-pending.png" alt-text="Icon for Approval request pending.":::|Pending|The approval status shows as pending if the approval request is pending decision from the approver.
|:::image type="content" source="media/approval-request-pending-timeout.png" alt-text="Icon for Approval request pending timeout.":::|Pending (Timeout)|This status means that the approval request hasn't responded by the approver with in the first 30 days, and the Power Automate cloud flow run that is managing this request is restarted automatically. Once restarted, the status changes back to Pending again.
|:::image type="content" source="media/approval-request-system-processing.png" alt-text="Icon for Approval request system processing.":::|System Processing|This status shows if the cloud flow is still processing the results.|
