---
title: Create flows from your phone in the Power Automate mobile app
description: Create a cloud flow from a template that, for example, sends a push notification when you receive mail from an address that you specify.
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 08/12/2025
ms.author: kewaiss
ms.reviewer: angieandrews
---

# Create flows from your phone

There are many repetitive tasks that we all wish we could run with just a tap of a button. For example, you might need to quickly email your team to remind them to join the daily team sync. Or, you might want to start a new Visual Studio Codespaces build of your code base after you're notified that there are no more checkins planned for the day. Flows allow you to accomplish these and many other tasks simply by tapping a button on your mobile device.

The main difference between flows and instant flows is that you need to trigger instant flows manually. To learn about the different types of flows, go to [Cloud flows](/power-automate/flow-types#cloud-flows).

## Prerequisites

To complete the example in this article, you need the following:

* Access to [Power Automate](https://make.powerautomate.com).
* The generally available version of Power Automate mobile app for [iOS](https://aka.ms/flowmobiledocsios) or [Android](https://aka.ms/flowmobiledocsandroid).
* An account with permissions to use the connectors to create your flow. For example, you need a Dropbox account in order to create a flow that accesses Dropbox.

## Create a flow

Create flows so that you can easily run repetitive tasks from any place, at any time from your mobile device. Running flows saves you time and, since the tasks they perform are automated, there are fewer errors than if you manually did them.  

1. Select the **+** (plus sign icon).
1. Select the **Post MSN Weather updates to Yammer group everyday** template.
1. Customize your flow by filling in these fields:

    - **Recurrence**

        - **Interval:** Enter a number. **Frequency:** Select the time occurrence.

    - **Get forecast for today**

        - **Location:** Select a valid input. **Units:** Select a measurement system.

    - **Post message**

        - **Group ID:** Select the group to post a message to.


    :::image type="content" source="../media/mobile/flow-template.png" alt-text="<alt text>":::

1. (Optional) Enter a name for your flow.

    If you don't enter a name, the flow is saved using the same name as the template you chose.

1. Select **Save**.

Congratulations, you created a flow! You can now run this flow anytime, any place, from the Power Automate mobile app. Simply press the flow and it will run!

## Related information

[Power Automate mobile app overview](overview-mobile.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]

