---
title: Create a flow from your phone | Microsoft Docs
description: Create a flow from a template that, for example, sends a push notification when you receive mail from an address that you specify
services: ''
suite: flow
documentationcenter: na
author: adiregev
manager: erikre
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/18/2016
ms.author: adiregev
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a flow from your phone by using Microsoft Flow
Create a flow from your phone by using a template, which you can find by searching through a list of services, browsing categories, or specifying keywords. Follow the steps in this topic to create a flow that sends a push notification to your phone when you get mail from your manager.

If you're unfamiliar with Microsoft Flow, [get an overview](getting-started.md).

## Prerequisites
* An [account for Microsoft Flow](sign-up-sign-in.md).
* The Microsoft Flow mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows) on a [supported device](getting-started.md#use-the-mobile-app). The graphics in this topic reflect the iPhone version of the app, but the interface on an Android device or Windows Phone is similar.
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
     
     For this tutorial, you'll open the template that sends a push notification when you get mail from your manager.
2. In the list of services, tap **See all**.
   
    ![Show list of services](./media/mobile-create-flow/list-services.png)
3. Tap the icon for **Push notification**.
   
    ![Push notifications](./media/mobile-create-flow/push-notifications.png)
4. In the search bar, type **email**, and then tap the template to send a push notification when you receive a message from your manager.
   
    ![Choose template](./media/mobile-create-flow/choose-template.png)
5. In the screen that gives details about the template that you've selected, tap **Use this template**.
   
    ![Confirm template](./media/mobile-create-flow/confirm-template.png)

## Finish the flow
1. If prompted, tap **Sign in**, and provide your credentials for Office 365 Outlook, Office 365 Users, or both.
   
    ![Sign in to Office 365](./media/mobile-create-flow/office-signin.png)
   
    You can use the same connections when you create other flows.
2. In the upper-right corner, tap **Next**.
   
    ![Tap Next](./media/mobile-create-flow/next.png)
   
    The next screen shows the trigger event and all of the resulting actions.
   
    ![Trigger event and actions](./media/mobile-create-flow/flow-structure.png)
   
    For this template, new mail triggers the flow, which retrieves your information (including your manager's address) and sends you a push notification when you get mail from that address. Some templates require some customization to work properly, but this template doesn't.
3. (optional) Near the top of the screen, type a different name for the flow.
   
    ![Rename flow](./media/mobile-create-flow/rename-flow.png)
4. In the upper-right corner, tap **Create**.
   
    ![Create flow](./media/mobile-create-flow/create-flow.png)
   
    Your flow is created and will check for mail from your manager until you pause or delete the flow.

## Next steps
* [Monitor your flow activity](mobile-monitor-activity.md).
* [Manage your flows](mobile-manage-flows.md).

