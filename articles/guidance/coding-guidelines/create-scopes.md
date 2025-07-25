---
title: Organize your flows with scopes
description: Learn how to use scopes to organize your Power Automate flows, manage complex workflows, and troubleshoot more effectively.
#customer intent: As a Power Automate user, I want to organize my flows using scopes so that I can manage complex workflows effectively.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/10/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Organize your flows with scopes

A *scope* is a container that groups actions together, making it easier to organize and visualize the parts of your workflow. When a workflow becomes larger and more intricate, scopes help keep things organized and simplify troubleshooting. This article explains how to use scopes effectively in Power Automate.

:::image type="content" source="media/use-scope.png" alt-text="Screenshot of actions within a scope.":::

## Create a scope

1. Open your cloud flow.
1. Select **+** to add an action.
1. Search for **Scope**.
1. Add the **Scope** control.
    :::image type="content" source="media/use-scope-add.png" alt-text="Screenshot of the add an action pane showing the Scope control." lightbox="media/use-scope-add.png":::
1. You can now add actions within the scope, or drag existing actions into the scope.

## Best practices for using scopes

- **Group related actions**. When you have a set of actions that are logically related, group them into a scope. This helps keep related tasks together and makes it easier to understand the purpose of each section.

- **Organize your flow**. Scopes can create a hierarchical structure within your flow. You can nest scopes to break down your workflow into smaller, more manageable sections. A hierarchical organization makes it easier to understand and manage complex workflows.

- **Implement error handling**. You can configure scopes to catch and handle errors that occur in the actions they contain. Using a catch scope makes it easier to troubleshoot and fix issues in your workflow. Learn more in [Employ robust error handling](error-handling.md).

- **Make your flow easier to read**. Collapse scopes to hide their contents, making it easier to read the flow or to focus on one part of it. Collapsing scopes helps keep your workspace neat and organized, especially when you're working with large and complex flows.

- **Avoid overusing scopes**. Not every action needs to be in a scope. Use scopes judiciously to avoid creating unnecessary complexity. Group actions into scopes only when it adds to the organization and manageability of your flow.

> [!TIP]
> To make your flows more readable, add comments or notes in the scope.
>
> :::image type="content" source="media/use-scope-note.png" alt-text="Screenshot of a note within a scope.":::
