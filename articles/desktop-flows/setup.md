---
title: Power Automate for desktop prerequisites & limitations | Microsoft Docs
description: Power Automate prerequisites & limitations
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: ''
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: desktop-flow
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

# Power Automate for desktop prerequisites & limitations

## Prerequisites

- A Microsoft work or school account to sign into Power Automate
- An account with administrator privileges to sign in to your Windows device

- System requirements:

   - A device that runs Windows 10 Home, Windows 10 Pro, Windows 10 Enterprise, Windows Server 2016, or Windows Server 2019. ARM devices are not supported.
      
      - Minimum hardware
         - Storage: 1GB
	      - RAM: 2GB
     - Recommended hardware
        - Storage: 2GB
	     - RAM: 4GB
     - .NET Framework 4.7.2 or later 
> [!NOTE]
> The minimum requirements do not include the resources required for the applications involved in the flows.
     
> [!TIP]
> If your device runs Windows 10 Home, you can use Power Automate to create your desktop flows and monitor them on [Power Automate](https://powerautomate.com). You can't trigger desktop flows to run from the cloud on Windows 10 Home devices. Other types of desktop flows (Windows recorder V1 and Selenium IDE) are not supported.

| Activity |  Description |Windows Home |  Windows Enterprise / Pro / Server  | 
|---------|------|----------|-----------|
| Authoring | Create with Power Automate for desktop |  Yes |  Yes  | 
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

## Set the display language for Power Automate for desktop

The language used in Power Automate for desktop is the display language selected on your Windows OS. Get more details on how to [manage display language settings in Windows 10](https://support.microsoft.com/windows/manage-display-language-settings-in-windows-10-219f28b0-9881-cd4c-75ca-dba919c52321).

## Supported languages

Here are the languages that Power Automate for desktop supports, in addition to English:

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
|**Dataverse storage**: Save new desktop flows built with Power Automate centrally in Dataverse, benefiting from Environment isolation and role-based access.|No|No|Yes| 
|**Sharing and Collaboration**: Share flows between team members and select access level such as co-development or run-only.|No|No|Yes| 
|**Centralized management and reporting**: New flows and any execution logs are automatically saved to Power Automate service to provide centralized management and reporting.|No|No|Yes|
|**Additional capabilities** such as AI Builder, integration with cloud flows, use of over 400+ premium and custom connectors, unattended RPA (with unattended addon) and much more.|No|No|Yes| 

## Known issues and limitations

1. Only work or school account users with Dataverse database provisioned in their default environment can create Power Automate desktop flows. Power Automate desktop flows will be stored in the default environment with the Dataverse database. 

    If the Dataverse database doesn't exist in the default environment, the user will not be able to create desktop flows and be prompted to create a database. There will be no connectivity of Power Automate desktop flows with cloud flows.  

    - After creating the Dataverse in the Power platform admin center, intermittently user might get prompted to create the database again. In this scenario, restart Power Automate for desktop (exit from the system tray icon).

 

1. If users have signed in with trial or paid accounts and want to connect their free Microsoft accounts, they have to use Power Automate for desktop version 2.6.48.21069 or above. Otherwise, they'll encounter the following error.  

      ![The prompted sign-in dialog with the respective error.](media\known-issues\pad-sign-in.png)

1. Microsoft Account and Work account without a paid license are not supported in Sovereign clouds. GCC, GCCH, China sovereign clouds need paid license to sign-in to Power Automate and paid attended RPA license to use Power Automate for desktop.

1. Power Automate Desktop applies the proxy configuration specified in Windows proxy settings. If the proxy server requires authentication, the administrator has to exclude Power Automate Desktop from using it or use another server that doesn't require authentication. You can find more information regarding bypassing proxy servers in [Configure Power Automate Desktop to bypass a corporate proxy server](governance.md#configure-power-automate-desktop-to-bypass-a-corporate-proxy-server).


## Learn more

- Learn to [create Power Automate desktop flows](create-flow.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).



[!INCLUDE[footer-include](../includes/footer-banner.md)]
