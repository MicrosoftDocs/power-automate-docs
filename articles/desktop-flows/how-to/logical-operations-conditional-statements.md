---
title: Use logical operations on conditional statements
description: Use logical operations on conditional statements 
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 09/06/2021
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Use logical operations on conditional statements 

Data validation is a typical requirement in most business tasks and allows the implementation of different behavior based on the available data. 

Power Automate provides various conditionals that run blocks of actions only if a given condition is met. If the condition is false, the actions are skipped.

> [!NOTE]
> You can find more information regarding conditionals in [Use conditionals](../use-conditionals.md).

While validating data, you may encounter cases where you need to check multiple variables in the same part of the flow. For example, you may want to run a set of actions only if two variables have specific values.

To implement this functionality, you can use either multiple nested **If** actions or a single **If** action containing a complex logical expression.

To create a nested if statement, deploy an **If** action within the block of another **If** action. All the actions inside the nested block will run only when both if statements are valid. 

![Screenshot of two nested if statements.](media/logical-operations-conditional-statements/nested-if-statements.png)

Although the implementation of nested if statements is convenient in some cases, it can lead to complicated flows when many checks are needed.

A more efficient way to achieve the same results is the use of logical expressions. In the following example, a single **If** action offers the same result as the previously nested **If** actions.

The expression in the **First operand** field uses the **AND** operator to check whether the variables **A** and **B** contain the values **10** and **5**, respectively.

![Screenshot of a logical expression in an If action.](media/logical-operations-conditional-statements/logical-expression-if-action.png)

In general, logical operators can check multiple conditions simultaneously, allowing you to implement more complex logic in a single expression. The **AND** operator returns **TRUE** when both parts of the expression are valid. To check if either of the two parts (or both) are valid, use the **OR** operator.

The **Second operand** field is populated with the value **TRUE**, while the selected **Operator** is **Equals to**. This configuration makes the action check if the expression in the **First operand** field is valid. If it's valid, the actions inside the if block will run. To check if an expression is invalid, populate the value **FALSE** in the **Second operand** field.

> [!NOTE]
> Logical expressions must be enclosed by percentage signs (**%**). The percentage sign is used as a special character to denote variables and expressions. You can find more information regarding the percentage notation and logical expressions in [Use variables and the % notation](../variable-manipulation.md).

To handle more demanding validation scenarios, use multiple logical operators and parentheses. Parentheses allow you to change the order of operations and work the same way as in algebra and programming languages.

In the following example, the flow displays a dialog that prompts users to select one or more files from their desktop. The **If** action checks whether the user has pressed **Cancel** in the dialog or selected more than 100 files.

![Screenshot of a flow that checks the limitations for file selection.](media/logical-operations-conditional-statements/file-selection-flow.png)

The first part of the expression on the left of the **OR** operator returns **True** when the user presses **Cancel** in the dialog. In this case, there are no selected files to process, so the flow has to stop. 

The second part of the expression returns **True** when the user selects **Open**, but the selected files are more than 100. This condition ensures that the user can't select too many files and prevents the flow from running too long. 

If one of these conditions (or both) is valid, the flow will stop and display a dialog informing the user about the implemented limitations.

![Screenshot of the logical expression in the If action.](media/logical-operations-conditional-statements/logical-expression.png)
