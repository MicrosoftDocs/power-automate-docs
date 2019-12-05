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
ms.date: 11/04/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set up UI flows

[This topic is pre-release documentation and is subject to change.]

[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

> [!IMPORTANT]
> The UI flows feature is currently rolling out across regions. If you don't see the feature in your environment, can't create UI flows, or get an error when you try to run it within a flow, please retry later.

Before you can use your device to create UI flows, you'll need to ensure it meets the requirements outlined here.

> [!TIP]
> Before you create a UI flow, check the [list of connectors](https://flow.microsoft.com/connectors/) to see if the application you want to automate already has a connector. If it does, consider creating a flow instead of a UI flow. You might also build your [own connector](https://docs.microsoft.com/connectors/custom-connectors/).

## Prerequisites

- Either a [paid](https://flow.microsoft.com/pricing/) or [trial](https://flow.microsoft.com/manage/) Power Automate plan.

- A work or school account to sign into your Windows device with administrator privileges and Power Automate.

- A device that runs Windows 10, Windows Server 2016, or Windows Server 2019.
- A US (QWERTY) keyboard attached.

- The [next version of Microsoft Edge](https://www.microsoftedgeinsider.com)
    or Google Chrome.

- An [environment](https://docs.microsoft.com/power-platform/admin/environments-overview) with a [Common Data Service database](https://docs.microsoft.com/power-platform/admin/create-database).

## Limitations

UI flows (preview) is available in English.

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

You'll find feature-specific limitations included in the documentation for each feature.

## Install UI flows on your device

The UI flows installer contains all the components needed to record, edit, and test UI flows for desktop. 

>[!IMPORTANT]
>The UI flows installer installs the Webdriver component and the UI flows browser extension. Both of these are needed to record, test, and run UI flows for desktop.

Follow these steps to install the UI flows app:

1. [Download the UI flows installer](https://go.microsoft.com/fwlink/?linkid=2102613).
1. Open the **Setup.Microsoft.Flow.UIflow.exe** file. This file is likely in your **Downloads** folder after you downloaded it in the previous step.
1. Follow the instructions in the **UI flows (preview) setup** installer to complete the installation.

> [!TIP]
> If you want to change the data collection setting, re-install UI flows and change the setting.

## Activate the UI flows browser extension 

Once the UI flows installer completes, you will be prompted by your browser to activate the extension.

- On Microsoft Edge (Chromium), select each warning icon in the top right of the browser, and then select **Enable extension**.
-   On Google Chrome, select **Enable extension** when prompted.  

> [!TIP]
> If you did not see the prompt in your browser, please check the following:
> - You must use Microsoft Edge (Chromium) or Google Chrome
> - You may have to manually enable the extension. For Microsoft Edge (Chromium), navigate to **edge://extensions** or for Google Chrome, navigate to **chrome://extensions**.
> - If Power Automate's UI flows extension does not appear, you can reinstall it with the [UI flows installer](https://go.microsoft.com/fwlink/?linkid=2102613).

<!-- To do for Gautier: check if the below is not bugged as there was one at some point.
> - Reinstall the extension from the Chrome store
Navigate to this link https://chrome.google.com/webstore/detail/microsoft-flow-preview/jcajipieipkmjpfakbdhmjidmhidogoo and install it manually, that will fix any issues. (For Edge Chromium, use the same link and accept when prompted to install from external stores.)
-->

## (optional) Install Selenium IDE to automate Web applications

The Selenium IDE is an open source tool that lets you record and playback human interactions on Websites.

With UI flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Common Data Service.

Follow these steps to install Selenium IDE:

1. [Download and install](https://go.microsoft.com/fwlink/?linkid=2107665) the Selenium IDE for the next version of Microsoft Edge or Google Chrome.

1. On Microsoft Edge (Chromium), select **Allow extensions from other stores**, and then select **Add to Chrome**.

## Install the on-premises data gateway

You will need the gateway to trigger your UI flow from an [event, schedule, or button flow.](../getting-started.md#types-of-flows).

>[!TIP]
>The gateway isn't required if you only want to create, edit, and test your UI flows on your device.

[Install the on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-install), if you need it.

## Uninstall UI flows

1. Open the **start** menu > **Settings** > **Apps**.
1. Search for **UI flows (preview)**, and then select it.
1. Select **Uninstall**.

## Next steps

- Learn to [create desktop UI flows](create-desktop.md).
- Learn to [create Web UI flows](create-web.md).
- Learn how to run [UI flows](run-ui-flow.md).
- Learn to [manage UI flows](manage.md).
- Learn more about the [on-premises gateway](../gateway-reference.md#use-a-gateway)

## Limitations
- The latest versions of each components are required to record, test or run UI flows.
- Please uninstall previous versions before installing the latest.


