---
title: Create a cloud flow in Power Automate
description: Learn how to create a cloud flow that automatically performs one or more actions when an event occurs.
suite: flow
author: kisubedi
contributors:
  - kewaiss
  - kisubedi
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 07/07/2025
ms.update-cycle: 180-days
ms.author: kisubedi
ms.reviewer: angieandrews
ms.custom: copilot-scenario-highlight
search.audienceType: 
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Create a cloud flow in Power Automate

Create a cloud flow that performs one or more tasks automatically after an event triggers it. For example, create a cloud flow that notifies you by email when someone sends a tweet that contains a keyword you specify. In this example, sending a tweet is the event, and sending mail is the action.

## Prerequisites

- An account on [Power Automate](https://make.powerautomate.com)
- An X account
- Office 365 credentials

## Create a cloud flow

[!INCLUDE[copilot-tab-experience](./includes/copilot-tab-experience.md)]

# [Using copilot](#tab/using-copilot)

With Copilot, you can create a cloud flow using natural language. Copilot generates a flow based on your prompt. You can use it 'as is', or customize it further. Learn more in [Configure your cloud flow in the designer](#configure-your-cloud-flow-in-the-designer).

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Copy the following prompt and paste it in the Copilot field:

    ```copilot-prompt
    when a new tweet is posted, send an email to eug@contoso.com with X username
    ```

1. Select **Generate**.

    Based on the description, Copilot begins to create a suggested *trigger* and *actions* for your flow. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

    In this example, the trigger is **When a new tweet is posted** and the actions are **Get user** and **Send an email**.

    :::image type="content" source="./media/get-started-logic-flow/copilot-natural-language-new-designer.png" alt-text="Screenshot of a prompt that uses natural language in Copilot.":::

1. Select **Keep it and continue**.

1. Review your connected apps and services to X and Outlook. A green checkmark indicates that the connection is valid.
1. Select **Next**. Your flow appears on the designer.
1. Save the flow and it's ready to use.

   Your flow triggers when new tweets mentioning the key phrase *Contoso Company* are posted. It also sends an email to the specified email address in the **Send an email** action.

1. Go to [Test your flow](#test-your-flow).

# [Without copilot](#tab/without-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. From the navigation bar on the left, select **My flows**.
1. Select **New flow**, and then select **Automated cloud flow**.
1. In the **Flow name** field, give your flow a name.

    If you skip this step, Power Automate generates a name for you.

1. In the **Search all triggers** field, enter **X**.
1. Select **When a new tweet is posted - X**.

    :::image type="content" source="./media/get-started-logic-flow/name-search-trigger-classic-designer.png" alt-text="Screenshot of name your flow and search for the Twitter trigger.":::

1. At the bottom of the screen, select **Create**.

   > [!TIP]
   > Connectors support multiple types of authentication. For example, SQL Server supports Microsoft Entra ID, SQL Server authentication, Windows authentication, and SQL connection string. Choose which type of authentication you want to use when configuring a connector.

1. Go to [Configure your cloud flow in the designer](#configure-your-cloud-flow-in-the-designer).

---

## Configure your cloud flow in the designer

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

1. Make sure you completed the steps in [Create a cloud flow](#create-a-cloud-flow).
1. Below the **When a new tweet is posted** trigger, select the plus sign (**+**).
1. In the **Search for an action or connector** field, enter **send email**.
1. Under **Office 365 Outlook**, select **Send an email (V2)**. The configuration pane opens.
1. In the configuration pane, enter your email address in the **To** field.
1. In the **Subject** field, enter **New tweet from:**, and then type a space.
1. Select the lightning bolt to the right and select **Tweeted by** to add a placeholder for it.

    If you don't see the **Tweeted by** dynamic content, select **See more** at the top of the list.

    :::image type="content" source="./media/get-started-logic-flow/add-parameter-new-designer.png" alt-text="Screenshot of adding the 'Tweeted by dynamic content in the new designer.":::

1. Select the **Body** field, select the lightning bolt, and then select **Tweet text** to add a placeholder for it.

    > [!NOTE]
    > Optionally, you can add more dynamic content, other text, or both to the body of the email.

1. Close the configuration pane by selecting **<<** in the upper-right corner of the pane.
1. Select **Save** and go to [Test your flow](#test-your-flow).

# [Classic designer](#tab/classic-designer)

1. Make sure you completed the steps in [Create a cloud flow](#create-a-cloud-flow).
1. Select **+ New step**.
1. In the **Choose an operation** field, enter **send email**.
1. In the **Actions** list, select **Send an email (V2) - Office 365 Outlook**.
1. In the **To** field, enter your email address.
1. In the **Subject** field, enter **New tweet from:**, and then type a space.
1. In the **Dynamic content** list, select **Tweeted by** to add a placeholder for it.

    :::image type="content" source="./media/get-started-logic-flow/add-parameter-classic-designer.png" alt-text="Screenshot of adding the Tweeted by dynamic content.":::

1. Select the **Body** field, and then select **Tweet text** in the **Dynamic content** list to add a placeholder for it.

    > [!NOTE]
    > Optionally, you can add more dynamic content, other text, or both to the body of the email.

1. Select **Save** and go to [Test your flow](#test-your-flow).

---

## Test your flow

After you [create a cloud flow](#create-a-cloud-flow) and save it, send a tweet with the keyword that you indicated, or wait for someone else to post such a tweet.

In about a minute after the tweet is posted, an email message notifies you of the new tweet.

> [!TIP]
> Use the **Send email (V2)** action to format email in which you customize the font, use bold, italic, or underline, customize the color and highlight, create lists or links, and more.

## Manage a cloud flow

You can have up to 600 flows in your account. If you already have 600 flows, delete one before you create another flow.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the navigation pane to the left, select **My flows**.

1. Select the vertical ellipsis (**&vellip;**) next to the flow you want to manage, and then do any of the following:

   * To pause a cloud flow, select **Turn off**.

        :::image type="content" source="./media/get-started-logic-flow/pause-flow.png" alt-text="Screenshot of pausing a flow.":::

   * To resume a cloud flow, select **Turn on**.

   * To edit a cloud flow, select **Edit** (or the pencil icon) that corresponds to the flow you want to edit.

   * To delete a cloud flow, **Delete**, and then select **Delete** on the message box that appears.

   * To view the run history of a cloud flow, select the flow from the **My flows** page. Then, select **Details** to see the history under the **28 day run history** section. Select a cloud flow run from the list to view the inputs and outputs of each step.

## Related information

- [Add steps](multi-step-logic-flow.md), such as different ways to be notified, to your flow.
- [Run tasks on a schedule](run-scheduled-tasks.md), when you want an action to occur daily, on a specific date, or after a specific number of minutes.
- [Add a cloud flow to an app](/power-apps/maker/canvas-apps/using-logic-flows)
- [Get started with team flows](create-team-flows.md) and invite others to collaborate with you to design flows.
- [Training: Get started with Power Automate (module)](/training/modules/get-started-flows/)
- [Training: Enhance communication using Power Automate and the Office 365 Users Connector (module)](/training/modules/enhance-communication/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
