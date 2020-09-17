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
ms.date: 03/24/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set up UI flows

Before you can use your device to create UI flows, you'll need to ensure it meets the requirements outlined here.

> [!TIP]
> Before you create a UI flow, check the [list of connectors](https://flow.microsoft.com/connectors/) to see if the application you want to automate already has a connector. If it does, consider creating a flow instead of a UI flow. You might also build your [own connector](https://docs.microsoft.com/connectors/custom-connectors/).

## Prerequisites

- Either a [paid](https://flow.microsoft.com/pricing/) or [trial](https://flow.microsoft.com/manage/) license for Power Automate Attended RPA.

- A work or school account to sign into your Windows device with administrator privileges and Power Automate.

- A device that runs Windows 10 Pro, Windows 10 Entreprise, Windows Server 2016, or Windows Server 2019.

- The [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later)
    or Google Chrome browser.

- An [environment](https://docs.microsoft.com/power-platform/admin/environments-overview) with a [Common Data Service database](https://docs.microsoft.com/power-platform/admin/create-database).

- A supported keyboard attached.

## Limitations

You must have the latest versions of each component to record, test, or run UI flows.

The following are not supported:
- Windows 10 Home installations are not supported.

-   Desktop UI Flows

    -   Multiple monitors
    -   Double click, mouse hover, touch/pen input
    -   Interactions on Windows (File explorer, startup menu, task bar, etc.)

-   Web UI Flows

    -   Right click.
    -   User session information (for example: cookies) will not be reused during
        playback. You will have to edit the script to embed sign in information when required by websites.

You'll find feature-specific limitations included in the documentation for each feature.

## Install UI flows and Power Automate Desktop on your device

The installer contains all the components needed to record, edit, and test your automations. 

Follow these steps to install the UI flows app:

1. [Download the UI flows installer](https://go.microsoft.com/fwlink/?linkid=2102613).
1. Open the **Setup.Microsoft.PowerAutomate.UIflow.exe** file. This file is likely in your **Downloads** folder after you downloaded it in the previous step.
1. Follow the instructions in the **UI flows setup** installer to complete the installation.
1. Once the installer launches, select to install UI Flows, Power Automate Desktop or both. 
1. Depending on the selection, you will be prompted to select the features to install for each product. 

>[!IMPORTANT]
>The UI flows package installs the Webdriver component and the UI flows browser extension. Both of these are needed to record, test, and run UI flows for desktop.
>The Power Automate Desktop (preview) package installs the Power Automate Desktop app, third-party components and browser extensions.

![Installation options image](https://user-images.githubusercontent.com/48315710/92633908-c546e380-f2d3-11ea-8976-6a7609eb70f8.png)

### Set data collection options

During installation, you can change the default settings if you do not want to send usage data to Microsoft. To do so, uncheck **Allow Microsoft to collect usage data to improve UI flows**.

## Activate the UI flows and Power Automate Desktop browser extension 

Once the installation is complete, all you have to do is make sure that the extensions for UI flows and Power Automate Desktop (preview) are active on the browser(s) you use.

![Installation success image](https://user-images.githubusercontent.com/48315710/92635143-a5b0ba80-f2d5-11ea-96ec-4672d84d13b3.png)

1. Click on one of the link displayed in the installer. For example, if you want to use UI flows on Microsoft Edge, click on the **Microsoft Edge** link.
1. It will open the store of your browser directly to the public page of the extension
1. Make sure the extension is already installed. If not:

For Microsoft Edge: 
- click on **Get** and **Add extension** when prompted. 
- If you see the message **This extension has been turned off in Microsoft Edge** on top of the page, then click on **Turn on extension**

For Google Chrome: 
- click on **Add to Chrome** and select **Enable extension** when prompted. 
- If you see the message **This item has been disabled in Chrome.** on top of the page, then click on **Enable this item**

> [!TIP]
> If you are not able to activate the extension(s) in your browser, please check the following:
> - You must use [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later) or Google Chrome. Firefox is only supported with the Power Automate Desktop extension.
> - If the extension does not appear, you can reinstall it with the [UI flows installer](https://go.microsoft.com/fwlink/?linkid=2102613).


## Install Selenium IDE to automate Web applications with UI flows

The Selenium IDE is an open source tool that lets you record and playback human interactions on Websites.

With UI flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Common Data Service.

Follow these steps to install Selenium IDE:

1. [Download and install](https://go.microsoft.com/fwlink/?linkid=2107665) the Selenium IDE for [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later) or Google Chrome.

1. On Microsoft Edge (version 80 or later), select **Allow extensions from other stores**, and then select **Add to Chrome**.

## Install the on-premises data gateway

You will need the gateway to trigger your UI flow from an [event, schedule, or button flow.](../getting-started.md#types-of-flows) on a remote device.

>[!TIP]
>The gateway isn't required if you only want to create, edit, and test your flows on your device.

[Install the on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-install), if you need it.


>[!IMPORTANT]
>When you install the gateway, it defaults to the region that Power Automate uses.


## Setup UI flows connections and machine credentials

1. Sign into [Power Automate](https://powerautomate.microsoft.com).
1. Expand **Data** on the left side of the screen.
1. Select **Connections**.

   ![A screenshot of the connections tab](../media/ui-flows-setup/connections-tab.png)

1. Select New connection.

   ![A screenshot of a connection](../media/ui-flows-setup/new-connection.png)

1. Search for *UI flow*, and then select **UI flows**.

   ![A screenshot of the search box](../media/ui-flows-setup/search-ui-flow.png)

1. Provide the gateway information and device credentials: 

    - **Domain and Username**: Provide your device account. You can use a local account by using the name of the user (for example, “MACHINENAME\\User” or “local\\User”), or an Active Directory account such as “DOMAIN\\User”.
    - **Password**: Your account’s password.
    - **Choose a gateway**: Select the gateway you want to use.

      ![A screenshot that shows where to enter the credentials for the connection](../media/ui-flows-setup/credentials-screen.png)

1. Select **Create**.

## Troubleshoot missing gateway

You might not find the gateway in the list while creating the connection for the following reasons:

- The gateway may be installed in a different region than your Power Automate region. To resolve this issue, uninstall the gateway from the device, and then reinstall it, selecting [the correct Power Automate region](../regions-overview.md#region-mappings-for-power-automate-and-gateways).
- The gateway was deleted by its owner.

## Supported keyboard layouts

- US keyboard – English (United States)
- US keyboard – English (Australia)
- US keyboard – English (Canada)
- Microsoft Pinyin – Chinese (Simplified Han, China)
- German keyboard – German (Germany)
- Microsoft IME – Japanese (Japan)
- United Kingdom keyboard – English (United Kingdom)
- French keyboard – French (France)
- Russian keyboard – Russian (Russia)
- Portuguese (Brazilian ABNT) keyboard – Portuguese (Brazil)
- Portuguese (Brazilian ABNT2) keyboard – Portuguese (Brazil)
- Microsoft IME – Korean (South Korea)
- Spanish keyboard – Spanish (Spain)
- Italian keyboard – Italian (Italy)
- Latin American keyboard – Spanish (Mexico)
- Polish (Programmers) keyboard – Polish (Poland)
- United States-International keyboard – Dutch (Netherlands)
- Turkish Q keyboard – Turkish (Turkey)
- India keyboard – English (India)

## Supported languages

Here are the languages that UI flows supports, in addition to English:

|||||
----|-----|-----|--------
Basque	| French	| Latvian	| Slovak
Bulgarian	|	Galician	|	Lithuanian	|	Slovenian
Catalan	|	German		|Malay	|	Spanish
Chinese (Simplified)	|	Greek	|	Norwegian	|	Swedish
Chinese (Traditional)	|	Hindi	|	Polish	|	Thai
Croatian	|	Hungarian	|	Portuguese (Brazil)	|	Turkish
Czech	|	Indonesian	|	Portuguese (Portugal)		|Ukrainian
Danish	|	Italian	|	Romanian	|	Vietnamese
Dutch		|Japanese	|	Russian	
Estonian 	|Kazakh	|	Serbian (Cyrillic, Serbia)	
Finnish		|Korean		|Serbian (Latin, Serbia)

## Uninstall UI flows

1. Open the **start** menu > **Settings** > **Apps**.
1. Search for **UI flows**, and then select it.
1. Select **Uninstall**.

## Learn more

- [Upgrade your UI flows](upgrade.md) from previous releases
- Learn to [create desktop UI flows](create-desktop.md).
- Learn to [create Web UI flows](create-web.md).
- Learn how to run [UI flows](run-ui-flow.md).
- Learn to [manage UI flows](manage.md).
- Learn more about the [on-premises gateway](../gateway-reference.md#use-a-gateway)
