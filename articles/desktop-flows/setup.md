---
title: Power Automate for desktop prerequisites & limitations | Microsoft Docs
description: Power Automate for desktop prerequisites & limitations
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: ''
editor: ''
tags: ''

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


- System requirements:

   - A device that runs Windows 10 Home, Windows 10 Pro, Windows 10 Enterprise, Windows 11 Home, Windows 11 Pro, Windows 11 Enterprise, Windows Server 2016, Windows Server 2019 or Windows Server 2022. ARM devices aren't supported.
      
      - Minimum hardware
        - Processor: 1.00 GHz or faster with two or more cores. For unattended mode, four or more cores are needed.
        - Storage: 1 GB
	      - RAM: 2 GB

      - Recommended hardware
        - Processor: 1.60 GHz or faster with two or more cores. For unattended mode, four or more cores are needed.
        - Storage: 2 GB
        - RAM: 4 GB
	      - GPU acceleration
        - .NET Framework 4.7.2 or later 

> [!NOTE]
> - The system requirements do not include the resources required for the applications involved in the flows.
> - To install Power Automate, an account with administrator privileges to sign in to your Windows device is required.
     
> [!TIP]
> If your device runs Windows 10 Home or Windows 11 Home, you can use Power Automate to create your desktop flows and monitor them on [Power Automate](https://powerautomate.com). You can't trigger desktop flows to run from the cloud on Windows Home devices. Other types of desktop flows (Windows recorder V1 and Selenium IDE) aren't supported.

| Activity |  Description |Windows Home |  Windows Enterprise / Pro / Server  | 
|---------|------|----------|-----------|
| Authoring | Create with Power Automate for desktop |  Yes |  Yes  | 
| Authoring | Create with Selenium IDE |  No |  Yes  |
| Runtime | Local runtime (Attended) |  Yes |  Yes  |
| Runtime | Cloud runtime (Attended / Unattended) |  No |  Yes  |
| Monitoring | Manage desktop flows |  Yes |  Yes  |
| Monitoring | View run logs |  Yes |  Yes  |

- Access as described in the [IP Address configuration](../ip-address-configuration.md)

-  TLS 1.2 is required for accessing the required services

- The [Microsoft Edge](https://www.microsoft.com/edge/) (version 80 or later)
    or Google Chrome browser.

- An [environment](/power-platform/admin/environments-overview) with a [Microsoft Dataverse database](/power-platform/admin/create-database). (Applicable only for work or school accounts)

- A supported keyboard attached.

- An active connection to the Internet.

## Set the display language for Power Automate for desktop

The language used in Power Automate for desktop is the display language selected on your Windows OS. Get more details on how to [manage display language settings in Windows](https://support.microsoft.com/windows/manage-display-language-settings-in-windows-10-219f28b0-9881-cd4c-75ca-dba919c52321).

## Supported languages

Here are the languages that Power Automate for desktop supports, in addition to English:

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
Estonian | Japanese |  | Turkish


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

## Run Power Automate with elevated rights

While creating desktop flows, some actions may need to access resources with elevated rights, such as files and applications. To run these actions successfully, launch Power Automate as administrator:

> [!IMPORTANT]
> - To run desktop flows through the flow designer or the console to interact with an application running with elevated rights, launch Power Automate as an administrator. 
> - When a desktop flow is triggered by a cloud flow, the actions contained in the desktop flow that require elevated privileges won't have any effect. Therefore, Power Automate won't be able to access applications that run with elevated rights and their elements.

1. Before launching Power Automate, ensure that the application is closed and doesn't appear on the Windows system tray.

1. Right-click on the Power Automate icon and select **Run as administrator**. 

1. To confirm that Power Automate is launched with administrator rights, open the Windows Task Manager, navigate to the **Details** tab, and check that Power Automate runs with elevated privileges.

    ![Screenshot of the Power Automate processes in the Windows Task Manager.](media/run-as-administrator/task-manager.png)

## Known issues and limitations

1. Only work or school account users with Dataverse database provisioned in their default environment can create Power Automate desktop flows. Power Automate desktop flows will be stored in the default environment with the Dataverse database. 

    If the Dataverse database doesn't exist in the default environment, the user won't be able to create desktop flows and be prompted to create a database. There will be no connectivity of Power Automate desktop flows with cloud flows.  

    - After creating the Dataverse in the Power platform admin center, intermittently user might get prompted to create the database again. In this scenario, restart Power Automate for desktop (exit from the system tray icon).

 

1. If users have signed in with trial or paid accounts and want to connect their free Microsoft accounts, they have to use Power Automate for desktop version 2.6.48.21069 or above. Otherwise, they'll encounter the following error.  

      ![Screenshot of the prompted sign-in dialog with the respective error.](media\known-issues\pad-sign-in.png)


1. Power Automate applies the proxy configuration specified in Windows proxy settings. If the proxy server requires authentication, the administrator has to exclude Power Automate from using it or use another server that doesn't require authentication. You can find more information regarding bypassing proxy servers in [Configure Power Automate to bypass a corporate proxy server](governance.md#configure-power-automate-for-desktop-to-bypass-a-corporate-proxy-server).

1. The number of actions that can be logged in a single desktop flow run is limited to 10 000. Additional actions will be performed but won't be logged.


## Learn more

- Learn to [create Power Automate desktop flows](create-flow.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).



[!INCLUDE[footer-include](../includes/footer-banner.md)]
