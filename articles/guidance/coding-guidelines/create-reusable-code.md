---
title: Create reusable code with child flows
description: Learn how to create reusable code with child flows in Power Automate to build modular and scalable automation workflows.
#customer intent: As a Power Automate user, I want to create reusable code using child flows so that I can create modular and scalable automation solutions.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/12/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Create reusable code with child flows

Instead of creating a single, overly complicated workflow, consider using [child flows](/power-automate/create-child-flows) to break down complex processes into manageable chunks. Child flows can make your flows more modular and easier to manage. This article provides an overview of child flows, their benefits, and an example scenario to illustrate their use.

## Benefits of using child flows

Child flows are reusable components that can be called from multiple parent flows. They allow you to encapsulate specific logic or functionality, making it easier to maintain and update your automation. Here are some key benefits of using child flows:

- **Modularity**: Child flows promote modularity, allowing you to build reusable components that can be easily plugged into different workflows. This approach not only streamlines development but also enhances maintainability.

- **Maintainability**: Smaller, focused flows are easier to update and troubleshoot, reducing the time and effort required for maintenance.

- **Scalability**: Modular flows can be easily scaled and adapted to new requirements without overhauling the entire automation. By breaking down your automation into smaller, more manageable pieces, you can scale your processes more effectively. Need to make changes or add functionality? With child flows, it's as simple as updating the individual components.

- **Granular control**: Child flows offer granular control over your automation logic. You can pass data between parent and child flows, enabling dynamic decision making and personalized experiences.

- **Collaboration**: In a team environment, child flows promote collaboration by allowing team members to work on separate components of a larger automation project simultaneously.

> [!TIP]
> Create the parent flow and all child flows *directly* in the same solution.

## Example parent-child flow scenario

This scenario shows the value of using a modular approval process to reduce redundancy and simplify maintenance.

The Contoso organization requires approvals for project proposals, leave requests, and expense submissions. The approvers for these scenarios are members of different SharePoint groups. Create a reusable child flow to extract the list of approvers from the SharePoint groups. Each parent flow (for example, project proposal, leave request, or expense submission) can call the child flow to retrieve the correct list of approvers.

### Child flow

The child flow extracts the list of approvers from a SharePoint list and returns it to the parent flow.

Steps in the child flow:

1. **Retrieve approvers**

    Query the SharePoint group to get the approvers based on the specified criteria.

1. **Return data**

    Send the list of approvers back to the calling parent flow.

:::image type="content" source="media/child-flow1.png" alt-text="Screenshot of the Power Automate designer showing a child flow that gets approvers from a SharePoint group.":::

### Parent flow

The parent flow calls the child flow to get the list of approvers and then processes the response.

Steps in the parent flow:

1. **Call child flow**

    Invoke the child flow to retrieve the list of approvers.

1. **Process response**

    Use the list of approvers to proceed with the approval process for the scenario (for example, project proposal, leave request, or expense submission).

:::image type="content" source="media/child-flow2.png" alt-text="Screenshot of the Power Automate designer showing the parent flow that calls the child flow." lightbox="media/child-flow2.png":::
