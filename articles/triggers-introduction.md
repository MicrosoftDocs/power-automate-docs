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

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/22/2022
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowadmin
ms.custom: intro-internal
---


# Get started with triggers

## What is a trigger?

A **trigger** is an event that starts a cloud flow. For example, if you want to get a notification in Microsoft Teams when someone sends you an email, in this case you receiving an email is the **trigger** that starts this flow.

Power Automate offers connectors to services such as SharePoint and Outlook. Most connectors
offer prebuilt triggers that you can use to start your flows. Here's a partial look at the triggers that Office 365 Outlook connector provides by default.

   ![A screenshot of the Office 365 Outlook triggers.](./media/triggers-introduction/outlook-triggers.png)

## Choose the right trigger

Triggers can be started instantly or manually, on a schedule, or automatically when an external event (such as when an email arrives) occurs.

### Triggers for instant/manual flows

If you'd like to run a cloud flow with a tap of a button on your mobile device, to remind your team to join the daily team meeting, create an instant flow (button flow). You can trigger these flows manually from any device.

[Learn more about instant flows](./introduction-to-button-flows.md#trigger-an-instant-flow).

### Triggers for scheduled flows

If you'd like to run a cloud flow on a schedule, for example, to send a weekly project report, create a [scheduled flow](./run-scheduled-tasks.md). In scheduled flows, you can choose when (date and time) and frequency (monthly/daily/hourly, etc.).

![A screenshot showing the start page for a scheduled flow.](./media/triggers-introduction//scheduled-flows.png)

### Triggers for automated flows

If you'd like to create a cloud flow that performs tasks automatically after an event occurs, for example, a cloud flow that notifies you by email when someone tweets with a keyword you specify, create [an automated flow](./get-started-logic-flow.md).

## Add a trigger to an existing flow

1. Edit the flow and then select add a new step.

1. Search for the connector and then select the app icon. This screenshot shows the results if you search for "Share".

   ![A screenshot that shows a seach for a connector.](./media/triggers-introduction/connectors.png)

1. Once selected, the corresponding triggers and actions will be shown. Choose the trigger that best suits your needs.

   ![A screenshot that shows the triggers for a selected connector.](./media/triggers-introduction/triggers-share.png)

>[!IMPORTANT]
>The trigger must be the first step of the flow.

## Licensing for premium connectors

You need a standalone [Power Apps license](/powerapps.microsoft.com/pricing/) or [Power Automate license](https://flow.microsoft.com/pricing/) to access all premium, on-premises, and custom connectors. Microsoft 365 plan licensees can use standard connectors but cannot use premium connectors.

Here's a screenshot that displays some of the premium connectors that are available in Power Automate.

![A screenshot that shows a few premium connectors.](./media/triggers-introduction/premium-connectors.png)

Follow these steps to find your license.

1. Go to [Power Automate](https://powerautomate.com/)

1. Select **My flows**.

1. Select a cloud flow.

1. Go to the **Details** section, and view the details under **Plan**.

## Customize a trigger by adding conditions

Sometimes, you may need to customize a trigger so that it fires only when certain conditions are met. For example, you may be using SharePoint's **When an item is created or modified** trigger in Power Automate. This trigger fires for every
change to SharePoint items but you might want the flow to only trigger when an item is created or the status is marked as *Approved*. While you can filter other events by adding conditions to the flow, the flow still runs and the calls are counted as an API request, causing you to reach your API request limits faster.
To avoid it, you can write [expressions](./use-expressions-in-conditions.md) in trigger conditions, avoiding a *run* if the condition in trigger isn't met.

You may also need to secure the trigger inputs and outputs in the run history of a cloud flow. To do this, you can turn on the secure input or secure output setting in the trigger.

![A screenshot that shows secure input turned on.](./media/triggers-introduction/secure-trigger-input-output.png)
[!INCLUDE[footer-include](includes/footer-banner.md)]
