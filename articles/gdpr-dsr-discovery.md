---
title: Power Automate GDPR Data Subject Requests Discovery | Microsoft Docs
description: Learn how to use Power Automate to respond to GPDR Data Subject Discovery Requests.
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/17/2018
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---
# Responding to GDPR Data Subject Discovery Requests for Power Automate


The first step in responding to a DSR is finding personal data that is the subject of the request. This first step helps you to determine whether a DSR meets your organization's requirements for honoring or declining a DSR request. For example, after finding and reviewing the personal data at issue, you may determine the request doesn’t meet your organization’s requirements because doing so may adversely affect the rights and freedoms of others.

Below is a summary of the types of Power Automate resources that contain personal data for a specific user.

|**Resources containing personal data**|**Purpose**|
|-----|-----|
|System-generated logs|Telemetry that captures system events and history.|
|Run history|The history of each flow execution for the past 28 days. This data includes the start time, end time, status, and all input/output information for the flow. [Learn more](https://flow.microsoft.com/blog/download-history-recurrence/)|
|Activity feed| Provides a recap of flow activities, including run status, failures, and notifications.|
|User jobs|Not seen to the user, system jobs that run on behalf of a user in order for flows to execute.|
|Flows|The workflow logic that exists for a cloud flow. [Learn more](/power-automate/get-started-logic-flow)|
|Flow permissions|Flows can be shared and re-assigned to other users. Permissions lists exist for all flows. [Learn more](/power-automate/frequently-asked-questions#can-i-share-the-flows-i-create)|
|User details|Details, which are not seen by user, that support flow execution.|
|Connections|Used by connectors and allow for connectivity to APIs, systems, databases, etc. [Learn more](/power-automate/add-manage-connections)|
|Connection permissions|Permissions for a specific connection. [Learn more](/power-automate/add-manage-connections)|
|Custom connectors|Custom connectors that a user has created and published that allows for connectivity to custom or third-party systems. [Learn more](/connectors/custom-connectors/)|
|Custom connector permissions|Permission lists for Custom connectors. [Learn more](/connectors/custom-connectors/share)|
|Gateway|Gateways are on-premises data services that can be installed by a user to transfer data quickly and securely between Power Automate and a data source that isn’t in the cloud. [Learn more](/power-automate/gateway-manage)|
|Gateway permissions|Gateways can be shared with users within an organization. [Learn more](/powerapps/maker/canvas-apps/share-app-resources)|


[!INCLUDE[footer-include](includes/footer-banner.md)]