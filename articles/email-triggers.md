---
title: Trigger a cloud flow based on email properties in Power Automate | Microsoft Docs
description: Start a cloud flow based on properties of an email such as the subject, sender's address, or recipient's address - When a new email arrives (V3), On new email
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/10/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Trigger a cloud flow based on email properties

Use the **When a new email arrives (V3)** trigger to create a cloud flow that runs when one or more of the following email properties match criteria that you provide.

| Property | When to use |
| --- | --- |
| Folder |Trigger a cloud flow whenever emails arrive in a specific folder. This property can be useful if you have rules that route emails to different folders. |
| To |Trigger a cloud flow based on the address to which an email was sent. This property can be useful if you receive email that was sent to different email addresses in the same inbox. |
|CC|Trigger a cloud flow based on the CC address to which an email was sent. This property can be useful if you receive email that was sent to different email addresses in the same inbox.
| From |Trigger a cloud flow based on the sender's email address. |
| Importance |Trigger a cloud flow based on the importance with which emails were sent. Emails can be sent with high, normal, or low importance. |
| Has Attachment |Trigger a cloud flow based on the presence of attachments in incoming emails. |
| Subject Filter |Search for the presence of specific words in the subject of an email. Your flow then runs actions that are based on the results of your search. |

> [!IMPORTANT]
> Each [Power Automate plan](https://flow.microsoft.com/pricing/) includes a run quota. Always check properties in the flow's trigger when possible. Doing so avoids using your run quota unnecessarily. If you check a property in a condition, each run counts against your plan's run quota, even if the filter condition that you defined isn't met.<br><br>For example, if you check an email's From address in a condition, each run counts against your plan's run quota, even if it's not from the address that interests you.

In the following tutorials, we check all properties in the **when a new email arrives (V3)** trigger. Learn more by visiting the [frequently asked billing questions](billing-questions.md#what-counts-as-a-run) and the [pricing](https://ms.flow.microsoft.com/pricing/) page.

## Prerequisites

- An account with access to [Power Automate](https://flow.microsoft.com).
- An email account with Outlook for Microsoft 365 or Outlook.com.
- The Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
- Connections to Office, Outlook, and the push notification service.

## Trigger a cloud flow based on an email's subject

In this tutorial, we create a cloud flow that sends a push notification to your mobile phone if the subject of any new email has the word "lottery" in it. Your flow then marks any such email as **read**.

>[!NOTE]
>Although this tutorial sends a push notification, you're free to use any other action that suits your workflow needs. For example, you might store the email contents in another repository such as Google Sheets or a Microsoft Excel workbook stored on Dropbox.

OK, let's get started.

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

9. In the **Subject Filter** box, enter the text that your flow uses to filter incoming emails.

     In this example, we're interested in any email that has the word "lottery" in the subject.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of advanced options.](./media/email-triggers/email-triggers-subject-text.png "Advanced options")

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

3. Enter the details for the mobile notification you want to receive when you receive an email that matches the **Subject Filter** you specified earlier.

    > [!div class="mx-imgBorder"]
    > ![Screenshot that displays the details of a notification.](./media/email-triggers/email-triggers-4.png "Details of a notification")

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

4. Select **Save** at the top of the page.

    > [!div class="mx-imgBorder"]
    > ![Screenshot that displays the save flow option.](./media/email-triggers/email-triggers-subject-notification.png "Save flow option")

Congratulations! You now receive a push notification each time you receive an email that contains the word "lottery" in the subject.

## Trigger a cloud flow based on an email's sender

In this tutorial, we create a cloud flow that sends a push notification to your mobile phone if any new email arrives from a specific sender (email address). The flow also marks any such email as Read.

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

9. In the **From** box, enter the email address of the sender. 

     Your flow takes action on any emails that are sent from this address.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of email property.](./media/email-triggers/email-triggers-from.png "Email property")

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

3. Enter the details for the mobile notification you'd like to receive whenever a message arrives from the email address that you entered earlier.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of mobile notification details.](./media/email-triggers/email-triggers-sender-notification.png "Mobile notification details")

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

4. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of creating a flow.](./media/email-triggers/email-triggers-sender-5.png "Create flow")

## Trigger a cloud flow when emails arrive in a specific folder

If you have rules that route emails to different folders based on certain properties, such as the address, you might want this type of flow.

Let's get started.

> [!NOTE]
> If you don't already have a rule that routes email to a folder other than your inbox, create such a rule and confirm it works by sending a test email.

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-specific-folder](includes/sign-in-use-blank-select-email-trigger-and-specific-folder.md)]

5. Select the folder to which you're routing specific emails. To display all email folders, first select the **Show Picker** icon, which is located on the right side of the **Folder** box on the **when a new email arrives (V3)** card.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of selecting a folder.](./media/email-triggers/email-triggers-2.png "Select folder")

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

3. Enter the details for the mobile notification you'd like to receive when an email arrives in the folder you selected earlier. If you haven't already, enter the credentials for the notifications service.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of notification details.](./media/email-triggers/email-triggers-folder-notification.png "Notification details")

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

4. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

    > [!div class="mx-imgBorder"]
    > ![Screenshot showing the option to save the cloud flow.](./media/email-triggers/email-triggers-7.png "Save the cloud flow")

Test the flow by sending an email that gets routed to the folder you selected earlier in this tutorial.

[!INCLUDE[footer-include](includes/footer-banner.md)]
