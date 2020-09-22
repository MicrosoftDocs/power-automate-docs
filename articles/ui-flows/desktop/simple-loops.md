---
title: Simple loops | Microsoft Docs
description: Simple loops
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

# Simple loops

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

The idea behind a loop is to make a flow repeat one or more actions multiple times. Power Automate Desktop implements the simplest type of loops with the **Loop** action.

This loop repeats the actions between the **Loop** and **End** actions for a set number of times. A loop index variable is created automatically to track the current iteration’s number.

![The Loop action.](media\simple-loops\loop-action.png)

A simple loop is ideal to use in two cases:

1. The exact number of times that a block of actions should be repeated is known.

1. The loop index variable must be used somewhere inside the loop.

![An example flow with a Loop action .](media\simple-loops\loop-example.png)

In case you need to exit the loop before the specified iterations are completed, use the **Exit loop** action. To skip the current iteration, use the **Next loop** action.