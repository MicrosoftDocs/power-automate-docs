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

> [!NOTE]
> If you try to rename a variable to an existing name, Power Automate will prompt you to confirm the merging of the two variables. Unintentional merging may affect the functionality of your flow and cause errors, so ensure that the merging is desirable.

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
    - **Mark as sensitive**: Defines whether to mark the variable as sensitive or not. You can find information regarding senstive variables in [Sensitive variables](#sensitive-variables).

    > [!NOTE]
    > The **Variable type**, **Variable name**, **Data type**, and **External name** fields are required to create an input variable.

    > [!NOTE]
    > If you choose an existing flow variable name for a new input variable, Power Automate will prompt you to confirm the merging of the two variables. Unintentional merging may affect the functionality of your flow and cause errors. Also, you can't use the name of an existing input or output variable.

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

    > [!NOTE]
    > If you choose an existing flow variable name for a new output variable, Power Automate will prompt you to confirm the merging of the two variables. Unintentional merging may affect the functionality of your flow and cause errors. Also, you can't use the name of an existing input or output variable.

    ![Screenshot of the Add a new output variable dialog box.](media\input-output-variables\Add-new-output-variable-dialog.png)

### Manage input and output variables

All the created input and output variables are displayed in the appropriate section of the variables pane.

![Screenshot of the input output variables section of the variables pane.](media\input-output-variables\variables-pane-input-output-variables.png)

Through this pane, you can rename, update, delete, and find the usages of each input/output variable.

To update an input/output variable:

1.  Right-click on its name in the variables pane and select **Edit**.

    > [!NOTE]
    > If you try to rename an input or output variable to an existing flow variable name, Power Automate will prompt you to confirm the merging of the two variables. Unintentional merging may affect the functionality of your flow and cause errors. Also, you can't use the name of an existing input or output variable.

    ![Screenshot of the Edit option for input/output variables.](media\renaming-variables\rename-input-variable.png)

2. In the **Edit variable** dialog, update the desired fields and select **Update** to apply the changes.

    ![Screenshot of the Edit variable dialog box.](media\renaming-variables\edit-variable-dialog.png)

## Sensitive variables

> [!IMPORTANT]
> Flows developed in older versions of Power Automate for desktop (v.2.13 or older) remain unaffected from the sensitive variables functionality, as long as they aren't edited. If users run existing flows from the console and the portal without editing them, they will still have the old behavior and work in the same way as before. To migrate flows to the new functionality, edit and save them at least once with Power Automate for desktop v.2.14 or above. This will convert past encrypted type input variables, as well as encrypted type variables produced by the 'Get password from CyberArk' action, to text type variables marked as sensitive.

There are scenarios where flows handle sensitive information that needs to be hidden while debugging and running the flow. Power Automate for desktop allows users to create sensitive variables that aren't visible when a flow runs from within the flow designer. 

If you have logged in with an organization premium account, the values of sensitive variables aren't logged in the desktop flow logs of the Power Automate portal when the flow runs from the console or a cloud flow. 

Users can set any variable as sensitive, independently of its type, via the variables pane. Sensitivity is marked at the variable level, so variable types that are structures of data, like lists, datarows, datatables or custom objects, will be sensitive as a whole. There is no way to mark only a list item or a datatable column or a variable property as sensitive in an otherwise non-sensitive variable. 

Sensitive variables can be manipulated, referenced, processed, and used in every action without any limitation, like every other variable. Additionally, they can be combined with other variables and included in expressions. In this case, for the logs' purposes, such expressions would be considered sensitive as a whole.

In the flow designer, the sensitivity works as a mask that can be set on and off. Thus, users can unmask sensitive variables to see their values or mask them again to hide their values. 

> [!NOTE]
> - The value of a sensitive variable is visible when the variable is sent to an application outside Power Automate for desktop or displayed through the **Display message**  action. 
> - Sensitivity isn't inheritable in variables. This means that if a sensitive variable or expression is added or assigned to another variable, the latter won't be sensitive by default, unless explicitly marked otherwise by the user.
> - Marking a variable as sensitive hides its values from the summary of the **Set variable** action.
> - The input details of the **Set variable** action aren't visible in the desktop flow logs when the contained variables have been marked as sensitive.


To set a variable as sensitive, right-click on it in the variables pane and select **Mark as sensitive**. To stop a variable from being sensitive, right-click on it and select **Mark as not sensitive**. 

![Screenshot of the Mark as sensitive option.](media\sensitive-variables\mark-as-sensitive-option.png)

Apart from the context menus, you can use the dedicated icon next to each variable to mark it as sensitive or not sensitive.

![Screenshot of the Mark as sensitive icon.](media\sensitive-variables\mark-as-sensitive-icon.png)

### Sensitive input and output variables

When creating or editing an input or output variable, select **Mark as sensitive** in the respective dialog to make it sensitive.

![Screenshot of the Add a new input variable dialog.](media\sensitive-variables\create-sensitive-input-variable.png)

The default value of an input variable is visible in the creating or editing dialog when sensitivity is enabled. This functionality is implemented because this value exists only for testing and debugging purposes. Each input has to be initialized in production runs from the portal or the console.

On the other hand, the default value isn't visible in the variables pane. Additionally, the default value of a sensitive input variable is hidden in the **Flow input** dialog, which appears when a flow containing input variables is run through the console.

The eye icon to reveal the value isn't available unless the user deletes the default value and provides a new one. 

![Screenshot of the Flow inputs dialog with a sensitive variable.](media\sensitive-variables\flow-inputs-dialog-sensitive-variable.png)

### Known issues and limitations

- **Issue:** Flows built or edited with Power Automate for desktop version 2.14 or above are incompatible with older versions of Power Automate for desktop. You can't use older versions of Power Automate for desktop to open or run these flows.

- **Workarounds:** None.

[!INCLUDE[footer-include](../includes/footer-banner.md)]