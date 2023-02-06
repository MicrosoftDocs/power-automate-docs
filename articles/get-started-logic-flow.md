---
title: Create a cloud flow in Power Automate
description: Learn how to create a cloud flow that automatically performs one or more actions, such as sending email, when events like someone adding a row to a SharePoint list occur.
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: napienko
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2023
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: intro-internal
---

# Create a cloud flow in Power Automate

Create a cloud flow that performs one or more tasks automatically after it's triggered by an event. For example, create a cloud flow that notifies you by email when someone sends a tweet that contains a keyword you specify. In this example, sending a tweet is the event, and sending mail is the action.

## Prerequisites

- An account on [Power Automate](https://make.powerautomate.com)

- A Twitter account

- Office 365 credentials

## Choose an event to start the flow

First, you will need to select what event, or *trigger*, starts your flow.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **Create** > **Build your own**.

1. In the **Search** field, enter **Twitter**.

1. In the **Choose a connector** list, select **Twitter**.

1. In the **Choose a trigger** list, select **When a new tweet is posted**.

   :::image type="content" alt-text="Screenshot of the choosing a trigger." source="./media/get-started-logic-flow/choose-trigger.png":::

1. Select **Next**.

## Choose an action

1. In the **Search** field, enter **send email**.

1. Select **Office 365 Outlook**.

1. In the **Choose an action** list, select **Send an email (V2)**.

   :::image type="content" alt-text="Screenshot of choosing an action." source="./media/get-started-logic-flow/choose-action.png":::

1. Select **Next**.

1. If prompted, select the sign-in button, and then provide your credentials.

1. In the **To** field, enter your email address in the **To** field, and then select your name from the dropdown menu.

1. In the **Subject** field, enter **New tweet from:** and then enter a space.

1. In the **Dynamic content** list, select **Tweeted by** to add a placeholder for it.

1. Select the **Body** field, and then select **Tweet text** from the **Dynamic content** list to add a placeholder for it.

   :::image type="content" alt-text="Screenshot of the fields in the Send an email (V2)action." source="./media/get-started-logic-flow/message-token.png":::

   Optionally, you can add more tokens, other text, or both to the body of the email.

1. Near the top of the screen, select **Save**.

## Test your flow

Send a tweet with the keyword that you indicated, or wait for someone else to post such a tweet.

Within a minute after the tweet is posted, an email message notifies you of the new tweet.

> [!TIP]
>
> Use the **Send email (V2)** action to format email in which you customize the font, use bold, italic or underline, customize the color and highlight, and create lists or links, and more.

## Manage a cloud flow

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left navigation pane, select **My flows**.

1. In the list of flows, select a flow. You'll see a set of icons.

    - To edit a cloud flow, select the pencil icon.

    - To do any of the following, select the vertical three dots and make a selection from the dropdown menu:

       - To pause a cloud flow, select **Turn Off**.

       - To resume a cloud flow, select **Turn on**.

       - To delete a cloud flow, select **Delete** from the dropdown menu, and then select **Delete** to confirm.
   
       - To view the run history of a cloud flow, select **Run History**.

           Alternatively, you can open the flow from the **My flows** page, and then view the history under the **28 day run history** section. Then, select a cloud flow run from the list to see the inputs and outputs of each step.

> [!NOTE]
>
> You can have up to 600 flows in your account. If you already have 600 flows, delete one before you create another flow.

### See also

- [Add steps](multi-step-logic-flow.md), such as different ways to be notified, to your flow.
- [Run tasks on a schedule](run-scheduled-tasks.md), when you want an action to occur daily, on a certain date, or after a certain number of minutes.
- [Add a cloud flow to an app](https://powerapps.microsoft.com/tutorials/using-logic-flows/) to allow your app to kick off logic in the cloud.
- [Get started with team flows](create-team-flows.md) and invite others to collaborate with you to design flows.


[!INCLUDE[footer-include](includes/footer-banner.md)]