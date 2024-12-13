---
title: Use and create scopes
description: Learn how to use and create scopes
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Use and create scopes

As workflows become more complex, it's essential to manage them effectively to handle problems, test them, and ensure they run smoothly. A **Scope** is a container that groups multiple actions together, making it easier to organize and visualize distinct parts of your workflow. When your workflow grows larger and more intricate, using a Scope can help keep things organized and simplify troubleshooting.

:::image type="content" source="media/use-scope.png" alt-text="Screenshot of the child flow that gets approvers from a SharePoint list":::

## How to use scopes

- **Grouping actions**: You can add multiple actions inside a scope. This is useful when you have a series of related actions that need to be executed together. Grouping actions in a scope helps maintain a clear structure and ensures that related tasks are kept together.

- **Organizing your flow**: Scopes allow you to create a hierarchical structure within your flow. You can nest scopes, where one scope contains another, enabling you to break down your workflow into smaller, more manageable sections. This hierarchical organization makes it easier to understand and manage complex workflows.

- **Error Handling**: Scopes are also beneficial for error handling. You can configure scopes to catch and handle errors that occur within the actions they contain. This makes it easier to troubleshoot and fix issues in your workflow. Learn more: [Employ robust error handling](error-handling.md)

- **Visibility and readability**: Scopes can be collapsed to hide their contents, making it easier to read the flow and focus on other parts of your flow. Collapsing scopes helps keep your workspace neat and organized, especially when dealing with large and complex flows.

- **Avoid overusing scopes**: Not every action needs to be within a scope. Use scopes judiciously to avoid unnecessary complexity. Only group actions into scopes when it adds value to the organization and manageability of your flow.

By using scopes effectively, you can enhance the clarity, organization, and maintainability of your workflows, making it easier to manage and troubleshoot as they grow in complexity.

:::image type="content" source="media/use-scope.png" alt-text="Screenshot of the child flow that gets approvers from a SharePoint list":::

> [!NOTE]
> We advise that you add comments or notes in the scope to make the flows more readable.
