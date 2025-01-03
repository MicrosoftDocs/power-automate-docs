---
title: Prerequisites and limitations
description: Learn about the prerequisites and limitations of Power Automate for desktop.
author: mattp123
ms.topic: overview
ms.date: 01/03/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
- jpapadimitriou
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---

# Prerequisites and limitations

This article presents all the prerequisites and limitations you should consider before installing and using Power Automate on your desktop.

## Prerequisites

- An account with administrator privileges to [install Power Automate](install.md) using the MSI installer
  - If you install it from the Microsoft Store, a standard Windows account is acceptable.

- An account to sign in to Power Automate
  - [Learn what features are available for each account type](#sign-in-account-comparison).

- A device with the following hardware (these requirements don't include the resources required for the applications involved in your desktop flows):

  > [!NOTE]
  > The following hardware requirements apply only to single-user sessions with Power Automate for desktop open.

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

- A device that runs Windows 10 (Home, Pro, Enterprise), Windows 11 (Home, Pro, Enterprise), Windows Server 2016, Windows Server 2019, or Windows Server 2022 (devices with ARM processors aren't supported)

    If your device runs Windows 10 Home or Windows 11 Home, you can use Power Automate to create desktop flows and monitor them on the [Power Automate portal](https://make.powerautomate.com). However, you can't trigger desktop flows from the cloud.
  
    | Activity | Description | Windows Home | Windows Enterprise/Pro/Server |
    |---------|------|----------|-----------|
    | Authoring | Create with Power Automate for desktop | Yes | Yes |
    | Runtime | Local runtime (attended) | Yes | Yes |
    | Runtime | Cloud runtime (attended/unattended) | No | Yes |
    | Monitoring | Manage desktop flows | Yes | Yes |
    | Monitoring | View run logs | Yes | Yes |

- Access as described in [IP Address configuration](../ip-address-configuration.md)

- TLS 1.2

- A browser: Microsoft Edge (version 80 or later), Google Chrome, or Mozilla Firefox

- An [environment](/power-platform/admin/environments-overview) with a [Microsoft Dataverse database](/power-platform/admin/create-database) (applicable only for work or school accounts)

- A supported keyboard attached

- An active connection to the Internet

### Prerequisites for multi-user session enabled Windows operating system (high density)

For high-density workloads on multi-session enabled Windows operation systems, each bot creates a separate user session. Therefore, the computer's hardware must support these concurrent Windows sessions. At a high level, we recommend the following configuration:

- **Basic requirements for the first user session**:
  - CPU: 4 cores
  - RAM: 4 GB
  - Storage: 2 GB
  
- **Per additional user session**:
  - CPU: 2 cores
  - RAM: 4 GB

> [!NOTE]
> - These recommendations can vary significantly based on background processes that are running, the type of workload being executed, and the specifications of the CPU cores. Hardware adjustments may be required depending on these factors.
> - You need a DSL-range internet (not LAN) bandwidth to function properly.

To monitor the performance of individual user sessions:

1. Open Task Manager.
1. Select the **Users** tab.
1. Review the RAM and CPU usage for each session.

## Considerations when setting up Power Automate for desktop using VM images

When setting up Power Automate for desktop in your organization, don't preinstall Power Automate for desktop as a part of a base VM image. This approach can lead to unexpected behavior due to the machine registration information that might still be retained in the cloned VM image.

Instead, install Power Automate for desktop individually on each machine after the imaging process. This method ensures that the installation is tailored to the specific environment.

For automated deployments, use deployment tools and scripts to install and configure Power Automate for desktop post-imaging. This method provides greater flexibility and control over the installation process, allowing for a more consistent and error-free deployment.

## Supported languages

Power Automate for desktop uses the display language selected in Windows. [Learn how to manage display language settings in Windows](https://support.microsoft.com/windows/manage-display-language-settings-in-windows-10-219f28b0-9881-cd4c-75ca-dba919c52321).

The following table shows all the languages that Power Automate for desktop supports in addition to English.

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

The following table describes what features are available for different account types. You can find more information regarding accounts in the [Power Platform license guide](https://aka.ms/Ignite21-Licensing).

||Microsoft account|Work or school account|Organization premium account|
|-----|-----|-----|-----|
|**Storage**|OneDrive Personal account|Dataverse of default environment|Dataverse across environments|
|**Accessible recorder**: Add different actions and record desktop apps and web apps in a single desktop flow.|Yes|Yes|Yes|
|**Easy-to-use designer**: Use the drag-and-drop visual designer to organize your flow logically, while using desktop and web recorders to capture core logic of your automation in a single desktop flow.|Yes|Yes|Yes|
|**Robust browser support**: Use intelligent data extraction across all major web browsers (Microsoft Edge, Internet Explorer, Google Chrome, Mozilla Firefox)|Yes|Yes|Yes|
|**Pre-built actions**: Apply a diverse set of 400+ prebuilt actions that connect to many different systems.|Yes|Yes|Yes|
|**Access to new actions**: Automate more non-API systems with new support for SAP, legacy terminals such as mainframes and AS/400, Java apps, Citrix, etc.|Yes|Yes|Yes|
|**Exception handling**: Take advantage of exception handling to enable automation of complex cases that require validation and proactively manage flow settings to ensure a flow is completed without the need for human interaction.|Yes|Yes|Yes|
|**Connectivity** with cloud flows (triggering/scheduling flows)|No|No|Yes|
|**Dataverse storage**: Save new desktop flows built with Power Automate centrally in Dataverse, benefiting from environment isolation and role-based access.|No|No|Yes|
|**Sharing and collaboration**: Share flows with team members and select access level such as codevelopment or run-only.|No|No|Yes|
|**Centralized management and reporting**: New flows and any execution logs are automatically saved to the Power Automate service to provide centralized management and reporting.|No|No|Yes|
|**Additional capabilities** such as AI Builder, integration with cloud flows, use of more than 400 premium and custom connectors, unattended RPA (with unattended add-on), and much more.|No|No|Yes|

## Known issues and limitations

- Desktop flows in v1 [schema](schema.md) environments can't exceed 100 MB in size. If a desktop flow exceeds the size limit, separate its logic into smaller desktop flows.
- Only work or school account users with a Dataverse database provisioned in their default environment can create Power Automate desktop flows. Power Automate desktop flows are stored in the default environment with the Dataverse database.

  If the Dataverse database doesn't exist in the default environment, the user isn't able to create desktop flows, and is prompted to create a database. There's no connectivity of Power Automate desktop flows with cloud flows.  

  After users create the Dataverse in the Power platform admin center, they might be prompted to create it again. In this scenario, exit Power Automate for desktop from the system tray icon and restart it.

- If users sign in with trial or paid accounts and want to connect their free Microsoft accounts, they must use Power Automate for desktop version 2.6.48.21069 or above. Otherwise, they encounter the following error:  

    :::image type="content" source="media\known-issues\pad-sign-in.png" alt-text="Screenshot of the sign-in window with error.":::

- Power Automate applies the proxy configuration specified in Windows proxy settings. If the proxy server requires authentication, the administrator must exclude Power Automate from using it or use another server that doesn't require authentication. Learn more about [configuring Power Automate to bypass a corporate proxy server](governance.md#configure-power-automate-for-desktop-to-bypass-a-corporate-proxy-server).

- The number of actions that can be logged in a single desktop flow run is limited to 10,000. Extra actions are performed but aren't logged.

- Power Automate for desktop is fully backwards compatible. However, forward compatibility isn't guaranteed. Each update might introduce action upgrades that change their signature (properties or values of an action) and/or a change in the engine powering runtime and authoring. Attempting to run or edit a desktop flow created with a newer version of Power Automate for desktop might result in the following error message:

"This flow has been generated by a newer Power Automate version than the one currently installed. Download and install the latest version of Power Automate and try again."

To resolve this issue, edit and run the flow with the version that was used to create or edit it, or use a newer version of Power Automate for desktop.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
