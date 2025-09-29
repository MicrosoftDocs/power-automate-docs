---
title: Work with triggers and actions
description: Learn how to use triggers and actions in Power Automate to streamline your workflows.
author: kewaiss
contributors:
  - kewaiss
  - v-aangie
ms.date: 10/01/2025
ms.topic: article
ms.update-cycle: 180-days
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

# Work with triggers and actions

This article explains how to use triggers and actions with various cloud flow types.

A *trigger* is an event that starts a cloud flow. It defines the conditions under which your flow runs. For example, you can create a flow that sends you a notification in Microsoft Teams when someone sends you an email. In this case, receiving an email is the trigger that starts this flow.

*Actions* are the events you want the flow to do after the trigger event takes place. To save a cloud flow, it must have at least a trigger and one action.

- Learn more about the types in [Types of cloud flows](overview-cloud.md#types-of-cloud-flows).
- Learn more about triggers in [Triggers overview](triggers-introduction.md).
- Learn more about actions in [Actions overview](actions-introduction.md).

If you're using Copilot to create your flow, Copilot automatically chooses the appropriate cloud flow type and trigger for you based on your description. If you're creating a flow without Copilot, you need to make these choices on your own.

In this article, you'll learn how to trigger a flow in three ways: automatically using predefined triggers, scheduled based on a specified date and time, and manually, as determined by you. After you create a trigger, you'll learn how to replace it in an existing flow, and then add actions to your flow to tell the trigger what to do after it starts.

## Select a trigger to start a flow when a designated event happens

An [automated cloud flow](overview-cloud.md#types-of-cloud-flows) is triggered by a designated event, such as receiving an email or a new item being added to a SharePoint list.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane, select **Create**.
1. Under **Start from blank**, select **Automated cloud flow**.
1. On the **Build an automated cloud flow** screen, enter a name for your flow.
1. In the **Choose your flow's trigger** field, search for and select the trigger you want to use. For example, you can enter, *When a new email arrives* to trigger the flow when you receive a new email.

    There are many triggers available, depending on the connectors you have access to. For example, you can use triggers from Microsoft 365, SharePoint, Dynamics 365, and many other services.

    Scroll through the list of triggers or use the search box to find the one you want. If you want to display more triggers, select **Show more**.

    :::image type="content" source="media/work-with-triggers-actions/triggers-automated.png" alt-text="Screenshot of some of the triggers available for automated cloud flows.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/work-with-triggers-actions/triggers-automated-designer.png" alt-text="Screenshot of the trigger in the designer for an automated cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. When you save your flow, it runs automatically when the trigger condition is met. For example, if you selected the *When a new email arrives* trigger, your flow runs automatically every time you receive a new email.

    Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

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

    :::image type="content" source="media/work-with-triggers-actions/triggers-scheduled.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/work-with-triggers/triggers-scheduled-designer.png" alt-text="Screenshot of the 'Recurrence' trigger in the designer for a scheduled cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. When you save your flow, it runs automatically at the specified time, or on the specified schedule. For example, if you set the recurrence to run every day at 10:00 AM, your flow runs automatically every day at that time.

    Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

## Select a trigger to start a flow manually

An instant cloud flow is triggered manually, such as when you select a button in Power Automate or in a mobile app.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane, select **Create**.
1. Under **Start from blank**, select **Instant cloud flow**.
1. On the **Build an instant cloud flow** screen, enter a name for your flow.
1. In the **Choose how to trigger this flow** field, search for and select the trigger you want to use.

    There are many triggers to start your flow. For example, you can trigger it manually with the click of a button, when a Dataverse row is selected, or for a selected Team message.

    :::image type="content" source="media/work-with-triggers-actions/triggers-instant.png" alt-text="Screenshot of some of the triggers available for instant cloud flows.":::

1. Select **Create**. Your trigger appears in the designer.

    :::image type="content" source="media/work-with-triggers/triggers-instant-designer.png" alt-text="Screenshot of the trigger in the designer for an instant cloud flow.":::

1. After you create a trigger, your next step is to add the actions that will take place once your trigger starts the cloud flow. When you save your flow, you can start it in either the portal or on your mobile phone. Unlike an automatic flow and a scheduled flow, you need to start an instant flow *manually*. After you activate the flow, you can check if the actions you added are executed as expected.

    Learn how to add an action in [Add actions to your cloud flow](#add-actions-to-your-cloud-flow).

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
1. If you want to save your flow, you need to [add at least one action](#add-actions-to-your-cloud-flow). Then, you can select **Save** on the command bar at the top of the page.

---

## Add actions to your cloud flow

You work with actions in the *designer*. Power Automate allows you to use either the [new designer](flows-designer.md) or the [classic designer](flows-designer.md) to add actions to your cloud flow. The steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

# [New designer](#tab/new-designer)

1. Below the trigger or action where you want the new action to appear, select the plus sign (**+**).
1. In the **Add an action** pane, search for and select the action you want to add. For example, you can enter *send an email* to find the **Send an email (V2)** action.
1. In the **Office 365 Outlook** list, select the action you want to add. The action is added to your flow.

    If you want a list of actions to choose from instead, you can select from four categories in the **Add an action** pane: **Favorites**, **AI capabilities**, **Built-in tools**, and **By connector**. Learn how to quickly find the action you need in [Configuration pane](flows-designer.md#configuration-pane).

    :::image type="content" source="media/work-with-triggers-actions/add-action-new.png" alt-text="Screenshot of the 'Add an actions' pane.":::

    If the action you want to add isn't in the list, select **See more** to display more actions.

1. On the command bar at the top of the screen, select **Save**.

# [Classic designer](#tab/classic-designer)

1. Hover over the down arrow below the trigger or action where you want the new action to appear until a plus sign (**+**) appears.
1. Select the plus sign (**+**), and then select **Add an action**.
1. In the **Choose an operation** search field, enter a keyword or phrase to find the action you want to add. For example, you can enter *send an email* to find the **Send an email (V2)** action.
1. In the **Actions** list, select the action you want to add. The action is added to your flow.

    :::image type="content" source="media/work-with-triggers-actions/add-action-classic.png" alt-text="Screenshot of the 'Actions' list in the 'Choose an operation' card.":::

    If the action you want to add isn't in the list, select **See more** to display more actions.

1. On the command bar at the top of the screen, select **Save**.

---

## Add another action

In this procedure, you add an action in the middle of the flow. This action saves a file in your Dropbox, archiving the item in the list.

1. Sign into [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. In the list of flows, select the **Edit** icon next to the flow you want to edit.
1. Select **New step**, enter **dropbox** in the search field, and select **Create file - Dropdown** in the **Actions** list.

    :::image type="content" source="media/work-with-triggers-actions/create-file-search.png" alt-text="Screenshot of creating a Dropbox file.":::

1. If prompted, provide your Dropbox credentials.
1. Select the folder icon on the right side of the **Folder path** box.
1. Select **>**, and then choose the folder in which you want to place the new file.
1. Enter the name of the new file into the **File name** box. Be sure to append an extension, such as ".txt", to the file name. Here, let's use the **TweetId** in the file's name to ensure uniqueness of the files. You might have to select **See more** to find the **TweetId** token.
1. Add the text that you want the file to contain by typing into the **File content** box. You can also add tokens into the **File content** box.

    If the file name you enter matches an existing file's name in the selected folder, the existing file is overwritten.

1. Save your flow.
1. Send a tweet that contains the keyword you specified.

     In about a minute, a file is created in your Dropbox account.

## Reorder or delete an action

To receive email after the file is created in Dropbox, move the Dropbox action by dragging its title bar above the email action. Release the Dropbox action over the arrow between the trigger (**When a new tweet is posted**) and the email action. (The cursor indicates whether the action is positioned correctly.)
  
> [!NOTE]
> You can't move a step before another if you're using any outputs from that step.

To delete an action, select **...** (the ellipsis) near the right edge of the title bar for the action you want to delete, select **Delete**, and then select **OK**.

> [!NOTE]  
> You can't delete an action if you're using any outputs from it anywhere in the flow. First, remove those outputs from the fields, and then you can delete the action.

## Copy and paste actions

If you want to duplicate actions while designing a cloud flow, you can copy and paste them. For example, if you're building a condition and want similar actions in the **If yes/true** side and the **If no/false** side, you can build the first action in one side and then copy it to the other side. This is an alternative to creating both actions from scratch.

1. On the action menu heading, select **...** (the ellipses).
1. Select **Copy to my clipboard**.
1. Select **New step** where you want your action to go.

     Notice the **My clipboard** tab that lets you choose from all of the actions that you copied.
1. Select the item you want to paste.

## Related information

- [Customize your triggers with conditions](customize-triggers.md)
- [Troubleshoot common issues with triggers](/troubleshoot/power-platform/power-automate/flow-run-issues/triggers-troubleshoot?tabs=new-designer)