---
title: Leverage Power Automate features
description: Learn how to use Power Automate features like code view, notes, and copy and paste actions to streamline your workflow creation process.
#customer intent: As an admin, I want to leverage Power Automate features so that I can streamline workflow creation.
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

Power Automate includes features designed to help streamline your workflow. This article describes features like viewing and editing the underlying code of actions and triggers, adding notes for better team communication, and using copy-paste actions to save time and boost productivity.

## Peek code or code view

Peek code or Code view is a feature that allows users to view the underlying JSON representation of the actions and triggers within a flow. This feature is useful for users who want to understand the structure and configuration of their flows, troubleshoot issues, or manually edit details that aren't easily accessible through the standard visual interface. 

Select an action and then select **Code view**:

:::image type="content" source="media/codeview.png" alt-text="Screenshot of the code view of an action." lightbox="media/codeview.png":::

Code view can be used to view trigger polling frequency, trigger type, trigger conditions, and the JSON schema of the dynamic content:

:::image type="content" source="media/trigger-codeview.png" alt-text="Screenshot of the code view of a Dataverse trigger.":::

## Adding notes

Adding notes or comments in Power Automate cloud flows is a helpful way to document the purpose, logic, and specific details of various actions and triggers within the flow. This practice is beneficial for both individual users and teams, as it improves the readability and maintainability of the flows.

To add a note, select the ellipsis next to an action and select **Add a Note**.

:::image type="content" source="media/add-note.png" alt-text="Screenshot of the selecting Add a note." lightbox="media/add-note.png":::

Once you add the note, it displays under the action name.

:::image type="content" source="media/add-note-done.png" alt-text="Screenshot of an action with a note." lightbox="media/add-note-done.png":::

## Copy and paste actions

Copying actions enables you to reuse the same action multiple times within a flow or across different flows. Copy-paste simplifies the process of creating and modifying flows and saves time and multiple select actions. You can copy and paste individual actions or entire conditions or scope actions. 

Select an action, then select **Copy Action** to copy it.

:::image type="content" source="media/copy-action.png" alt-text="Screenshot of selecting Copy Action." lightbox="media/copy-action.png":::

Select **+** to **Paste an action**.

:::image type="content" source="media/paste-action.png" alt-text="Screenshot of selecting Paste an Action." lightbox="media/paste-action.png":::

