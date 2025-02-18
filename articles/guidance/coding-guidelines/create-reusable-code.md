---
title: Create reusable code for child flows
description: Learn how to create reusable code using child flows in Power Automate to streamline your automation processes and enhance maintainability.
#customer intent: As an admin, I want to create reusable code for child flows so that I can streamline automation processes and enhance maintainability.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/03/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Create reusable code for child flows

Power Automate cloud flows help automate complex solutions. However, solutions can quickly become large and difficult to navigate and maintain.

Instead of creating a single, overly complex automation solution, consider using [child flows](/power-automate/create-child-flows). Child flows allow you to break down complex processes into manageable chunks. This approach adds depth and efficiency to your automation processes, making your flows more modular and easier to manage.

## Benefits of using child flows

Reasons to use child flows include:

- **Modularity**: Child flows promote modularity, allowing you to build reusable components that can be easily plugged into different workflows. This approach not only streamlines development but also enhances maintainability.
- **Maintainability**: Smaller, focused flows are easier to update and troubleshoot, reducing the time and effort required for maintenance.
- **Scalability**: Modular flows can be easily scaled and adapted to new requirements without overhauling the entire automation. By breaking down your automation into smaller, more manageable pieces, you can scale your processes more effectively. Need to make changes or add functionality? With child flows, it's as simple as updating the individual components.
- **Granular control**: Child flows offer granular control over your automation logic. You can pass data between parent and child flows, enabling dynamic decision making and personalized experiences.
- **Collaboration**: In a team environment, child flows promote collaboration by allowing team members to work on separate components of a larger automation project simultaneously.

> [!TIP]
> Create the parent flow and all child flows *directly* in the same solution. Refer to [known limitations](/power-automate/create-child-flows#known-issue).


## Example parent-child flow scenario

This scenario shows the value of using a modular and efficient approval process to reduce redundancy and simplify maintenance.

The Contoso organization requires approvals for various scenarios such as project proposals, leave requests, and expense submissions. The approvers for these scenarios are members of different SharePoint groups. To streamline this process, create a single reusable child flow to extract the list of approvers from the SharePoint groups. Each parent flow (for example, project proposal, leave request, or expense submission) can then call this child flow to retrieve the list of approvers.

### Child flow

The child flow extracts the list of approvers from a SharePoint list and returns this list to the parent flow.

Steps in the child flow:

1. **Retrieve approvers**

    Query the SharePoint group to get the approvers based on the specified criteria.

1. **Return data**

    Send the list of approvers back to the calling parent flow.

:::image type="content" source="media/child-flow1.png" alt-text="Screenshot of the child flow that gets approvers from a SharePoint group.":::

### Parent flow

The parent flow calls the child flow to get the list of approvers and then processes the response accordingly.

Steps in the parent flow:

1. **Call child flow** 

    Invoke the child flow to retrieve the list of approvers.

1. **Process response**

    Use the list of approvers returned by the child flow to proceed with the approval process for the specific scenario (for example, project proposal, leave request, or expense submission).

:::image type="content" source="media/child-flow2.png" alt-text="Screenshot of the parent flow that calls the child flow." lightbox="media/child-flow2.png":::