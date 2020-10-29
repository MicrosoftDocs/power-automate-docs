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
<!--note from editor: We get build errors (soon to become warnings) when we reuse images and alt text in an article. You don't actually need either of the following images; the UI isn't complex, and the BACX Leadership Team wants us to reel back the number of images anyway (I believe because of the cost, especially the Loc cost). Suggest deleting. If you don't like, you'll need to use different art and different alt text.
   ![A screenshot that shows a flow inside a solution selected.](./media/remove-solution-aware-flow/new-flow-inside-solution.png)
-->
1. Select **More commands** (...) for your flow, select **Remove**, and then select **Remove from this solution**.
<!--note from editor: As above.
   ![A screenshot that shows the option to remove a flow from a solution highlighted.](./media/remove-solution-aware-flow/delete-flow-from-solution.png)
-->

>[!IMPORTANT]
>When you remove a flow, it gets moved to the **Common Data Service Default Solution**, where you can edit or delete the flow, or add it to another solution. 

## Delete a flow from an environment

1. Sign in to Power Automate, and then select **Solutions** from the navigation bar.
1. Select the solution that contains the flow you want to delete from the environment.
<!--
   ![A screenshot that shows the flow to be removed from the environment selected.](./media/remove-solution-aware-flow/new-flow-inside-solution.png)
--> 
1. Select **...**<!--note from editor: Using **More commands** (...) and then simply **...** is via Writing Style Guide --> for your flow, select **Remove**, and then select **Delete from this environment**.

<!--
   ![A screenshot that shows the option to delete a flow from an environment highlighted.](./media/remove-solution-aware-flow/delete-flow-from-environment.png)
-->

## Learn more

- [Create a solution](./overview-solution-flows.md)
- [Create a flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
