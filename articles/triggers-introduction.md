---
title: Triggers in Power Automate | Microsoft Docs
description: Learn all about triggers in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/17/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowadmin
---


# Get started with triggers

## What is a trigger?

A **trigger** is the event that starts a cloud flow. For example, if you want to get a notification in Microsoft Teams when someone sends you an email, in this case you receiving an email is the **trigger** that starts this flow.

Power Automate offers connectors (apps/services like SharePoint, Outlook, /.) and most connectors
offer prebuilt triggers that you can use to start your flows. Here's a partial look at the triggers that Office 365 Outlook connector provides by default.

   ![A screenshot of the Office 365 Outlook triggers.](./media/triggers-introduction/12700a7ab29c81632d6c15024a9779e8.png)

## Choose the right trigger

Triggers can be started instantly or manually, on a schedule, or automatically when some other even occurs.

### Triggers for instant/manual flows

If you'd like to run a cloud flow with a tap of a button on your mobile device, to remind your team to join the daily team meeting, create an instant flow (button flow). You can trigger these flows manually from any device. 

[Learn more about instant flows](./introduction-to-button-flows.md#trigger-an-instant-flow).


### Triggers for scheduled flows

If you'd like to run a cloud flow on a schedule, for example, to send a weekly project report, create a [scheduled flow](). In scheduled flows, you can choose when (date and time) and frequency (monthly/daily/hourly, etc.). 

Learn more about [scheduled flows](./run-scheduled-tasks.md).

![A screenshot showing the start page for a scheduled flow.](./media/triggers-introduction//1270c8bd76f42e6531daa735a562502a.png)


### Triggers for automated flows

If you'd like to create a cloud flow that performs tasks automatically after an event, for example, create a cloud flow that notifies you by email when someone tweets keyword you specify, create an automated flow. 

Learn more about [automated flows](./get-started-logic-flow.md)

## Add a trigger to an existing flow 

1. Add a new step

1. Search for the connector and select the app icon.

   ![A screenshot that shows a seach for a connector.](./media/triggers-introduction/da75261b15a79f891d38b4adbe9be3f3.png)

1. Once selected, the corresponding triggers and actions will be shown. Choose
    the trigger that best suits your need.

   ![A screenshot that shows the triggers for a selected connector.](./media/triggers-introduction/d869f08de1135874ed9f0dcbe6fa002d.png)

>[!IMPORTANT]
>The trigger must be the first step of the flow.


## Licensing for premium connectors

![A screenshot that shows a few premium connectors.](./media/triggers-introduction/premium-connectors.png)

You need a standalone [Power Apps license](https://powerapps.microsoft.com/pricing/) or [Power Automate license](https://flow.microsoft.com/pricing/) to access all premium, on-premises, and custom connectors. Microsoft 365 plan licensees can use standard connectors but cannot use premium connectors.

To find your license:

1. Go to [flow.microsoft.com](https://preview.flow.microsoft.com/)

1. Select **My flows**.

1. Select a cloud flow.

1. Go to the **Details** section, and then select **Plan**.  

   Your current license plan is displayed.

## Customize a trigger by adding conditions

Sometimes, you may need to customize a trigger so that it fires only when certain conditions are met. For example, you may be using SharePoint’s **When an item is created or modified** trigger in Power Automate. This trigger fires for every
change to SharePoint items but you might want the flow to only trigger when an item is
created or the status is marked as *Approved*. While you can filter other events by
adding conditions to the flow, the flow still runs and the calls are
counted as an API request, causing you to reach your API request limits faster.
To avoid it, you can write expressions in trigger conditions, avoiding a *run* if the condition in trigger isn't met.

Here's a [community article of how to use trigger conditions](https://www.timlinenterprises.com/microsoft-power-automate-flow-trigger-conditions/).

You may also need to secure the trigger inputs/outputs in the run history of a cloud flow. To do this, you can turn on the secure input and/or secure output setting in the trigger. A great community article of how to do it is [here](https://d365demystified.com/2019/12/19/secure-input-output-in-power-automate-run-history/).



[!INCLUDE[footer-include](includes/footer-banner.md)]
