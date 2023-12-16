---
title: Power Fx in desktop flows (preview)
description: Learn about using Power Fx for creating expressions in desktop flows
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/18/2023
ms.author: dipapa
ms.reviewer: 
contributors: 
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Fx in desktop flows

[This article is prerelease documentation and is subject to change.]

[Power Fx](/power-platform/power-fx/overview) is the low-code language for expressing logic across [Microsoft Power Platform](/power-platform). It's a general-purpose, strong-typed, declarative, and functional programming language.

Power Fx is expressed in human-friendly text. It's a low-code language that makers can work with directly in an Excel-like formula bar or Visual Studio Code text window. The "low" in low-code is due to the concise and simple nature of the language, making common programming tasks easy for both makers and developers.

Power Fx enables the full spectrum of development from no-code makers without any programming knowledge to pro-code for the professional developers. It enables diverse teams to collaborate and save time and efforts.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality.
> - These features are available before an official release so that customers can get early access and provide feedback.
> - This feature requires Power Automate for desktop v2.39 or later.

## Using Power Fx in desktop flow (preview)

To use Power Fx as an expression language in a desktop flow, you have to create a desktop flow and enable the respective toggle button when creating the flow through Power Automate for desktop's console.

:::image type="content" source="media/power-fx/enabling_power_fx.png" alt-text="Screenshot of the Enable Power Fx button":::

> [!NOTE]
> Each Power Fx expression must start with "=" (equals to sign). 

In the same fashion as Excel formulas, desktop flows that utilize Power Fx as their expression language use **1** (one) based array indexing instead of **0** (zero) based indexing.  

Variable names are case-sensitive in desktop flows with Power Fx. For example, **NewVar** is different than **newVar**. 

When Power Fx is enabled in a desktop flow, variable hoisting isn't supported, requiring users to initialize a variable before its use. Trying to utilize an uninitialized variable in Power Fx expressions results in an error. 
 
Examples: 

- The **=1** in an input field is equivalent to the numeric value 1  
- The **= variableName** is equal to the variableName variable's value.  
- The expression  **= {'prop':"value"}** returns a record value that is equivalent to a custom object  
- The expression **= Table({'prop':"value"})** returns a Power Fx table that is equivalent to a list of custom objects  
- The expression - **= [1,2,3,4]** creates a list of numeric values
- To access the value from a List you should use the function **Index(var, number)**, where var is the name of the List and number is the position of the value to be retrieved  
- To access a data table cell using a column index, use the **ReadCell()** function. 
**ReadCell(DataTableVar, 1, 1)** retrieves the value from the cell in row 1, column 1
**ReadCell(DataRowVar, 1)** retrieves the value from the cell in row 1  


If the input provided doesn't start with the equals sign, the following rules apply:
- Numeric values without spaces are interpreted as numeric values 
- **True/ False** as input, regardless of case and without spaces are interpreted as boolean values 
- All other inputs are considered of text type values 
- **If** action now accepts a single conditional expression instead of multiple operands.

## Available Power Fx functions 

For the complete list of all available functions in Power Automate for desktop flows, go to [Formula reference - desktop flows](/power-platform/power-fx/formula-reference-desktop-flows).

## Known issues and limitations 

- Using variables in UI element/ web selectors isn't currently supported. 
- The following actions from the standard library of automation actions aren't currently supported: 
  - Create list
  - Shuffle list
  - Remove item from list
  - Sort list
  - Merge lists
  - Reverse list
  - Remove duplicate items from list
  - Find common list items
  - Retrieve DataTable columns into list
  - Add item to list
  - Create new list
  - Create new data table
  - Insert tow into data table
  - Update data table item
  - Delete row from data table
  - Switch
  - Case
  - Default case

- **General value** type variables aren't permitted in lists, tables, or as a property for Record values.
- Whenever a **General value** type variable is utilized, a warning message stating "Deferred type provided" is presented. These warnings arise due to Power Fx's strict requirement for strong-typed schemas (strictly defined types). 
- Certain automation actions from the standard library of actions, such as **Read from Excel**, **Read from CSV**, **Extract data from a web**, **Extract data from window**, **Execute SQL statement** and **Convert JSON to a custom object** produce **General type** variables that can't be evaluated yet during the authoring. For the time being, ignore warnings resulting from such cases. 
- The General type variables that are produced from the above actions are currently incompatible with the following functions: Filter(), LookUp(), Search(), CountIf(), With(). 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
