---
title: Configure actions and the actions pane
description: This section shows how to use the actions pane to deploy actions in the flow designer.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 11/03/2022
ms.author: iomavrid
ms.reviewer: gtrantzas
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Configure actions and the actions pane

The actions pane occupies the left side of the flow designer and displays all the available desktop flow actions.

:::image type="content" source="media/actions-pane/actions-pane.png" alt-text="Screenshot of the actions pane.":::

To find a specific action, populate its name in the search bar at the top of the pane. Searching also returns partial matches but requires at least two provided characters. When the search term matches a module name, the results display the module expanded with all its actions available.

:::image type="content" source="media/actions-pane/actions-search.png" alt-text="Screenshot of the search field in the actions pane.":::

## Add actions to the workspace

To develop a desktop flow, find the action you want to deploy, and double-click on it or drag it into the workspace.

:::image type="content" source="media/adding-actions/add-action.png" alt-text="Screenshot of an action while dragging it into the workspace.":::

After the deployment, the modal of the action opens and displays the available parameters of the action. Some actions may have default values for some parameters, while others require user input. When the configuration is ready, select **Save**.

:::image type="content" source="media/adding-actions/action-properties.png" alt-text="Screenshot of the modal of an action.":::

## Configure actions

Power Automate actions contain three main elements:

- **Input parameters**  have the form of text fields, drop-down menus, and checkboxes and determine the way the action functions and the data it gets as input. The data can be hardcoded values or variables.

    To use a variable as a parameter, select the appropriate icon on the right side of the field and pick the desired variable.

    Each field can accept specific data types, such as numeric values, text, or lists. If you use values or variables of wrong data types as inputs, the action will throw an error. To find more information about data types, refer to [Variable datatypes](variable-data-types.md).

    :::image type="content" source="media/configuring-actions/action-input-parameteres.png" alt-text="Screenshot of the input parameters in an action's modal.":::

- **Produced variables** are automatically generated variables that hold the outcomes of the actions for later use. All the produced variables of an action are available on the bottom part of its modal.

    Like any other variable, produced variables have data types defined by their content. To find more information about data types, refer to [Variable datatypes](variable-data-types.md).

    If a produced variable isn't useful for later use, unselect the checkbox next to its name to disable it.

    The name of a produced variable can't contain special characters, white spaces, and non-Latin characters. Additionally, it can't start with arithmetic characters.

    :::image type="content" source="media/configuring-actions/action-produced-variables.png" alt-text="Screenshot of a produced variable in an action's modal.":::

- **Error-handling configuration** allows you to set a custom functionality for the cases when an action fails. To configure error-handling for an action, select **On error** in its modal. To find more information regarding error-handling, refer to [Handle errors in desktop flows](errors.md).

    :::image type="content" source="media/configuring-actions/action-on-error.png" alt-text="Screenshot of the On error option in an action's modal.":::

## Enable and disable actions

To disable or enable an action, right-click on it and select **Disable action** or **Enable action**, respectively.

:::image type="content" source="media/enabling-disabling-actions/enable-disable-action.png" alt-text="Screenshot of the option to disable actions.":::

Disabling an action allows you to remove it from the flow without erasing it. This feature is commonly applied for testing, as it enables you to try different versions of your desktop flow efficiently.

When an action is disabled, all variables initialized in its modal get hidden from the variables pane. The flow may throw an error if you use the hidden variables in other actions.

In the example below, two actions throw an error because they contain variables defined in a disabled action. To find information on how to handle errors, go to [Handle errors in desktop flows](errors.md).

:::image type="content" source="media/enabling-disabling-actions/enable-disable-action-variables.png" alt-text="Screenshot of an example in which disabling an action causes errors.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
