---
title: Create an approval from a chat or channel | Microsoft Docs
description: Learn how to create an approval from a chat or channel.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
contributors:
 - kewaiss
 - v-aangie
 - cyrilanderson
ms.service: power-automate
ms.subservice: teams
ms.topic: how-to
ms.date: 08/31/2026
ms.author: matow
ms.reviewer: cyanderson
---

# Create an approval from a chat or channel

With the new approvals experience in Teams, you can create an approval from any chat or channel from the compose box.

## Start an approval in a chat or channel

Follow these steps to create an approval in a chat or channel in Teams.

1. Sign in to [Microsoft Teams](https://teams.microsoft.com).
1. Go to the chat or channel where you want to send the approval.
1. Select the approvals icon under the compose box.

   :::image type="content" source="../media/native-approvals-in-teams/approvals-compose-box.png" alt-text="Start an approval in chat.":::

1. When you select the icon, a modal dialog appears for you to enter the details of the approval.

   :::image type="content" source="../media/native-approvals-in-teams/approvals-dialog-box.png" alt-text="Approvals form.":::

1. Enter the details of the approval you want to send, along with who you need the approval from.

> [!TIP]
> By default, the approvers' input is restricted to the roster of the team or chat where you're sending the approval.

1. **Optional**: Include a file with your approval. Select *Add attachment* in the Approval form. The app automatically stores any uploaded files in your OneDrive/SharePoint folder, just like other files shared on Teams.

   :::image type="content" source="../media/native-approvals-in-teams/approval-attach.png" alt-text="Add attachment to approvals.":::

1. Select **Send**.

   The app creates and sends a card in the chat or channel.

   :::image type="content" source="../media/native-approvals-in-teams/approvals-card.png" alt-text="Approvals card.":::

## Custom responses for approvals

If you want to customize the actions for an approval, use the **Custom responses** option to change the action to anything you want. To do so, follow the same steps mentioned earlier and then toggle the custom responses option in the approvals form.

   :::image type="content" source="../media/native-approvals-in-teams/custom-responses.png" alt-text="Custom responses.":::

> [!TIP]
> To add more than two custom responses, use a cloud flow to send the approval. [Learn more about custom responses in approvals](../create-approval-response-options.md).

## Known issue

Currently, all approvals you create by using this native Teams experience are in your organization's default environment.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
