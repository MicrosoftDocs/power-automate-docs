---
title: Microsoft Flow GDPR Data Subject Requests Discovery | Microsoft Docs
description: Learn how to use Microsoft Flow to respond to GPDR Data Subject Requests.  
services: ''
suite: flow
documentationcenter: na
author: keweare
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/17/2018
ms.author: keweare

---
# Responding to GDPR Data Subject Requests for Microsoft Flow

## Introduction
The first step in responding to a DSR is finding personal data that is the subject of the request. This first step, will help you determine whether a DSR meets your organization's requirements for honoring or declining a DSR request. For example, after finding and reviewing the personal data at issue, you may determine the request doesn’t meet your organization’s requirements because doing so may adversely affect the rights and freedoms of others. 

Below is a summary of the types of Microsoft Flow resources that contain personal data for a specific user. 

|**Customer data**|**Purpose**|
|-----|-----|
|System-generated logs|Telemetry that captures system events and history.|
|Run history|The history of each flow execution for the past 28 days. This data includes the start time, end time, status and all input/output information for the flow. [Learn more](https://flow.microsoft.com/en-us/blog/download-history-recurrence/)|
|Activity feed| Provides a recap of flow activities, including run status, failures, and notifications.|
|User jobs|Not seen to the user, system jobs that run on behalf of a user in order for flows to execute.|
|Flows|The workflow logic that exists for a flow. [Learn more](https://docs.microsoft.com/en-us/flow/get-started-logic-flow)|
|Flow permissions|Flows can be shared and re-assigned to other users. Permissions lists exist for all flows [Learn more](https://docs.microsoft.com/en-us/flow/frequently-asked-questions#can-i-share-the-flows-i-create)|
|User details|Details, which is not seen by user, that support flow execution.|
|Connections|Used by connectors and allow for connectivity to APIs, systems, databases, etc. [Learn more](https://docs.microsoft.com/en-us/flow/add-manage-connections)|
|Connection permissions|Custom connectors can be shared with users within an organization. [Learn more](https://docs.microsoft.com/en-us/flow/add-manage-connections)|
|Custom connectors|Custom connectors that a user has created and published that allows for connectivity to custom or third-party systems. [Learn more](https://docs.microsoft.com/en-us/connectors/custom-connectors/)|
|Custom connector permissions|Permission lists for Custom connectors. [Learn more](https://docs.microsoft.com/en-us/connectors/custom-connectors/share)|
|Gateway|Gateways are on-premises data gateways that can be installed by a user to transfer data quickly and securely between PowerApps and a data source that isn’t in the cloud. [Learn more](https://docs.microsoft.com/en-us/flow/gateway-manage)|
|Gateway permissions|Gateways can be shared with users within an organization. [Learn more](https://go.microsoft.com/fwlink/?linkid=872249)|


