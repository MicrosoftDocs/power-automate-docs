---
title: Using loops
description: Using loops
author: HeatherOrt
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 09/22/2020
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Use loops



Loops are a fundamental concept in desktop flow development and prove to be invaluable elements in complex flows. The main idea behind a loop is to make a desktop flow repeat one or more actions multiple times. 

Power Automate provides three different kinds of loops that iterate based on various factors: 

- **Simple loops** - Iterate for a set number of times
- **Loops condition** - Iterate as long as a condition is valid
- **For each loops** - Iterate through a list

## Simple loops

The idea behind a loop is to make a desktop flow repeat one or more actions multiple times. Power Automate implements the simplest type of loops with the **Loop** action.

This loop repeats the actions between the **Loop** and **End** actions for a set number of times. A loop index variable is created automatically to track the current iteration’s number.

![Screenshot of the Loop action.](media\simple-loops\loop-action.png)

A simple loop is ideal to use in two cases:

1. The exact number of times that a block of actions should be repeated is known.

1. The loop index variable must be used somewhere inside the loop.

![Screenshot of an example flow with a Loop action.](media\simple-loops\loop-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit loop** action. To skip the current iteration, use the **Next loop** action.

## Loop condition

Unlike simple loops, the **Loop condition** makes a desktop flow repeat one or more actions as long as a condition is true.

![Screenshot of the Loop condition action.](media\loop-condition\loop-condition.png)

If the condition is always true, the loop will never end. This situation is called an endless loop.

The condition consists of two operands and an operator. The platform supports the most significant logical operations, such as **equal**, **not equal**, and **greater than**.

![Screenshot of an example flow with a Loop condition action.](media\loop-condition\loop-condition-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit loop** action. To skip the current iteration, use the **Next loop** action.

## For each loop

The **For each** loop iterates through a list (or data table) and stores the current item in a variable. Its primary purpose is to get each item of a list (or row of a data table) and use it in other actions.

![Screenshot of the For each action.](media\for-each-loop\for-each-loop.png)

You can use this kind of loop to search for specific names, contents, or attributes in all kinds of lists. For example, you can iterate through a list of retrieved files to find a file with a specific name. 

![Screenshot of an example flow with a For each action.](media\for-each-loop\for-each-loop-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit** loop action. To skip the current iteration, use the **Next loop** action.

You'll find the list of loop actions available in the [Actions reference](actions-reference/loops.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
