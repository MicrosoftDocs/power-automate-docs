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
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/18/2023
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---

# Respond to personal data discovery requests (Microsoft Entra ID)

The first step in responding to personal data requests is to find personal data that's subject to the request. This step helps you to determine whether a request meets your organization's requirements for honoring or declining the request.

The following table summarizes the Power Automate resources that may contain the personal data of a user who authenticates using Microsoft Entra ID.

| **Resource** | **Purpose** |
| ----- | ----- |
| System-generated logs | Records that capture system events and history. |
| Run history | The history of each flow execution for the past 28 days, including the start time, end time, status, and all inputs and outputs. [Learn more](https://flow.microsoft.com/blog/download-history-recurrence/). |
| Activity feed | Recaps flow activities, including run status, failures, and notifications. |
| User jobs | Not visible to the user; system jobs that run on behalf of a user for flows to execute. |
| Flows | The workflow logic that exists for a cloud flow. [Learn more](./get-started-logic-flow.md). |
| Flow permissions | Permissions that allow other users to share a flow. [Learn more](./frequently-asked-questions.yml#can-i-share-the-flows-i-create-). |
| User details | Not visible to the user; details that support flow execution. |
| Connections | Used by connectors to share data with APIs, systems, databases, etc. [Learn more](./add-manage-connections.md). |
| Connection permissions | Permissions for connections. [Learn more](./add-manage-connections.md). |
| Custom connectors | Custom connectors that a user has created and published that allow connections to custom or third-party systems. [Learn more](/connectors/custom-connectors/) |
| Custom connector permissions | Permissions for custom connectors. [Learn more](/connectors/custom-connectors/share). |
| Gateway | Gateways are on-premises data services that users can install to transfer data quickly and securely between Power Automate and a data source that isn't in the cloud. [Learn more](./gateway-manage.md). |
| Gateway permissions | Permissions for gateways. [Learn more](/powerapps/maker/canvas-apps/share-app-resources). |

[!INCLUDE [footer-include](includes/footer-banner.md)]