---
title: Create flows for popular email scenarios in Power Automate | Microsoft Docs
description: Top scenarios where you can use Power Automate to manage your email.
author: msftman
manager: kvivek
ms.subservice: cloud-flow
ms.topic: article
ms.date: 05/10/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create flows for popular email scenarios

Here are some of the top scenarios in which you can use Power Automate to manage your email.

- Send an email from your account.

- Send an email from a distribution list or shared mailbox.

- Send an email with voting options.

- Build an approval process and notify colleagues via email.

- Send a reminder email to approvers.

- Send a daily digest email with a summary table.

## Send email from your account

To send email from your account, use the [Send an email (V2)](/connectors/office365/) action.

You can send the email to one or more recipients. You can use the rich text editor to make text bold, add color, and format the email similar to the way you do in Outlook. You can add static text or values from previous actions by using dynamic content. You can use the **send as** option to send email as someone else, or on behalf of someone else. To use this option, you'll need the permissions in Outlook to send on another person's behalf. You can find all email you send in your **Sent items** folder in Outlook.

For example, if you have a cloud flow that sends you an email as soon as your item is approved, you can add the link of the approved item as an attachment.

> [!div class="mx-imgBorder"]
> ![Screenshot that displays an example of an email that uses dynamic content in the body of the email.](./media/email/dynamic-content.png "Email that uses dynamic content in the body of the email")

## Send email with voting options

Use the **Send email with options** action to send an email with voting options using actionable email. Provide voting options in the **User Options** field.

> [!div class="mx-imgBorder"]
> ![Screenshot showing a Send email with options card.](./media/email/email-options.png "Send email with options card")

The recipients receive an email similar to the following screenshot.

> [!div class="mx-imgBorder"]
> ![Screenshot of an email with voting buttons.](./media/email/voting-buttons.png "Email with voting buttons")

In your flow, you must capture that response and save it somewhere. You might email it to yourself, save it to Excel, or post it to Microsoft Teams. Don't forget to save it, otherwise you won't know how people voted.

## Send an email from a distribution list or shared mailbox

Use the [Send an email from a shared mailbox (V2)](/connectors/office365/) action, and specify the shared mailbox address to send email from a shared mailbox. 

The distribution list admin must first give you [permissions](/microsoft-365/admin/manage/send-email-as-distribution-list?view=o365-worldwide) to the shared mailbox. When you use this action, email appears in the Sent folder of your shared mailbox because you're sending it from that account directly.

> [!div class="mx-imgBorder"]
> ![Screenshot that shows the Send an email from a shared mailbox (V2) card.](./media/email/shared-mailbox.png "Send an email from a shared mailbox (V2) card")

## Build an approval process and send notifications via email

You can use Power Automate to [build an approval process that notifies users via email](https://o365hq.com/blog/build-an-approval-process-with-power-automate).

## Send reminder email to approvers

You can also send [reminder emails for approval requests](https://flow.microsoft.com/blog/approval-reminders-using-parallel-branches).

## Send a daily digest email with a table

Here are three ways you can send a daily digest email with a table.

- Use the [Data Operation – Select](./data-operations.md#use-the-select-action) action to create a table with the column names and data you'd like to appear in the email.
You can further format the data by using expressions. In following example, the flow gets calendar events within a certain timeframe, converts the time zones, and then creates a table with the events.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of an example flow with a table that has column names and data you'd like to appear in the email.](./media/email/table.png "Example flow with a table")

- Add the [Create HTML Table](./data-operations.md#use-the-create-html-table-action) action, and then add the output from the select action to the HTML action.

- Add the [Send an email (V2)](/connectors/office365/) action, and then add the output from an HTML table into the body of the email.

### More information

[Overview of using Outlook and Power Automate](email-overview.md)  
[Create flows to manage email](create-email-flows.md)  
[Customize email in flows](email-customization.md)  

[!INCLUDE[footer-include](includes/footer-banner.md)]
