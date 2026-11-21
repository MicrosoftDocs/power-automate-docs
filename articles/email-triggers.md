---
title: Trigger a cloud flow based on email properties in Power Automate
description: Learn how to start a cloud flow based on properties of an email such as the subject, sender's address, or recipient's address - When a new email arrives (V3), On new email.
suite: flow
author: radioblazer
contributors:
  - hamenon
  - v-aangie
  - cyrilanderson
ms.author: matow
ms.reviewer: cyanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 09/21/2026
ms.update-cycle: 180-days
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
|CC|Trigger a cloud flow based on the CC address to which an email was sent. This property can be useful if you receive email that was sent to different email addresses in the same inbox. |
| From |Trigger a cloud flow based on the sender's email address. |
| Importance |Trigger a cloud flow based on the importance with which emails were sent. Emails can be sent with high, normal, or low importance. |
| Has Attachment |Trigger a cloud flow based on the presence of attachments in incoming emails. |
| Subject Filter |Search for the presence of specific words in the subject of an email. Your flow then runs actions that are based on the results of your search. |

> [!IMPORTANT]
> Each [Power Automate plan](https://make.powerautomate.com/pricing/) includes a run quota. Always check properties in the flow's trigger when possible. Doing so avoids using your run quota unnecessarily. If you check a property in a condition, each run counts against your plan's run quota, even if the filter condition that you defined isn't met. For example, if you check an email's From address in a condition, each run counts against your plan's run quota, even if it's not from the address that interests you.

In the following tutorials, we check all properties in the **when a new email arrives (V3)** trigger. Learn more in [frequently asked billing questions](billing-questions.md#what-counts-as-a-run) and in [pricing](https://make.powerautomate.com/pricing/).

## Prerequisites

- An account with access to [Power Automate](https://make.powerautomate.com).

- An email account with Outlook for Microsoft 365 or Outlook.com.

- Connections to Office, Outlook, and Microsoft Teams.

## Trigger a cloud flow based on an email's subject

In this tutorial, you create a cloud flow that sends a Teams message if the _subject_ of any new email has the word "lottery" in it. Your flow then marks any such email as **read**.

Although this tutorial sends a Teams message, you can similarly use any other action that suits your workflow needs. For example, you might store the email contents in another repository such as Google Sheets or a Microsoft Excel workbook stored on Dropbox.

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

1. Ask Copilot to help finish creating your flow by typing the following prompt:

    "When I receive an email, if the email contains the word 'lottery' in the subject, send me a Teams message about it and mark the email as Read."

    :::image type="content" source="./media/email-triggers/copilot-lottery.png" alt-text="Screenshot of triggering a cloud flow based on an email's subject in Copilot.":::

    Copilot generates a proposed flow based on your prompt.

1. Review the connections and parameters on the designer.
1. Revise, as needed, using the Copilot chat and the designer interface.
1. When you are done, select **Save**.

# [Classic designer](#tab/classic-designer)

1. On the **When a new email arrives (V3)** card, select **Show advanced options**.

1. In the **Subject Filter** box, enter the text that your flow uses to filter incoming emails.

     In this example, you're interested in any email that has the word "lottery" in the subject.

    :::image type="content" source="./media/email-triggers/email-triggers-subject-text.png" alt-text="Screenshot of the When a new email arrives (V3) advanced options with lottery entered in the Subject Filter box.":::

1. Select **New step**.

1. In the search field, enter **Teams**, and then select the **Microsoft Teams** connector. You see the Teams connector actions.

1. Select the action that you want to use for the Teams message. For example, select **Post a message in a chat or channel** or **Post a message to myself**.

1. Enter the details for the Teams message you want to receive when you receive an email that matches the **Subject Filter** you specified earlier.

1. Select **Save**.

Congratulations! You now receive a Teams message each time you receive an email that contains the word "lottery" in the subject.

---

## Trigger a cloud flow based on an email's sender

In this tutorial, you create a cloud flow that sends a Teams message if any new email arrives from a specific sender (email address). The flow also marks any such email as Read.

# [New designer](#tab/new-designer)

1. Ask Copilot to create your flow by typing the following prompt:

    "When I receive an email from jake@contoso.com, send me a Teams message and mark the email as Read."

    :::image type="content" source="./media/email-triggers/copilot-email.png" alt-text="Screenshot of triggering a cloud flow based on an email's sender in Copilot.":::

1. Review the connections and parameters on the designer.
1. Save the flow.

# [Classic designer](#tab/classic-designer)

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-inbox-folder](includes/sign-in-use-blank-select-email-trigger-and-inbox-folder.md)]

1. In the **From** box, enter the email address of the sender.

     Your flow takes action on any emails that are sent from this address.

1. Select **New step**.

1. In the search field, enter **Teams**, and then select the **Microsoft Teams** connector. You see the Teams connector actions.

1. Select the action that you want to use for the Teams message. For example, select **Post a message in a chat or channel** or **Post a message to myself**.

1. Enter the details for the Teams message you'd like to receive whenever a message arrives from the email address that you entered earlier.

1. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

---

## Trigger a cloud flow when emails arrive in a specific folder

If you have rules that route emails to different folders based on certain properties, such as the address, you might want this type of flow.

> [!NOTE]
> If you don't already have a rule that routes email to a folder other than your inbox, create such a rule and confirm it works by sending a test email.

# [New designer](#tab/new-designer)

1. Ask Copilot to create your flow by typing a request, such as:

    "When I receive an email in Sync Issues folder, send me a Teams message and mark the email as Read."

    :::image type="content" source="./media/email-triggers/copilot-folder.png" alt-text="Screenshot of triggering a cloud flow when emails arrive in a specific folder in Copilot.":::

1. Ensure the email trigger folder is selected. Copilot usually selects the folder, but if it doesn't, select it yourself.

    :::image type="content" source="./media/email-triggers/copilot-parameters-folder.png" alt-text="Screenshot of a selected folder in Copilot.":::

1. Save your flow. Your automation starts running.

1. Test your flow by sending an email to the folder you specified.

# [Classic designer](#tab/classic-designer)

[!INCLUDE [sign-in-use-blank-select-email-trigger-and-specific-folder](includes/sign-in-use-blank-select-email-trigger-and-specific-folder.md)]

1. Select **New step**.

1. In the search field, enter **Teams**, and then select the **Microsoft Teams** connector. You see the Teams connector actions.

1. Select the action that you want to use for the Teams message. For example, select **Post a message in a chat or channel** or **Post a message to myself**.

1. Enter the details for the Teams message you'd like to receive when an email arrives in the folder you selected earlier. If you didn't enter the credentials for the notifications service, enter them now.

[!INCLUDE [add-mark-as-read-action](includes/add-mark-as-read-action.md)]

1. Give your flow a name, and then save it by selecting **Create flow** at the top of the page.

Test the flow by sending an email that gets routed to the folder you selected earlier in this tutorial.

---

## Related information

[Training: Create flows to manage email (module)](create-email-flows.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
