---
title: Learn to create desktop UI flows | Microsoft Docs
description: Learn to create desktop UI flows for Windows applications.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/24/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create and test desktop UI flows

[This topic is pre-release documentation and is subject to change.]

In the following steps, we'll demonstrate how to automate the calculator app to sum two numbers and then store the result for later use. 

>[!TIP]
>You can automate other apps by following a similar pattern.

## Create a desktop UI flow

1. Ensure your [device is ready]() to create UI flows. <!--Todo: link to the prereqs section-->
1. Use the [Chromium version of Microsoft Edge](https://www.microsoftedgeinsider.com) or Google Chrome to open [Microsoft Flow](https://flow.microsoft.com), and then sign in.

1. Select  **My flows** > **UI flows (preview)** > **New**.

   ![Create new UI flow](../media/create-windows-ui-flow/create-new.png "Create new UI flow")

1. Choose **Desktop app** and then select **Next**.

   ![Select desktop](../media/create-windows-ui-flow/select-desktop.png "Select desktop") 

1. Enter a name for your UI flow into the **Flow name** field, and then select **Next**.

   ![Select desktop](../media/create-windows-ui-flow/give-a-name.png "Select desktop") 

1. Select **Next** at the bottom to skip the optional **Set up inputs** screen since we aren't using inputs in this walkthrough.

1. Select the **Record app** card to expand it.

   ![Select record app](../media/create-windows-ui-flow/select-record-app.png "Select record app")

1. Select **Launch recorder**.

   ![Select launch recorder](../media/create-windows-ui-flow/select-launch-recorder.png "Select launch recorder")

   The recorder control displays at the top of your screen.

   ![The recorder-control](../media/create-windows-ui-flow/recorder-control.png "The recorder-control")

1. Start the calculator app.

     >[!TIP]
     >As your mouse hovers over controls in the app, you'll notice that a blue outline highlights each control. Always wait for the blue highlight before you select a control.
     >
     >If the blue highlight doesn't display around the element, it might not be recorded properly.

1. Select **Record** from the recorder control.
1. Select the first number, select **+**, select the second number, and then select **=**.

    ![The calculator app](../media/create-windows-ui-flow/app-to-record.png "The calculator app")

     <!--todo Is this really necessary?-->
     >[!NOTE] 
     >Unsupported apps will be blocked so that you don’t unintentionally record them.

1. Select **Done** on the recorder control after you complete the actions you want to record.

1. Close the app that you recorded.

1. Select the card that starts with "Run <app name> script" to view  screenshots of the recorded steps.

     >[!TIP]
     >Select **...** > **Delete** to remove any extra steps that you may want to remove.

    ![Show recorded steps](../media/create-windows-ui-flow/show-recorded-steps.png "Show recorded steps")

1. Select **Next**. 

1. Select **Next** to skip the optional **Set up outputs** step since we aren't using outputs in this walkthrough.

## Test your UI flow

It's always a great idea to test your UI flow. To do this, select the **Test now** button, and then watch your UI flow run.
    
 >[!IMPORTANT]
 >For best results, do not interact with your device for the duration of playback.

1. Select **Save and exit** to save your flow and exit the UI flows feature.


## Known issues in the Preview release of desktop UI flows


It is recommended to have the apps that you want to record already launched and in a maximized state before you start recording.

UI flows will launch a new instance of the applications upon each test or run. It is recommended to add a **Close** action at the end of your UI flow.

Duplicate actions may be created depending on the type of application and the speed of your recording. You can review and delete actions by selecting “**…**”.

![](../media/known-issues-desktop/60755d5ba679a56d7d2ca2ede5a19103.png)

Right clicks may not played back correctly. In such case, while recording, click left to focus UI flows on the target User Interface element then right click.


<!--Todo: link to uninstall instructions-->
If UI flows no longer records or plays back Windows applications after installing a new version, uninstall the previous version before installing a new one.

### Unsupported application types

-   Interactions on Windows (File explorer, startup menu, task bar, etc.).

-   Web browsers (Chrome, IE, Edge, Edge Chromium, Firefox, Mozilla, etc.).
    Please instead refer to [Create a Web UI flow](edit-web.md) to
    automate websites.

-   Java applications

-   Click once applications

-   Applications with a web view such as Electron applications

-   Office 2016 and earlier

### Unsupported configurations

-   Multi-screen

-   Recording through a virtual machine client (Remote Desktop, Citrix, etc.),
    either with the UI flow app running on the host device or on the virtual
    machine. None are supported.

-   Moving an application to another screen during a recording session.

-   Multiple instances of an application where the main window titles are
    identical.

-   Application windows with identical titles – e.g. for Microsoft Outlook:
    multiple “Untitled – Message (HTML)” new mail windows active at the same
    time.

-   Applications that span across multiple monitors.

-   Concurrent recording sessions on a given device.

-   Concurrent playback sessions on a given device. In case of simultaneous UI
    flow run, the first one will take precedence and the subsequent ones fill
    fail until the first one is completed.

-   Playback on a machine with different keyboard layout than the one it was
    initially recorded on.

-   Recording on a device or Windows session while the Browser with Microsoft
    Flow is on a different device or Windows session.

### Unsupported action types & behaviors (will not be recorded)

-   Double click

-   Mouse move

-   Mouse hover

-   Click and drag

-   Touch or pen input

-   Open app before recording

-   Closed app before playback starts

## Next steps

<!--Todo: fix links-->
- To trigger the UI Flow you just created you can learn how to [run UI
flows](run-ui-flow.md).

- If you want to do more with UI flows, you can also try out UI flows with [input and output](inputs-outputs-web.md) parameters.

