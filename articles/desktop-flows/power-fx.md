---
title: Power Fx and desktop flows overview (preview)
description: Learn about using Power Fx for creating expressions in desktop flows
author: jpapadimitriou

ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 11/24/2023
ms.author: dipapa
ms.reviewer: 
contributors: 
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Fx and desktop flows overview (preview)

[Power Fx](/power-platform/power-fx/overview) is the low-code language that will be used across Microsoft Power Platform. It's a general-purpose, strong-typed, declarative, and functional programming language.

Power Fx is expressed in human-friendly text. It's a low-code language that makers can work with directly in an Excel-like formula bar or Visual Studio Code text window. The "low" in low-code is due to the concise and simple nature of the language, making common programming tasks easy for both makers and developers. It enables the full spectrum of development from no-code for those who have never programmed before to "pro-code" for the seasoned professional, with no learning or rewriting cliffs in between, enabling diverse teams to collaborate and save time and expense.

> [!IMPORTANT]
> This feature requires Power Automate for desktop v2.39 or later.

## Using Power Fx in desktop flow (preview)

To use Power Fx as an expression language in a desktop flow you have to create a desktop flow and enable the respective toggle button when creating the flow through Power Automate for desktop's console.


:::image type="content" source="media/power-fx/enabling_power_fx.png" alt-text="Screenshot of the Enable Power Fx button" border="false":::


Each Power Fx expression should start with '=' (equals sign). 

In the same fashion as Excel formulas, desktop flows that utilize Power Fx as their expression language use **1** (one) based aray indexing instead of **0** (zero) based indexing.  

Variable names are case-sensitive in desktop flows with Power Fx. For example **NewVar** is different than **newVar**. 

When Power Fx is enabled in a desktop flow, variable hoisting is not supported, requiring users to initialize a variable before its use. Trying to utilize an uninitialized variable in Power Fx expressions will result to an error. 
 

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


If the input provided does not start with the equals sign, the following rules apply:
- Numeric values without spaces are interpreted as numeric values 
- **True/ False** as input, regardless of case and without spaces are interpreted as boolean values 
- All other inputs are considered of text type values 
- **If** action now accepts a single conditional expression instead of multiple operands.


## Available Power Fx functions 

- Abs
- Acos
- Acot
- And
- Asin
- Atan
- Atan2
- Average
- Blank
- Boolean
- Concat
- Coalesce
- Char
- Concatenate
- Cos
- Cot
- Count
- CountA
- CountIf
- CountRows
- Date
- DateAdd
- DateDiff
- DateTime
- DateValue
- DateTimeValue
- Day
- Degrees
- Dec2Hex
- Decimal
- Distinct 
- DropColumns
- EncodeUrl
- EndsWith 
- Error 
- Exp 
- Filter 
- Find 
- First
- FirstN 
- Float 
- ForAll 
- GUID 
- Hex2Dec 
- Hour 
- If 
- IfError 
- Int 
- Index 
- IsBlank 
- IsBlankOrError 
- IsEmpty 
- IsError 
- IsNumeric
- IsToday 
- Language 
- Last 
- LastN 
- Left 
- Len 
- Ln 
- Log
- LookUp
- Lower
- Max
- Mid
- Min
- Minute
- ModMonth 
- Not 
- Now 
- Or 
- Proper 
- Pi 
- PlainText 
- Power 
- Radians 
- Rand 
- RandBetween 
- Replace 
- Right 
- Round 
- RoundUp 
- RoundDown 
- Second 
- Sequence 
- Shuffle 
- Scountin 
- Sort 
- Split 
- Sqrt 
- StartsWith 
- StdevP 
- Substitute 
- Sum 
- Switch 
- Table 
- Tan 
- Text 
- Time 
- TimeValue 
- TimeZoneOffset 
- Today 
- Trim 
- TrimEnds 
- Trunc 
- Upper 
- Value 
- VarP 
- Weekday 
- With 
- Year 
- ReadCell 


## Known issues & limitations 

- Using variables in UI element/ web selectors is not currently supported. 
- The following actions from the standard library of automation actions are not currently supported: 
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

- **General value** type variables, are not permitted in lists, tables, or as a property for Record values.
- Whenever a **General value** type variable is utilized, a warning message stating "Deferred type provided" is presented. These warnings arise due to Power Fx's strict requirement for strong-typed schemas (strictly defined types). 
- Certain automation actions from the standard library of actions, such as **Read from Excel**, **Read from CSV**, **Extract data from a web**, **Extract data from window**, **Execute SQL statement** and **Convert JSON to a custom object** produce **General type** variables that cannot be evaluated yet during the authoring. For the time being, ignore warnings resulting from such cases. 
- The General type variables that are produced from the above actions are currently incompatible with the following functions: Filter(), LookUp(), Search(), CountIf(), With(). 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
