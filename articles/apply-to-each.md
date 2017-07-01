<properties
    pageTitle="Use the apply to each action to loop through an array of items. | Microsoft Flow"
    description="Use Microsoft Flow to loop through an array of items to check multiple conditions and take actions based on those conditions."
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
   ms.date="03/16/2017"
   ms.author="deonhe"/>

# Use the apply to each action in Microsoft Flow to process a list of items periodically

Many triggers can immediately start a flow based on an event such as when a new email arrives in your inbox. These triggers are great, but sometimes you want to run a flow that queries a data source on a predefined schedule, taking certain actions based on the properties of the items in the data source. To do this, your flow can be started on a schedule (such as once per day) and use a loop action such as **Apply to each** to process a list of items. For example, you could use **Apply to each** to update records from a database or list of items from Microsoft SharePoint.

In this walk-through, we'll create a flow that runs every 15 minutes and does the following:

1. Gets the last 10 unread messages in your Office 365 Outlook Inbox.
1. Checks each of the 10 messages to confirm if any has **meet now** in the subject.
1. Checks if the email is from your boss or was sent with high importance.
1. Sends a push notification and marks as read any email that has **meet now** in the subject and is either from your boss or was sent with high importance.

This diagram shows the details of the flow we'll create in this walk-through:

![overview of the flow being built](./media/apply-to-each/foreach-flow-visio.png)

## Prerequisites

Here are the requirements for successfully performing the steps in this walk-through:

- An account that's registered to use [Microsoft Flow](https://flow.microsoft.com).
- An Office 365 Outlook account.
- The Microsoft Flow mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
- Connections to Office 365 Outlook and the push notification service.

## Create a flow

1. Sign into [Microsoft Flow](https://flow.microsoft.com):

1. Select the **My flows** tab, and then create a flow from a blank:

     ![create from blank](./media/apply-to-each/foreach-1.png)

1. Enter "schedule" into the search box to search for all services and triggers that are related to scheduling.
1. Select the **Schedule - Recurrence** trigger to indicate that your flow will run on a schedule that you'll provide next:

     ![schedule recurrence action](./media/apply-to-each/foreach-2.png)

1. Set the schedule to run every 15 minutes:

     ![schedule runs](./media/apply-to-each/foreach-3.png)

1. Select **+ New step**, **Add an action**, and then type **outlook** into the search box to search for all actions related to Microsoft Outlook.

1. Select the **Office 365 Outlook - Get emails** action:

     ![select get emails action](./media/apply-to-each/foreach-4.png)

1. This will open the **Get emails** card. Configure the **Get emails** card to select the top 10 unread emails from the Inbox folder. Don't include attachments because they won't be used in the flow:

     ![configure email card](./media/apply-to-each/foreach-5.png)

     >[AZURE.NOTE] So far, you've created a simple flow that gets some emails from your inbox. These emails will be returned in an array; the **Apply to each** action requires an array, so this is exactly what's needed.

## Add actions and conditions

1. Select **+ New step**, **More**, and then **Add an apply to each** action:

     ![select apply to each](./media/apply-to-each/foreach-6.png)

1. Insert the **Body** token into the **Select an output from previous steps** box on the **Apply to each** card. This pulls in the body of the emails to be used in the **Apply to each** action:

     ![add body token](./media/apply-to-each/foreach-7.png)

1. Select **Add a condition**:

     ![add condition](./media/apply-to-each/foreach-8.png)

1. Configure the **Condition** card to search the subject of each email for the words "meet now":

     - Insert the **Subject** token into the **Object Name** box.
     - Select **contains** in the **Relationship** list.
     - Enter **meet now** into the **Value** box.

          ![configure condition](./media/apply-to-each/foreach-subject-condition.png)

1. Select **More**, and then select **Add a condition** from the **IF YES, DO NOTHING** branch. This opens the **Condition 2** card; configure that card like this:

     - Insert the **Importance** token into the **Object Name** box.
     - Select **is equal to** in the **Relationship** list.
     - Enter **High** into the **Value** box.

          ![add condition](./media/apply-to-each/foreach-importance-condition.png)

1. Select **Add an action** under the **IF YES, DO NOTHING** section. This will open the **Choose an action** card, where you'll define what should happen if the search condition (the **meet now** email was sent with high importance) is true:

     ![add action](./media/apply-to-each/foreach-9.png)

1. Search for **notification**, and then select the **Notifications - Send me a mobile notification** action:

     ![seach and select notification](./media/apply-to-each/foreach-10.png)

1. On the **Send me a mobile notification** card, provide the details for the push notification that will be sent if the subject of an email contains "meet now", and then select **Add an action**:

     ![configure notification](./media/apply-to-each/foreach-11.png)

1. Enter **read** as the search term, and then select the **Office 365 Outlook - Mark as read** action. This will mark each email as read after the push notification is sent:

     ![add mark as read action](./media/apply-to-each/foreach-12.png)

1. Add the **Message Id** token to the **Message Id** box of the **Mark as read** card. You may need to select **See more** to find the **Message Id** token. This indicates the Id of the message that will be marked as read:

     ![add message id](./media/apply-to-each/foreach-13.png)

1. Going back to the **Condition 2** card, on the **IF NO, DO NOTHING** branch:
     - Select **Add an action**, and then type **get manager** into the search box.
     - Select the **Office 365 Users - Get manager** action from the search results list.
     - Enter your *full* email address into the **User** box of the **Get Manager** card.

          ![add and configure get manager action](./media/apply-to-each/foreach-get-manager.png)

1. Select **More**, and then select **Add a condition** from the **IF NO** branch. This opens the **Condition 3** card; configure the card to check if the email sender's email address (the From token) is the same as your boss' email address (the Email token):
     - Insert the **From** token into the **Object Name** box.
     - Select **contains** in the **Relationship** list.
     - Enter **Email** token into the **Value** box.

     ![configure search condition](./media/apply-to-each/foreach-condition3-card.png)

1. Select **Add an action** under the **IF YES, DO NOTHING** section of the **Condition 3** card. This will open the **IF YES** card, where you'll define what should happen if the search condition (the email was sent from your boss) is true:

     ![configure condition](./media/apply-to-each/foreah-condition3-add-action.png)

1. Search for **notification**, and then select the **Notifications - Send me a mobile notification** action:

     ![search for notification action](./media/apply-to-each/foreach-10.png)

1. On the **Send me a mobile notification 2** card, provide the details for the push notification that will be sent if the email is from your boss, and then select **Add an action**:

     ![configure notification card](./media/apply-to-each/foreach-boss-notification.png)

1. Add the **Office 365 Outlook - Mark as read** action. This will mark each email as read after the push notification is sent:

     ![add mark as read action](./media/apply-to-each/foreach-12.png)

1. Add the **Message Id** token to the **Mark as read 2** card. You may need to select **See more** to find the **Message Id** token. This indicates the Id of the message that will be marked as read:

     ![configure mark as read action](./media/apply-to-each/foreach-mark-as-read2.png)

1. Name your flow, and then create it:

     ![give your flow a name and save it](./media/apply-to-each/foreach-14.png)

If you followed along, your flow should look similar to this diagram:

![overview of the flow created](./media/apply-to-each/foreach-flow-finished.png)

## Run the flow

1. Send yourself a high-importance email that includes **meet now** in the subject (or have someone in your organization send you such an email).
1. Confirm the email is in your inbox and it's unread.
1. Sign into Microsoft Flow, select **My flows**, and then select **Run now**:

     ![run now](./media/apply-to-each/foreach-run-1.png)

1. Select **Run flow** to confirm you really want to run the flow:

     ![confirm run](./media/apply-to-each/foreach-run-2.png)

1. After a few moments you should see the results of the successful run:

     ![run results](./media/apply-to-each/foreach-run-3.png)

## View results of the run

Now that you've run the flow successfully, you should receive the push notification on your mobile device.

1. Open the Microsoft Flow app on your mobile device, and then select the **Activity** tab. You'll see the push notification about the meeting:

     ![select the activity tab](./media/apply-to-each/foreach-notification-1.png)

1. To see the full contents of the notification, you may have to select the notification. You'll see the full notification, similar to this:

     ![notification details](./media/apply-to-each/foreach-notification-2.png)

     >[AZURE.NOTE] If you don't receive the push notification, confirm that your mobile device has a working data connection.
