---
title: Create flows from your phone
description: Create a cloud flow from a template that, for example, sends a push notification when you receive mail from an address that you specify.
services: ''
suite: flow
documentationcenter: na
author: msftman
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/16/2023
ms.author: deonhe
ms.reviewer: angieandrews
---

# Create flows from your phone

There are many repetitive tasks that we all wish we could run with just a tap of a button. For example, you may need to quickly email your team to remind them to join the daily team sync. Or, you might want to start a new Visual Studio Codespaces build of your code base after you've been notified that there are no more checkins planned for the day. Instant flows allow you to accomplish these and many other tasks simply by tapping a button on your mobile device.

If you're unfamiliar with Power Automate, [Get started](../getting-started.mdgetting-started.md).

## Prerequisites

To complete the example in this article, you'll need the following:

* Access to [Power Automate](https://make.powerautomate.com).
* The generally available version of Power Automate mobile app for [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) on a [supported device](../getting-started.md#use-the-mobile-app).
* An account with permissions to use the connectors to create your instant flow. For example, you'll need a Dropbox account in order to create an instant flow that accesses Dropbox.

## Create an instant flow

Create instant flows so that you can easily run repetitive tasks from any place, at any time via your mobile device. Running instant flows saves you time and, since the tasks they perform are automated, there will be fewer errors than if you manually did them.  

1. Select the **+** (plus sign icon).
1. Select the **Post MSN Weather updates to Yammer group everyday** template.
1. Customize your flow by filling in these fields:

    - **Recurrence**

        - **Interval:** Enter a number. **Frequency:** Select the time occurrence.

    - **Get forecast for today**

        - **Location:** Select a valid input. **Units:** Select a measurement system.

    - **Post message**

        - **Group ID:** Aelect the group to post a message to.


    :::image type="content" source="../media/mobile/flow-template.png" alt-text="<alt text>":::

1. Select **Save**.
1. Enter a name for your flow, and then select **Submit**.

Congratulations, you've created an instant flow! You can now run this instant flow anytime, any place, from the **Instant flows** tab in the Flow app. Simply press the instant flow and it will run!

## Trigger an instant flow

Now that you've created an instant flow, it's time to run it. Since you can only run instant flows from the Flow app, be sure you've installed Flow on your Android or iOS mobile device.  

1. Launch the flow app, tap **Instant flows** at the bottom of the page, and tap the instant flow that you wish to trigger.  
1. View the progress while the flow runs.

    The page updates, indicating that the instant flow has completed.  

That's all there is to running a cloud flow. You should now receive the push notification, indicating that the email has been sent.  

### See also

- [Monitor your flow activity](mobile-monitor-activity.md)
- [Manage cloud flows](manage-cloud-flows.md)



[!INCLUDE[footer-include](includes/footer-banner.md)]
