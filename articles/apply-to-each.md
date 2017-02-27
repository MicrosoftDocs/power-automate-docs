<properties
    pageTitle="Learn how to parse an array of items and take an action based on a condition by using the Apply to each action.| Microsoft Flow"
    description="Use Microsoft Flow to loop through an array of items."
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
   ms.date="02/30/2017"
   ms.author="deonhe"/>

# Using the apply to each action in Microsoft Flow

Sometimes you need to confirm a condition on each item in an array and then take a particular action if the condition is met. Microsoft Flow makes this simple by providing the **apply to each** action that can be used with a *condition*. In this walk-through, we'll create a flow that does the following periodically:  
1. Get the last 10 messages in your Office365 Outlook email inbox  
2. Check each of the 10 messages to determine if it unread and has **meet now** in the subject. If both conditions are met, the flow will send a push notification to your mobile device, letting you know that you need to attend a meeting.  
3. Mark the email as *read*.  

### Prerequisites
- To use the **apply to each** action, your flow must provide an array of items.  
- You will also need to configure connections to Office 365 Outlook and the push notification service.  


## Use the apply to each action
After you have signed into the [Microsoft Flow portal](https://flow.microsoft.com), 
1. Select the **My flows** tab and then create a flow from a blank template:  
![](./media/apply-to-each/foreach-1.png)  
2. Enter "schedule" into the search box to search for all services and triggers that are related to scheduling.  
3. Select the  the **Schedule - Recurrence** trigger to indicate that your flow will run on a schedule that you will provide next:  
![](./media/apply-to-each/foreach-2.png)  
4. Set the schedule to run every 15 minutes:  
![](./media/apply-to-each/foreach-3.png)  
5. Select **Add an action** and then type **outlook** into the search box to search for all actions related to Microsoft Outlook.  
6. Select the **Office 365 Outlook - Get emails** action:  
![](./media/apply-to-each/foreach-4.png)  
7. This will open the **Get emails** card. Configure the **Get emails** card to select the top 10 unread emails from the Inbox folder. Do not include attachments because they won't be used in the flow:  
![](./media/apply-to-each/foreach-5.png)  
So far, you have created a simple flow that gets some emails from your inbox. These emails will be returned in an array; the **apply to each** action requires an array, so this is exactly what is needed.  
8. Select the **add an apply to each** action:  
![](./media/apply-to-each/foreach-6.png)  
9. Insert the **Body** token into the **Select an output from previous steps** control on the **Apply to each** card. This pulls in the body of the emails to be used in the *apply to each* operation:  
![](./media/apply-to-each/foreach-7.png)  
10. Select **Add a condition**:  
![](./media/apply-to-each/foreach-8.png)  
11. Configure the **Condition** card to search the subject of each email for the words "meet now":
- Insert the **Subject** token into the **Object name** control.
- Select **Contains** in the **Relationship** drop down list box.
- Enter **meet now** into the  **Value** control.  
12. Select **Add an action** under the **IF YES, DO NOTHING** section. This will open the **IF YES** card, where you'll define what should happen if the search condition is true:    
![](./media/apply-to-each/foreach-9.png)  
13. Search for **notification** and then select the **Notifications - Send me a mobile notification** action:  
![](./media/apply-to-each/foreach-10.png)  
14. On the **Send me a mobile notification** card, provide the details for the push notification that will be sent if the subject of an email contains "meet now":  
![](./media/apply-to-each/foreach-11.png)  
15. Add the **Office 365 Outlook - Mark as read** action. This will mark each email as read after the push notification is sent:  
![](./media/apply-to-each/foreach-12.png)  
16. Add the **Message id** token to the **Mark as read** card. This indicates the Id of the message that will be marked as read:  
![](./media/apply-to-each/foreach-13.png)  
17. Name your flow and then create it:  
![](./media/apply-to-each/foreach-14.png)  


## Run the flow
1. Send an email to yourself or have someone in your organization send you an email with **meet now** in the subject of the email.  
1. Confirm the email is in your inbox and it is unread.  
1. Run the flow you just created from the **My flows** tab of the Microsoft Flow portal by selecting **Run now**:  
![](./media/apply-to-each/foreach-run-1.png)  
1. Select **Run flow** to confirm you really want to run the flow:  
![](./media/apply-to-each/foreach-run-2.png)  
1. After a few moments you should see the results of the successful run:  
![](./media/apply-to-each/foreach-run-3.png)  

## View results
Now that you've run the flow successfully, you should receive the push notification on your mobile device.  
1. Open your Microsoft Flow app on your mobile device and then select the **Activity** tab. You will see the push notification about the meeting:  
![](./media/apply-to-each/foreach-notification-1.png)  
1. To see the full contents of the notification, you may have to select the notification. You will see the full notification, similar to this:  
![](./media/apply-to-each/foreach-notification-2.png)  

>[AZURE.NOTE] If you don't receive the push notification, confirm that your mobile device has a working data connection.  

## Learn more