---
title: Use a flow to perform a change set request in Dataverse | Microsoft Docs
description: Learn how to use change set requests to update rows in Microsoft Dataverse with flows.  
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: TapanM
ms.author: Matow
editor: ''
tags: ''

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/06/2021
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---

# Use a flow to perform a change set request in Dataverse

*Change sets* provide a way to bundle several operations that either succeed or fail as a group. When multiple operations are contained in a change set, all the operations are considered *atomic*, which means that if any one of the operations fails, any completed operations are rolled back.

Follow these steps to get started with change sets.

1. In your flow, select **New step**.

1. Enter **changeset** into the search box of the **Choose an operation** card.

   Notice that the operations list now only displays operations with the word "changeset" in its name.

1. Select the **Perform a changeset request** to add its scope to your flow.

   ![Change set request action.](../media/dataverse-how-tos/change-set-1.png "Change set request action")

1. Select **Add an action**.

   ![Add an action.](../media/dataverse-how-tos/change-set-2.png "Add an action")

    You’ll notice that this approach is different from any other action you’ve added in the following ways:

    - Instead of inputs and outputs, this is a container to which you can add actions.

    - When you select **Add an action**, you’ll see just the following three actions:

      - Add a new row

      - Delete a row

      - Update a row

    ![The three actions available for Perform a changeset request.](../media/dataverse-how-tos/change-set-3.png "The three actions available for Perform a changeset request")

    You cannot have additional built-in actions inside of a change set scope because all actions are evaluated together in Dataverse. You will see that there are no arrows between each of the actions, indicating that there are no dependencies between these actions (they’ll all run at once).

1. Add all of the actions that you want to perform.<!-- Edit note: This is the same image as above. Also, the ALT text does not seem to match well. -->

   ![Executes a changeset scope.](../media/dataverse-how-tos/change-set-3.png "Executes a changeset scope")
