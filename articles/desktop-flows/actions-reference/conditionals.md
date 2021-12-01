---
title: Conditionals | Microsoft Docs
description: Conditionals Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Conditionals


|<!-- --> |
|-----|
|[Case](#case)|
|[Default case](#casedefault)|
|[Else](#else)|
|[Else if](#elseif)|
|[If](#if)|
|[Switch](#switch)|

## Getting started with conditionals

Conditional actions allow you to modify which actions to run, based on the outcomes of conditional statements.

Useful applications and features:
* Use the If group of conditionals to evaluate any type of condition.
* Use the Switch group of conditionals to compare a single variable with multiple possible values.
* Cover multiple scenarios by employing nested conditionals.
* Provide default and alternative behaviors to flows based on the available data.

You can find more information on how to use the conditional actions [here](../use-conditionals.md)

## Conditionals actions
### <a name="case"></a> Case
An expression that, if met, a block of actions associated with that particular case runs

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|The comparison operator of this case|
|Value to compare|No|*||Enter a value to compare with the switch-block value|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="case_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="casedefault"></a> Default case
A block of actions that is run, if no case expression has been met in the switch body

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="casedefault_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="else"></a> Else
Marks the beginning of a block of actions that ran if the condition specified in the preceding 'If' statements aren't met

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="else_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="elseif"></a> Else if
Marks the beginning of a block of actions that ran if the conditions specified in the preceding 'If' statements aren't met, but the condition specified in this statement is met

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|Choose the relationship of first operand to the second operand.|
|First operand|No|*||Enter a value name defined by a previous action, text, number or expression to compare with the second operand.|
|Second operand|No|*||Enter a value name produced by a previous action, text, number or expression to compare with the first operand.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="elseif_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="if"></a> If
Marks the beginning of a block of actions that is run if the condition specified in this statement is met

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|Choose the relationship of first operand to the second operand.|
|First operand|No|*||Enter a value name defined by a previous action, text, number or expression to compare with the second operand.|
|Second operand|No|*||Enter a value name produced by a previous action, text, number or expression to compare with the first operand.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="if_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="switch"></a> Switch
Dispatches execution to different parts of the switch body based on the value of the expression

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Value to check|No|*||Enter a value name, text, or number to compare with the following cases.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="switch_onerror"></a> Exceptions
- This action doesn't include any exceptions



[!INCLUDE[footer-include](../../includes/footer-banner.md)]