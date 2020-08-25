---
title: Switch-case model | Microsoft Docs
description: Switch-case model
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Switch-case model

Unlike if-else conditionals, a switch block can address several possible execution paths. A switch statement is a control mechanism that allows a variable or expression to change the flow's behavior.

The **Switch** action marks the beginning of a switch block. Every **Switch** is accompanied by an **End** action that marks the switch block's end.

![A example with an switch block.](../../media/switch-case-model/switch-block.png)

Inside the switch block, each **Case** marks a block of actions to execute if the respective condition is true.

![The cases in the switch block.](../../media/switch-case-model/case-blocks.png)

In case all conditions are invalid, the flow will execute the actions in the **Default Case** block, if exists.

![The default case in the switch block.](../../media/switch-case-model/default-block.png)