---
title: Power Automate Desktop prerequisites & limitations | Microsoft Docs
description: Power Automate Desktop prerequisites & limitations
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: ''
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/02/2021
ms.author: marleon
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate Desktop prerequisites & limitations

## Prerequisites

- A work or school account to sign into your Windows device with administrator privileges and Power Automate.

- System requirements:

   - A device that runs Windows 10 Home, Windows 10 Pro, Windows 10 Enterprise, Windows Server 2016, or Windows Server 2019. ARM devices are not supported.
      
      - Minimum hardware
         - Storage: 1GB
	      - RAM: 2GB
     - Recommended hardware
        - Storage: 2GB
	     - RAM: 4GB
     - .NET Framework 4.7.2 or later 
     
> [!TIP]
> If your device runs Windows 10 Home, you can use Power Automate Desktop to create your desktop flows and monitor them on [Power Automate](https://powerautomate.com). You can't trigger desktop flows to run from the cloud on Windows 10 Home devices. Other types of desktop flows (Windows recorder V1 and Selenium IDE) are not supported.

| Activity |  Description |Windows Home |  Windows Enterprise / Pro / Server  | 
|---------|------|----------|-----------|
| Authoring | Create with Power Automate Desktop |  Yes |  Yes  | 
| Authoring | Create with Windows Recorder V1 |  No |  Yes  |
| Authoring | Create with Selenium IDE |  No |  Yes  |
| Runtime | Local runtime (Attended) |  Yes |  Yes  |
| Runtime | Cloud runtime (Attended / Unattended) |  No |  Yes  |
| Monitoring | Manage desktop flows |  Yes |  Yes  |
| Monitoring | View run logs |  Yes |  Yes  |

- Access as described in the [IP Address configuration](../ip-address-configuration.md)

- The [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later)
    or Google Chrome browser.

- An [environment](/power-platform/admin/environments-overview) with a [Microsoft Dataverse database](/power-platform/admin/create-database). (Applicable only for work or school accounts)

- A supported keyboard attached.

- An active connection to the Internet.

> [!IMPORTANT]
> You must have the latest versions of each component to record, test, or run desktop flows.

## Set the display language for Power Automate Desktop

The language used in the Power Automate Desktop is the display language selected on your Windows OS. Get more details on how to [manage display language settings in Windows 10](https://support.microsoft.com/windows/manage-display-language-settings-in-windows-10-219f28b0-9881-cd4c-75ca-dba919c52321).



ptional)

The Selenium IDE is an open source tool that lets you record and playback human interactions on Websites.

With desktop flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Dataverse.

Follow these steps to install Selenium IDE:

1. Make sure you already installed and enabled Windows recorder (v1) extension (see previous section)

1. [Download and install](https://go.microsoft.com/fwlink/?linkid=2107665) the Selenium IDE for [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later) or Google Chrome.

1. On Microsoft Edge (version 80 or later), select **Allow extensions from other stores**, and then select **Add to Chrome**.

## Supported languages

Here are the languages that desktop flows supports, in addition to English:

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

>[!NOTE]
>Power Automate Desktop is available only in English, French, German, Japanese, Spanish, Danish, Dutch, Finnish, Italian, Norwegian, Polish, Portuguese (Brazil), Chinese (Traditional), Chinese (Simplified), Swedish, and Turkish.

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



## Sign-in account comparison

Below you can find detailed comparison on what each user will have access to. You can find more information on the versions in the [Power Platform license guide](https://aka.ms/Ignite21-Licensing).

||Microsoft account|Work or school account|Organization premium account|
|-----|-----|-----|-----|
|**Storage**|OneDrive Personal account|Dataverse of Default Environment|Dataverse across environments|
|**Accessible recorder**: Add different actions and record desktop apps and web apps in a single desktop flow.|Yes|Yes|Yes|
|**Easy to use designer**: Use the drag-and-drop visual designer to organize your flow logically, while utilizing desktop and web recorders to capture core logic of your automation within a single desktop flow.|Yes|Yes|Yes|
|**Robust browser support**: Use intelligent data extraction across all major web browsers (Edge, Firefox, Internet Explorer, Chrome)|Yes|Yes|Yes|
|**Pre-built actions**: Leverage a diverse set of 400+ pre-built actions that connect to many different systems.|Yes|Yes|Yes|
|**Access to new actions**: Automate more non-API systems with new support for SAP, legacy terminals such as mainframes and AS/400, Java apps, Citrix, etc.|Yes|Yes|Yes|
|**Exception handling**: take advantage of exception handling to enable automation of complex cases that require validation (via action and scripts) and proactively manage flow settings to ensure a flow is completed without the need for human interaction.|Yes|Yes|Yes|
|**Connectivity** with cloud flows (triggering/scheduling flows)|No|No|Yes|
|**Dataverse storage**: Save new flows built with Power Automate Desktop centrally in Dataverse, benefiting from Environment isolation and role-based access.|No|No|Yes| 
|**Sharing and Collaboration**: Share flows between team members and select access level such as co-development or run-only.|No|No|Yes| 
|**Centralized management and reporting**: New flows and any execution logs are automatically saved to Power Automate Service to provide centralized management and reporting.|No|No|Yes|
|**Additional capabilities** such as AI Builder, integration with cloud flows, use of over 400+ premium and custom connectors, unattended RPA (with unattended addon) and much more.|No|No|Yes| 

## Known issues and limitations

1. Only work or school account users with Dataverse database provisioned in their default environment can create Power Automate Desktop flows. Power Automate Desktop flows will be stored in the default environment with the Dataverse database. If the Dataverse database doesn't exist in the default environment, the user will not be able to create Power Automate Desktop flows and be prompted to create a database. There will be no connectivity of Power Automate Desktop flows with cloud flows.  

    - After creating the Dataverse in the Power platform admin center, intermittently user might get prompted to create the database again. In this scenario, restart Power Automate Desktop (exit from the system tray icon).

    - Microsoft Dataverse provisioning in the default environment from Power Automate Desktop to create a flow will be supported in the upcoming release.  

1. If the customer already installed Power Automate Desktop and has paid attended RPA license or trial license and wants to try Free MSA, they have to download the latest Power Automate Desktop version with March release to sign-in using their Microsoft Account. Otherwise, they see the below error.  

      ![The prompted sign-in dialog with the respective error.](media\known-issues\pad-sign-in.png)

1. Microsoft Account and Work account without a paid license are not supported in Sovereign clouds. GCC, GCCH, China sovereign clouds need paid license to sign-in to Power Automate and paid attended RPA license to use Power Automate Desktop.    

1. Windows Recorder v1 desktop flows does not support
    -   Multiple monitors.
    -   Double click, mouse hover, touch/pen input.
    -   Interactions on Windows (File explorer, startup menu, task bar, etc.)

1. Selenium desktop flows do not support
    -   Right click.
    -   User session information (for example: cookies) will not be reused during
        playback. You will have to edit the script to embed sign in information when required by websites.

You'll find feature-specific limitations included in the documentation for each feature.

## Learn more

- Learn to [create Power Automate Desktop flows](create-flow.md).
- Learn to [create Windows recorder (v1) flows](create-desktop.md).
- Learn to [create Selenium IDE flows](create-web.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).
- Learn more about the [on-premises gateway](../gateway-reference.md#use-a-gateway).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
