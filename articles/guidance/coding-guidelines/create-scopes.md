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

As workflows get more complicated, it's essential to manage them well to handle problems, test them, and keep them working smoothly. A Scope is like a container that holds a bunch of actions together. Th makes it easier to organize and see distinct parts of your workflow. So, when your workflow grows bigger and more complex, using the Scope tool can make it easier to keep things in order and fix any issues that come up.

:::image type="content" source="media/use-scope.png" alt-text="Screenshot of the child flow that gets approvers from a SharePoint list":::

Here's how scopes work:

- **Grouping actions:** You can add multiple actions inside a scope. This is useful when you have a series of actions that are related to each other or need to be executed together.

- **Organizing your flow:** By using scopes, you can create a hierarchical structure within your flow. You can have nested scopes, where one scope contains another scope, allowing you to break down your workflow into smaller, more manageable sections.

- **Error handling:** Scopes are also helpful for error handling. You can set up scopes to catch and handle errors that occur within the actions they contain, which makes it easier to troubleshoot and fix issues in your workflow. Error handling is discussed in more detail [insert link].
- **Visibility and collapsibility:** Scopes can be collapsed to hide their contents, making it easier to focus on other parts of your flow. Collapsing scopes helps keep your workspace neat and organized, especially when working with large and complex flows.
- **Avoid using flows for every single action:** Not every action is required to be within a scope. Don't overuse scopes action if there's no need.

> [!NOTE]
> We advise that you add comments or notes in the scope to make the flows more readable.
