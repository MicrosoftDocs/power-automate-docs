---
title: Create a cloud flow from your phone | Microsoft Docs
description: Create a cloud flow from a template that, for example, sends a push notification when you receive mail from an address that you specify
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 06/01/2023
ms.author: napienko
ms.reviewer: angieandrews
---

# Create a flow from your phone

There are many repetitive tasks that we all wish we could run with just a tap of a button. For example, you may need to quickly email your team to remind them to join the daily team sync, or you may want to start a new Visual Studio Codespaces build of your code base after you've been notified that there are no more checkins planned for the day. Instant flows allows you to accomplish these and many other tasks simply by tapping a button on your mobile device.

## Prerequisites

To complete the example in this topic, you'll need the following:

- Access to [Power Automate](https://make.powerautomate.com).
- The Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) on a [supported device](getting-started.md#use-the-mobile-app).
- An account with permissions to use the connectors to create your instant flow. For example, you'll need a Dropbox account in order to create an instant flow that accesses Dropbox.

If you're unfamiliar with Power Automate, go to [Get started](getting-started.md).

> [!NOTE]
>The graphics in this topic reflect the iPhone version of the app, but the interface on an Android device or Windows Phone is similar.

## Create an instant flow

Create instant flows so that you can easily run repetitive tasks from any place, at any time via your mobile device. Running instant flows saves you time and, since the tasks they perform are automated, there will be fewer errors than if you manually did them.  

1. Select the **+** sign.
1. Select the **Send an email to remind your team to join a meeting** template.
   
    ![Send an email to remind your team to join a meeting image.](./media/introduction-to-button-flows/create-button-from-mobile-3.png)  
1. Select **USE THIS TEMPLATE** at the bottom of the page.
1. Sign in to all services that this template uses.
1. After you've signed in to all services, select **Next**.
1. Select **CREATE**. Here you can also review the flow and make any changes you require to personalize the email, for example.
1. After a few moments, the instant flow is created. Select **SEE MY FLOW**.
1. On the **My flows** tab, view all your flows.

Congratulations, you've created an instant flow! You can now run this instant flow anytime, any place, from the **Instant flows** tab in the Flow app. Simply press the instant flow and it will run!

## Trigger an instant flow

Now that you've created an instant flow, it's time to run it. Since you can only run instant flows from the Flow app, be sure you've installed Flow on your Android or iOS mobile device.  

1. Launch the flow app, tap **Instant flows** at the bottom of the page, and tap the instant flow that you wish to trigger.  
1. View the progress while the flow runs.

    The page updates, indicating that the instant flow has completed.  

That's all there is to running a cloud flow. You should now receive the push notification, indicating that the email has been sent.  






### See also

- [Monitor your flow activity](mobile-monitor-activity.md).
- [Manage your flows](mobile-manage-flows.md).



[!INCLUDE[footer-include](includes/footer-banner.md)]
