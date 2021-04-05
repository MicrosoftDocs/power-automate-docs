---
title: Use a flow to perform a changeset request in Dataverse | Microsoft Docs
description: Learn how to use changeset requests to update rows in Microsoft Dataverse with flows.  
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''
ms.service: power-automate
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


# Use a flow to perform a changeset request in Dataverse


![Graphical user interface, text, application, email Description automatically generated](../media/dataverse-how-tos/cc0cee1e835ad1577bdecccd23ebc4f6.png)

Change sets provide a way to bundle several operations that either succeed or fail as a group. When multiple operations are contained in a change set, all the operations are considered *atomic*, which means that if any one of the operations fails, any completed operations are rolled back.

![Change set request action](../media/dataverse-how-tos/e34a1aa3aec940e1629d8f761a8af62a.png)

To get started with change sets, just add the **Executes a changeset request** scope to your flow.

![Graphical user interface, text, application Description automatically generated](../media/dataverse-how-tos/14cf3b7d911d56da328f2f807fbeb06f.png)

You’ll notice that this is different from any other action you’ve added in the following ways.

- Instead of inputs and outputs, this is a container to which you can add actions.
- When you select **Add an action** you’ll see just the following three actions:

- Create a new row

- Delete a row

- Update a row

![The three actions for the executes a changeset scope](../media/dataverse-how-tos/13a004c80eef10754f2a0bc4eff57d8b.png)

You cannot have additional built-in actions inside of a change set scope because all actions are evaluated together in Dataverse. You will see that there are no arrows between each of the actions, indicating that there are no dependencies between these actions (they’ll all run at once).

![Executes a changeset scope](../media/dataverse-how-tos/02697bf7df88cf9377f91a858816b146.png)
