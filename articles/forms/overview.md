---
title: Overview of using Microsoft Forms and Power Automate (contains video)
description: Learn how to use a form in a flow.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/11/2022
ms.author: napienko
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of flows with Microsoft Forms

Use the [Microsoft Forms](/connectors/microsoftforms/) connector in Power Automate to add a form to a flow. Do you need to record a purchase in your sales system when you receive an order form? Maybe you'd like to get an emailed notification when a customer submits a survey or a student turns in a quiz. These are a few examples of how using forms with Power Automate flows can eliminate manual data entry, simplify record keeping, and help you stay on top of your day.

Watch the following video to see how easy it is to use a form in Power Automate:<br><br>

>[!VIDEO <https://www.microsoft.com/videoplayer/embed/RWKXdv>]

## Triggering a form action in a flow

In Power Automate, a trigger is an event that makes something happen in the flow. Actions are what happens in response to the trigger.

Unlike other connectors, Forms has just one trigger, "When a new response is submitted," and one action, "Get response details." The action pulls in the details of the form response as dynamic content that you can use elsewhere in the flow.

:::image type="content" source="../media/forms/forms-trigger.png" alt-text="Screenshot of the Microsoft Forms trigger in the Power Automate canvas.":::

:::image type="content" source="../media/forms/forms-action.png" alt-text="Screenshot of the Microsoft Forms action in the Power Automate canvas.":::

## More information
<!-- The following two articles don't seem like the most logical next place to direct readers. Wouldn't information about Forms be more useful?-->
- [Power Apps and Microsoft Teams](/powerapps/teams/overview)
- [Power Virtual Agents and Microsoft Teams]( https://aka.ms/pva-teams-docs)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
