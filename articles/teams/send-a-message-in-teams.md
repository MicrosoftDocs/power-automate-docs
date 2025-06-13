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
ms.author: kewaiss
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.date: 06/13/2025
ms.topic: how-to
---

# Send a message in Teams using Power Automate

This article explains different ways in which you can send a message in Teams.

You can use Power Automate to set up a flow that sends messages to a Teams channel or group chat using the Microsoft Teams connector. Messages can be posted either as the user who is signed into the connector in the flow, or by using the Flow bot.

## Cloud flow setup

The scenarios in this article use a cloud flow to notify a channel or a group chat.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows** > **New flow** > **Automated cloud flow**.
1. Enter a name for your flow.
1. In the **Search all triggers** field, start typing **When a file is created (properties only) - SharePoint** and select it as your trigger when it appears in the list.
1. Select **Create**. This creates a new cloud flow with the **When a file is created (properties only)** trigger card in the center of the designer screen.

    Notice that the trigger card says *Invalid parameters* in red. This is because you need to configure it.

    > [!NOTE]
    > The screenshots of the designer might look different from your screen. This is because Power Automate allows you to use either the modern [new designer](../flows-designer.md) or the classic designer. The screenshots use the new designer, but the steps are similar in the classic designer.
    >
    > Learn more about the designer in [Identify differences between the classic designer and the new cloud flows designer](../flows-designer.md#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer).

1. In the designer, select the **When a file is created (properties only)** card to open the configuration pane to the left.
1. In the configuration pane, configure your trigger by selecting a site address and library name for the SharePoint site from the **Site Address** and **Library Name** dropdown menus.

    :::image type="content" source="../media/send-a-message-in-teams/flow-trigger-new-designer.png" alt-text="Screenshot showing the When a file is created (properties only) trigger in Power Automate.":::

1. Close the panel by selecting (**<<**) in the top right corner of the panel.

    Notice that the *Invalid parameters* message is now gone.

1. To add an action to this flow, select the plus sign (**+**).
1. Search for the **Post a message in a chat or channel** action, and then select it under the **Microsoft Teams** connector.

## Message sender options

The **Post a message in a chat or channel** action can send a message in the following two ways:

- **As the Flow bot:** In this method, the message gets sent as the Flow bot instead of any individual users. Use this sender option if you don't want to tie the message to any specific user and want to use a generic sender instead.

- **As a User:** In this method, the message gets sent as the user who is signed in to the Teams connector in the Flow (generally the Flow owner). This method can be used when the message needs to get sent as a regular user.

The **Post as** and **Post in** options within the action control the combinations of how messages can be posted in Teams.

## Post a message as the Flow bot in a Teams channel

To send a message as the Flow bot in a Teams channel:

1. In the **Post as** dropdown menu, select **Flow bot**.
1. In the **Post in** dropdown menu, select **Channel**.

    After you select these options, more dynamic inputs appear.

1. In the **Team** dropdown menu, select the team where you want to send the message.
1. In the **Channel** dropdown menu, select the channel where you want to send the message.
1. In the **Message** field, enter the message you want to send. To add a dynamic value to the message, do the following:
    1. Place the cursor where the input should appear.
    1. Select the lightning bolt to the right of the message field.
    1. Select an input from the list. If you don't see the input you want, select **See more** to expand the list.

    :::image type="content" source="../media/send-a-message-in-teams/flow-bot-channel-new-designer.png" alt-text="Screenshot showing 'Post a message in a chat or channel as the Flow bot.":::

## Post a message as the Flow bot in an existing named group chat

To send a message as the Flow bot in a group chat:

1. In the **Post as** dropdown menu, select **Flow bot**.
1. In the **Post in** dropdown menu, select **Group chat**.
1. In the **Group chat** dropdown menu, select a group chat to post the message in.
1. In the **Message** field, enter the message you want to send. To add a dynamic value to the message, do the following:
    1. Place the cursor where the input should appear.
    1. Select the lightning bolt to the right of the message field.
    1. Select an input from the list. If you don't see the input you want, select **See more** to expand the list.

    :::image type="content" source="../media/send-a-message-in-teams/flow-bot-group-chat-new-designer.png" alt-text="Screenshot showing Post a message in group chat.":::

    By default, Teams lists only the 50 most recent group chats in the dropdown menu. If you want to send a message to a new group chat, use the option in [Create a new group chat and post a message to it as the Flow bot](#create-a-new-group-chat-and-post-a-message-to-it-as-the-flow-bot).

1. Close the panel by selecting (**<<**) in the top right corner of the panel.

## Create a new group chat and post a message to it as the Flow bot

The **Post message in a chat or channel** action can be combined with the **Create a chat** action to create a new group chat and post a message to it. This is useful in scenarios where a chat might not already exist for this topic and one needs to be created.

To create a new group chat:

1. Select the (**+**) *above* the **Post a message in a chat or channel** action.
1. In the **Add an action** field, search for and select the **Create a chat** action.
1. In the **Members to add** field, add the members who need to be in the chat using their emails. Separate emails with a semi-colon.
1. Enter the title for the chat if needed.

    :::image type="content" source="../media/send-a-message-in-teams/create-a-chat.png" alt-text="Screenshot of the 'Create a chat' action.":::

1. In the designer, select the **Post a message in a chat or channel** action to configure it.
1. In the **Post as** dropdown menu, select **Flow bot**.
1. In the **Post in** dropdown menu, select **Group chat**.
1. In the **Group chat** dropdown menu, scroll to the bottom of the list and select **Enter custom value**.
1. Select the lightning bolt, and then select **Conversation ID** from the **Create a chat** list.

## Post a message as the Flow bot directly to a user

When you send a message as the Flow bot, you have the added option of posting directly to a user. This is useful in notification scenarios where you want to contact an individual user using the Flow bot.

1. In the designer, select the **Post a message in a chat or channel** action to configure it.
1. In the **Post as** dropdown menu, select **Flow bot**.
1. In the **Post in** dropdown menu, select **Chat with Flow bot**.
1. In the **Recipient** field, specify the user you want to message and the specific message you want to send.
1. In the **Message** field, enter the message you want to send. To add a dynamic value to the message, do the following:
    1. Place the cursor where the input should appear.
    1. Select the lightning bolt to the right of the message field.
    1. Select an input from the list. If you don't see the input you want, select **See more** to expand the list.

    :::image type="content" source="../media/send-a-message-in-teams/flow-bot-chat-direct-new-designer.png" alt-text="Screenshot of posting a message as the Flow bot directly to a user.":::

## Post a message as the user in a Teams Channel

To send a message as the user in a Teams channel:

1. In the **Post as** dropdown menu, select **User**
1. In the **Post in** dropdown menu, select  **Channel**.

    These actions display two dynamic inputs that let you specify the team and channel to send the message and add your message in the message field.  

    :::image type="content" source="../media/send-a-message-in-teams/user-channel-new-designer.png" alt-text="Screenshot showing Post a message in channel as the user.":::

## Post a message as the user in an existing named group chat

To send a message as the user in a Group chat:
1. In the **Post as** dropdown menu, select **User**.
1. In the **Post in** dropdown menu, select **Group chat**.
1. In the **Group chat** field, select the group chat to post the message in.
1. In the **Message** field, enter the message you want to send. To add a dynamic value to the message, do the following:
    1. Place the cursor where the input should appear.
    1. Select the lightning bolt to the right of the message field.
    1. Select an input from the list. If you don't see the input you want, select **See more** to expand the list.

:::image type="content" source="../media/send-a-message-in-teams/user-group-chat-new-designer.png" alt-text="Screenshot showing Post a message in existing named group chat as the user":::

By default, Teams only lists the 50 most recent **named** group chats in the drop-down. If you want to send a message to a new group chat, use the option in [Create a new group chat and post a message](#create-a-new-group-chat-and-post-a-message).

## Create a new group chat and post a message

The **Post message in a chat or channel** action can be combined with the **Create a chat** action to create a new group chat and post a message to it. This is useful in scenarios where a chat might not already exist for this topic and one needs to be created.

1. Select the plus sign (**+**) *above* the **Post a message in a chat or channel** action.
1. In the **Add an action** field, search for and select the **Create a chat** action.
1. In the **Members to add** field, add the members who need to be in the chat using their emails. Separate emails with a semi-colon.
1. Enter the title for the chat if needed.
1. In the designer, select the **Post a message in a chat or channel** action to configure it.
1. In the **Post as** dropdown menu, select **User**.
1. In the **Post in** dropdown menu, select **Group chat**.
1. In the **Group chat** dropdown menu, scroll to the bottom of the list and select **Enter custom value**.
1. Select the lightning bolt, and then select **Conversation ID** from the **Create a chat** list.

    :::image type="content" source="../media/send-a-message-in-teams/user-group-chat-new-new-designer.png" alt-text="Screenshot showing Post a message in group chat as the user.":::

### Mention a user in any message

Mentions are a great way to get the attention of a user in Teams. You can combine any of the previous actions and add a mention in the message to a user or channel.

1. Select the plus sign (**+**) *above* the **Post a message in a chat or channel** action.
1. In the **Add an action** field, search for and select the **Get an @mention token for a user** action.
1. In the **User** field, specify the email of the user you want to mention in the **User** field. This action generates a dynamic value that can be used in the message field of the **Post a message in chat or channel** action.

    The **User** field only accepts a single user input. If you want to mention multiple users, you need to add multiple instances of this action within the flow.

1. Add the mention dynamic value generated from  **Get an @mention token for a user** action in any of the previous **Post a message in chat or channel** action scenarios.

    The **Get an @mention token for a user** action only supports mentioning users and not channels or Teams at the moment.

    :::image type="content" source="../media/send-a-message-in-teams/user-group-chat-mention-new-designer.png" alt-text="Screenshot of a mention in the group chat message.":::

## Known issues and limitations

- By default, Teams only lists the 50 most recent group chats in the drop-down list.
- The **Get an @mention token for a user** is only for mentioning users. Mentioning channels or teams isn't supported.
- Sending a message in private channels isn't supported.

## Related information

[Training: Use the Teams connector in Power Automate (module)](/training/modules/use-teams-connector/?source=recommendations)
