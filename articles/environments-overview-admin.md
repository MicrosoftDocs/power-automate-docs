---
title: Administer environments and Power Automate resources
description: Learn how to use, create, and manage environments in Power Automate.
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 05/26/2023
ms.author: cgarty
ms.reviewer: angieandrews
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

### Power Platform admin center (PPAC)
The Power Platform admin center, or PPAC, ([https://aka.ms/ppac](https://aka.ms/ppac)) provides an interactive experience for performing administrative tasks within Power Platform.

### PowerShell cmdlets 
PowerShell cmdlets provide a way to automate administrative tasks using PowerShell. These cmdlets can be used in a sequence to automate multistep administrative actions. [Power Automate commands](/power-platform/admin/powerapps-powershell#power-automate-commands) provide a way to view and modify environments, flows, and data related to Power Automate.

### Management and Admin connectors  
Power Automate Management and Admin connectors provide the ability to use flows to manage and monitor Power Automate and the rest of Power Platform.

- **Power Automate Management connector** is designed to help with administrative management and monitoring ([Power Automate Management](/connectors/flowmanagement/)).
- **Microsoft Flow for Admins** allows you to complete typical admin actions, such as disabling a flow and deleting a flow ([Power Automate for Admins](/connectors/microsoftflowforadmins/)).
- **Power Apps for Admins connector** can be used to set permissions on Power Apps or set permissions to a certain connector being used by this app ([Power Apps for Admins](/connectors/powerappsforadmins/)).
- **PowerApps for App Makers** can be used by the makers themselves. Some actions are an overlay to administrational tasks, such as settings permissions to an app as mentioned previously ([Power Apps for Makers](/connectors/powerappsforappmakers/)).
- **Power Platform for Admins** can be used to perform tasks against platform components, such as creating an environment, provisioning a Microsoft Dataverse database, or creating a DLP policy for a specific environment ([Power Platform for Admins](/connectors/powerplatformforadmins/)).

### COE Starter Kit
The [Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit) provides a template implementation using the Management and Admin connectors. It comes with a Power BI dashboard that can be leveraged to gain tenant-wide insights.

## Tips and tricks

### List Flows as Admin action deprecated in favor of List Flows as Admin (V2)
The [List flows as Admin action](/connectors/flowmanagement/#list-flows-as-admin-(deprecated)) on the [Power Automate Management connector](/connectors/flowmanagement/) has been deprecated in favor of the [List Flows as Admin (V2) action](/connectors/flowmanagement/#list-flows-as-admin-(v2)). The [List Flows as Admin (V2) action](/connectors/flowmanagement/#list-flows-as-admin-(v2)) can list all flows in an environment. It has higher performance, since it returns only the identifying information about the flow. To accomplish this performance increase, the flow definition and some other metadata aren't returned. If the flow definition or additional metadata is needed, then a subsequent call can be made to the [Get Flow as Admin action](/connectors/flowmanagement/#get-flow-as-admin). 
This community forum post contains more information, migration guidance, and a Q&A (question and answer) format: [Transition to List Flows as Admin V2 from deprecated List Flows as Admin action](https://powerusers.microsoft.com/t5/Using-Connectors/Transition-to-List-Flows-as-Admin-V2-from-deprecated-List-Flows/m-p/2213884)

[!INCLUDE[footer-include](includes/footer-banner.md)]
