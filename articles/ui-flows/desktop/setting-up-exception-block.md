---
title: Setting up an action exception block | Microsoft Docs
description: Setting up an action exception block
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

# Setting up an action exception block

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

--------PLACEHOLDER TEXT-----------------------------------------------------

An exception block contains multiple actions which are likely to fail or produce an erroneous result. Place the actions in a block prevents the entire block of attempting to complete, should at least one of the Actions within it fail. 

Use a **Begin exception block** action to mark the beginning of these actions. Configure the action properties to do any or all of the following: