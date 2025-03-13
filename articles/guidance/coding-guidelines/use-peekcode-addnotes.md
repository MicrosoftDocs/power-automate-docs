---
title: Leverage Power Automate features
description: Learn how to use Power Automate features like code view, notes, and copy and paste actions to streamline your workflow creation process.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 03/13/2025
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

# Leverage Power Automate features

Power Automate includes features designed to help streamline your workflow. This article describes features like viewing and editing the underlying code of actions and triggers, adding notes for better team communication, and using copy-paste actions to save time and boost productivity.

## Peek code or code view

Peek code or code view is a feature that allows you to view the underlying JSON representation of the actions and triggers within a flow. This feature is useful if you want to understand the structure and configuration of your flows and their actions. Editing code view directly to make flow changes isn't currently available.

Select an action and then select **Code view**:

:::image type="content" source="media/codeview.png" alt-text="Screenshot of the code view of an action." lightbox="media/codeview.png":::

Code view can be used to view trigger polling frequency, trigger type, trigger conditions, and the JSON schema of the dynamic content:

:::image type="content" source="media/trigger-codeview.png" alt-text="Screenshot of the code view of a Dataverse trigger.":::

## Add notes

Adding notes or comments in Power Automate cloud flows is a helpful way to document the purpose, logic, and specific details of various actions and triggers within the flow. This practice is beneficial for both individual users and teams, as it improves the readability and maintainability of the flows.

To add a note, select the vertical ellipsis (&vellip;) next to an action and select **Add a Note**.

Once you add the note, it displays under the action name.

:::image type="content" source="media/add-note-done.png" alt-text="Screenshot of an action with a note." lightbox="media/add-note-done.png":::

## Copy and paste actions

Copying actions enables you to reuse the same action multiple times within a flow or across different flows. Copy-paste simplifies the process of creating and modifying flows and saves time and multiple select actions. You can copy and paste individual actions or entire conditions or scope actions.

1. To copy an action, select it and then select **Copy Action**.
1. To paste an action, select **+** > **Paste an action**.



