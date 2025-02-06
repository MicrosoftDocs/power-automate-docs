---
title: Leverage Power Automate features
description: Learn how to use Power Automate features like code view, notes, and copy and paste actions to streamline your workflow creation process.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/06/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Leverage Power Automate features

Power Automate includes features designed to help streamline your workflow. This article describes some of those features, including the ability to view and edit the underlying code of actions and triggers, add notes for better communication with team members, and using copy-paste actions to save time and improve productivity.

## Peek code/code view

Peek code or Code view is a feature that allows users to view the underlying JSON representation of the actions and triggers within a flow. This feature is useful for users who want to understand the structure and configuration of their flows, troubleshoot issues, or manually edit details that aren't easily accessible through the standard visual interface. 

Simply select an action and select **Code view**:

:::image type="content" source="media/codeview.png" alt-text="Screenshot of the code view of an action.":::

Code view can be used to view trigger polling frequency, trigger type, trigger conditions, and the JSON schema of the dynamic content:

:::image type="content" source="media/trigger-codeview.png" alt-text="Screenshot of the code view of a Dataverse trigger.":::

## Adding notes

Adding notes or comments in Power Automate cloud flows is a helpful way to document the purpose, logic, and specific details of various actions and triggers within the flow. This practice is beneficial for both individual users and teams, as it improves the readability and maintainability of the flows.

To add a note, select the ellipsis next to an action and select **Add a Note**.

:::image type="content" source="media/add-note.png" alt-text="Screenshot of the selecting Add a note.":::

Once you add the note, it shows displayed under the action name.

:::image type="content" source="media/add-note-done.png" alt-text="Screenshot of an action with a note.":::

## Copy and paste actions

Copying actions enables you to reuse the same action multiple times within a flow or across different flows. Copy-paste simplifies the process of creating and modifying flows and saves time and multiple select actions. You can copy and paste individual actions or entire conditions or scope actions. 

Select an action and select **Copy Action** to copy the action.

:::image type="content" source="media/copy-action.png" alt-text="Screenshot of selecting Copy Action.":::

Select the **+** to **Paste an action**.

:::image type="content" source="media/paste-action.png" alt-text="Screenshot of selecting Paste an Action.":::

