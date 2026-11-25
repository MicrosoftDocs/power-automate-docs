---
title: Use the Apply to each action to process a list of items periodically
description: Use Power Automate to loop through an array of items to check multiple conditions and take actions based on those conditions.
suite: flow
author: radioblazer
contributors:
  - kartikraop
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 11/16/2026
ms.update-cycle: 180-days
ms.author: matow
ms.reviewer: cyanderson
ms.custom: bap-template
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: bap-ai-copilot
---

# Use the Apply to each action to process a list of items periodically

Many triggers can immediately start a cloud flow based on an event such as when a new email arrives in your inbox. These triggers are great, but sometimes you want to run a cloud flow that queries a data source on a predefined schedule, taking certain actions based on the properties of the items in the data source. To do this, your flow can be started on a schedule (such as once per day) and use a loop action such as **Apply to each** to process a list of items. For example, you could use **Apply to each** to update records from a database or list of items from Microsoft SharePoint.

Watch this video for a demo of the **Apply to each** action.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=6b48b330-128d-4130-b093-2f18edae65c3]

In this tutorial, we'll create a cloud flow that runs every 15 minutes and does the following:

1. Gets the last 10 unread messages in your Microsoft 365 Outlook Inbox.

1. Checks each of the 10 messages to confirm if any has **meet now** in the subject.

1. Checks if the email is from your boss or was sent with high importance.

1. Sends a Teams message and marks as read, any email that has **meet now** in the subject and is either from your manager or was sent with high importance.

## Prerequisites

To complete this tutorial, you need the following prerequisites:

- An account that's registered to use [Power Automate](https://make.powerautomate.com).
- A Microsoft 365 Outlook account.
- Connections to Microsoft 365 Outlook and the push notification service.

For detailed information about using SharePoint with Power Automate, see the [SharePoint documentation](/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers).

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

## Create a cloud flow

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **My flows** > **New flow** > **Scheduled cloud flow**.

1. In the **Flow name** field, enter a name for your flow.

1. In the **Starting** fields, select the date and time to indicate when the flow should start running.

1. In the **Repeat every** fields, set the schedule to run the flow. In this example, type 15 and select **Minute** from the dropdown menu to run the flow every 15 minutes.

1. Select **Create**.

    :::image type="content" source="media/apply-to-each/foreach-3.png" alt-text="Screenshot of the options to set up a scheduled flow.":::

1. Select **Insert a new action**.

1. In the **Search** field, type "outlook" to find all connectors and actions related to Microsoft Outlook.

1. Select the **Get emails (V3)** action to open the **Get emails (V3)** card.

1. Configure the **Get emails (V3)** card to select the top 10 unread emails from the **Inbox** folder.

   Don't include attachments because the flow doesn't use them.

So far, you created a simple flow that gets some emails from your inbox. The flow returns these emails in an array. The **Apply to each** action requires an array, so this setup works perfectly.

## Add actions and conditions

1. Select **Insert a new action** > **Built-in tools** > **Control** > **Apply to each** action.
1. Select the field and then select **body/value** from the **Dynamic content** list to place it in the **Select an output from previous steps** field on the **Apply to each** card. This step pulls in the body of the emails to use in the **Apply to each** action.

1. Within the **Apply to each** action, select **Insert a new action** > **Built-in tools** > **Control** > **Condition**.

1. Configure the **Condition** card to search the subject of each email for the words "meet now".

    - Select the first field and then select **Subject** in the **Dynamic content** list.
    - In the dropdown list of operators in the second field, select **contains**.
    - In the third field, enter "meet now".

1. In the **True** branch, select **Insert a new action** > **Built-in tools** > **Condition**. This step opens the **Condition 1** card.

1. Configure the **Condition 1** card to search each email with "meet now" in the subject for high importance.

    - Select the first field and then select **Importance** in the **Dynamic content** list.
    - If not already selected, in the dropdown list of operators in the second field, select **is equal to**.
    - In the third field, enter "high".

1. In the **True** branch, select **Insert a new action**. This step opens the **Choose an action** card, where you define what happens if the search condition (the **meet now** email was sent with high importance) is true.

1. Search for "teams," and then select the **Post a message to myself** action.

1. On the **Post a message to myself** card, in the **Body content** field, enter the details for the push notification that gets sent if the subject of an email contains "meet now" and the **Importance** is **high**.

1. Select the **False** branch to select the recipients.
    * Select **Insert a new action**, and then type **get manager** in the search field.
    * In the **Actions** list, select **Get manager (V2)**.
    * In the **Get Manager (V2)** card, select the **User (UPN)** field.
    * In the **Dynamic content** list, select **To** to get the manager of the email recipient (yourself).

1. In the **False** branch, select **Insert a new action**.

1. From the **Actions** list, select **Controls** > **Condition**. This step opens the **Condition 2** card.

1. Configure the card to check if the email sender's email address (the **From** token) is the same as your boss's email address (the **Mail** token).

    * Select the first field and then select **From** in the **Dynamic content** list.
    * In the dropdown list of operators in the second field, select **contains**.
    * In the third field, select **Mail** in the **Dynamic content** list.

1. Under the **True** section of the **Condition 2** card, select **Insert a new action**.

Next, define what should happen if the search condition (the email was sent from your boss) is true.

1. Search for "teams", and then select the **Post a message to myself** action.

1. On the **Post a message to myself 1** card, provide the details for the message to send if the email is from your boss.

1. Select **Insert a new action**.

1. Add the **Mark as read or unread (V3)** action.

1. Add the **Message Id** token from **Get emails (V3)** to the **Mark as read or unread (V3)** card. The **Message Id** is the Id of the message that gets marked as read.

1. Select **Enter custom value** from the **Advanced parameters** > **Mark as** list on the **Mark as read or unread (V3)** card.

1. In the **Dynamic content** list, select **Is Read**.

1. On the toolbar at the top, select **Save** to save your flow.

## Run the flow

1. Send yourself a high-importance email that includes **meet now** in the subject. Alternatively, you can have someone in your organization send you such an email.

1. Confirm the email is in your inbox and it's unread.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **My flows**. A list of your flows displays.

1. Select the circle for the flow you just created.

1. Select the **Run** icon to the right of the flow name.

    :::image type="content" source="./media/apply-to-each/run-flow.png" alt-text="Screenshot of run now.":::

1. On the panel to the right, select **Run flow**.

1. When the run flow starts, select **Done**.

1. Select the flow run to view the results.

## View results of the run

Now that you ran the flow, you should receive the messages in Teams.

## Related information

[Training: Use Dataverse triggers and actions in Power Automate (module)](/training/modules/use-dataverse-triggers-actions/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
