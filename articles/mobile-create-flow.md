---
title: Create a cloud flow from your phone | Microsoft Docs
description: Create a cloud flow from a template that, for example, sends a push notification when you receive mail from an address that you specify
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
ms.date: 09/18/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a flow from your phone

Create a cloud flow from your phone by using a Power Automate template. On the **Templates** screen in Power Automate, you can select the **Mobile** category to find templates designed to work on your mobile phone.

In this topic, we'll follow an example to create a flow that sends a push notification to your phone when you get mail from your boss.

If you're unfamiliar with Power Automate, [get an overview](getting-started.md).

## Prerequisites

To complete the example in this topic, you'll need the following:

* Access to [Power Automate](sign-up-sign-in.md).
* The Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) on a [supported device](getting-started.md#use-the-mobile-app). The graphics in this topic reflect the iPhone version of the app, but the interface on an Android device or Windows Phone is similar.
* To use the template demonstrated in this topic, you'll also need:
  
  * Office 365 credentials.
  * Push notifications enabled on your phone.

## Find a template

1. Open the mobile app, and then tap **Browse** at the bottom of the screen.
  
    ![Browse icon](./media/mobile-create-flow/browse-icon.png)
  
    You can find a template in any of these ways:

   * Specify a keyword in the search box at the top of the screen.
   * Tap an option in the list of services.
   * Scroll down to show a variety of categories, and then tap a template in any category.

       ![Browse tab](./media/mobile-create-flow/browse-tab.png)

     For this tutorial, you'll open the template that sends a push notification when you get mail from your boss.
1. In the list of services, tap **See all**.

    ![Show list of services](./media/mobile-create-flow/list-services.png)
1. Tap the **Notifications** service icon.

    ![Push notifications](./media/mobile-create-flow/push-notifications.png)
1. In the search bar, type **boss**, and then tap the template to send a push notification when you receive a message from your boss.

    ![Choose template](./media/mobile-create-flow/choose-template.png)
1. In the screen that gives details about the template that you've selected, tap **Use this template**.

    ![Confirm template](./media/mobile-create-flow/confirm-template.png)

## Finish the flow
1. If prompted, tap **Sign in**, and provide your credentials for Office 365 Outlook, Office 365 Users, or both.

    ![Sign in to Office 365](./media/mobile-create-flow/office-signin.png)

    >[!TIP]
    >You can use the same connections when you create other flows.

1. In the upper-right corner, tap **Create**.

    ![Tap Create](./media/mobile-create-flow/create.png)


    Your flow is created and it checks for email from your boss until you pause or delete the flow.

    ![Completed flow](./media/mobile-create-flow/success.png)

## Next steps
* [Monitor your flow activity](mobile-monitor-activity.md).
* [Manage your flows](mobile-manage-flows.md).



[!INCLUDE[footer-include](includes/footer-banner.md)]