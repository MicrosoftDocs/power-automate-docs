---
title: Power Fx in desktop flows
description: Learn about using Power Fx for creating expressions in desktop flows.
author: nikosmoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/28/2026
ms.author: nimoutzo
ms.reviewer: smurkute
contributors: 
- DanaMartens
- spanopoulos-msft
- shwetamurkute
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Fx in desktop flows

[Power Fx](/power-platform/power-fx/overview) is the low-code language for expressing logic across [Microsoft Power Platform](/power-platform). It's a general-purpose, strong-typed, declarative, and functional programming language.

Power Fx is expressed in human-friendly text. It's a low-code language that makers can work with directly in an Excel-like formula bar or Visual Studio Code text window. The "low" in low-code comes from the concise and simple nature of the language, making common programming tasks easy for both makers and developers.

Power Fx enables the full spectrum of development from no-code makers without any programming knowledge to pro-code for the professional developers. It enables diverse teams to collaborate and save time and effort.

## Using Power Fx in desktop flow

To use Power Fx as an expression language in a desktop flow, you need to create a desktop flow and turn on the toggle when you create the flow through Power Automate for desktop's console.

:::image type="content" source="media/power-fx/enabling_power_fx.png" alt-text="Screenshot of the Enable Power Fx button":::

### Differences in Power Fx enabled flows

> [!NOTE]
> Each Power Fx expression must start with an "=" (equals sign).

If you're transitioning from flows where Power Fx is disabled, you might notice some differences. To streamline your experience while creating new desktop flows, here are some key concepts to keep in mind:

- Like Excel formulas, desktop flows that use Power Fx as their expression language use one-based array indexing instead of zero-based indexing. For example, expression `=Index(numbersArray, 1)` returns the first element of the `numbersArray` array.

- Variable names are case-sensitive in desktop flows with Power Fx. For example, **NewVar** is different than **newVar**.

- When Power Fx is enabled in a desktop flow, you must initialize variables before use. Attempting to use an uninitialized variable in Power Fx expressions results in an error.

- The **If** action accepts a single conditional expression. Previously, it accepted multiple operands.

- While flows without Power Fx enabled use the term "General value" to denote an unknown object type, Power Fx uses a strict type system. In Power Fx enabled flows, there's a distinction between **dynamic variables** (variables whose type or value can change during runtime) and **dynamic values** (values whose type or schema is determined at runtime).
To better understand this distinction, consider the following example. The `dynamicVariable` changes its type during runtime from a `Numeric` to a `Boolean` value, while `dynamicValue` is determined during runtime to be an untyped object, with its actual type being a `Custom object`:

  :::image type="content" source="media/power-fx/dynamic-variable.png" alt-text="Screenshot showing the setting of a dynamic variable and dynamic value.":::

- Values that are treated as dynamic values are:
  - Data tables
  - Custom objects with unknown schema
  - Dynamic action outputs (for example, the "Run .NET Script" action)
  - Outputs from the "Run desktop flow" action
  - Any action output without a predefined schema (for example, "Read from Excel worksheet" or "Create New List")

- Dynamic values are treated similarly to the [Power Fx Untyped Object](/power-platform/power-fx/untyped-object) and normally require explicit functions to be converted into the required type (for example, `Bool()` and `Text()`). To streamline your experience, there's an implicit conversion when using a dynamic value as an action input or as a part of a Power Fx expression. There's no validation during authoring, but depending on the actual value during runtime, a runtime error occurs if the conversion fails.

- Whenever a dynamic variable is used, a warning message stating "Deferred type provided" is presented. These warnings arise due to Power Fx's strict requirement for strong-typed schemas (strictly defined types). Dynamic variables aren't permitted in lists, tables, or as a property for Record values.

- By combining the **Run Power Fx expression** action with expressions using [Collect, Clear, ClearCollect](/power-platform/power-fx/reference/function-clear-collect-clearcollect), and [Patch](/power-platform/power-fx/reference/function-patch) functions you can emulate behavior found in the actions **Add item to list** and **Insert row into data table** which were previously not available for Power Fx enabled desktop flows. While both actions are still available, use the Collect function when working with strongly typed lists (for example, a list of files). This function ensures the list remains typed, as using the Add Item to List action converts the list into an untyped object.

### Examples

- The **`=1`** in an input field is equivalent to the numeric value 1.
- The **`= variableName`** is equal to the variableName variable's value.  
- The expression  **`= {'prop':"value"}`** returns a record value that is equivalent to a custom object.
- The expression **`= Table({'prop':"value"})`** returns a Power Fx table that is equivalent to a list of custom objects.  
- The expression - **`= [1,2,3,4]`** creates a list of numeric values.
- To access the value from a List, use the function **`Index(var, number)`**, where var is the name of the List and number is the position of the value to retrieve.
- To access a data table cell by using a column index, use the **`Index()`** function.
**`=Index(Index(DataTableVar, 1), 2)`** retrieves the value from the cell in row 1 within column 2.
**`=Index(DataRowVar, 1)`** retrieves the value from the cell in row 1.
- To include an interpolated value in an input or a UI/web element selector, use the following syntax: `Text before ${variable / expression} text after`
  - Example: `The total number is ${Sum(10, 20)}`

> [!NOTE]
> If you want to use the dollar sign (**`$`**) followed by an opening curly brace sign (**`{`**)  within a Power Fx expression or in the syntax of a UI/Web element selector and don't want Power Automate for desktop to treat it as the string interpolation syntax, follow this syntax: **`${`** (the first dollar sign acts as an escape character).

## Available Power Fx functions

For the complete list of all available functions in Power Automate for desktop flows, see [Formula reference - desktop flows](/power-platform/power-fx/formula-reference-desktop-flows).

## Known issues and limitations

- The following actions from the standard library of automation actions aren't currently supported:
  - Switch
  - Case
  - Default case
- Desktop flows don't currently support some Power Fx functions presented through IntelliSense. Those functions display the following design time error when used: "Parameter 'Value': PowerFx type 'OptionSetValueType' isn't supported."

## What's new

This section lists what changed in each update.

### 2.48

In the September 2024 release:

- Re-enable previously unsupported list and data table manipulation actions from the **Variables** category.
- Native **untyped object** support for custom objects, lists, and data tables. Learn more about untyped objects at [Untyped object data type](/power-platform/power-fx/untyped-object).
  - This change reduces the design-time warnings and usage of deferred types. Untyped object is a way to handle types with unknown schema at design time.
  - In previous versions, **dynamic variables** (variables whose type or value can change during runtime) and **dynamic values** (values whose type or schema is determined at runtime) were handled the same way. When either a dynamic value or a dynamic variable was used in a Power Fx expression, a warning was triggered: "Deferred type provided." These warnings occurred because Power Fx enforces strict type schemas (strongly defined types).
  Starting with this version, we distinguished between these two cases. While dynamic variables continue to generate the "deferred type" warning, dynamic values are now treated as untyped objects.
  - All data table variables are untyped, while custom objects resulting from **Convert JSON to a custom object** action are untyped. Lists become untyped after you manipulate them with Power Automate for desktop actions from the **Variables** category.
  - Previously, certain automation actions from the standard library of actions, such as **Read from Excel**, **Read from CSV**, **Extract data from a web**, **Extract data from window**, **Execute SQL statement**, and **Convert JSON to a custom object** produced a dynamic variable, along with a "deferred type" warning. They now produce an untyped data table or untyped custom object variable instead.
- [Set](/power-platform/power-fx/reference/function-set) Power Fx function is now enabled but not fully supported yet. While you can't use it to modify a variable's value directly, you can use it with the above structures to update custom object properties and values of lists in specific indexes (for example, `=Set(Index(Index(DataTable, 1), 1), 42)` or `=Set(customObject.property, 17)`).
- Fixed an issue with accessing nested list properties of an object in Power Fx enabled flows.

> [!CAUTION]
> In version 2.48 of Power Automate for desktop, there are updates for Power Fx enabled desktop flows that could impact the execution of Power Fx enabled flows created with previous versions. Thoroughly test this version with your existing Power Fx flows.
>
> - **Child flow outputs**: Exercise caution when using output variables from child flows in a Power Fx enabled desktop flow. This caution involves output variables of types list, custom object, and data table.
> - **Single-value column arrays**: An array created by using an expression like `=[1, 2, 3]` results in a single-value column array in Power Fx enabled flows, whose items are objects with a single property: `{Value: 1}`. Attempting to access the `Value` property of this item, after modifying the first array with an action, results in an authoring error.
> - **Power Fx function usage**: In certain Power Fx functions, such as `IsEmpty()`, previous versions accepted a dynamic variable as an argument and didn't throw a validation error. By using the 2.48 version, using a variable that is handled as a dynamic variable results in a validation error, and a failure to execute existing flows. The resolution to this problem is to apply proper casting to the dynamic (untyped) value. Learn more about casting functions in [Untyped object data type](/power-platform/power-fx/untyped-object). You might encounter this issue when editing a flow and receive an error message like "Invalid argument type (UntypedObject). Expecting a Table value instead." To resolve this issue, follow the error messages to convert your expression into a valid one.
>   - Other examples of functions that might throw a validation error when using a combination of dynamic and typed variables are `Sum()`, `Filter()`, `Concatenate()` and operators like `in` (for example, `"string" in DynamicValueObject`).
> - **Variable comparison**: Similar to the previously mentioned issue, there can be type incompatibilities when you apply comparison operators (`=`, `<>`, `>`, `<` and so on) on expressions involving dynamic values. Exercise caution and apply the proper casting before you compare dynamic values.

### 2.43

In the April 2024 release:

- Case sensitivity. For example, *NewVar* is a different variable than *newVar*.
- [Run Power Fx expression](./actions-reference/variables.md#run-power-fx-expression) action is available under the [Variables](./actions-reference/variables.md#variable-actions) group of actions. Run Power Fx expression allows you to execute expressions directly on data sources.
- Support for the [Collect, Clear, ClearCollect](/power-platform/power-fx/reference/function-clear-collect-clearcollect) Power Fx functions in desktop flows.  
- Support for the [Patch](/power-platform/power-fx/reference/function-patch) Power Fx function in desktop flows.
- Use variables and Power Fx expressions in UI element or web selector syntax.
- Include interpolated values in the syntax of a UI or web element selector. For interpolated strings, use this syntax: **${** Power Fx expression **}**.

> [!IMPORTANT]
> In version 2.43 of Power Automate for desktop, updates for Power Fx enabled desktop flows could affect the execution of Power Fx enabled desktop flows created with previous versions.
Specifically:
> - **Case-sensitive variable names**: Variable names within Power Fx enabled desktop flows created with **Power Automate for desktop version 2.43 and later** are case-sensitive. Power Fx desktop flows created with **Power Automate for desktop version 2.42 and earlier** allowed for case-insensitive variable names. For example, *NewVar* and *newVAR* reference the same variable. For Power Fx enabled desktop flows created with **Power Automate for desktop version 2.42 and earlier**, review and verify that the produced variables are as expected.

### 2.42

In the March 2024 release:

- IntelliSense capabilities are now available for Power Fx enabled desktop flows.
  - Syntax colorization
  - Autocomplete functionality during typing with real-time suggestions
  - Signature helpers for Power Fx functions

> [!NOTE]
> IntelliSense capabilities are available for expressions. To input an expression, use the **equals sign (=** your expression **)** at the beginning of the respective input or the **string interpolation notation ( ${** your expression **} )**.

- Function picker
  - You can access the function picker by using the **fx** button in the skittle when interacting with the respective inputs. All Power Fx functions currently supported for desktop flows are available there.

### 2.41

In the February 2024 release:

- Inputs that don't begin with the equals sign (**=**) are now considered as text type values. Numeric and boolean inputs must always begin with the equals sign.
- Inputs now support interpolated strings. To include an interpolated value in an input, use the following syntax: `Text before ${variable/ expression} text after`.
  - Example: `The total number is ${Sum(10, 20)}`

> [!NOTE]
> To use interpolated string syntax, omit the equals (=) sign at the beginning of the input.

### 2.39

In the December 2023 release:

- If the input doesn't start with the equals sign, the following rules apply:
  - Numeric values without spaces are interpreted as numeric values.
  - **True/ False** as input, regardless of case and without spaces are interpreted as boolean values.
  - All other inputs are considered text values.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
