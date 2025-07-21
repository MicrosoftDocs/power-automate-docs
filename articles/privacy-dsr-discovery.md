---
title: Respond to personal data discovery requests (Microsoft Entra ID)
description: Learn about the resources available in Power Automate to help you meet your obligations to discover customers' personal data under various privacy laws and regulations for users who authenticate using Microsoft Entra ID.
suite: flow
documentationcenter: na
author: v-aangie
ms.author: angieandrews
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/16/2025
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---

# Respond to personal data discovery requests (Microsoft Entra ID)

The first step in responding to personal data requests is to find personal data that's subject to the request. This step helps you to determine whether a request meets your organization's requirements for honoring or declining the request.

## Step 1: Find personal data for the user in Power Automate
The following table summarizes the Power Automate resources that may contain the personal data of a user who authenticates using Microsoft Entra ID.

| **Resource** | **Purpose** |
| ----- | ----- |
| System-generated logs | Records that capture system events and history. |
| Run history | The history of each flow execution for the past 28 days, including the start time, end time, status, and all inputs and outputs. [Learn more](https://flow.microsoft.com/blog/download-history-recurrence/). |
| Activity feed | Recaps flow activities, including run status, failures, and notifications. |
| User jobs | Not visible to the user; system jobs that run on behalf of a user for flows to execute. |
| Cloud flows | The workflow logic that exists for a cloud flow. [Learn more](./get-started-logic-flow.md). |
| Desktop flows | The workflow logic for a desktop flow. [Learn more](./desktop-flows/introduction.md). |
| Flow permissions | Permissions that allow other users to share a flow. [Learn more](./frequently-asked-questions.yml#can-i-share-the-flows-i-create-). |
| User details | Not visible to the user; details that support flow execution. |
| Connections | Used by connectors to share data with APIs, systems, databases, etc. [Learn more](./add-manage-connections.md). |
| Connection permissions | Permissions for connections. [Learn more](./add-manage-connections.md). |
| Custom connectors | Custom connectors that a user has created and published that allow connections to custom or third-party systems. [Learn more](/connectors/custom-connectors/) |
| Custom connector permissions | Permissions for custom connectors. [Learn more](/connectors/custom-connectors/share). |
| Machine and machine groups | Machines registered with Power Automate for Desktop. [Learn more](./desktop-flows/manage-machine-groups.md). |
| Hosted machines | Windows 365 machines created in Power Automate. [Learn more](./desktop-flows/hosted-machines.md). |
| Gateway | Gateways are on-premises data services that users can install to transfer data quickly and securely between Power Automate and a data source that isn't in the cloud. [Learn more](./gateway-manage.md). |
| Gateway permissions | Permissions for gateways. [Learn more](/powerapps/maker/canvas-apps/share-app-resources). |
| Process mining processes | Processes analyzed with the Process Mining capability in Power Automate. [Learn more](./process-mining-overview.md). |

## Step 2: Find personal data for the user in other Power Platform services

Personal data subject to the request might be present in Power Platform services if the user has interacted with other Power Platform features. For guidance on how to discover personal data stored in the Power Apps service, Microsoft Copilot Studio service or Dataverse, go to [About privacy](/power-platform/admin/about-privacy).

## Step 3: Find personal data for the user in the Microsoft 365 admin center

Some feedback mechanisms in Power Automate are integrated with the Microsoft 365 admin center.

For guidance on how to discover feedback data stored by the Microsoft 365 admin center, go to [How can I see my user's feedback?](/microsoft-365/admin/misc/feedback-user-control?view=o365-worldwide#how-can-i-see-my-users-feedback&preserve-view=true).

[!INCLUDE [footer-include](includes/footer-banner.md)]
