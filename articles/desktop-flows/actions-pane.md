---
title: Actions and the actions pane | Microsoft Docs
description: This section describes the actions and the actions pane in flow designer.
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Configure actions and the actions pane

Upon opening the flow designer, the actions pane on the left side of the window shows all the action groups. 

![View of the actions pane.](\media\actions-pane\actions-pane.png)

To quickly find a specific action, enter the name of the action in the search bar. Searching also returns partial matches.

![Search in the actions pane.](\media\actions-pane\actions-search.png)

## Adding an action to the workspace

To begin developing a desktop flow, select an action and double-click on it, or drag it into the workspace. 

![add action.](\media\adding-actions\add-action.png)

A dialog box opens with the parameters of the action. Actions have certain parameters such as variable names and default values. Other actions will require user input to be initialized. After selecting **Save**, the action appears in the workspace.

![action properties.](\media\adding-actions\action-properties.png)

## Configuring an action

Power Automate actions consist of two main segments:
- The input parameters - They have the form of text fields, drop-down menus, and  check boxes
- The produced variables - Automatically created variables

![Τhe parameters and the produced variables of the Copy folder action.](media/configuring-actions/actions-parameters-outputs.png)

The input parameters determine the way an action functions and the data it gets as input. The data can be hardcoded values or variables. 

To use a variable as a parameter, select the icon on the field's right side and pick the respective variable.

Each field can accept specific data types, such as numbers, text, or lists. If a value or variable of a wrong data type is used as an input, the action will throw an error. 

![The icon to select an input parameter in the action.](media/configuring-actions/actions-parameters.png)

The produced variables hold the outcomes of the action for later use. All the produced variables are displayed on the bottom part of the action's properties. 

Each produced variable has a data type defined by its data. You can see the data type of a variable in the **Variables** pane. Find more information about data types in the [respective article](variable-data-types.md).

In case a produced variable isn't needed for later use, unselect the checkbox under **Variables produced**. 

![The option to disable a produced variable in the action.](media/configuring-actions/actions-outputs.png)

>[!NOTE]
> Produced variable names, may not contain special characters, white spaces and non-latin characters and can't start with arithmetic characters.

## Configuring action errors

When an action throws an error, the flow stops its execution by default. To configure a custom error handling behavior for an action, select the **On error** option in its properties.

![The on On error option in the action.](media/configuring-actions-errors/on-error-option-action.png)

The first option in the dialog box is the **Retry action if an error occurs** checkbox. This checkbox makes the flow execute the action a set number of times after a set number of seconds. The default value is one retrying with an interval of two seconds.

![The Retry action checkbox in the action.](media/configuring-actions-errors/retry-action.png)

To continue the flow's execution, even if the retry option fails, select the **Continue flow run** option. Through the ​drop-down list, you can:

- **Go to next action**: Executes the following action in order.
- **Repeat action**: Repeats the action until it runs successfully. 
- **Go to label**: Continues the execution from a point defined by a **Label** action.

![The continue flow run option in the action.](media/configuring-actions-errors/continue-flow-run.png)

Power Automate offers two additional error handling options. Select the **New rule** button to:
- **Set variable**: Sets the desired value to a specified variable.
- **Run subflow**: Executes a specified subflow. 

![The New rule option in the action.](media/configuring-actions-errors/new-rule.png)

If different errors require different error handling behaviors, select the **Advanced** option and configure each possible error separately. 

## Enabling and disabling actions

To disable or enable an action, right-click on it and select **Disable action** or **Enable action**, respectively. 

![The disable action option.](media\enabling-disabling-actions\enable-disable-action.png)

Disabling an action allows you to remove it from the flow without erasing it. This feature is commonly applied to test different versions of a desktop flow and decide which one is the most efficient. 

When an action is disabled, all variables defined in it are hidden from the **Variables** pane. If the hidden variables are used in other actions, the flow may throw an error. 

In the example below, two actions threw an error because they contain variables defined in a disabled action.

![An example in which disabling an action hides some varibales.](media\enabling-disabling-actions\enable-disable-action-variables.png)

[!INCLUDE[footer-include](../includes/footer-banner.md)]