---
title: Learn to create UI flows | Microsoft Docs
description: Learn to automate legacy apps with UI flows.
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

Create your first desktop UI flow
------------------------------------------

In the following steps, we'll demonstrate how to automate the calculator app to add two numbers and then store the result for later use. You can automate other apps by following a similar pattern.

1. Ensure your [device is ready]() to create UI flows. <!--Todo: link to the prereqs section-->
1.  Use the [Chromium version of Microsoft Edge](https://www.microsoftedgeinsider.com) or Google Chrome to open [Microsoft Flow](https://flow.microsoft.com), and then sign in.

1. Select  **My flows**, and then select **UI flows (preview)**.
1. Select **+ New** from the top of the screen.    

   ![dfdfdf](../media/create-windows-ui-flow/a3b2b3c31c9b2a87c703e0299fd4b225.png "ddfdf")

1.  Choose **Desktop app** and then select **Next**.

    ![](../media/create-windows-ui-flow/5bb2857f2b7400c26e0bd77a274e8a2d.png) 

1.  Enter a name for your UI flow into the **Flow name** field, and then select **Next**.

1.  Select **Next** at the bottom to skip the optional **Set up inputs** screen.

    ![](../media/create-windows-ui-flow/d1ba306e26af36c769b9110c538e1ba3.png)

1.  Select the **Record app** card to expand it.

     ![](../media/create-windows-ui-flow/96b2612205e69dd8e8df8e63e1aed312.png)

1.  Select **Launch recorder**.

    ![](../media/create-windows-ui-flow/9f75c46661c5dd3d33ad280f95c874f9.png)

    The recorder control displays at the top of your screen.

1.  Start the calculator app.

     >[!TIP]
     >As your mouse hovers over controls in the app, you'll notice that a blue outline highlights each control. Always wait for the blue highlight before you select a control.
     >
     >If the blue highlight doesn't display around the element, it might not be
    recorded properly.

1.  Select **Record** from the recorder control.
1.  Select the first number, select **+**, select the second number, and then select **=**.

     >[!NOTE] <!--todo Is this really necessary?-->
     >unsupported apps will be blocked so that you don’t unintentionally
    record them.

    ![](../media/create-windows-ui-flow/aca3847b2a1104f3757b755a15019215.png)

1.  Select **Done** after you complete the actions you want to record, and then close the app that you recorded.

    ![](../media/create-windows-ui-flow/b700fb5100e0de146ba3325573d3f0af.png)

1.  Select the card that starts with "Run <app name> script" to view the screenshot list of recorded steps.

     >[!TIP]
     >Select **...** > **Delete** to remove any extra steps that you may want to remove. 
1.  Select **Next**. 

    ![](../media/create-windows-ui-flow/5af823232153f97ecb638284e654f86b.png)

1.  Select **Next** to skip the optional **Set up outputs** step.

    ![](../media/create-windows-ui-flow/ac88c713a644864c4d6eafef598431f8.png)

    >[!TIP]
    >It's always a great idea to test your UI flow. To do this, select the **Test now** button, and then watch your UI flow run.
    
    >[!IMPORTANT]For best results, do not interact with your device for the duration of playback.

1.  Select **Save and exit** to save your flow and exit the UI flows feature.

## Next steps

