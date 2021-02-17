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
ms.date: 10/11/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a cloud flow in a solution


Flows you create in a solution are known as *solution-aware* flows. Follow these steps to create a solution-aware flow.

## Prerequisites

You need to have at least one solution before you can create a solution-aware flow.

## Create the flow 

1. Sign in to [Power Automate](https://flow.microsoft.com).
1. Select **Solutions** from the navigation bar.

   ![Screen showing the left navigation bar with the Solutions option hightlighted](./media/create-flow-solution/select-solutions-from-left-nav.png)

1. Select the solution in which you'll create your flow.

   ![Screen showing the list of solutions](./media/create-flow-solution/new-solution-created.png)

1. Select **New**, and then select **Flow**.

   ![Screen showing the different types of items that can be created with flow highlighted](./media/create-flow-solution/select-new-flow.png)

   Power Automate opens.

1. Use the available connectors and triggers to build your flow.

   In this example, we'll build a simple flow that sends a notification when an email arrives in your inbox.
1. Search for and then select **Office 365 Outlook**.
1. Select the **When a new email arrives (V3)** trigger.
1. Select **New step**.
1. Search for the word "Notification", and then select the **Send me a mobile notification** action.
1. Add the **Subject** dynamic token to the **Text** field of the **Send me a mobile notification** box.
1. Give your flow a name and then save the flow.

   Your flow should appear like this:

   ![Screenshot showing the flow that's created](./media/create-flow-solution/new-email-notification-flow.png)
   
1. Select **Solutions** to see your flow in the solution:

   ![Screenshot that shows your flow inside the solution](./media/create-flow-solution/new-flow-inside-solution.png)

## Learn more

* [Create a solution](./overview-solution-flows.md)
* [Export a solution](./export-flow-solution.md)
* [Import a solution](./import-flow-solution.md)
* [Edit a solution-aware flow](./edit-solution-aware-flow.md)
* [Remove a solution-aware flow](./remove-solution-aware-flow.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]