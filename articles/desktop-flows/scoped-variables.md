---
title: Work with scoped variables in Power Automate for desktop
description: Learn how to create and manage scoped variables in Power Automate for desktop to improve modularity, debugging, and maintainability of your desktop flows.
author: cochamos
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: concept-article
ms.date: 11/11/2025
ms.author: cochamos
ms.reviewer: dmartens
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Scoped variables in Power Automate for desktop

Power Automate for desktop now supports scoped variables. You can declare variables that are accessible only within the specific local subflow where you create them. This enhancement makes desktop flows more modular and improves the maintainability, debugging, and updating processes.

## Variable scope

Variables in Power Automate for desktop are either global or local. You create global variables in global subflows, and you can access them throughout the entire desktop flow. You create local variables in local subflows, and you can only use them in the local subflow where you create them. The variables panel now has two tabs at the top, **Global** and **Local**, so you can easily manage and distinguish between variables based on their scope.

### Create local subflows and variables

You establish the scope of a subflow when you create it. You can specify the intended scope for the new subflow by using the designated scope field, as shown in the following image:

:::image type="content" source="media\scoped-variables\add-new-subflow.png" alt-text="Screenshot that shows the add new subflow dialog with the scope drop-down control expanded.":::

> [!IMPORTANT]
> - You can't change the scope of a subflow after you create it.
> - The "main" subflow always has a global scope, which you can't modify.

To work with local variables, add a new subflow from the subflows menu and select **Local** in the scope field. 

When you create the subflow, the variables panel automatically switches to the local variables tab and displays only the variables defined within that subflow. 

:::image type="content" source="media\scoped-variables\designer-local-variables-view.png" alt-text="Screenshot that shows the designer with a local subflow that contains three actions and its variables.":::

You can access variables created in global subflows from both the **Global** tab and the variables picker. You can only see and use local subflow variables within their respective subflow. You can't access them from other subflows.

### Reference global variables in local subflows

To reference a global variable within a local subflow, select it from the variables picker under the **Global** tab:

:::image type="content" source="media\scoped-variables\variables-picker.png" alt-text="Screenshot that shows the variables picker with a global and local variables tab.":::

After you add the global variable, it appears with a `global.` prefix in its name:

:::image type="content" source="media\scoped-variables\action-with-global-variable.png" alt-text="Screenshot that shows an action in a local subflow with a global variable selected.":::

When you reference global variables from a local subflow, they appear with this prefix, making it clear which variables are accessible across the entire flow. You can manually reference a global variable by prefixing its name with `global.` (for example, `global.<variable name>`). 

## Create, pass, and retrieve variables in local subflows

Since you can't access local variables from any other subflow, you need to pass variables to a subflow when working with local subflows and variables.

Each local subflow maintains its own distinct input and output variables, which facilitate the assignment and retrieval of values from other subflows. Conversely, global subflow variables remain available for seamless value exchange with desktop flows, consistent with existing functionality.

### Create input and output variables in local subflows

To declare input and output variables in local subflows, go to your chosen local subflow, select the + icon at the upper right of the variables panel, and then add the variables as you normally would.

Once you create any input or output variables, you can see them in the variables pane under the local subflow local tab that you created them from.

:::image type="content" source="media\scoped-variables\local-variables-created.png" alt-text="Screenshot that shows the variables panel of a local subflow with input and output variables created.":::

### Pass and retrieve values from local subflows

After you define input variables in a local subflow, use the **Run subflow** action to assign values to these variables. This action lets you pass specific values as arguments to the input variables of the local subflow you choose. You can control the behavior and data flow within your automation.

When the subflow runs, it produces output variables that you can retrieve. The action lists these output variables under the produced variables section. You can capture and use the results generated by the subflow. 

:::image type="content" source="media\scoped-variables\run-subflow-action-with-scoped-variables.png" alt-text="Screenshot that shows the Run subflow action with input and output arguments.":::
