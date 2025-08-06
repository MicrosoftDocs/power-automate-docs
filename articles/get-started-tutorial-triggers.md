---
title: "Tutorial: Get started with triggers"
description: Learn how to use triggers in Power Automate to streamline your workflows.
author: kewaiss
contributors:
  - kewaiss
  - v-aangie
ms.date: 08/07/2025
ms.topic: how-to
ms.service: power-automate
ms.subservice: cloud-flow
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType:
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Tutorial: Get started with triggers

This article explains how to use triggers with various cloud flow types.

A trigger is an event that starts a cloud flow. It defines the conditions under which your flow runs. For example, you can create a flow that sends you a notification in Microsoft Teams when someone sends you an email. In this case, receiving an email is the trigger that starts this flow.

- Learn more about the types in [Types of cloud flows](overview-cloud.md#types-of-cloud-flows).
- Learn more about triggers in [Triggers overview](triggers-introduction.md).

If you're using Copilot to create your flow, Copilot automatically chooses the appropriate cloud flow type and trigger for you based on your description. If you're creating a flow without Copilot, you need to make these choices on your own.

In this article, you'll learn how to start a flow in three ways: automatically using predefined triggers, manually as determined by you, and scheduled based on a specified date and time. After you create a trigger, you'll learn how to replace it in an existing flow, and add actions to your flow to tell the trigger what to do after it starts.

## Select a trigger to start a flow when a designated event happens

An [automated cloud flow](overview-cloud.md#types-of-cloud-flows) is triggered by a designated event, such as receiving an email or a new item being added to a SharePoint list.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane, select **Create**.
1. Under **Start from blank**, select **Automated cloud flow**.
1. On the **Build an automated cloud flow** screen, enter a name for your flow.
1. In the **Choose your flow's trigger** field, search for and select the trigger you want to use. For example, you can enter, *When a new email arrives* to trigger the flow when you receive a new email.

    There are many triggers available, depending on the connectors you have access to. For example, you can use triggers from Microsoft 365, SharePoint, Dynamics 365, and many other services.

    Scroll through the list of triggers or use the search box to find the one you want. If you want to display more triggers, select **Show more**.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-automated.png" alt-text="Screenshot of some of the triggers available for automated cloud flows.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-automated-designer.png" alt-text="Screenshot of the trigger in the designer for an automated cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

## Select a trigger to start a flow manually

An instant cloud flow is triggered manually, such as when you select a button in Power Automate or in a mobile app.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane, select **Create**.
1. Under **Start from blank**, select **Instant cloud flow**.
1. On the **Build an instant cloud flow** screen, enter a name for your flow.
1. In the **Choose how to trigger this flow** field, search for and select the trigger you want to use.

    There are many triggers to start your flow. For example, you can trigger it manually with the click of a button, when a Dataverse row is selected, or for a selected Team message.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-instant.png" alt-text="Screenshot of some of the triggers available for instant cloud flows.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-instant-designer.png" alt-text="Screenshot of the trigger in the designer for an instant cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

## Run a cloud flow on a schedule

[A scheduled cloud flow](overview-cloud.md#types-of-cloud-flows) runs at a specific time or on a recurring schedule, such as every day at 10:00 AM or every Monday at 9:00 AM.

When you create a scheduled cloud flow, Power Automate automatically assigns the **Recurrence** trigger.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane, select **Create**.
1. Under **Start from blank**, select **Scheduled cloud flow**.
1. On the **Build a scheduled cloud flow** screen, enter a name for your flow.
1. Under **Run this flow**, select the calendar icon and select the start date for your flow.
1. In the **at** dropdown menu, select the time to start the flow.
1. In the **Repeat every** field and the recurrence dropdown menu, select the recurrence pattern, such as every day, every week, or every month.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-scheduled.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/get-started-tutorial-triggers/triggers-scheduled-designer.png" alt-text="Screenshot of the 'Recurrence'trigger in the designer for a scheduled cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

## Replace the trigger in an existing cloud flow

If you change your mind about the trigger you selected, you can replace it with a different one.

You work with triggers in the *designer*. [!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.
    1. Select the flow that you want to edit.
    1. On the command bar at the top of the page, select **Edit**.
1. In the flow designer, select the trigger that you want to replace.
1. At the top of the configuration pane, select the vertical ellipsis (**&vellip;**) and then select **Delete**.

    To confirm the deletion, select **OK** in the dialog box that appears.

1. After you delete the trigger, Power Automate replaces the current trigger with the **Add a trigger** card.
1. Select the **Add a trigger** card. The **Add a trigger** pane opens.
1. Search for the connector or trigger you want to use. You can search for a specific trigger by typing a name in the search field, or by selecting the right arrow (**>**) next to an option in a trigger category.

    The **Add a trigger** pane is organized in the same way as the **Add an action** pane. Learn more in [Explore the cloud flows designer](flows-designer.md#configuration-pane).

1. Select the trigger that you want to use. The configuration pane opens to allow you to configure the trigger.
1. Configure the trigger settings, if needed.
1. Close the configuration pane and return to the flow designer by selecting **<<**.

    The new trigger is now the first step in your flow.

1. If you want to save your flow, you need to [add at least one action](#add-actions-to-your-cloud-flow). Then, you can select **Save** on the command bar at the top of the page.

# [Classic designer](#tab/classic-designer)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.
    1. Select the flow that you want to edit.
    1. On the command bar at the top of the page, select **Edit**.
1. On the trigger card, select the ellipsis (**…**) and then select **Delete**.

    To confirm the deletion, select **OK** in the dialog box that appears.

    After you delete the trigger, Power Automate prompts you to select a new trigger.

1. Search for the connector or trigger you want to use with one of the following methods:
    - To get a list of the corresponding triggers for a specific app, select the icon for the app.
    - To use a keyword search or to search for a specific trigger, enter the keyword or name of the trigger in the **Search connectors and triggers** field.
  
    Both methods return a list of triggers that you can use in your flow. If you can't find the trigger you want in the list, select **See more**.

1. Select the trigger that you want to use. You return to the designer, where you can configure the trigger.
1. 1. If you want to save your flow, you need to [add at least one action](#add-actions-to-your-cloud-flow). Then, you can select **Save** on the command bar at the top of the page.

---

## Add actions to your cloud flow

*Actions* are the events you want the flow to do after the trigger event takes place. To save a cloud flow, it must have at least a trigger and one action.

You work with actions in the *designer*. Power Automate allows you to use either the [new designer](flows-designer.md) or the [classic designer](flows-designer.md) to add actions to your cloud flow. The steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

# [New designer](#tab/new-designer)

1. Below the trigger or action where you want the new action to appear, select the plus sign (**+**).
1. In the **Add an action** pane, search for and select the action you want to add. For example, you can enter *send an email* to find the **Send an email (V2)** action.
1. In the **Office 365 Outlook** list, select the action you want to add. The action is added to your flow.

    If you want a list of actions to choose from instead, you can select from four categories in the **Add an action** pane: **Favorites**, **AI capabilities**, **Built-in tools**, and **By connector**. Learn how to quickly find the action you need in [Configuration pane](flows-designer.md#configuration-pane).

    :::image type="content" source="media/get-started-tutorial-triggers/add-action-new.png" alt-text="Screenshot of the 'Add an actions' pane.":::

    If the action you want to add isn't in the list, select **See more** to display more actions.

1. On the command bar at the top of the screen, select **Save**.

# [Classic designer](#tab/classic-designer)

1. Hover over the down arrow below the trigger or action where you want the new action to appear until a plus sign (**+**) appears.
1. Select the plus sign (**+**), and then select **Add an action**.
1. In the **Choose an operation** search field, enter a keyword or phrase to find the action you want to add. For example, you can enter *send an email* to find the **Send an email (V2)** action.
1. In the **Actions** list, select the action you want to add. The action is added to your flow.

    :::image type="content" source="media/get-started-tutorial-triggers/add-action-classic.png" alt-text="Screenshot of the 'Actions' list in the 'Choose an operation' card.":::

    If the action you want to add isn't in the list, select **See more** to display more actions.

1. On the command bar at the top of the screen, select **Save**.

---

## Related information

- [Customize your triggers with conditions](customize-triggers.md)
- [Troubleshoot common issues with triggers](/troubleshoot/power-platform/power-automate/flow-run-issues/triggers-troubleshoot?tabs=new-designer)