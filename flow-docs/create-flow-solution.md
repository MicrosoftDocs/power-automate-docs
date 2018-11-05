---
title: Learn how to create solution-aware flows | Microsoft Docs
description: Learn how to create solution-aware flows.
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

#

## Create a flow in a solution

Flows you create in a solution are known as solution-aware flows. Follow these steps to create a solution-aware flow.

### Prerequisites

You need to have at least one solution before you can create a solutiuon-aware flow.

1. Sign into [Microsoft Flow](https://flow.microsoft.com).
1. Select **Solutions** from the navigation bar.

    ![](./media/create-flow-solution/select-solutions-from-left-nav.png)

1. Select the solution in which you'll create your flow.

    ![](./media/create-flow-solution/new-solution-created.png)

1. Select **+ New**, and then select **Flow**.

    ![](./media/create-flow-solution/select-new-flow.png)

    Microsoft Flow opens.

1. Use the available connectors and triggers to build your flow.

    In this example, we'll build a simple flow that sends a notification when an email arrives into my inbox.
1. Search for, and then select **Office 365 Outlook**.
1. Select the **When a new email arrives** trigger.
1. Select **+ New step**.
1. Select the **Send me a mobile notification** action.
1. Add the **Subject** dynamic token to the **Text** field of the **Send me a mobile notification** box.
1. Give your flow a name and then save the flow.

    If you're following along, your flow should appear like this image:

    ![](./media/create-flow-solution/new-email-notification-flow.png)
1. Select **Solutions** and see your flow in the solution:

    ![](./media/create-flow-solution/new-flow-inside-solution.png)

## Learn more

* [Create a solution](./create-solution.md)
* [Export a solution](./export-flow-solution.md)
* [Import a solution](./import-flow-solution.md)
* [Edit a solution-aware flow](./edit-solution-aware-flow.md)