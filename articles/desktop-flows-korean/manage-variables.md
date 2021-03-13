---
title: Manage the Variables pane | Microsoft Docs
description: Manage the Variables pane
author: georgiostrantzas
ms.service: power-automate
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



The **Variables** pane shows the input and output variables passed to and from Power Automate Desktop. It also displays all the variables used in the current flow under **Flow variables**. 
<!--note from editor: We should not use bold on the name. -->

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

To update the name of an input/output variable globally, right-click on its name in the **Variables** pane and select **Edit**.

![The Rename option for input/output variables.](media\renaming-variables\rename-external-variable.png)

In the **Edit variable** dialog box, populate the **Variable name** and **External name** fields for the internal and external variable name, respectively. 

![The Edit variable dialog box](media\renaming-variables\edit-variable-window.png)

## Input and output variables

Power Automate Desktop enables data exchange with the Power Automate platform through the input and output variables.
<!--note from editor: We do not use bold font on names like this. -->

These variables are passed to and from Power Automate Desktop, allowing you to create sophisticated flows. Ιn Power Automate, any input variables will be added to the UI action as fields. You can find more information about passing data between Power Automate Desktop and Power Automate in [Link a Power Automate Desktop flow with a cloud flow](link-pad-flow-portal.md).
<!--note from editor: Suggest for this previous sentence "You can find more information about passing data between Power Automate Desktop and Power Automate in <add article title as a link>."-->

To create an input or output variable, select the **+**  button in the [**Variables**](manage-variables.md) pane and choose the respective option.
<!--note from editor: Instead of using the + button, use the name that appears when you hover over the + sign and possibly put the plus sign after it like this <name of button> (+). -->

![The plus button in the Variables pane to create new input and output variables.](media\input-output-variables\create-input-output-variable.png)

  
In the **Add a new input variable** dialog box, populate the following fields:
- **Variable type**: Defines if the variable is input or output.
- **Variable name**: The name of the variable in the flow.
- **Default value**: The default value when the flow runs from the Power Automate Desktop flow designer or the Power Automate Desktop console.
- **Data type**: The type of the variable, like number, text, or datetime.
- **External name**: The name used outside the flow. The external name is the name that will appear in Power Automate.
- **Description**: A description of the variable. This field is mandatory and will appear in Power Automate.

![The Add a new input variable dialog box](media\input-output-variables\Add-new-input-variable-window.png)

![The Add a new output variable dialog box](media\input-output-variables\Add-new-output-variable-window.png)




[!INCLUDE[footer-include](../includes/footer-banner.md)]