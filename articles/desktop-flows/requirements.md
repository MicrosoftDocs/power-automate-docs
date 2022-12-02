---
title: Prerequisites and limitations
description: See the prerequisites and limitations of Power Automate for desktop.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/01/2022
ms.author: gtrantzas
ms.reviewer: pefelesk
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Prerequisites and limitations

> [!IMPORTANT]
>
> - From February 28th 2022, Selenium IDE will no longer be supported.
> - Since November 30th 2021, Windows recorder (V1) no longer works.
> - Migrate your flows created with Selenium IDE and Windows recorder (V1) to Power Automate for desktop or delete them.

This article presents all the prerequisites and limitations you should consider before installing and using Power Automate on your desktop.

## Prerequisites

- To [install Power Automate](install.md), a Windows account with administrator privileges is required.

  > [!IMPORTANT]
  > Microsoft Store installations don't require users to have admin rights to install.

- An account to sign in to Power Automate. To see what features are available for each account type, go to [Sign-in account comparison
](#sign-in-account-comparison).

- A device with the following hardware:

    > [!IMPORTANT]
    > The hardware requirements don't include the resources required for the applications involved in the desktop flows.

  Minimum hardware:
  - Processor: 1.00 GHz or faster with two or more cores. For unattended mode, four or more cores are needed.
  - Storage: 1 GB
  - RAM: 2 GB

  Recommended hardware:
  - Processor: 1.60 GHz or faster with two or more cores. For unattended mode, four or more cores are needed.
  - Storage: 2 GB
  - RAM: 4 GB
  - GPU acceleration
  - .NET Framework 4.7.2 or later

- A device that runs Windows 10 (Home, Pro, Enterprise), Windows 11 (Home, Pro, Enterprise), Windows Server 2016, Windows Server 2019 or Windows Server 2022. Devices with ARM processors aren't supported.

    If your device runs Windows 10 Home or Windows 11 Home, you can use Power Automate to create desktop flows and monitor them on the [portal](https://powerautomate.com). However, you can't trigger desktop flows from the cloud and run other types of desktop flows (Windows recorder V1 and Selenium IDE).
  
    | Activity |  Description |Windows Home |  Windows Enterprise / Pro / Server  |
    |---------|------|----------|-----------|
    | Authoring | Create with Power Automate for desktop |  Yes |  Yes  |
    | Authoring | Create with Selenium IDE |  No |  Yes  |
    | Runtime | Local runtime (Attended) |  Yes |  Yes  |
    | Runtime | Cloud runtime (Attended / Unattended) |  No |  Yes  |
    | Monitoring | Manage desktop flows |  Yes |  Yes  |
    | Monitoring | View run logs |  Yes |  Yes  |

- Access as described in [IP Address configuration](../ip-address-configuration.md)

- TLS 1.2 is required for accessing the required services

- An installed browser: Microsoft Edge (version 80 or later), Google Chrome, or Mozilla Firefox

- An [environment](/power-platform/admin/environments-overview) with a [Microsoft Dataverse database](/power-platform/admin/create-database). (Applicable only for work or school accounts)

- A supported keyboard attached

- An active connection to the Internet

## Supported languages

Power Automate for desktop uses the display language selected on your Windows OS. To find more information about Windows language settings, go [Manage display language settings in Windows](https://support.microsoft.com/windows/manage-display-language-settings-in-windows-10-219f28b0-9881-cd4c-75ca-dba919c52321).

The following list shows all the languages that Power Automate for desktop supports, in addition to English:

A - E|F - J|K - Q|R - T|U - Z
----|-----|-----|-----|-----
Basque | Finnish | Kazakh | Romanian | Ukrainian
Bulgarian | French | Korean | Russian | Vietnamese
Catalan | Galician | Latvian | Serbian (Cyrillic, Serbia)
Chinese (Simplified) | German | Lithuanian | Serbian (Latin, Serbia)
Chinese (Traditional) | Greek | Malay | Slovak
Croatian | Hindi | Norwegian | Slovenian
Czech | Hungarian | Polish | Spanish
Danish | Indonesian | Portuguese (Brazil) | Swedish
Dutch | Italian | Portuguese (Portugal) | Thai
Estonian | Japanese |  | Turkish |

## Sign-in account comparison

Below you can see what features are available for different account types. You can find more information regarding accounts in the [Power Platform license guide](https://aka.ms/Ignite21-Licensing).

||Microsoft account|Work or school account|Organization premium account|
|-----|-----|-----|-----|
|**Storage**|OneDrive Personal account|Dataverse of Default Environment|Dataverse across environments|
|**Accessible recorder**: Add different actions and record desktop apps and web apps in a single desktop flow.|Yes|Yes|Yes|
|**Easy to use designer**: Use the drag-and-drop visual designer to organize your flow logically, while utilizing desktop and web recorders to capture core logic of your automation within a single desktop flow.|Yes|Yes|Yes|
|**Robust browser support**: Use intelligent data extraction across all major web browsers (Microsoft Edge, Internet Explorer, Google Chrome, Mozilla Firefox)|Yes|Yes|Yes|
|**Pre-built actions**: Apply a diverse set of 400+ pre-built actions that connect to many different systems.|Yes|Yes|Yes|
|**Access to new actions**: Automate more non-API systems with new support for SAP, legacy terminals such as mainframes and AS/400, Java apps, Citrix, etc.|Yes|Yes|Yes|
|**Exception handling**: Take advantage of exception handling to enable automation of complex cases that require validation (via action and scripts) and proactively manage flow settings to ensure a flow is completed without the need for human interaction.|Yes|Yes|Yes|
|**Connectivity** with cloud flows (triggering/scheduling flows)|No|No|Yes|
|**Dataverse storage**: Save new desktop flows built with Power Automate centrally in Dataverse, benefiting from Environment isolation and role-based access.|No|No|Yes|
|**Sharing and Collaboration**: Share flows between team members and select access level such as co-development or run-only.|No|No|Yes|
|**Centralized management and reporting**: New flows and any execution logs are automatically saved to Power Automate service to provide centralized management and reporting.|No|No|Yes|
|**Additional capabilities** such as AI Builder, integration with cloud flows, use of over 400+ premium and custom connectors, unattended RPA (with unattended addon) and much more.|No|No|Yes|

## Known issues and limitations

- Only work or school account users with Dataverse database provisioned in their default environment can create Power Automate desktop flows. Power Automate desktop flows will be stored in the default environment with the Dataverse database.

    If the Dataverse database doesn't exist in the default environment, the user won't be able to create desktop flows and be prompted to create a database. There will be no connectivity of Power Automate desktop flows with cloud flows.  

    After users create the Dataverse in the Power platform admin center, they might get prompted to create it again. In this scenario, exit Power Automate for desktop from the system tray icon to restart it.

- If users have signed in with trial or paid accounts and want to connect their free Microsoft accounts, they have to use Power Automate for desktop version 2.6.48.21069 or above. Otherwise, they'll encounter the following error.  

    :::image type="content" source="media\known-issues\pad-sign-in.png" alt-text="Screenshot of the prompted sign-in dialog with the respective error.":::

- Power Automate applies the proxy configuration specified in Windows proxy settings. If the proxy server requires authentication, the administrator has to exclude Power Automate from using it or use another server that doesn't require authentication. You can find more information regarding bypassing proxy servers in [Configure Power Automate to bypass a corporate proxy server](governance.md#configure-power-automate-for-desktop-to-bypass-a-corporate-proxy-server).

- The number of actions that can be logged in a single desktop flow run is limited to 10,000. Extra actions will be performed but won't be logged.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
