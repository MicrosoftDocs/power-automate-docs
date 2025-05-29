---
title: Build readable and maintainable flow scripts
description: Learn how to build clear and manageable flow scripts to improve efficiency, teamwork, and troubleshooting in Power Automate.
# customer intent: As a Power Automate user, I want to organize flow scripts clearly so that I can improve development efficiency and troubleshooting.
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Build readable and maintainable flow scripts

Building flow scripts in Power Automate with clarity and organization improves development efficiency, fosters collaboration, and simplifies troubleshooting. Follow these recommendations to streamline workflows, enhance teamwork, and make scripts easier to manage and scale.

## Use consistent naming conventions

Provide descriptive and meaningful names for subflows, variables, UI elements, and images.

For variables (input/output and flow variables):

- Use camelCase, PascalCase, or underscores to separate words.  
- Add a datatype prefix to variable names.  
- For input/output variables, add a prefix to both the variable name and external name to distinguish them from flow variables and other variables outside the Desktop flow designer.

:::image type="content" source="media/build-flow-scripts/variables.png" alt-text="Screenshot of the variables pane in Desktop flow designer showing use of prefixes in names to distinguish variables." lightbox="media/build-flow-scripts/variables.png":::

Follow best practices for cloud flows by learning more about [using consistent naming for flow components](../coding-guidelines/use-consistent-naming-conventions.md). Learn more about [managing variables and the variables pane in Desktop flow designer](../../desktop-flows/manage-variables.md).

## Add comments

Use the **Comment** action to add notes in the flow script:

- Add a comment at the beginning of the **Main** subflow to introduce the flow. Provide a short description of the process, the intended audience, and related flows.

- Add comments to explain changes when fixing bugs.

- Add comments at the beginning of each subflow to describe its purpose.

:::image type="content" source="media/build-flow-scripts/comments.png" alt-text="Screenshot showing how to add comments in a flow script." lightbox="media/build-flow-scripts/comments.png":::

> [!NOTE]  
> Get help adding comments using the [Summarize actions & subflows Copilot skill](../../desktop-flows/copilot-in-power-automate-for-desktop.md#use-copilot-to-summarize-actions-and-subflows).

## Add regions

Use the **Region** and **End region** actions to group actions within a subflow logically so they can be expanded or collapsed.

:::image type="content" source="media/build-flow-scripts/region.png" alt-text="Screenshot of the Region and End region actions in a subflow." lightbox="media/build-flow-scripts/region.png":::

## Use modular design and reusable components

Break down your flow into logical modules or sections based on functionality or tasks.

### Subflows

Create subflows to group related actions or reusable tasks.

1. Identify actions that perform a task or need repetition, and group them in a subflow. 

    :::image type="content" source="media/build-flow-scripts/subflow.png" alt-text="Screenshot of a flow diagram showing subflow creation." lightbox="media/build-flow-scripts/subflow.png":::
 
1. Invoke the subflow with the **Run subflow** action.

    :::image type="content" source="media/build-flow-scripts/run-subflow.png" alt-text="Screenshot of the Run subflow action." lightbox="media/build-flow-scripts/run-subflow.png":::

Learn more about [setting up subflows](../../desktop-flows/designer-workspace.md#setting-up-subflows).

### Reusable flows

Create reusable flows to simplify complex processes into manageable parts for use in different workflows.

- Identify flows that can be reused across other desktop flows, and create a dedicated flow to use as a reusable component.  
- Share the reusable flow with other users in an environment.  
- Convert a subflow to a reusable flow by copying and pasting all its actions into the new flow's workspace.  
- Invoke it with the **Run desktop flow** action as a child desktop flow.

:::image type="content" source="media/build-flow-scripts/run-desktop-flow.png" alt-text="Screenshot of the available desktop flows in the Run desktop flow action." lightbox="media/build-flow-scripts/run-desktop-flow.png":::

Learn more about [running a desktop flow from other desktop flows](../../desktop-flows/how-to/run-desktop-flow-action.md).

Follow best practices for cloud flows by learning more about [creating reusable code](../coding-guidelines/create-reusable-code.md).
