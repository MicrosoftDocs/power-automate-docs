---
title: Send a message in Teams using Power Automate
description: Learn the different ways in which you can send a message in Microsoft Teams
author: kisubedi
contributors:
  - kisubedi
  - kewaiss
  - kartikraop
  - hamenon-ms
  - v-aangie
ms.author: kisubedi
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 05/08/2025
---

# Send a message in Teams using Power Automate

This article covers different ways in which you can send a message in Teams.

You can use Power Automate to set up a flow that sends messages to a Teams Channel or group chat using the Microsoft Teams connector. Messages can be posted either as the user who is signed into the connector in the flow or by using the Flow bot.

## Flow setup

For the purposes of this document, we're using a scenario where a flow is used to notify a Channel or a Group chat, but the same principles can be used to apply to any flow where the **Post a message in a chat or channel** is used.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows** > **New** > **Automated cloud flow**.
1. Enter a name for your flow.
1. Select the **When a file is created (properties only) - SharePoint** trigger.
1. Select **Create**.
1. Set up your trigger by choosing a SharePoint site and Folder ID that you want to monitor.
1. To add an action to this flow, select **+**.
1. Search for and select the **Post a message in a chat or channel** action.

## Message sender options

The **Post a message in a chat or channel** action can send a message in the following two ways:

- **As the Flow bot:** In this method, the message gets sent as the Flow bot instead of any individual users. Use this sender option if you didn't want to tie the message to any specific user and just want to use a generic sender instead.

- **As a User:** In this method, the message gets sent as the user who is signed in to the Teams connector in the Flow (generally the Flow owner). This method can be used when the message needs to get sent as a regular user.

The **Post as** and **Post in** options within the action control all the different combinations of how messages can be posted in Teams.

## Post a message as the Flow bot in a Teams channel

To send a message as the Flow bot in a Teams channel, select the **Post as** option as **Flow bot** and the **Post in** option as **Channel**. After selecting these options, two more dynamic inputs should appear. Specify the team and channel where you want to send the message, and enter your message in the message field.

:::image type="content" source="../media/post-a-message/flow-bot-channel-new-designer.png" alt-text="Screenshot showing Post a message in channel as the Flow bot":::

:::image type="content" source="../media/post-a-message/flow-bot-channel-teams-new-designer.png" alt-text="Screenshot showing Message in Teams from the Flow bot":::

## Post a message as the Flow bot in an existing named group chat

To send a message as the Flow bot in a group chat:

1. Select the **Post as** option as **Flow bot** and the **Post in** option as **Group chat**.

    :::image type="content" source="../media/post-a-message/flow-bot-group-chat-new-designer.png" alt-text="Screenshot showing Post a message in group chat":::

1. Another option shows up that lets you select the group chat to post in. Choose a group chat to post the message in and add your message in the message field.

    By default, Teams lists only the 50 most recent **named** group chats in the dropdown menu. If you want to send a message to a new group chat, use the option in [Create a new group chat and post a message to it as the Flow bot](#create-a-new-group-chat-and-post-a-message-to-it-as-the-flow-bot).

## Create a new group chat and post a message to it as the Flow bot

The **Post message in a chat or channel** action can be combined with the **Create a chat** action to create a new group chat and post a message to it. This is useful in scenarios where a chat might not already exist for this topic and one needs to be created.

1. To create a new group chat, add the **Create a chat** action *before* the **Post message in a chat or channel** action. Add the members who need to be in the chat using their emails. Separate multiple emails with a semi-colon and enter the title for the chat if needed.
1. To send a message as the Flow bot in the new created group chat, select the **Post as** option as **Flow bot** and the **Post in** option as **Group chat**. Once you do, another option that lets you select the group chat to post in appears.
1. In the Group chat field, choose **Enter custom value** and select the **Conversation id** from the **Create a chat** action in the dynamic token picker.

    :::image type="content" source="../media/post-a-message/flow-bot-group-chat-new-new-designer.png" alt-text="Screenshot showing Post a message in group chat as the Flow bot":::

## Post a message as the Flow bot directly to a user

When you send a message as the Flow bot, you have the added option of posting directly to a user. This is useful in notification scenarios where you want to reach out to an individual user using the Flow bot.

For this, select the **Chat with Flow bot** option and specify the user you want to message and the specific message you want to send.

:::image type="content" source="../media/post-a-message/flow-bot-chat-direct-new-designer.png" alt-text="Screenshot showing Post a message in a Teams group chat as the Flow bot":::

## Post a message as the user in a Teams Channel

To send a message as the user in a Teams channel, select the **Post as** option as **User** and the **Post in** option as **Channel**. This action displays two dynamic inputs that let you specify the team and channel to send the message and add your message in the message field.  

:::image type="content" source="../media/post-a-message/user-channel-new-designer.png" alt-text="Screenshot showing Post a message in channel as the user":::

## Post a message as the user in an existing named group chat

To send a message as the user in a Group chat, select the **Post as** option as **User** and the **Post in** option as **Group chat**. After you do, an another option that lets you select the Group chat to post in appears. Choose a group chat to post the message in and add your message in the message field.

:::image type="content" source="../media/post-a-message/user-group-chat-new-designer.png" alt-text="Screenshot showing Post a message in existing named group chat as the user":::

By default, Teams only lists the 50 most recent **named** group chats in the drop-down. If you want to send a message to a new group chat, use the option in [Create a new group chat and post a message](#create-a-new-group-chat-and-post-a-message).

## Create a new group chat and post a message

The **Post message in a chat or channel** action can be combined with the **Create a chat** action to create a new group chat and post a message to it. This is useful in scenarios where a chat might not already exist for this topic and one needs to be created.

1. To create a new group chat, add the **Create a chat** action *before* the **Post message in a chat or channel** action. Add the members who need to be in the chat using their emails. Separate multiple emails with a semi-colon and enter the title for the chat if needed.
1. To send a message as the Flow bot in the new created group chat, select the **Post as** option as **User** and the **Post in** option as **Group chat**. Once you do, another option that lets you select the Group chat to post in appears. In the Group chat field, choose **Enter custom value** and select the **Conversation id** from the **Create a chat** action in the dynamic token picker.

    :::image type="content" source="../media/post-a-message/user-group-chat-new-new-designer.png" alt-text="Screenshot showing Post a message in group chat as the user":::

### Mention a user in any message

Mentions are a great way to get the attention of a user in Teams. You can combine any of the above actions and add a mention in the message of to a user or channel.

1. To mention a user, use the **Get @mention token for a user** action before the **Post a message in chat or channel** action. Specify the email of the user you want to mention in the **User** field. This action generates a token that can be used in the message field of the **Post a message in chat or channel** action.

    The **User** field only accepts a single user input. If you want to mention multiple users, you need to add multiple instances of this action within the flow.

1. Add the mention token generated from  **Get @mention token for a user** action in any of the previous **Post a message in chat or channel** action scenarios.

    The **Get @mention token for a user** action only supports mentioning users and not channels or Teams at the moment.

    :::image type="content" source="../media/post-a-message/user-group-chat-mention-new-designer.png" alt-text="Screenshot showing Post a message in group chat as the user with a mention":::

## Known issues and limitations

- By default, Teams only lists the 50 most recent **named** group chats in the drop-down list.

- The **Get @mention token for a user** is only for mentioning users. Mentioning channels or teams isn't supported.

- Sending a message in private channels isn't supported.

## Related information

[Training: Use the Teams connector in Power Automate (module)](/training/modules/use-teams-connector/?source=recommendations)
