---
title: Trigger a cloud flow based on email properties in Power Automate
description: Learn how to start a cloud flow based on properties of an email such as the subject, sender's address, or recipient's address - When a new email arrives (V3), On new email.
suite: flow
author: HeatherOrt
contributors:
  - hamenon
  - v-aangie
ms.author: dbekirop
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/01/2025
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: bap-ai-copilot
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
> Each [Power Automate plan](https://make.powerautomate.com/pricing/) includes a run quota. Always check properties in the flow's trigger when possible. Doing so avoids using your run quota unnecessarily. If you check a property in a condition, each run counts against your plan's run quota, even if the filter condition that you defined isn't met.<br><br>For example, if you check an email's From address in a condition, each run counts against your plan's run quota, even if it's not from the address that interests you.

In the following tutorials, we check all properties in the **when a new email arrives (V3)** trigger. Learn more by visiting the [frequently asked billing questions](billing-questions.md#what-counts-as-a-run) and the [pricing](https://make.powerautomate.com/pricing/) page.

## Prerequisites

- An account with access to [Power Automate](https://make.powerautomate.com).

- An email account with Outlook for Microsoft 365 or Outlook.com.


- The Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).
- Connections to Office, Outlook, and the push notification service.

## Trigger a cloud flow based on an email's subject

In this tutorial, we create a cloud flow that sends a push notification to your mobile phone if the subject of any new email has the word "lottery" in it. Your flow then marks any such email as **read**.

Although this tutorial sends a push notification, you're free to use any other action that suits your workflow needs. For example, you might store the email contents in another repository such as Google Sheets or a Microsoft Excel workbook stored on Dropbox.

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

# [New designer](#tab/new-designer)

1. Simply ask Copilot to create your flow by typing the following prompt:

    **When I receive an email that contains the word 'lottery' in the subject, send me a push notification and mark the email as Read.**

    :::image type="content" source="./media/email-triggers/copilot-lottery.png" alt-text="Screenshot of triggering a cloud flow based on an email's subject in Copilot.":::

1. Review the connections and parameters on the designer.
1. Save the flow.

# [Classic designer](#tab/classic-designer)

1. Select the folder that you'd like the flow to monitor for incoming emails, and then select **Show advanced options**.

    To display all your email folders, select the **Show Picker** icon, which is located on the right side of the **Folder** box on the **When a new email arrives (V3)** card.

1. In the **Subject Filter** box, enter the text that your flow uses to filter incoming emails.

     In this example, we're interested in any email that has the word "lottery" in the subject.

    :::image type="content" source="./media/email-triggers/email-triggers-subject-text.png" alt-text="Screenshot of advanced options.":::

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

1. Enter the details for the mobile notification you want to receive when you receive an email that matches the **Subject Filter** you specified earlier.

    :::image type="content" source="./media/email-triggers/email-triggers-4.png" alt-text="Screenshot that displays the details of a notification.":::

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

1. Select **Save** at the top of the page.

Congratulations! You now receive a push notification each time you receive an email that contains the word "lottery" in the subject.

---

## Trigger a cloud flow based on an email's sender

In this tutorial, you create a cloud flow that sends a push notification to your mobile phone if any new email arrives from a specific sender (email address). The flow also marks any such email as Read.

# [New designer](#tab/new-designer)

1. Simply ask Copilot to create your flow by typing the following prompt:

    **When I receive an email from jake@contoso.com, send me a push notification and mark the email as Read.**

    :::image type="content" source="./media/email-triggers/copilot-email.png" alt-text="Screenshot of triggering a cloud flow based on an email's sender in Copilot.":::

1. Review the connections and parameters on the designer.
1. Save the flow.

# [Classic designer](#tab/classic-designer)

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

1. In the **From** box, enter the email address of the sender. 

     Your flow takes action on any emails that are sent from this address.

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

3. Enter the details for the mobile notification you'd like to receive whenever a message arrives from the email address that you entered earlier.

    :::image type="content" source="./media/email-triggers/email-triggers-sender-notification.png" alt-text="Screenshot of mobile notification details.":::

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

4. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

---

## Trigger a cloud flow when emails arrive in a specific folder

If you have rules that route emails to different folders based on certain properties, such as the address, you might want this type of flow.

> [!NOTE]
> If you don't already have a rule that routes email to a folder other than your inbox, create such a rule and confirm it works by sending a test email.

# [New designer](#tab/new-designer)

1. Simply ask Copilot to create your flow by typing :

    **When I receive an email in Sync Issues folder, send me a push notification and mark the email as Read.**

    :::image type="content" source="./media/email-triggers/copilot-folder.png" alt-text="Screenshot of triggering a cloud flow when emails arrive in a specific folder in Copilot.":::

1. Make sure the folder is selected in email trigger, if it isn't already applied by Copilot.

    :::image type="content" source="./media/email-triggers/copilot-parameters-folder.png" alt-text="Screenshot of a selected folder in Copilot.":::

1. Your flow is ready to be used. Simply save the flow and your automation is running.
1. Test your flow by sending an email to the folder you specified.

# [Classic designer](#tab/classic-designer)

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-specific-folder](includes/sign-in-use-blank-select-email-trigger-and-specific-folder.md)]

5. Select the folder to which you're routing specific emails. To display all email folders, first select the **Show Picker** icon, which is located on the right side of the **Folder** box on the **when a new email arrives (V3)** card.

    :::image type="content" source="./media/email-triggers/email-triggers-2.png" alt-text="Screenshot of selecting a folder.":::

[!INCLUDE [add-mobile-notification-action](includes/add-mobile-notification-action.md)]

3. Enter the details for the mobile notification you'd like to receive when an email arrives in the folder you selected earlier. If you haven't already, enter the credentials for the notifications service.

    :::image type="content" source="./media/email-triggers/email-triggers-folder-notification.png" alt-text="Screenshot of notification details.":::

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

4. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

Test the flow by sending an email that gets routed to the folder you selected earlier in this tutorial.

---

## Related information

[Training: Create flows to manage email (module)](create-email-flows.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
