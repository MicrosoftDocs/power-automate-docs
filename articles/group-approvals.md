---
title: Send an approval to Microsoft 365 group
description: Easily send approvals to a Microsoft 365 groups 
services: ''
suite: flow
documentationcenter: na
author: hamenon-ms
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/27/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Start an approval with a Microsoft 365 group

In addition to individual users you can also send approvals to [Microsoft 365 groups](https://docs.microsoft.com/en-us/microsoftteams/office-365-groups). This can be useful in scenarios where you need the approval of one amongst a group of people, but you are not particular on which specific user provides the approval. For instance:
* You need the approval of a representative of the leadership team for a project
* You want the copy of the new marketing material to be approved by someone on the social media team

>[!NOTE]
>Not every single person of the group needs to involved in the approval. Only a single user from the group needs to respond to the approval. That users response is used to represent the entire group.

## Sending an approval to a Microsoft 365 group
Approvals to groups behave exactly like approvals to users. It is just the entity that the approval is being sent to that is different. Lets look at a simple example below.

>[!NOTE]
>The example below uses the First to respond action type but you can combine this with other types of approvals as well.

## Create the flow

1. Sign into Power Automate.
1. Select **My flows** > **New** > **Instant-from blank**.

    ![New instant blank flow](./media/approval-attachments/new-instand-blank.png)

1. Give your flow a name > search for, and then select **Manually trigger a flow**, and then select **Create**.

    ![Name your flow and select a trigger](./media/approval-attachments/name-flow-trigger.png)

1. Select the **Manually trigger a flow** trigger > **Add an input** > **File**.

     The previous steps configure your flow so that when it runs, it requests a file from the user to trigger your flow.

1. Select **New step**
1. Search for **Approvals** and then select **Start and wait for an approval**.
1. Select **Approve/reject - First to respond** in the **Approval type** list of the **Start and wait for an approval** card.
1. Provide the following information on the **Start and wait for an approval** card:

   - **Title** - This is a short description that tells the approver what the request is about.
   - **Details** - This text shows up in the approval request.

1. In the **Assigned to** input start typing the name of the group you want to send the approval to. The field now accepts both user and group inputs. If you know the email id associated with the group you can directly include that as well. TODO ADD IMAGE HERE

>[!TIP]
>You can include multiple groups in the Assigned to field, just like you can with users

1. Select **Save** to save your flow.

## Test your flow

1. Select **Test**.
1. Select **I'll perform the trigger action**.

     ![Test your flow](./media/approval-attachments/test-flow.png)

1. Select **Test** > **Continue** to start the test.

1. Select **Run flow**.

   You'll see that the test run starts.

     ![The test starts](./media/approval-attachments/test-started.png)

1. Select **Flow Runs Page** to monitor the status of the test.

## Approve the request

The group to which you sent the approval request receives an email, similar to this image, where they can **Approve** or **Reject** the approval.

TODO NEED IMAGE HERE

>[!TIP]
>Approvers can review requests in the approvals center as well.

## Learn more

In most approval flows, you'd want to notify the person who requests the approval of the decision. Follow the [modern approvals article](modern-approvals.md#add-an-email-action-for-approvals) to learn how to add a **condition** to an approval flow to take specific actions based on the **outcome** of the request.

## Behavior when sending to multiple groups
You can choose to send an approval to multiple groups or even a combination of groups and users. Here are a few examples of such scenarios and their expected outcome:

* First to respond approval sent to Group 1 and Group 2: At least 1 user **from either** group 1 or group 2 needs to approve
* Everyone must respond approval sent to Group 1 and Group 2: At least 1 user **from both** Group 1 and Group 2 needs to approve
* First to respond approval sent to Group 1 and user 1: At least user 1 or 1 member from group 1 needs to approve
* Everyone must respond approval sent to User 1 and Group 1: Both User 1 and at least 1 member from Group 1 has to approve