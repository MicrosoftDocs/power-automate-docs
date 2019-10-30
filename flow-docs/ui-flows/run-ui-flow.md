---
title: Run UI flows from other flows | Microsoft Docs
description: Run UI flows from other flows 
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
ms.date: 10/23/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run UI flows
[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

[This topic is pre-release documentation and is subject to change.]

After you've created and tested a UI flow, you can run it from an event, schedule, or button. To make this possible, add your UI flow to an [Automated
flow](https://docs.microsoft.com/flow/get-started-logic-flow), a [Button flow](https://docs.microsoft.com/flow/introduction-to-button-flows), a
[Scheduled flow](https://docs.microsoft.com/flow/run-scheduled-tasks), or a[Business process flows](https://docs.microsoft.com/flow/business-process-flows-overview).

## Prerequisites

You need the the [on-premises data gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409) for your
device to have the UI flow triggered by Microsoft Flow.

The gateway is an enterprise-grade secure connection between Microsoft Flow and your device (where your UI flow runs). Microsoft Flow uses the gateway access your on-premises device to trigger your UI flows from an event, schedule or button.

<!--To do, no need for this here... it duplicates gateway content-->

<!-- ![](../media/run-ui-flow/3ae74b6c16e297854ff672a5061b693b.png)

You need to use the same work or school account in the gateway as on your
Windows device and Microsoft Flow.

1. Accept the terms of use and privacy statement  
    
    ![](../media/run-ui-flow/d95126d0056d250ea37211ee19466a6c.png)

1.  You will be prompted multiple times by Windows to accept changes made to
    your computer

1. Enter the email address for your work or school account that is used with
    Microsoft Flow and your Windows device and select **sign in**.

   ![](../media/run-ui-flow/d558e4a710057996e0ac1da52bb5e8e8.png)

1. Sign in with your account. You may see a different screen at this stage
    depending on your account configuration.  
    
    ![](../media/run-ui-flow/0d7bbbce4401278aa3137cb004cc7970.png)

1. Register a new gateway if this is the first time that you do so  
    

    ![](../media/run-ui-flow/855da551b31c1878bd69d0cc679b59af.png)

1. Choose a name for the gateway, set a recovery key of your choice and select
    **Configure.**  
  
    ![](../media/run-ui-flow/2876dc7a67a1dc8c8216b7639524bc1f.png)

1. You are done and can close the summary screen

   ![](../media/run-ui-flow/15de4d8c977e2427376c6aead13b0bbe.png)

For more information you can look at the [on-premises data gateway installer
documentation](https://docs.microsoft.com/data-integration/gateway/service-gateway-app)
and the [gateway
management](https://docs.microsoft.com/flow/gateway-manage) documentation.

-->

## Run your UI flow from an event, button, schedule or business process

In this example we will use an automated flow to trigger a UI flow when a
new email arrives.

1. Navigate to [Microsoft Flow,](https://flow.microsoft.com/) select **My flows** in the left navigation bar, select **New**, and then select **Automated-from blank**.

   >[!TIP]
   >You can choose any other type of flow to suit your needs.

1. Give it a name then choose a service for which you have an account for such
    as Outlook.com, Microsoft Teams or Gmail. In this example we will use “When
    a new email arrives” from Office 365 Outlook.  
    
    ![](../media/run-ui-flow/2d4ec17d239169a46905cef1829fa3a1.png)

1. Click **Create** then add a new step

1. Search for **UI flows** and select it  
  
    ![](../media/run-ui-flow/949b72d28a1233a7c76b7fe92ac50c11.png)

1. Select **Run a UI flow for Desktop (preview)** or **Run a UI flow for web
    (preview)**

     ![](../media/run-ui-flow/4e66da4e12a1235d06d94f00b806793e.png)

1.  Provide the gateway information and device credentials. You will only have
    to do this once per device:

    -  **Connection name**: choose a name for the device to Flow connection. It
        can be different than the Gateway name.

    -  **Username**: provide your device’s Work or School account on your
        device.

    -  **Password**: your Work or School account’s password.

    -  **Gateway**: select the gateway that you created during the
        installation.

     ![](../media/run-ui-flow/f253eebbddcc90c7d2c65c4d2523ec14.png)

1.  Next, select the UI flow that you previously created

    ![](../media/run-ui-flow/a00455ae03a71ea477cfa32a632896f0.png)

1.  Save it and test it out by sending yourself an email! You will see UI flow
    automation playing back the steps you recorded. **Please do not interact
    with your device for the duration of playback.**

## Use inputs & outputs

Once you defined inputs and outputs within a UI flow, you can pass information
from and to them.

1. When you add a UI flow in a flow, you can see the list of inputs that have
    defined during the creation phase

   ![](../media/run-ui-flow/05c87e0bfc4e994c00fc1ad253c17749.png)

1. You can bind each input with previous steps of the Flow by selecting an
    input from the token picker

   ![](../media/run-ui-flow/7b2d9c3d9a9ad3bbb8a612497e484aa7.png)

1. You can also bind outputs of you UI flow with inputs of next steps.

![](../media/run-ui-flow/d0c4bd1796298d1ea694cb381a0a26db.png)

## Limitations and known issues

-   Gateway clusters are unsupported

-   Playback of an input step where the key sequence was recorded from a non US
    (QWERTY) keyboard will result in key strokes in US (QWERTY).

## Next steps

