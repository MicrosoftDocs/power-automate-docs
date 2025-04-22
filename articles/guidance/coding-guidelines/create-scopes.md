---
title: Use and create scopes
description: Learn how to use and create scopes in Power Automate to manage complex workflows and effectively troubleshoot.
#customer intent: As a Power Automate user, I want to organize my flows using scopes so that I can manage complex workflows effectively.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Use and create scopes

As workflows become more complex, it's essential to manage them effectively to handle problems, test, and ensure they run smoothly. 

## What is a scope

A *scope* is a container that groups multiple actions together, making it easier to organize and visualize distinct parts of your workflow. When your workflow grows larger and more intricate, using a scope helps keep things organized and simplifies troubleshooting.

:::image type="content" source="media/use-scope.png" alt-text="Screenshot of actions within a scope." lightbox="media/use-scope.png":::

## How to use scopes

To group actions and manage their execution using scopes in Power Automate:

- **Group actions**: You can add multiple actions inside a scope, which is useful when you have a series of related actions that need to be executed together. Grouping actions in a scope helps maintain a clear structure and ensures that related tasks are kept together.

- **Organize your flow**: Scopes allow you to create a hierarchical structure within your flow. You can nest scopes, where one scope contains another, enabling you to break down your workflow into smaller, more manageable sections. This hierarchical organization makes it easier to understand and manage complex workflows.

- **Implement for error handling**: Scopes are also beneficial for error handling. You can configure scopes to catch and handle errors that occur within the actions they contain. Using a catch scope makes it easier to troubleshoot and fix issues in your workflow. Learn more: [Employ robust error handling](error-handling.md)

- **Maintain visibility and readability**: Collapse scopes to hide their contents, making it easier to read the flow and focus on other parts of your flow. Collapsing scopes helps keep your workspace neat and organized, especially when dealing with large and complex flows.

- **Avoid overusing scopes**: Not every action needs to be within a scope. Use scopes judiciously to avoid unnecessary complexity. Group actions into scopes only when it adds value to the organization and manageability of your flow.

By using scopes effectively, you can enhance the clarity, organization, and maintainability of your workflows, making them easier to manage and troubleshoot as they grow in complexity.

> [!TIP]
> To make the flows more readable, add comments or notes in the scope.
>
> :::image type="content" source="media/use-scope-note.png" alt-text="Screenshot of a note within a scope." lightbox="media/use-scope-note.png":::
