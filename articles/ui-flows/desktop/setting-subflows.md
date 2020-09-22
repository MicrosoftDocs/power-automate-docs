---
title: Setting up subflows | Microsoft Docs
description: Setting up subflows
author: rokontol
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: rokontol
ms.reviewer: rokontol
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Setting up subflows

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Subflows are groups of actions, which may be referenced as a group within a flow.

Every flow contains the **Main** subflow - this is the subflow that is run when a flow starts. Any other subflows may be invoked through the **Run subflow** action:

![The Run subflow action](./media/setting-subflows/run-subflow-action.png)

Subflows are shown in tabs, directly over the main workspace. To add a new subflow, select the subflows tab, select **+**, and enter the subflow name.

![Add new subflow](./media/setting-subflows/add-new-subflow.png)

Select a subflow tab to edit the respective subflow.