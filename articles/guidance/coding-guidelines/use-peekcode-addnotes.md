---
title: Streamline workflow creation with Power Automate features
description: Learn how to use Power Automate features like code view, notes, and copy and paste actions to streamline your workflow creation.
#customer intent: As a Power Automate user, I want to leverage Power Automate features so that I can streamline workflow creation.
author: manuelap-msft
contributors:
  - manuelap-msft
  - kisubedi
  - v-aangie
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/13/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Streamline workflow creation with Power Automate features

Power Automate includes several features that are designed to streamline the process of creating automated flows. This article describes how to view the underlying code of actions and triggers, add notes for better team communication, and use copy-paste actions to save time and boost productivity.

Where you find these features depends on whether you're using the new designer or the classic designer. Learn more in [What is the cloud flows designer?](../../flows-designer.md).

In the classic designer, you can find all the features discussed in this article in the action menu, as shown in the following example.

:::image type="content" source="media/pa-features-classic designer.png" alt-text="Screenshot of the action menu in the Power Automate classic designer.":::

The following sections describe where to find the features in the new designer.

## View underlying code

Peek code (classic designer) or code view (new designer) allows you to view the underlying JSON representation of actions and triggers in a flow. It's useful if you want to understand the structure and configuration of your flows. You can't edit the code directly to make changes to actions or triggers. However, you can view information such as the trigger polling frequency, type, and conditions, and the JSON schema of the dynamic content in an action.

### Code view (new designer)

In the new designer, select an action, and then select **Code view**.

:::image type="content" source="media/trigger-codeview.png" alt-text="Screenshot of the code view of a Dataverse trigger in a Power Automate flow, with the trigger type and conditions highlighted." lightbox="media/codeview.png":::

### Peek code (classic designer)

In the classic designer, select the ellipsis (**&hellip;**) on an action or trigger, and then select **Peek code**. Select **Done** to close the peek.

## Add notes

Notes in Power Automate cloud flows are like comments in code&mdash;they're a helpful way to document the purpose, logic, and details of actions and triggers. They improve the readability and maintainability of your flows, whether you build flows as part of a team or on your own.

### Add a note (new designer)

1. In the new designer, select an action. Select the vertical ellipsis (**&vellip;**), and then select **Add a note**.

    :::image type="content" source="media/pa-features-add-note-new-designer.png" alt-text="Screenshot of adding a note to an action in the Power Automate new designer.":::

1. Type your note.

    A note icon appears on the action or trigger to indicate that a note is present. To view the note, hover over the icon.

    :::image type="content" source="media/pa-features-note-added-new-designer.png" alt-text="Screenshot of an action with a note in the Power Automate new designer.":::

### Add a note (classic designer)

1. In the classic designer, select the ellipsis (**&hellip;**) on an action or trigger, and then select **Add a note**.

1. Select the text box under **Note** and type your note. Press Enter to save it.

    :::image type="content" source="media/pa-features-add-note-classic-designer.png" alt-text="Screenshot of adding a note to an action in the Power Automate classic designer.":::

    The note appears under the action name.

    :::image type="content" source="media/add-note-done.png" alt-text="Screenshot of an action with a note in the Power Automate classic designer." lightbox="media/add-note-done.png":::

## Copy and paste actions

You can copy and paste actions to reuse them in a flow or across different flows. You can copy individual actions or entire conditions or scope actions. You can't copy triggers.

### Copy an action (new designer)

1. In the new designer, right-click the action you want to reuse, and then select **Copy action**.

    :::image type="content" source="media/pa-features-copy-action-new-designer.png" alt-text="Screenshot of copying an action in the Power Automate new designer.":::

1. Right-click the plus icon (**+**) where you want to add a new action, and then select **Paste an action** > **Paste an action**.

    :::image type="content" source="media/pa-features-paste-action-new-designer.png" alt-text="Screenshot of pasting an action in the Power Automate new designer.":::

### Copy an action (classic designer)

1. In the classic designer, select the ellipsis (**&hellip;**) on an action, and then select **Copy to my clipboard**.

1. Select the plus icon (**+**) where you want to add a new action, and then select **My clipboard**.

    :::image type="content" source="media/pa-features-paste-action-classic-designer.png" alt-text="Screenshot of selecting the clipboard to paste a copied action in the Power Automate classic designer.":::

1. Select the action you copied earlier.
