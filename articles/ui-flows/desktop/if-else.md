---
title: If/else | Microsoft Docs
description: If/else
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

# If/else

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

The **If** statement is one of the most commonly used conditionals in flow development and programming.  

Power Automate Desktop provides the **If** action to check whether a given condition is valid. If the condition is true, the logic between the **If** and **End** is executed.

An **If** action consists of two operands and an operator. The platform supports the most significant logical operations, such as **equal**, **not equal**, and **greater than**.

![An example flow containing an If block.](media\if-else\if-block.png)

An **If** may optionally contain an **Else** action. The **Else** action defines the logic to be executed when the **If** condition is invalid. It should be placed between the **If** and the **End** actions.

![An example flow containing an If-else block.](media\if-else\else-block.png)

 
To set multiple conditions for which different logic is executed, deploy the **Else if** action. This action is executed when the previous **If** and **Else if** conditions are invalid. It should be placed within the **If/End** block and always before the **Else** action.

![An example flow containing an If-else block with two additional Else-if blocks.](media\if-else\else-if-block.png)

In all cases, the variables and values used as operands must be of the same data type. Comparing variables of different data types makes the condition always false.