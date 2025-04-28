---
title: Use the Apply to each action to process a list of items periodically
description: Use Power Automate to loop through an array of items to check multiple conditions and take actions based on those conditions.
suite: flow
author: kisubedi
contributors:
  - kisubedi
  - kartikraop
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/01/2025
ms.author: kisubedi
ms.reviewer: angieandrews
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

2. Checks each of the 10 messages to confirm if any has **meet now** in the subject.

3. Checks if the email is from your boss or was sent with high importance.

4. Sends a push notification and marks as read, any email that has **meet now** in the subject and is either from your boss or was sent with high importance.

This diagram shows the details of the flow we'll create.

:::image type="content" source="./media/apply-to-each/foreach-flow-visio.png" alt-text="Screenshot of an overview of the flow being built.":::

## Prerequisites

Here are the requirements for successfully performing the steps in this tutorial.

- An account that's registered to use [Power Automate](https://make.powerautomate.com).
- A Microsoft 365 Outlook account.
- The Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
- Connections to Microsoft 365 Outlook and the push notification service.

For detailed information about using SharePoint with Power Automate, go to the [SharePoint documentation](/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers).

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

## Create a cloud flow

# [New designer](#tab/new-designer)

[!INCLUDE [cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

1. Try asking Copilot to create a flow by typing this prompt:

    **Every 15 minutes, Get top 10 unread emails and get my manager. If the email is from my manager OR the email is Important and subject contains 'meet now', send me a push notification to my phone.**

    Copilot suggests a flow based on your prompt:

    :::image type="content" source="./media/apply-to-each/copilot-apply-to-each-prompt.png" alt-text="Screenshot of a flow suggestion from Copilot.":::

1. Select **Next** and review the connections.
1. Select **Next** and your flow appears on the designer.

    The flow is preconfigured with all the required fields in the designer.

    :::image type="content" source="./media/apply-to-each/copilot-configured-flow.png" alt-text="Screenshot of a flow created by Copilot based on your prompt.":::

1. Save the flow and it's ready to use.

# [Classic designer](#tab/classic-designer)

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **My flows** > **New flow** > **Scheduled cloud flow**.

1. In the **Flow name** field, enter a name for your flow.

1. In the **Starting** fields, select the date and time to indicate when the flow should start running.

1. In the **Repeat every** fields, set the schedule to run the flow. In this example, type 15 and select **Minute** from the dropdown menu to run the flow every 15 minutes.

1. Select **Create**.

    :::image type="content" source="media/apply-to-each/foreach-3.png" alt-text="Screenshot of the options to set up a scheduled flow.":::

1. Select **+ New step**.

1. In the **Search** field, type **outlook** to find all connectors and actions related to Microsoft Outlook.

1. Select the **Get emails (V3)** action to open the **Get emails (V3)** card.

1. Configure the **Get emails (V3)** card to select the top 10 unread emails from the **Inbox** folder.

   Don't include attachments because they won't be used in the flow.

    :::image type="content" source="./media/apply-to-each/foreach-5.png" alt-text="Screenshot of a configured email card.":::

So far, you've created a simple flow that gets some emails from your inbox. These emails will be returned in an array. The **Apply to each** action requires an array, so this is exactly what's needed.

---

## Add actions and conditions

1. Select **+ New step** > **Built-in** > **Apply to each** action.
1. Select the field and then select **value** from the **Dynamic content** list to place it in the **Select an output from previous steps** field on the **Apply to each** card. This pulls in the body of the emails to be used in the **Apply to each** action.

1. Select **+ New step** > **Control** > **Condition**.

1. Configure the **Condition** card to search the subject of each email for the words "meet now".

    * Select the first field and then select **Subject** in the **Dynamic content** list.
    * In the dropdown list of operators in the second field, select **contains**.
    * In the third field, enter **meet now**.

1. In the **If yes** branch, select **Add an action** > **Condition**. This opens the **Condition 2** card.

1. Configure the **Condition 2** card to search each email with "meet now" in the subject with high importance.

    * Select the first field and then select **Importance** in the **Dynamic content** list.
    * (If not already selected) In the dropdown list of operators in the second field, select **is equal to**.
    * In the third field, enter **high**.

1. In the **If yes** branch, select **Add an action**. This opens the **Choose an action** card, where you'll define what happens if the search condition (the **meet now** email was sent with high importance) is true.

1. Search for **notification**, and then select the **Send me a mobile notification** action.

1. On the **Send me a mobile notification** card in the **Text** field, enter the details for the push notification that will be sent if the subject of an email contains "meet now" and the **Importance** is **high**.

    :::image type="content" source="./media/apply-to-each/foreach-11.png" alt-text="Screenshot of a notification for a mobile configuration.":::

1. Select the **If no** branch to select the recipients.
    * Select **Add an action**, and then type **get manager** in the search field.
    * In the **Actions** list, select **Get manager (V2)**.
    * In the **Get Manager (V2)** card, select the **User (UPN)** field.
    * In the **Dynamic content** list, select **To**.

1. In the **If no** branch, select **Add an action**.

1. From the **Actions** list, select **Condition**. This opens the **Condition 3** card.

1. Configure the card to check if the email sender's email address (the **From** token) is the same as your boss' email address (the **Email** token).

    * Select the first field and then select **From** in the **Dynamic content** list.
    * In the dropdown list of operators in the second field, select **contains**.
    * In the third field, enter **mail**.

1. Under the **If yes** section of the **Condition 3** card, select **Add an action**.

Next, you'll define what should happen if the search condition (the email was sent from your boss) is true.

1. Search for **notification**, and then select the **Send me a mobile notification** action.

1. On the **Send me a mobile notification 2** card, provide the details for the push notification that will be sent if the email is from your boss.

1. Select **Add an action**.

1. Add the **Mark as read or unread (V3)** action.

1. Add the **Message Id** token to the **Mark as read or unread (V3)** card. The **Message Id** is the Id of the message that will be marked as read.

1. Select **Enter custom value** from the **Mark as** list on the **Mark as read or unread (V3)** card.

1. In the **Dynamic content** list, select **Is Read**.

    :::image type="content" source="./media/apply-to-each/foreach-mark-as-read2.png" alt-text="Screenshot of mark as read action.":::

1. On the toolbar at the top, select **Save** to save your flow.

## Run the flow

1. Send yourself a high-importance email that includes **meet now** in the subject. Alternatively, you can have someone in your organization send you such an email.

1. Confirm the email is in your inbox and it's unread.

1. Sign into [Power Automate](https://make.powerautomate.com).

1. Select **My flows**. A list of your flows displays.

1. Place a check in the circle for the flow you just created to select it.

1. Select the **Run** icon to the right of the flow name.

    :::image type="content" source="./media/apply-to-each/run-flow.png" alt-text="Screenshot of run now.":::

1. On the panel to the right, select **Run flow**.

1. When the run flow has successfully started, select **Done**.

1. Select the flow run in which you're interested to view the results.

## View results of the run

Now that you've run the flow successfully, you should receive the push notification on your mobile device.

> [!NOTE]
> If you don't receive the push notification, confirm that your mobile device has a working data connection.

## Related information

[Training: Use Dataverse triggers and actions in Power Automate (module)](/training/modules/use-dataverse-triggers-actions/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
