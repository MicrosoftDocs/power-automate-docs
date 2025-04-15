---
title: Configure actions and the actions pane
description: This section shows how to use the actions pane to deploy actions in the flow designer.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/21/2025
ms.author: iomavrid
ms.reviewer: matp
ms.collection: bap-ai-copilot
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

After the deployment, the modal of the action opens and displays the available parameters of the action. Some actions might have default values for some parameters, while others require user input. When the configuration is ready, select **Save**.

:::image type="content" source="media/adding-actions/action-properties.png" alt-text="Screenshot of the modal of an action.":::

### Adding actions from the suggested actions panel

[!INCLUDE [cc-beta-prerelease-disclaimer](actions-reference/includes/cc-beta-prerelease-disclaimer.md)]

In addition to adding actions from the actions panel, you can also use the suggested actions panel.

> [!IMPORTANT]
>
> - To understand the capabilities and limitations of this feature, go to [FAQ for Power Automate for desktop suggested actions](../faqs-action-suggestions-power-automate-desktop.md).

### Availability by region

The suggested next best action is available in environments located in the following countries/regions:

  - Asia Pacific
  - Australia
  - Brazil
  - Canada
  - Europe
  - France
  - Germany
  - India
  - Japan
  - Norway
  - Singapore
  - South Africa
  - South Korea
  - Switzerland
  - United Arab Emirates
  - United Kingdom
  - United States

### Availability by account type

Currently, Copilot in Power Automate for desktop is only available for users with a work or school account.

> [!NOTE]
> If your environment is in a supported region, you are signed in with a work or school account, and you still can't see Copilot in the Power Automate for desktop experience, contact your Power Platform administrator.

### Using suggested actions in your flows

The suggested actions functionality uses AI to generate a list of actions that you could use as the next steps in your flow. To do so, select the add button that appears on mouse hover or when an action is selected.
:::image type="content" source="media/suggested-actions/next_best_action.png" alt-text="Screenshot of the add actions via the suggested actions panel." lightbox="media/suggested-actions/next_best_action.png":::

Once the **Suggested actions** panel appears, double-click the action that you want to add to your flow.
:::image type="content" source="media/suggested-actions/next_best_action2.png" alt-text="Screenshot of the suggested actions panel." lightbox="media/suggested-actions/next_best_action2.png":::

### Disabling the suggested actions functionality

To disable Copilot's suggested actions functionality, Power Platform admins can contact Microsoft support. More information: [Get Help + Support](/power-platform/admin/get-help-support)

### Help us improve this feature

You can send feedback by selecting the thumb up or thumb down icon underneath the AI-generated action suggestions. Once you do, a dialog box appears, which you can use to submit feedback to Microsoft.

:::image type="content" source="media/pad_generative_answers/feedback_dialog1.png" alt-text="Image that shows where you can send your feedback about copilot in Power Automate for desktop.":::

> [!NOTE]
> If you can't see the dialog box, your Power Platform admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

### Turn off user feedback functionality

As a [Power Platform admin](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator), prevent users from sending Copilot feedback to Microsoft by using the "Copilot feedback" [tenant setting](/power-platform/admin/tenant-settings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home?#/homepage), and then selecting **Health** > **Product feedback**.

## Configure actions

Power Automate actions contain three main elements:

- **Input parameters**  have the form of text fields, drop-down menus, and checkboxes and determine the way the action functions and the data it gets as input. The data can be hardcoded values or variables.

    To use a variable as a parameter, select the appropriate icon on the right side of the field and pick the desired variable.

    Each field can accept specific data types, such as numeric values, text, or lists. If you use values or variables of wrong data types as inputs, the action results in an error. To find more information about data types, refer to [Variable datatypes](variable-data-types.md).

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

When an action is disabled, all variables initialized in its modal get hidden from the variables pane. The flow might display an error if you use the hidden variables in other actions.

In the following example, two actions throw an error because they contain variables defined in a disabled action. To find information on how to handle errors, go to [Handle errors in desktop flows](errors.md).

:::image type="content" source="media/enabling-disabling-actions/enable-disable-action-variables.png" alt-text="Screenshot of an example in which disabling an action causes errors.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
