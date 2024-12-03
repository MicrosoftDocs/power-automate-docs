---
title: Use wait conditions to delay flows | Microsoft Docs
description: Use wait conditions to delay your flows until specific conditions are met.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/20/2024
ms.author: Matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Use wait conditions to delay flows

The Microsoft Dataverse connector provides four ways to add wait conditions. Use these wait conditions when you need to delay processing in your flows until a particular condition is met.

- Postpone triggering the flow and the first action until a specific time. To learn more, go to
    [Wait condition using Postpone Until](./create-update-delete-trigger.md#wait-condition-using-delay-until).

- Add a fixed delay before the next step.

- Delay an action until a specific timestamp.

    ![Delay actions.](../media/wait-conditions/dff6f3bc845cae8be3c69632d6857767.png "Delay actions")

- Delay an action until a specific event occurs. You can use this action from the Microsoft Dataverse connector or any other connector as a step in the middle of the flow to delay subsequent steps until a specific event occurs. For example, you can define a flow that’s similar to the one in the following image to check for updates to **Account** rows in Dataverse, and then waits for an email confirmation from the **Account** manager before updating the change.

    ![Flow to update rows.](../media/wait-conditions/delay-actions-flow.png "Flow to update rows")
