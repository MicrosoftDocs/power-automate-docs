---
title: Set up UI flows on your device | Microsoft Docs
description: Set up UI flows on your device
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
ms.date: 09/11/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set up UI flows
[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

[This topic is pre-release documentation and is subject to change.]


>[!TIP]
>Before you create a UI flow, check the [list of connectors](https://flow.microsoft.com/connectors/) to see if the application you want to automate already has a connector. If it does, consider creating a flow instead of a UI flow. You might also build your [own connector](https://docs.microsoft.com/connectors/custom-connectors/).

Before you can use your device to create UI flows, you'll need to ensure it meets the requirements outlined here.

## Prerequisites

- Either a [paid](https://flow.microsoft.com/pricing/) or [trial](https://flow.microsoft.com/manage/) Microsoft Flow plan.

- A work or school account to sign into both Microsoft Flow and your Windows device.

- A device that runs Windows 10, Windows Server 2016, or Windows Server 2019.
- A US (QWERTY) keyboard attached.

- The [next version of Microsoft Edge](https://www.microsoftedgeinsider.com)
    or Google Chrome.

- An [environment](https://docs.microsoft.com/power-platform/admin/environments-overview)
    with a [Common Data Service database](https://docs.microsoft.com/power-platform/admin/create-database).

<!--todo - Are these still relevant
#### Summary of the known limitations

UI flow (preview) is only available in English language and for US (QWERTY)
keyboard configurations.

The following are not supported:

-   Desktop UI Flows

    -   Multiple monitors

    -   Virtual machines

    -   Double click, mouse hover, touch/pen input

    -   Interactions on Windows (File explorer, startup menu, task bar, etc.)

-   Web UI Flows

    -   Right click

    -   User session information (e.g.: cookies) will not be reused during
        playback. You will have to edit the script to embed sign in information
        when required by websites.

The full list of limitations is available at the end of each section. -->

<!-- ## Get your device ready

To create and run UI flows, you need to install the following
components:

|  | **Name**                             | **Usage**  |                                                        
|---|--------------------------------------|----------------------------------------------------------------------|
|   | [The UI flows app](https://go.microsoft.com/fwlink/?linkid=2102613)                         | Record desktop Windows applications                                  |          |
|   | UI flows browser extension           | Record and test desktop Windows applications Record Web applications |                                                                                              |
|   | Webdriver                            | Test and run desktop Windows applications                            |                                                                                              |
|   | [Selenium IDE](https://go.microsoft.com/fwlink/?linkid=2107665) | Record and playback Web applications                                 |  |
|   | [Gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409)                              | Trigger your UI flow from an event, schedule or button.              |  |


##### Run the UI flows installer

The UI flows installer contains all the components needed to record, edit and
test UI flows.

![C:\\Users\\gachasta\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.MSO\\5A533980.tmp](media/3cf1e583443c99995288b7a9cdd53ae2.jpg)

If you want to change the data collection setting, re-install UI flows and
change the setting. -->

## Get your device ready

To create and run UI flows, install the following components:

|  | **Name**                             | **Usage**  |                                                        
|---|--------------------------------------|----------------------------------------------------------------------|
|   | [The UI flows app](https://go.microsoft.com/fwlink/?linkid=2102613)                         | Record desktop Windows applications                                  |          |
|   | UI flows browser extension           | Record and test desktop Windows applications. Record Web applications. |                                                                                              |
|   | Webdriver                            | Test and run desktop Windows applications                            |                                                                                              |
|   | [Selenium IDE](https://go.microsoft.com/fwlink/?linkid=2107665) | Record and playback Web applications                                 |  |
|   | [Gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409)                              | Used to enable events, scheduled flows, or button flows to connect to, trigger your UI flows (running inside your organization), and run them.              |  |


### Run the UI flows app

The UI flows installer contains all the components needed to record, edit and test UI flows.


### Activate the UI flows browser extension 

UI flows is supported on the following browsers only:
   - [Microsoft Edge (Chromium)](https://microsoftedgeinsider.com/).
   - Google Chrome.

Once you are done with the UI flows installer, you will be prompted by your browser to activate the extension.

- On Microsoft Edge (Chromium), select each warning icon in the top right  of the browser, and then select **Enable extension**.
.
    <!--Update the this pic     
        ![](../media/ui-flows-setup/8a4ea389fcad965781274f463f382b84.png) -->
-   On Google Chrome, select **Enable extension** when prompted.  
    
    <!--![ ](../media/ui-flows-setup/1301c0086aa1ef031b2505df7f5b2cae.png)-->

### Install Selenium IDE for web automation

Selenium IDE is an open source tool that lets you record and playback human
interactions on websites.

With UI flows, you can run Selenium IDE scripts from Microsoft Flow and keep them stored securely (with appropriate IT governance) in Common Data Service.

You can download and learn more about Selenium IDE here from the next version of Microsoft Edge or Google Chrome.

On Microsoft Edge (Chromium) you will need to **Allow extensions from other stores** then select **Add to Chrome**

![](../media/ui-flows-setup/62a1f2e69c21b089922f3f92fcd26560.png)

![](../media/ui-flows-setup/7e7b7a0a45b876b036980eaebf728d52.png)

### On-premises data gateway

The gateway is not required if you only want to create, edit and test your UI flow.

You will need the gateway to trigger your UI flow from an [event, schedule, or button flow.](../getting-started.md/#types-of-flows)

<!--todo: confirm that -->
The gateway set up is covered in the following section: [install the On-premises data Gateway](../gateway-reference.md/#use-a-gateway)

### Uninstall UI flows

1. Open the **start** menu > **Settings** > **Apps**.
1. Search for **UI flows (preview)**, and then select it.
1. Select **Uninstall**.

## Next steps

- Learn to [create desktop UI flows](create-desktop.md).
- Learn to [create Web UI flows](create-web.md).
- Learn how to run [UI flows](run-ui-flow.md).
- Learn to [manage UI flows](manage.md).
