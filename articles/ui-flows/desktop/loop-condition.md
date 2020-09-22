---
title: Loop condition | Microsoft Docs
description: Loop condition
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

# Loop condition

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Unlike simple loops, the **Loop condition** makes a flow repeat one or more actions as long as a condition is true.

![The Loop condition action.](media\loop-condition\loop-condition.png)

If the condition is always true, the loop will never end. This situation is called an endless loop.

The condition consists of two operands and an operator. The platform supports the most significant logical operations, such as **equal**, **not equal**, and **greater than**.

![An example flow with a Loop condition action.](media\loop-condition\loop-condition-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit loop** action. To skip the current iteration, use the **Next loop** action.