---
title: Environment overview for Administrators | Microsoft Docs
description: Using, creating, and managing environments in Power Automate
services: ''
suite: flow
documentationcenter: na
author: msftman
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/14/2020
ms.author: deonhe
ms.reviewer: gtrantzas
search.audienceType: 
  - admin
---
# Administer environments and Power Automate resources

## Administer environments
An *environment* is a space to store, manage, and share your organization's business data, apps, and flows. It also serves as a container to separate apps that might have different roles, security requirements, or target audiences. How you choose to use environments depends on your organization and the apps you build. For example:

- You can choose to only build your apps in a single environment.
You might create separate environments that group the test and production versions of your apps.

- You might create separate environments that correspond to specific teams or departments in your company, each containing the relevant data and apps for each audience.

- You might also create separate environments for different global branches of your company.

You can create and manage environments using the [Power Platform admin center](https://aka.ms/ppac). 

Learn all about [environments](/power-platform/admin/environments-overview) in the Microsoft Power Platform admin guide.

## Tools
There are a number of tools available for administering environments and resources. 

### Power Platform Admin Center (PPAC)
The Power Platform Admin Center, or PPAC, ([https://aka.ms/ppac](https://aka.ms/ppac)) provides an interactive experience for performing administrative tasks within the Power Platform.

### PowerShell cmdlets 
PowerShell cmdlets provide a way to automate administrative tasks using PowerShell. These cmdlets can be used in a sequence to automate multistep administrative actions. [Power Automate commands](https://learn.microsoft.com/en-us/power-platform/admin/powerapps-powershell#power-automate-commands) provide a way to view and modify environments, flows, and data related to Power Automate.

### Management and Admin Connectors  
Power Automate Management and Admin Connectors provide the ability to use flows to manage and monitor Power Automate and the rest of the Power Platform.

- **Power Automate Management connector** is designed to help with administrative management and monitoring ([Power Automate Management](/connectors/flowmanagement/)).
- **Microsoft Flow for Admins** allows you to complete typical admin actions, such as disabling a flow and deleting a flow ([Power Automate for Admins](/connectors/microsoftflowforadmins/)).
- **Power Apps for Admins connector** can be used to set permissions on Power Apps or set permissions to a certain connector being used by this app ([Power Apps for Admins](/connectors/powerappsforadmins/)).
- **PowerApps for App Makers** can be used by the makers themselves, though some actions being an overlay to administrational tasks, such as settings permissions to an app as mentioned previously ([Power Apps for Makers](/connectors/powerappsforappmakers/)).
- **Power Platform for Admins** can be used to perform tasks against platform components, such as creating an environment or provisioning a Microsoft Dataverse database or creating a DLP policy for a specific environment ([Power Platform for Admins](/connectors/powerplatformforadmins/)).

### COE Starter Kit
The [Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit.md) provides a template implementation using the Management and Admin connectors, and comes with a Power BI dashboard that can be leveraged to gain tenant-wide insights.

## Tips and tricks

### List Flows as Admin action deprecated in favor of List Flows as Admin (V2)
The [List flows as Admin action](/connectors/flowmanagement/#list-flows-as-admin-(deprecated)) on the [Power Automate Management connector](/connectors/flowmanagement/) has been deprecated in favor of the [List Flows as Admin (V2) action](/connectors/flowmanagement/#list-flows-as-admin-(v2)). The [List Flows as Admin (V2) action](/connectors/flowmanagement/#list-flows-as-admin-(v2)) action can list all flows in an environment and has higher performance since it returns only the identifying information about the flow. To accomplish this performance increase, the flow definition and some other metadata is not returned. If the flow definition or additional metadata is needed, then a subsequent call can be made to the [Get Flows as Admin action](/connectors/flowmanagement/#get-flow-as-admin).

[!INCLUDE[footer-include](includes/footer-banner.md)]
