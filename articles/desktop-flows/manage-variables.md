---
title: Manage the Variables pane | Microsoft Docs
description: Manage the Variables pane
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage variables and the variables pane



The variables pane shows the input and output variables passed to and from Power Automate Desktop. It also displays all the variables used in the current flow under **Flow variables**. 

![The Variables pane.](media\variables-pane\variables-pane.png)

Through the **Variables** pane, you can search for variables, rename them, find their usages and filter them by type. 

## The variable value viewer

When the flow runs, the current value of each variable is shown next to its name. Variables of disabled actions are omitted. To clear the values of all variables, select the eraser icon at the bottom of the pane.

![The current variables' values displayed in the variables pane.](media\variables-pane\current-variable-values.png)

To view the value of a variable in more detail, double-click on the variable. The **variable value viewer** shows the data type of the variable, and expands any datarows or datatables to show their contents.

![The current variables' values displayed in detail in the variable value viewer.](media\variables-pane\variable-viewer.png)

Certain data types may contain nested elements. For example, a custom object type variable may contain another custom object in its properties. The figure below shows the variable **CustomerObject** which contains **Company**, another custom object. To view the properties of the nested element, select **More**.

![Parent custom object example.](media\variables-pane\custom-object-parent.png)

The variable value viewer displays the properties of the child custom object. To go back to the parent custom object, select the arrow.

![Child custom object example.](media\variables-pane\custom-object-child.png)

## Renaming a desktop variable

To rename a desktop flow variable, make a right-click on its name in the **Variables** pane and select **Rename**. The name of the variable will be updated in all its occurrences.

![The Rename option for flow variables.](media\renaming-variables\rename-flow-variable.png)

Although you can update variables' names manually through actions, the name will be changed only in these specific actions, not globally. 

## Input and output variables

Power Automate Desktop enables data exchange with the Power Automate platform through the input and output variables. These variables are passed to and from Power Automate Desktop, allowing you to create sophisticated flows.

Additionally, you can use input variables to set values manually when the flows are triggered through the console.

> [!NOTE]
> You can find more information about passing data between Power Automate Desktop and Power Automate in [Trigger a Power Automate Desktop flow from another flow](link-pad-flow-portal.md).

### Create an input variable

To create an input variable:

1. Select the (**+**) button in the variables pane and then **Input**.

     ![The plus button in the variables pane to create a new input variable.](media\input-output-variables\create-input-variable.png)

1. When the **Add a new input variable** dialog is appeared, populate the following fields:

    - **Variable type**: Defines if the variable is input or output.
    - **Variable name**: The name of the variable in the flow.
    - **Data type**: The type of the variable, like number, text, or datetime.
    - **Default value**: The default value when the flow runs from the Power Automate Desktop flow designer or the Power Automate Desktop console.
    - **External name**: The name used outside the flow. The external name is the name that will appear in Power Automate.
    - **Description**: A description of the variable that will appear in Power Automate and the Flow inputs dialog.

    > [!NOTE]
    > The **Variable type**, **Variable name**, **Data type**, and **External name** fields are required to create an input variable.

     ![The Add a new input variable dialog box.](media\input-output-variables\Add-new-input-variable-dialog.png)

If you run a flow containing input variables through the console, the **Flow inputs** dialog will prompt you to set their values manually. You can find more information about running flows in [Run attended and unattended desktop flows](run-pad-flow.md). 

   ![The Flow inputs dialog.](media\input-output-variables\flow-input-dialog.png)

### Create an output variable

To create an output variable:

1. Select the (**+**) button in the variables pane and then **Output**.

    ![The plus button in the variables pane to create a new output variable.](media\input-output-variables\create-output-variable.png)

1. When the **Add a new output variable** dialog is appeared, populate the following fields:

    - **Variable type**: Defines if the variable is input or output.
    - **Variable name**: The name of the variable in the flow.
    - **External name**: The name used outside the flow. The external name is the name that will appear in Power Automate.
    - **Description**: A description of the variable that will appear in Power Automate.

    > [!NOTE]
    > The **Variable type**, **Variable name**, and **External name** fields are required to create an output variable.

    ![The Add a new output variable dialog box.](media\input-output-variables\Add-new-output-variable-dialog.png)

### Manage input and output variables

All the created input and output variables are displayed in the appropriate section of the variables pane.

![The input output variables section of the variables pane.](media\input-output-variables\variables-pane-input-output-variables.png)

Through this pane, you can rename, update, delete, and find the usages of each input/output variable.

To update an input/output variable:

1.  Right-click on its name in the variables pane and select **Edit**.

    ![The Edit option for input/output variables.](media\renaming-variables\rename-input-variable.png)

2. In the **Edit variable** dialog, update the desired fields and select **Update** to apply the changes.

    ![The Edit variable dialog box.](media\renaming-variables\edit-variable-dialog.png)


[!INCLUDE[footer-include](../includes/footer-banner.md)]