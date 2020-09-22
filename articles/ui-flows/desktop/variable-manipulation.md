---
title: Variable manipulation and the % notation | Microsoft Docs
description: Variable manipulation and the % notation
author: georgiostrantzas
ms.service: flow
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

# Variable manipulation and the % notation

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Variables are used within flows to store data for further processing. Every variable name must be enclosed by percentage signs (**%**). The percentage sign is used as a special character to denote variables. Any expression between percentage signs should be evaluated.

![Quote notation in a Change text case action's field.](media\variable-manipulation\quote-notation.png)

Occasionally, the percentage sign should be used as a simple character, instead of denoting a calculation. In those cases, it should be escaped using another percentage character (%%).

**​Power Automate Desktop** enables you to create complex expressions containing hardcoded values, variable names, arithmetic and logical operations, comparisons and parentheses.

![Complex expression in a Set variable action's field.](media\variable-manipulation\expression.png)

**Hardcoded values**

To include a hardcoded text value inside a variable, use quotes. Every value between the quote characters will be treated as a text value and not as a variable name.

![Hardcoded values in a Set variable action's field.](media\variable-manipulation\hardcoded-values.png)

**Variable names**

Variables can be used by adding their name to the expression without any further notation.

![Multiple variables in a Set variable action's field.](media\variable-manipulation\variables-names.png)

**Basic arithmetic**

To make mathematical operations, use all the essential, arithmetic operators, such as addition (**+**), subtraction (**-**), multiplication (**\***), and division (**/**).

Arithmetic operations are predominantly used with numerical values and variables. However, you can also use the addition operator to concatenate strings. Adding numbers and text strings in the same expression will convert the numbers into text, and concatenate them with the other text strings.

| Expression                  | Result                                              |
|-----------------------------|-----------------------------------------------------|
| %5 * 3%                     | 15 (number)                                         |
| %4 / Var%                   | 4 divided by the value of the Variable named “Var”  |
| %'this is ' + 'text'%       | this is text (text)                                 |
| %'This is the number ' + 5% | This is the number 5 (text)                         |

**Comparisons**

Besides arithmetic operators, make comparisons using the following operators

| Operator | Description                        |
|--------- |------------------------------------|
| =, !=    | Equal/not equal                    |
| <, <=    | Less than/less than or equal       |
| >, >=    | Greater than/greater than or equal |

Keep in mind that comparisons, when evaluated, produce either **True** or **False** as a value. Naturally, comparisons can only be done between values of the same type.

**Logical operators**

Logical operators can also be used to check multiple conditions simultaneously, allowing you to implement more complex logic in a single expression. The supported operators are: AND and OR. 

| Expression                     | Result                                                                                                           |
|--------------------------------|------------------------------------------------------------------------------------------------------------------|
| %Index = 1 OR Index = 2%     | True if the value of the **Index** variable is 1 OR 2, otherwise False                                           |
| %Index = 4 AND Text = "Four"% | True if the value of the **Index** variable is 4 AND the value of the **Text** variable is Four, otherwise False |

**Parentheses**

To change the operators' priority, use parentheses. Parentheses are handled the same way as in algebra and programming languages.

![Expression with parentheses in a Set variable action's field.](media\variable-manipulation\parentheses.png)