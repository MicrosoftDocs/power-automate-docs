---
title: Work with triggers and actions
description: Learn how to use triggers and actions in Power Automate to streamline your workflows.
author: kewaiss
contributors:
  - kewaiss
  - v-aangie
ms.date: 01/16/2026
ms.topic: article
ms.update-cycle: 180-days
ms.service: power-automate
ms.subservice: cloud-flow
ms.author: matow
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

A *trigger* is an event that starts a cloud flow. It defines the conditions under which your flow runs. *Actions* are the events you want the flow to do after the trigger event takes place. For example, you can create a flow that sends you a notification in Microsoft Teams (the action) when someone sends you an email (the trigger). To save a cloud flow, it must have at least a trigger and one action.

- Learn more about the [types of cloud flows](overview-cloud.md#types-of-cloud-flows)
- Learn more about [triggers](triggers-introduction.md)
- Learn more about [actions](actions-introduction.md)

If you're using Copilot to create your flow, Copilot automatically chooses the appropriate cloud flow type and trigger for you based on your description. If you're creating a flow without Copilot, you need to make these choices on your own.

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

## Next step

> [!div class="nextstepaction"]
> [Customize your triggers with conditions](customize-triggers.md)

## Related information

- [Customize your triggers with conditions](customize-triggers.md)
- [Troubleshoot common issues with triggers](/troubleshoot/power-platform/power-automate/flow-run-issues/triggers-troubleshoot?tabs=new-designer)