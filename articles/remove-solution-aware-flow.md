---
title: Learn how to remove or delete solution-aware flows | Microsoft Docs
description: Learn how to remove solution-aware flows from solutions or delete them from environments.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/12/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Remove a solution-aware flow

You can either remove a flow from a solution, or delete the flow from an environment entirely.

|Action|Result|
|------|-----------|
|Remove from this solution|The flow is removed from the selected solution, but it remains in the environment and you can use it in other solutions in the environment at a later date.|
|Delete from this environment|The flow is deleted, and won't be available in the environment.|

## Remove a flow from a solution

1. Sign in to Power Automate, and then select **Solutions** from the navigation bar.
1. Select the solution that contains the flow you want to remove.
1. Select **More commands** (...) for your flow, select **Remove**, and then select **Remove from this solution**.

>[!IMPORTANT]
>When you remove a flow, it gets moved to the **Common Data Service Default Solution**, where you can edit or delete the flow, or add it to another solution. 

## Delete a flow from an environment

1. Sign in to Power Automate, and then select **Solutions** from the navigation bar.
1. Select the solution that contains the flow you want to delete from the environment.
1. Select **More commands** (...) for your flow, select **Remove**, and then select **Delete from this environment**.

## Learn more

- [Create a solution](./overview-solution-flows.md)
- [Create a flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
