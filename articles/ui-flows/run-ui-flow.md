---
title: Run UI flows from other flows | Microsoft Docs
description: Run UI flows from other flows in attended or unattended mode.
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
ms.date: 03/03/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run attended and unattended UI flows

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

## Run UI Flows unattended or attended

When you create UI flows, you run them either in **attended** or **unattended** mode. Unattended mode is best for aplications that do not need to be supervised by a human.

When running flows unattended, UI flows automatically signs into the target devices that run Windows 10, Windows Server 2016, or Windows Server 2019. Once the automation completes, UI flows signs out from the device and reports its activity in Power Automate.

To run an unattended UI Flow, you must have the following conditions met:
1. The target user session is not active (user is logged out of the target machine)
1. If there are existing sessions they must be disconnected (locked does not count, and UI flows run will fail); said disconnected sessions must NOT be the logged in as the user that the flow connection runs as.
>[!NOTE]
>A "disconnected" session can occur when you login using remote desktop and click the "x", or when you click "switch user" on the console session. 

To run an attended UI Flow, you need to have an active windows session that matches the name of the user configured for your connection. The session must not be locked.


Here are some key differences between attended and unattended runs:

## Attended mode

1. UI flows expects an unlocked user session on target devices.
1. The target session must use the same user credentials you used in the gateway connection for that UI flow.

1. When an attended UI flow run starts on the target machine we recommend that nobody interacts with your device until the run finishes.

## Unattended mode

1. UI flows creates, manages and then releases the user sessions on the target devices.

1. Unattended UI flows runs will run on devices, even if the screen is locked.

1. Windows 10 devices cannot run unattended if there are any active sessions on the device (even a locked one). You will receive this error: *Cannot execute UI flow. There is a locked or inactive user session on the target device*.

1. On Windows Server, if you have a locked session open with the same user as the UI flow is supposed to run as, you will receive the same error: *Cannot execute UI flow. There is a locked or inactive user session on the target device*.


## Schedule multiple UI flows on the same device

You can schedule multiple UI flows to run on one or more devices. If more than one UI flow runs trigger on the same device, the UI flows backend orchestrates the runs by following these rules:

1.  Sends the first UI flow to the target device.

1.  Queues other UI flows and displays them as **waiting** in the UI flows or gateway details page.

1.  Sends the next UI flow when each run completes.

>[!NOTE]
>These orchestration rules apply to both UI flows that are scheduled by the same user or by different users on the same device.

>[!IMPORTANT]
>If there too many UI flows in the execution queue a timeout might occur. UI
>flow runs will currently fail if they don’t run within 30 minutes after being triggered.

## Rerun failed UI flows

If a UI flow run fails, you can try running it either after correcting the cause of that failure or in certain cases to troubleshoot the failed run.

1. Go to the UI flows details page and identify the failed run you want to rerun.

1. Select the parent flow of the run in which you are interested.

   This leads you to the parent flow run where the UI flow failed.

1. Select resubmit button from the action menu.

## Troubleshoot failures

### Failed UI flows

1. If your unattended UI flow fails with **cannot create new session** error message, follow these steps to resolve the issue:

    1.  On Windows 10, confirm that you don’t have an active user session locked or unlocked on your target device.
    1.  On Windows Server 2016 or Windows Server 2019, confirm you haven’t reached the maximum number of active user sessions that's configured for your machine, otherwise UI flows won’t be able to create new sessions to run new UI flows.

### UI flows app status

The UI flows app is the software that you install on your local machine that manages and executes UI Flow runs. It enables our UI Flow cloud services to communicate and orchestrate UI Flows on your machine.

In the gateway list and gateway details pages you see the current UI flows app status for each device.

![A screenshot that shows the list of gateways](../media/run-ui-flow/gateway-list.png)

Your UI flows app can be in on of the following states:

1. **Available**: The UI flows app is online and ready to run UI flows.

1. **Running**: One or more UI flows are running on the machine. Any other UI flows that the backend sends to the target device will queue and wait its slot to run.

1. **Fix connection to gateway**: The UI flow cloud service can’t reach the target device, likely because there is a problem with the gateway connection. To resolve this issue, go to the connection and confirm that the credentials
    you use are correct.

1. **Unknown**: This status means that the backend cannot reach the UI flows app.

    1. If the **gateway status** is **offline**, confirm that the device is turned on and connected to the Internet. You may also [troubleshoot the gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-tshoot)

    1. If the **gateway status** is **online**, try the following actions:

        1. Confirm the UI flows app and services are running on your device.

        1. Restart the UI flow service on your device.

## Learn more

 - Install the [on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-app).
 - [Use the on-premises data gateway app](https://docs.microsoft.com/flow/gateway-manage) documentation.
 - [Troubleshoot](https://docs.microsoft.com/data-integration/gateway/service-gateway-tshoot) the on-premises data gateway.
