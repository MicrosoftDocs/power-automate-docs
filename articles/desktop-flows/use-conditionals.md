---
title: Using conditionals
description: Using conditionals
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 09/22/2020
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

# Use conditionals



Conditionals allow you to execute blocks of actions only if a given condition is met. If the condition is false, the block of actions will be skipped.

Using conditionals, you can ensure certain elements have a wished value or state before performing other actions. For example, you can check if a file exists before trying to rename it. 

## If/else

The **If** statement is one of the most commonly used conditionals in flow development and programming.  

Power Automate  provides the **If** action to check whether a given condition is valid. If the condition is true, the logic between the **If** and **End** is executed.

An **If** action consists of two operands and an operator. The platform supports the most significant logical operations, such as **equal**, **not equal**, and **greater than**.

![Screenshot of an example flow containing an If block.](media\if-else\if-block.png)

An **If** may optionally contain an **Else** action. The **Else** action defines the logic to be executed when the **If** condition is invalid. It should be placed between the **If** and the **End** actions.

![Screenshot of an example flow containing an If-else block.](media\if-else\else-block.png)

 
To set multiple conditions for which different logic is executed, deploy the **Else if** action. This action is executed when the previous **If** and **Else if** conditions are invalid. It should be placed within the **If/End** block and always before the **Else** action.

![Screenshot of an example flow containing an If-else block with two additional Else-if blocks.](media\if-else\else-if-block.png)

In all cases, the variables and values used as operands must be of the same data type. Comparing variables of different data types makes the condition always false.

## If variations

Apart from the standard **If** action, Power Automate provides some additional conditional actions:

- **If file exists**: Checks if a file exists or not before executing a block of actions. This action can be used to ensure that a file exists before performing other operations on it.

- **If folder exists**: Checks if a folder exists or not before executing a block of actions.

- **If service**: Executes a block of actions if a specific service is running, is paused or is stopped.

- **If process**: Executes a block of actions if a specific Windows process is running, or not.

- **If window**: Executes a block of actions if a specific window is open, or not.

- **If window contains**: Executes a block of actions if a specific text or UI element exists in a window, or not.

- **If image**: Executes a block of actions if a specific image is found on the screen, or not.

- **If web page contains**: Executes a block of actions if a web page contains a specific element or some text, or not.

- **If text on screen (OCR)**: Checks if a given text is found on the screen or not, using an OCR Engine of your choice.

## Switch-case model

Unlike if-else conditionals, a switch block can address several possible execution paths. A switch statement is a control mechanism that allows a variable or expression to change the flow's behavior.

A switch block consists of three main parts:

1. The **Switch** action that marks the beginning of a switch block. Every **Switch** is accompanied by an **End** action that marks the switch block's end.

2. Inside the switch block, each **Case** marks a block of actions to execute if the respective condition is true.

3. In case all conditions are invalid, the flow will execute the actions in the **Default case** block, if exists.

![Screenshot of an example flow containing a switch block.](media\switch-case-model\switch.png)

You'll find the list of conditional actions available in the [Actions reference](actions-reference/conditionals.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
