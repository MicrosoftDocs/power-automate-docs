---
title: For each loop | Microsoft Docs
description: For each loop
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

# For each loop

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

The **For each** loop iterates through a list (or data table) and stores the current item in a variable. Its primary purpose is to get each item of a list (or row of a data table) and use it in other actions.

![The For each action.](media\for-each-loop\for-each-loop.png)

You can use this kind of loops to search for specific names, contents, or attributes in all kinds of lists. For example, you can iterate through a list of retrieved files to find a file with a specific name. 

![An example flow with a For each action.](media\for-each-loop\for-each-loop-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit** loop action. To skip the current iteration, use the **Next loop** action.
