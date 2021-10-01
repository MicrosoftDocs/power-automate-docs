---
title: Manage the Variables pane | Microsoft Docs
description: Manage the Variables pane
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage variables and the variables pane



The variables pane shows the input and output variables passed to and from Power Automate. It also displays all the variables used in the current flow under **Flow variables**. 

![Screenshot of the Variables pane.](media\variables-pane\variables-pane.png)

Through the **Variables** pane, you can search for variables, rename them, find their usages and filter them by type. 

## The variable value viewer

When the flow runs, the current value of each variable is shown next to its name. Variables of disabled actions are omitted. To clear the values of all variables, select the eraser icon at the bottom of the pane.

![Screenshot of the current variables' values displayed in the variables pane.](media\variables-pane\current-variable-values.png)

To view the value of a variable in more detail, double-click on the variable. The **variable value viewer** shows the data type of the variable, and expands any datarows or datatables to show their contents.

![Screenshot of the current variables' values displayed in detail in the variable value viewer.](media\variables-pane\variable-viewer.png)

Certain data types may contain nested elements. For example, a custom object type variable may contain another custom object in its properties. The figure below shows the variable **CustomerObject** which contains **Company**, another custom object. To view the properties of the nested element, select **More**.

![Screenshot of a parent custom object example.](media\variables-pane\custom-object-parent.png)

The variable value viewer displays the properties of the child custom object. To go back to the parent custom object, select the arrow.

![Screenshot of a child custom object example.](media\variables-pane\custom-object-child.png)

## Renaming a desktop variable

To rename a desktop flow variable, make a right-click on its name in the **Variables** pane and select **Rename**. The name of the variable will be updated in all its occurrences.

![Screenshot of the Rename option for flow variables.](media\renaming-variables\rename-flow-variable.png)

Although you can update variables' names manually through actions, the name will be changed only in these specific actions, not globally. 

## Input and output variables

Power Automate enables data exchange with the Power Automate platform through the input and output variables. These variables are passed to and from Power Automate for desktop, allowing you to create sophisticated flows.

Additionally, you can use input variables to set values manually when the flows are triggered through the console.

> [!NOTE]
> You can find more information about passing data between Power Automate cloud flows and desktop flows in [Trigger a Power Automate flow from another flow](link-pad-flow-portal.md).

### Create an input variable

To create an input variable:

1. Select the (**+**) button in the variables pane and then **Input**.

     ![Screenshot of the plus button in the variables pane that creates a new input variable.](media\input-output-variables\create-input-variable.png)

1. When the **Add a new input variable** dialog is appeared, populate the following fields:

    - **Variable type**: Defines if the variable is input or output.
    - **Variable name**: The name of the variable in the flow.
    - **Data type**: The type of the variable, like number, text, or datetime.
    - **Default value**: The default value when the flow runs from the Power Automate flow designer or the Power Automate console.
    - **External name**: The name used outside the flow. The external name is the name that will appear in Power Automate.
    - **Description**: A description of the variable that will appear in Power Automate and the Flow inputs dialog.

    > [!NOTE]
    > The **Variable type**, **Variable name**, **Data type**, and **External name** fields are required to create an input variable.

     ![Screenshot of the Add a new input variable dialog box.](media\input-output-variables\Add-new-input-variable-dialog.png)

If you run a flow containing input variables through the console, the **Flow inputs** dialog will prompt you to set their values manually. You can find more information about running flows in [Run attended and unattended desktop flows](run-pad-flow.md). 

   ![Screenshot of the Flow inputs dialog.](media\input-output-variables\flow-input-dialog.png)

### Create an output variable

To create an output variable:

1. Select the (**+**) button in the variables pane and then **Output**.

    ![Screnshot of the plus button in the variables pane that creates a new output variable.](media\input-output-variables\create-output-variable.png)

1. When the **Add a new output variable** dialog is appeared, populate the following fields:

    - **Variable type**: Defines if the variable is input or output.
    - **Variable name**: The name of the variable in the flow.
    - **External name**: The name used outside the flow. The external name is the name that will appear in Power Automate.
    - **Description**: A description of the variable that will appear in Power Automate.

    > [!NOTE]
    > The **Variable type**, **Variable name**, and **External name** fields are required to create an output variable.

    ![Screenshot of the Add a new output variable dialog box.](media\input-output-variables\Add-new-output-variable-dialog.png)

### Manage input and output variables

All the created input and output variables are displayed in the appropriate section of the variables pane.

![Screenshot of the input output variables section of the variables pane.](media\input-output-variables\variables-pane-input-output-variables.png)

Through this pane, you can rename, update, delete, and find the usages of each input/output variable.

To update an input/output variable:

1.  Right-click on its name in the variables pane and select **Edit**.

    ![Screenshot of the Edit option for input/output variables.](media\renaming-variables\rename-input-variable.png)

2. In the **Edit variable** dialog, update the desired fields and select **Update** to apply the changes.

    ![Screenshot of the Edit variable dialog box.](media\renaming-variables\edit-variable-dialog.png)

## Sensitive variables

> [!IMPORTANT]
> Flows developed in older versions of Power Automate for desktop remain unaffected from the sensitive variables functionality. Users can run existing flows from the console and the portal without editing them. Existing flows still have the old behavior and work in the same way as before. 

There are scenarios where flows handle sensitive information that needs to be hidden while debugging and running the flow. Power Automate for desktop allows users to create sensitive variables that aren't visible when a flow runs from within the flow designer. 

If you have logged in with an organization premium account, the values of sensitive variables aren't logged in the Power Automate portal when the flow runs from the console or a cloud flow. 

Users can set any variable as sensitive, independently of its type, via the variables pane. Sensitive variables can be manipulated, referenced, processed, and used in every action without any limitation, like every other variable. 

In the flow designer, the sensitivity works as a mask that can be set on and off. Thus, users can unmask sensitive variables to see their values or mask them again to hide their values. 

> [!NOTE]
> The value of a sensitive variable is visible when the variable is sent to an application outside Power Automate for desktop or displayed through the **Display message**  action. 

To set a variable as sensitive, right-click on it in the variables pane and select **Mark as sensitive**. To stop a variable from being sensitive, right-click on it and select **Mark as no sensitive**. 

![Screenshot of the Mark as sensitive option.](media\sensitive-variables\mark-as-sensitive-option.png)

Apart from the context menus, you can use the dedicated icon next to each variable to mark it as sensitive or not sensitive.

![Screenshot of the Mark as sensitive icon.](media\sensitive-variables\mark-as-sensitive-icon.png)

### Sensitive inputand output variables

When creating or editing an input or output variable, select **Mark as sensitive** in the respective dialog to make it sensitive.

![Screenshot of the Add a new input variable dialog.](media\sensitive-variables\create-sensitive-input-variable.png)

The default value of an input variable is visible in the creating or editing dialog when sensitivity is enabled. This functionality is implemented because this value exists only for testing and debugging purposes. Each input has to be initialized in production runs from the portal. 

On the other hand, the default value isn't visible in the variables pane. Additionally, the default value of a sensitive input variable is hidden in the **Flow input** dialog, which appears when a flow containing inputs variables is run through the console.

The eye icon to reveal the value isn't available unless the user deletes the default value and provides a new one. 

![Screenshot of the Flow inputs dialog with a sensitive variable.](media\sensitive-variables\flow-inputs-dialog-sensitive-variable.png)

### Known issues and limitations

- **Issue:** Flows built or edited with Power Automate for desktop version 2.14 or above are incompatible with older versions of Power Automate for desktop. You can't use older versions of Power Automate for desktop to open or run these flows.

- **Workarounds:** None.

- **Issue:** Hardcoded values aren't supported as sensitive. If you set a new variable with a hardcoded value and mark it as sensitive, it won't be logged when used in following actions. However, the hardcoded value will be visible in the logs of the original "Set variable" action.

- **Workarounds:** Users are expected to follow the RPA best practices and retrieve values from external sources in variables that can then be marked as sensitive. This way, the value won't be persisted during runtime. 

[!INCLUDE[footer-include](../includes/footer-banner.md)]