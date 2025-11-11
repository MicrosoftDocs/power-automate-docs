---
title: Working with scoped variables
description: Create and manage scoped variables in Power Automate for desktop
author: cochamos
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: concept-article
ms.date: 11/11/2025
ms.author: cochamos
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Scoped variables in Power Automate for desktop
Power Automate for desktop now supports scoped variables, allowing you to declare variables that are accessible only within the specific local subflow where they are created. This enhancement makes desktop flows more modular and improves the maintainability, debugging, and updating processes.

## Understanding variables scope
Variables in Power Automate for desktop are categorized as either global or local. Global variables are created in global subflows and accessible throughout the entire desktop flow, while local variables are restricted to the subflow where they are created. The variables panel has been updated to reflect this distinction, featuring two tabs at the top, Global and Local, so you can easily manage and distinguish between variables based on their scope.

![Screenshot of the variables pane.](media\scoped-vars\variables_pane_empty.png)

### Creating local subflows and variables
The scope of a subflow is established at the time of its creation. A designated scope field is now available, allowing you to specify the intended scope for the newly created subflow, as illustrated in the image below:

![Screenshot that shows the add new subflow dialog with the scope drop-down control expanded.](media\scoped-vars\add_new_subflow.png)

>[!IMPORTANT]
> - You cannot change the scope of a subflow after it is created.
> - The “Main” subflow always has a global scope, which cannot be modified.

To work with local variables, start by adding a new subflow from the subflows menu and selecting “Local” in the scope field. 

![Screenshot that shows the add new subflow dialog with the local scope selected.](media\scoped-vars\add_new_local_subflow.png)

Once the subflow is created, the variables panel will automatically switch to the local variables tab, displaying only the variables defined within that subflow. 

![Screenshot that shows the designer with a local subflow that contains three actions and its variables.](media\scoped-vars\designer_and_local_variables_view.png)

Variables created in global subflows remain accessible from both the Global tab and the variables picker, but local subflow variables are only visible and usable within their respective subflow - they cannot be accessed from other subflows.

### Referencing global variables in local subflows
If you need to reference a global variable within a local subflow, you can do so by selecting it from the variables picker under the Global tab:

![Screenshot that shows the variables picker with a global and local variables tab.](media\scoped-vars\variables_picker.png)

Once added, the global variable will appear with a “global.” prefix in its name:

![Screenshot that shows an action in a local subflow with a global variable selected.](media\scoped-vars\action_with_global_variable.png)

When referenced from a local subflow, global variables will appear with this prefix, making it clear which variables are accessible across the entire flow. You may manually reference a global variable by prefixing its name with “global.” (for example, global.<variable name>). 

## Creating, passing and retrieving variables in local subflows
Since access to local variables is not available from any other subflow other than the one they were created, passing variables to a subflow is an essential part of working with local subflows and variables.

Each individual local subflow maintains its own distinct input and output variables, which facilitate the assignment and retrieval of values from other subflows. Conversely, global subflow variables continue to remain available for seamless value exchange with desktop flows, consistent with existing functionality.

### Creating input and output variables in local subflows

To declare input and output variables in local subflows, go to your chosen local subflow, click the + icon at the upper right of the variables panel, and then add the variables as you normally would.

![Screenshot that shows the variables panel of a local subflow with the create Input or Output variable menue open.](media\scoped-vars\local_IO_variables.png)

Once you have created any input or output variables, you will be able to see them in the variables pane under the local subflow local tab that you created them from

![Screenshot that shows the variables panel of a local subflow with input and output variables created.](media\scoped-vars\local_IO_variables-created.png)

### Passing and retrieving values from local subflows

Once you have defined input variables in a local subflow, you can assign values to these variables by using the “Run subflow” action. This action allows you to pass specific values as arguments to the input variables of the chosen local subflow, making it possible to control the behavior and data flow within your automation.

After the subflow has executed, any output variables that were produced during its run will become available for retrieval. These output variables are listed under the action’s produced variables, enabling you to capture and utilize the results generated by the subflow. 

![Screenshot that shows the Run subflow action with input and output arguments.](media\scoped-vars\run_subflow_action_with_IO_variables.png)



