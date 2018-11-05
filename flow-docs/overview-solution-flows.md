---
title: Overview of solution-aware flows | Microsoft Docs
description: Learn the benefits of creating flows in solutions.
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
ms.date: 11/05/2018
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview

When you host your flows in a [solution](), they become portable, making it effortless to move them, and all their components from one environment to another environment. A typical use case is for an Independent Software Vendor (ISV) to develop flows in a sandbox environment, and then move those flows to a test environment. After testing, the ISV would then move the flows to a production environment at clients who purchase these flows. This process is much easier when you create your flows in solutions, and the move the solutions and their contents.

Flows you create inside a solution are known as *solution-aware* flows. You can add multiple flows in a single solution.

[!NOTE] You cannot move non solution-aware flows (flows not created in a solution) into a solution.

## Prerequisites

You must have the following components to create solutions, and solution-aware flows:

* [CDS 2.0](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
* [XRM 9.1]()

## Create a solution

Follow these steps to create a solution:

1. Sign into [Microsoft Flow](https://flow.microsoft.com).
1. Select **Solutions** from the navigation bar.

    ![](./media/overview-solution-flows/select-solutions-from-left-nav.png)
1. Select **+ New Solution**.

    ![](./media/overview-solution-flows/select-new-solution.png)

1. Provide all required information for your new solution, including **Display name**, **Publisher**, **Version**, and **Name**. It's also a great idea to provide a description for your solution.

    ![](./media/overview-solution-flows/new-solution.png)

1. Select **Save and Close** from the menu at the top.

    ![](./media/overview-solution-flows/save-and-close-solution.png)

    Your new solution might appear like this image:

    ![](./media/overview-solution-flows/new-solution-created.png)

    ![TIP] Select **Solutions** to refresh the list of soltuons if your new solution doesn't appear.

## Learn more

* [Create a solution](./create-solution.md)
* [Create a flow in a solution](./create-flow-solution.md)
* [Export a solution](./export-flow-solution.md)
* [Import a solution](./import-flow-solution.md)
* [Edit a solution-aware flow](./edit-solution-aware-flow.md)