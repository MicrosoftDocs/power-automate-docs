---
title: Variable manipulation and the % notation
description: Variable manipulation and the % notation
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/16/2024
ms.author: dipapa
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Use variables and the % notation

Variables are used within flows to store data for further processing. Every variable name must be enclosed by percentage signs (**%**). The percentage sign is used as a special character to denote variables. Any expression between percentage signs should be evaluated.

![Screenshot of the percentage notation in a Change text case action's field.](media\variable-manipulation\percentage-notation.png)

Occasionally, the percentage sign should be used as a simple character, instead of denoting a calculation. In those cases, it should be escaped using another percentage character (%%).

​Power Automate enables you to create complex expressions containing hardcoded values, variable names, arithmetic and logical operations, comparisons and parentheses.

![Screenshot of a complex expression in a Set variable action's field.](media\variable-manipulation\expression.png)

## Hardcoded values

To include a hardcoded text value inside a variable, use quotes. Every value between the quote characters will be treated as a text value and not as a variable name.

![Screenshot of the hardcoded values in a Set variable action's field.](media\variable-manipulation\hardcoded-values.png)

## Using blank values

Variables can receive null (empty) values. Any variable, dynamic or not, including nested properties, can be populated with a **Blank** value. To check whether a variable holds a blank value use the **Is blank** or **Is not blank** options when configuring the respective [conditional actions](./actions-reference/conditionals.md).

> [!NOTE]
> Some action parameters can be assigned a blank value if the input argument is nullable. If the parameter can't receive a blank value, an error occurs.

## Variable names

Variables can be used by adding their name to the expression without any further notation.

![Screenshot of multiple variables in a Set variable action's field.](media\variable-manipulation\variables-names.png)

## Basic arithmetic

To make mathematical operations, use all the essential, arithmetic operators, such as addition (**+**), subtraction (**-**), multiplication (**\***), and division (**/**).

Arithmetic operations are predominantly used with numerical values and variables. However, you can also use the addition operator to concatenate strings. Adding numbers and text strings in the same expression will convert the numbers into text, and concatenate them with the other text strings.

| Expression                  | Result                                              | Result variable type |
|-----------------------------|-----------------------------------------------------|----------------------|
| %5 * 3%                     | 15                                                  | Number               |
| %4 / Var%                   | 4 divided by the value of the Variable named “Var”  | Number               |
| %'this is ' + 'text'%       | this is text                                        | Text                 |
| %'This is the number ' + 5% | This is the number 5                                | Text                 |

## Comparisons

Besides arithmetic operators, make comparisons using the following operators

| Operator | Description                        |
|--------- |------------------------------------|
| =, <>    | Equal/not equal                    |
| <, <=    | Less than/less than or equal       |
| >, >=    | Greater than/greater than or equal |

Keep in mind that comparisons, when evaluated, produce either **True** or **False** as a value. Naturally, comparisons can only be done between values of the same type.

## Logical operators

Logical operators can also be used to check multiple conditions simultaneously, allowing you to implement more complex logic in a single expression. The supported operators are: AND, OR, and NOT. 

| Expression                     | Result                                                                                                           |
|--------------------------------|------------------------------------------------------------------------------------------------------------------|
| %Index = 1 OR Index = 2%       | True if the value of the **Index** variable is 1 OR 2, otherwise False.                                          |
| %Index = 4 AND Text = "Four"%  | True if the value of the **Index** variable is 4 AND the value of the **Text** variable is Four, otherwise False.|
| %NOT(4 <> 4)%                  | Reverses the logical value in the parentheses. In this examples, it returns True.                                |

Additionally, you can use the following logical expressions to check the value of a string or variable. 

| Expression                      | Arguments | Description                                                                                          |
|---------------------------------|---------- |------------------------------------------------------------------------------------------------------|
| %StartsWith(arg1,arg2,arg3)%    | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string starts with the specified value, otherwise False. |
| %NotStartsWith(arg1,arg2,arg3)% | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string doesn't start with the specified value, otherwise False. |
| %EndsWith(arg1,arg2,arg3)%      | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string ends with the specified value, otherwise False. |
| %NotEndsWith(arg1,arg2,arg3)%   | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string doesn't end with the specified value, otherwise False. |
| %Contains(arg1,arg2,arg3)%      | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string contains the specified value, otherwise False. |
| %NotContains(arg1,arg2,arg3)%   | **arg1**: Text to search into </br> **arg2**: Text to search for </br> **arg3**: Ignore case (True / False)      | True if the provided string doesn't contain the specified value, otherwise False. |
| %IsEmpty(arg1)%                 | **arg1**: Text to check  | True if the provided string doesn't contain any characters, otherwise False. |
| %IsNotEmpty(arg1)%              | **arg1**: Text to check  | True if the provided string contain one or more characters, otherwise False. | 

## Parentheses

To change the operators' priority, use parentheses. Parentheses are handled the same way as in algebra and programming languages.

![Screenshot of the an expression with parentheses in a Set variable action's field.](media\variable-manipulation\parentheses.png)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
