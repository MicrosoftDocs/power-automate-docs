---
title: Instant flows overview
description: Learn how to create an instant flow.
services: ''
suite: flow
documentationcenter: na
author: msftman
ms.subservice: cloud-flow
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/16/2023
ms.author: deonhe
  - ms.reviewer: angieandrewa
---
# Instant flows overview

There are many repetitive tasks that we all wish we could run with just a tap of a button. For example, you may need to quickly email your team to remind them to join the daily team sync, or you may want to start a new Visual Studio Codespaces build of your code base after you've been notified that there are no more checkins planned for the day. Instant flows allows you to accomplish these and many other tasks simply by tapping a button on your mobile device.

## Why create instant flows?
Create instant flows so that you can easily run repetitive tasks from any place, at any time via your mobile device. Running instant flows saves you time and, since the tasks they perform are automated, there will be fewer errors than if you manually did them.  

## Create an instant flow
### Prerequisites
* Access to [Power Automate](https://flow.microsoft.com).
* An account with permissions to use the connectors to create your instant flow. For example, you'll need a Dropbox account in order to create an instant flow that accesses Dropbox.

### From the portal
In this tutorial, you'll create an instant flow that starts a Visual Studio Codespaces build and sends notifications to let you know when the build starts.

1. Sign in to [Power Automate](https://make.microsoft.com).
1. From the left side of the screen, select **Create**.
1. Select **Instant cloud flow**.
1. Give your flow a name in the **Flow name** > **Manually trigger a flow** > **Create**. 
 
1. From the list of templates, select the **Trigger a new build in VSO** template.  
 1. on the **Trigger a new build in VSO** page, select **Use this template**.
1. If you aren't signed in, you'll be prompted to do so.  
1. After you've signed into Flow, you'll be prompted to sign into the connectors used in the template you've selected. In this example, in step 2 above we selected the **Trigger a new build in VSO** template, so we have to sign into VSO (and any other connectors you are working with), if you're not already signed in.
1. if you agree to authorize Power Automate to access your VSO account, Select **Accept**.  
 1. Authorize each connector similarly.

    The designer should appear like this when you are ready to go to the next step. To move on, select **Continue**.  
   ![Continue button.](./media/introduction-to-button-flows/create-button-6.png)
1. You're ready to configure the properties for the build you wish to start.
1. On the **Queue a new build** card, select or enter the **Account name**, **Project name**, **Build definition Id**, **Source branch** and optionally, **Parameters**.
1. On the **Send a push notification** card, configure the properties of the push notification.

    By default, this push notification is configured to send an HTML link to a Web page that displays the status of the build.  
1. To save your instant flow, select **Create flow**.
1. When you see a message that your flow was created, select **Done**.  

Congratulations, you've created an instant flow! You can now run this instant flow anytime, any place, from the **Instant flows** tab in the Flow app. Simply press the instant flow and it'll run!

### From your mobile device

The Power Automate mobile app is available for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).

>[!NOTE]
>While this tutorial displays screens from an iOS device, the screens and experience on an Android device are similar.

In the app:

1. Select **Browse** and scroll to the **Instant flow** category.  
1. Select **SEE ALL**. This displays all ready-to-go instant flow templates.
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

## Monitor your instant flow runs
You can monitor instant flows from the **Activity** tab of the flow app.

![Activity tab image.](./media/introduction-to-button-flows/create-button-from-mobile-13.png)  

>[!TIP]
>Tap any activity to drill into the results of the run to learn about the run.  

## Manage instant flows
You have full control of your instant flows so you can enable/disable, edit or delete a button anytime, any place. From the mobile app or from the flow portal, select **My flows** to get started managing your flows.

On the **My flows** tab of the Flow app:

1. Select the flow you wish to manage.
1. You can tap any of these options, based on what you'd like to accomplish.

   ![Options to manage flows.](./media/introduction-to-button-flows/manage-flow-1.png)  

1. To delete a cloud flow, tap **Delete flow**.  

    >[!WARNING]
    >All run history is deleted when you delete a cloud flow.

1. To save your changes after you're done editing an instant flow, tap **Update**. 

1. To view the results of all runs of a particular instant flow, tap **Run history**.

   If you disable a cloud flow, it will no longer be available on the **Buttons** tab.

### See also
* [Share instant flows](share-buttons.md)
* Learn to use [button trigger tokens](introduction-to-button-trigger-tokens.md) to send real-time data when your instant flows are run
* Install the Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows)

[!INCLUDE[footer-include](includes/footer-banner.md)]
