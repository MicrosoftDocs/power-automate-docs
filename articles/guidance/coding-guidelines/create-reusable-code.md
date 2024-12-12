---
title: Create reusable code (child flows)
description: Learn how create reusable code
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

# Create reusable code (child flows)

Power Automate cloud flows can help automate complex solutions, however, they can grow excessively large and complex quickly making it difficult to navigate and maintain the flow.

Instead of building a complex single automation solution, use child flows which can add complexity, depth, and efficiency to these automation processes. They allow you to break down complex processes into manageable chunks, making your flows more modular and easier to manage.

### Why use child flows?

- **Modularity**: Child flows promote modularity, allowing you to build reusable components that can be easily plugged into different workflows. This not only streamlines development but also enhances maintainability.
- **Scalability**: By breaking down your automation into smaller, more manageable pieces, you can scale your processes more effectively. Need to make changes or add functionality? With child flows, it's as simple as updating the individual components.
- **Granular Control**: Child flows offer granular control over your automation logic. You can pass data between parent and child flows, enabling dynamic decision-making and personalized experiences.
- **Collaboration**: In a team environment, child flows promote collaboration by allowing team members to work on separate components of a larger automation project simultaneously.

    > [!NOTE]
    > You should create the parent flow and all child flows *directly* in the same solution. Refer to [known limitations](https://learn.microsoft.com/power-automate/create-child-flows#known-issue).

    **Example parent/child flow scenario:** Contoso organization requires approvals for scenarios like Project Proposal, Leave request, and Expense submissions. The approvers are part of different SharePoint groups. A single reusable child flow can be used to extract the list of SharePoint approvers from the SharePoint groups. Each parent flow, for example the flows for project proposal, leave request, or expense submission, can call the same child flow to retrieve a list of approvers.

    **Child Flow** 

    The child flow extracts the lists of approvers from a SharePoint list and returns the list:

    :::image type="content" source="media/child-flow1.png" alt-text="Screenshot of the child flow that gets approvers from a SharePoint list":::

    **Parent Flow** 

    The parent flow calls the child flow and processes the response:

     :::image type="content" source="media/child-flow2.png" alt-text="Screenshot of the parent flow that calls the child flow":::


Learn more: [Create child flows](/power-automate/create-child-flows).