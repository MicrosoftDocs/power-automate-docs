---
title: Manage flows from your phone | Microsoft Docs
description: View a list of your flows, enable or disable them, and view each flow's event/s, action/s, and run history
services: ''
suite: flow
documentationcenter: na
author: adiregev
manager: erikre
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/11/2016
ms.author: adiregev
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Manage flows in Power Automate from your phone

View a list of all flows that you created and, for each flow, view its events and actions, enable or disable it, and explore its run history.

**Prerequisites**

* Install the Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) on a [supported device](getting-started.md#use-the-mobile-app). The graphics in this topic reflect the iPhone version of the app, but the graphics on Android and Windows Phone look similar.
* If you don't already have a cloud flow, create one on [the website for Power Automate](https://flow.microsoft.com/). For easier testing, use one that you can trigger yourself instead of waiting for an external event.

The flow in this tutorial runs when you receive mail from a specific address:

![Trigger flow on receipt of mail from specific address.](./media/mobile-manage-flows/create-trigger.png)

You could configure such a cloud flow with your personal email address for testing and a different address (for example, your manager's) when the flow is ready for real use.

When the flow runs, it sends a custom push notification, with this syntax, to your phone:

![Send message to Slack.](./media/mobile-manage-flows/create-event.png)

**Note**: You can also [monitor flow activity](mobile-monitor-activity.md) from the mobile app.

## Manage a cloud flow
1. Open the mobile app, and then tap **My flows** at the bottom of the screen to list all your flows.
   
    Each entry shows the name of the flow, icons for its events and actions, the time when it ran most recently, and an icon that indicates whether the most recent run succeeded.
   
    ![List of flows.](./media/mobile-manage-flows/flow-list.png)
2. Tap a cloud flow to show options for managing it.
   
    ![Options to manage a cloud flow.](./media/mobile-manage-flows/flow-details.png)
3. Tap the **Enable flow** toggle to enable or disable the flow.
4. Tap **See flow** to show the events and actions for that flow, tap each event or an action to expand it, and then tap **Back**.
   
    ![Events and actions for a cloud flow.](./media/mobile-manage-flows/flow-event-action.png)
5. Tap **Run history** to show the flow's successes, failures, or both.
   
    ![List of runs.](./media/mobile-manage-flows/history-mixed.png)
6. Tap a run to show whether each event and action succeeded and, if so, how much time (in seconds) it took.
   
    ![Run details.](./media/mobile-manage-flows/flow-run.png)



[!INCLUDE[footer-include](includes/footer-banner.md)]