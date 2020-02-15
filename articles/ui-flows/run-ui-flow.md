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
ms.date: 11/04/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run UI flows

[This topic is pre-release documentation and is subject to change.]

[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

After you've created and tested a UI flow, you can run it from an event, schedule, or button. To make this possible, add your UI flow to an [Automated flow](../get-started-logic-flow.md), a [Button flow](../introduction-to-button-flows.md), a [Scheduled flow](../run-scheduled-tasks.md), or a [business process flow](../business-process-flows-overview.md).

## Prerequisites

- You need the [on-premises data gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409) for your device to have the UI flow triggered by Power Automate.
   
   The gateway is an enterprise-grade secure connection between Power Automate and your device (where your UI flow runs). Power Automate uses the gateway to access your on-premises device so that it can trigger your UI flows from an event, schedule, or button.
- A work or school account. 

   >[!IMPORTANT]
   >You must use the same work or school account to set up the gateway, to sign into Power Automate, and to log into your Windows device.
   

## Run your UI flow from an event, button, schedule, or business process flow

In this example we will use an automated flow to trigger a UI flow when a new email arrives.

1. Navigate to [Power Automate](https://flow.microsoft.com/).
1. Select **My flows** in the left navigation bar.
1. Select **New**, and then select **Automated-from blank**.

   >[!TIP]
   >You can choose any other type of flow to suit your needs.

1. Give your flow a name in the **Flow name** box.
1. Search for "new email", and then select **When a new email arrives (V3)** from the list of triggers. 
    
   ![Select a trigger](../media/run-ui-flow/2d4ec17d239169a46905cef1829fa3a1.png "Select a trigger")

1. Select **Create**, and then select **New step**.

1. Search for **UI flows**, and then select **Run a UI flow for desktop** from the list of **Actions**. 

   ![Search action](../media/run-ui-flow/search-action.png "Search action")

1. Provide the gateway information and device credentials. 

   You'll have to do this once per device:

    - **Connection name**: Choose a name for the device to Flow connection. It can be different from the gateway name.
    - **Username**: Provide your device’s work or school account.
    - **Authentication type**: Select Windows.
    - **Password**: Your work or school account’s password.
    - **Gateway**: Select the gateway that you created during the installation.

      ![Connection settings](../media/run-ui-flow/connection-settings.png "Connection settings")

      >[!TIP]
      >If you don't see your gateway, you might need to select a different connection. To do this, select **...** from the top right side of the **Run a UI flow for desktop (preview)** card, and then select the connection you want to use from **My connections**.

      ![Select a new connection](../media/run-ui-flow/select-new-connection.png "Select a new connection")

1. Select the UI flow that you previously created.

   ![Select UI flow](../media/run-ui-flow/select-ui-flow.png "Select UI flow")

1. Select **Save** to save your automated flow.

1. Test your flow by sending an email to trigger it. You will see your UI flow  playing back the steps you recorded. 

![Successful run that calls a UI flow](../media/run-ui-flow/successful-run.png "Successful run that calls a UI flow")

>[!TIP]
>Do not interact with your device while the flow runs.

## Use inputs and outputs

When you define inputs and outputs within a UI flow, you can pass information from and to those inputs.

1. When you add a UI flow to a flow, you can see the list of inputs that were defined in the UI flow.

   ![UI flow inputs](../media/run-ui-flow/inputs.png "UI flow inputs")

1. You can populate each input field in the UI flow with values from previous steps in the flow. To do this, select the input field, and then select an input from the token picker.


1. You can also use outputs from your UI flow as inputs for actions that appear later in the flow. To do this, select the input field, and then select an input from the token picker.

## Limitations and known issues

- Gateway clusters are not supported.
- Since non-US 
    (QWERTY) keyboards are not supported in this realease, playback of an input step where the key sequence was recorded from a non-US (QWERTY) keyboard will result in key strokes in US (QWERTY).

## Learn more

 - Install the [on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-app).
 - [Use the on-premises data gateway app](https://docs.microsoft.com/flow/gateway-manage) documentation.
 - [Troubleshoot](https://docs.microsoft.com/data-integration/gateway/service-gateway-tshoot) the on-premises data gateway.
