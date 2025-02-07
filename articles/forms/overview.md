---
title: Overview of using Microsoft Forms and Power Automate
description: Learn how to use a form in a flow.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
editor: ''
tags: ''
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/22/2022
ms.author: jamiller
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of flows with Microsoft Forms

Use the [Microsoft Forms](/connectors/microsoftforms/) connector in Power Automate to add a form to a flow. Do you need to record a purchase in your sales system when you receive an order form? Maybe you'd like to get an emailed notification when a customer submits a survey or a student turns in a quiz. These are a few examples of how using forms with Power Automate flows can eliminate manual data entry, simplify record keeping, and help you stay on top of your day.

Watch the following video to see how you can use a form in Power Automate.

>[!VIDEO https://learn-video.azurefd.net/vod/player?id=630b3153-e815-4f18-a372-d6cade5effee]

## Triggering a form action in a flow

In Power Automate, a trigger is an event that starts a run of a flow. Actions are the steps a flow takes in response to the trigger.

Forms has one trigger. "When a new response is submitted," and one action, "Get response details." The action pulls in the details of the form response as dynamic content that you can use elsewhere in the flow.

:::image type="content" source="../media/forms/forms-trigger.png" alt-text="Screenshot of the Microsoft Forms trigger in the Power Automate canvas.":::

:::image type="content" source="../media/forms/forms-action.png" alt-text="Screenshot of the Microsoft Forms action in the Power Automate canvas.":::


[!INCLUDE[footer-include](../includes/footer-banner.md)]
