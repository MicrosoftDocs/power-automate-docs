---
title: Switch-case model | Microsoft Docs
description: Switch-case model
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

# Switch-case model

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Unlike if-else conditionals, a switch block can address several possible execution paths. A switch statement is a control mechanism that allows a variable or expression to change the flow's behavior.

A switch block consists of three main parts:

1. The **Switch** action that marks the beginning of a switch block. Every **Switch** is accompanied by an **End** action that marks the switch block's end.

2. Inside the switch block, each **Case** marks a block of actions to execute if the respective condition is true.

3. In case all conditions are invalid, the flow will execute the actions in the **Default case** block, if exists.

![A example with an switch block.](media\switch-case-model\switch.png)