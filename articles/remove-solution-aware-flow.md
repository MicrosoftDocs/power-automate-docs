---
title: Learn how to remove or delete solution-aware flows | Microsoft Docs
description: Learn how to remove solution-aware flows from solutions or delete them from environments.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/08/2022
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Remove a solution-aware flow

You can either remove a cloud flow from a solution, or delete the flow from an environment entirely.

Action|Result
------|-----------
Remove from this solution|The flow is removed from the selected solution, but it remains in the environment. You can use the flow in other solutions in the environment at a later date.
Delete from this environment|The flow is deleted; it is not available in the environment.

## Remove a cloud flow from a solution

1. Sign in to Power Automate, and then select **Solutions** from the navigation bar.
1. Select the solution that contains the flow you want to remove from the solution.

   ![A screenshot that shows a flow inside a solution selected.](./media/remove-solution-aware-flow/new-flow-inside-solution.png)

1. Select **...** (Commands) for your flow, select **Remove**, and then select either **Remove from this solution**.

   ![A screenshot that shows the option to remove a flow from a solution hightlighted.](./media/remove-solution-aware-flow/delete-flow-from-solution.png)

>[!IMPORTANT]
>When you remove a cloud flow, it gets moved to the **Default Solution**, where you can edit or delete the flow, or add it to another solution.

## Delete a cloud flow from an environment

1. Sign in to Power Automate, and then select **Solutions** from the navigation bar.
1. Select the solution that contains the flow you want to delete from the environment.

   ![A screenshot that shows the flow to be removed from the environment selected.](./media/remove-solution-aware-flow/new-flow-inside-solution.png)

1. Select **...** (Commands) for your flow, select **Remove**, and then select **Delete from this environment**.

   ![A screenshot that shows the option to delete a flow from an environment hightlighted.](./media/remove-solution-aware-flow/delete-flow-from-environment.png)

## Learn more

- [Create a solution](./overview-solution-flows.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
