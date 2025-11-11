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

**<screenshot 1>**

### Creating local subflows and variables
The scope of a subflow is established at the time of its creation. A designated scope field is now available, allowing you to specify the intended scope for the newly created subflow, as illustrated in the image below:

**<screenshot 2>**

>[!IMPORTANT]
> - You cannot change the scope of a subflow after it is created.
> - The “Main” subflow always has a global scope, which cannot be modified.

To work with local variables, start by adding a new subflow from the subflows menu and selecting “Local” in the scope field. 

**<screenshot 3>**

Once the subflow is created, the variables panel will automatically switch to the local variables tab, displaying only the variables defined within that subflow. 

**<screenshot 4>**

Variables created in global subflows remain accessible from both the Global tab and the variables picker, but local subflow variables are only visible and usable within their respective subflow - they cannot be accessed from other subflows.

### Referencing global variables in local subflows
If you need to reference a global variable within a local subflow, you can do so by selecting it from the variables picker under the Global tab:

**<screenshot 5>**

Once added, the global variable will appear with a “global.” prefix in its name:

**<screenshot 6>**

When referenced from a local subflow, global variables will appear with this prefix, making it clear which variables are accessible across the entire flow. You may manually reference a global variable by prefixing its name with “global.” (for example, global.<variable name>). 

## Creating, passing and retrieving variables in local subflows
Since access to local variables is not available from any other subflow other than the one they were created, passing variables to a subflow is an essential part of working with local subflows and variables.

Each individual local subflow maintains its own distinct input and output variables, which facilitate the assignment and retrieval of values from other subflows. Conversely, global subflow variables continue to remain available for seamless value exchange with desktop flows, consistent with existing functionality.

### Creating input and output variables in local subflows

To declare input and output variables in local subflows, go to your chosen local subflow, click the + icon at the upper right of the variables panel, and then add the variables as you normally would.

**<screenshot 7>**

Once you have created any input or output variables, you will be able to see them in the variables pane under the local subflow local tab that you created them from

**<screenshot 8>**

### Passing and retrieving values from local subflows

Once you have defined input variables in a local subflow, you can assign values to them using the “Run subflow” action. Output variables will be available as produced variables after the subflow runs, allowing you to retrieve results. When you run a subflow, input variables show up as arguments for that subflow within the action, and output variables are listed under the action’s produced variables.

**<screenshot 9>**



