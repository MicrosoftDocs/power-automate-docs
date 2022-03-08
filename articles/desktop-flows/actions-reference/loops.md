---
title: Loops | Microsoft Docs
description: Loops Actions Reference
author: mariosleon

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Loops

[Exit loop](#break)  
[For each](#foreach)  
[Loop](#loop)  
[Loop condition](#while)  
[Next loop](#continue)  

## Getting started with loops

Loops are used to automate repetitive sections of a flow by executing a block of actions multiple times.

Useful applications and features:
* Use simple loops to perform a given number of repetitions and iterate through data.
* Deploy loop conditions in order to repeat actions until a condition is met.
* Iterate through the items of a list using for each loops.
* Explicitly end loops when required.

You can find more information on how to use the loop actions [here](../use-loops.md)

## Loops actions

### <a name="break"></a> Exit loop
Terminates the loop and the flow resumes at the next action or statement following the loop

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="break_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="foreach"></a> For each
Iterates over items in a list, data table or data row, allowing a block of actions to be executed repeatedly

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Value to iterate|No|*||Enter a list, data row, or data table value to iterate through it.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
||*|The value name that will store the current item value in each iteration.|


##### <a name="foreach_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="loop"></a> Loop
Iterates a block of actions for a specified number of times

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Start from|No|Numeric value||Set the starting point of the loop counter.|
|Increment by|No|Numeric value||Set the increment that the loop counter variable is increased by.|
|End to|No|Numeric value||Set the ending point of the loop counter.|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
||*|The value name that will store the current index, starting at the start from value. The value will change by the increment with each iteration.|


##### <a name="loop_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="while"></a> Loop condition
Iterates a block of actions as long as a specified condition proves to be true

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=)|Equal to (=)|Choose the relationship of first operand to second operand.|
|First operand|No|*||Enter a value name defined by a previous action, text, number or expression to compare with the second operand.|
|Second operand|No|*||Enter a value name produced by a previous action, text, number or expression to compare with the first operand.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="while_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="continue"></a> Next loop
Forces the next iteration of the block to take place, skipping any actions in between

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="continue_onerror"></a> Exceptions
- This action doesn't include any exceptions



[!INCLUDE[footer-include](../../includes/footer-banner.md)]