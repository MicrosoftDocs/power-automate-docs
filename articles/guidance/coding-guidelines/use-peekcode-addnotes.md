---
title: Use code view, add notes, and copy&paste action
description: Learn how to use code view, add notes, and copy&paste action
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

# Use code view, add notes, and copy&paste action

## Peek code/Code View

Peek code or Code view is a feature that allows users to view the underlying JSON representation of the actions and triggers within a flow. This feature is useful for users who want to understand the structure and configuration of their flows, troubleshoot issues, or manually edit details that aren't easily accessible through the standard visual interface. 

To view the code view, select an action and select **Code View**:

:::image type="content" source="media/codeview.png" alt-text="A screenshot of the code view of an action":::

The code view can be used to view trigger polling frequency, trigger type,  trigger conditions, and JSON schema of the dynamic content:

:::image type="content" source="media/trigger-codeview.png" alt-text="A screenshot of the code view of a Dataverse trigger":::

## Add a note

Adding notes or comments in Power Automate cloud flows is a helpful way to document the purpose, logic, and specific details of various actions and triggers within the flow. This practice is beneficial for both individual users and teams, as it improves the readability and maintainability of the flows.

To add a note, select the ellipsis next to an action and select **Add Note**:

:::image type="content" source="media/add-note.png" alt-text="A screenshot of the selecting Add a note":::

Once you add the note, it shows under the action name:
To add a note, select the ellipsis next to an action and select **Add Note**:

:::image type="content" source="media/add-note-done.png" alt-text="A screenshot of an action with a note":::

## Copy and Paste actions

Copying actions is useful to reuse the same action multiple times within a flow or across different flows. This helps in simplifying the process of creating and modifying flows and saves time and multiple select. You can copy and paste individual actions or entire conditions or scope actions as well. 

Select an action and select **Copy Action** to copy the action:

:::image type="content" source="media/copy-action.png" alt-text="A screenshot of selecting Copy Action":::

Select the **+** to paste an action:

:::image type="content" source="media/paste-action.png" alt-text="A screenshot of selecting Paste Action":::

