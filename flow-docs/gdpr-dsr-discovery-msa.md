---
title: Microsoft Flow GDPR Data Subject Discovery Requests for Microsoft Accounts (MSA) | Microsoft Docs
description: Learn how to use Microsoft Flow to respond to GPDR Data Subject Discovery Requests for Microsoft Accounts.  
services: ''
suite: flow
documentationcenter: na
author: KentWeareMSFT
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 5/16/2018
ms.author: keweare

---
# Responding to GDPR Data Subject Discovery Requests for Microsoft Flow - Microsoft Accounts (MSA)

The first step in responding to a DSR is finding personal data that is the subject of the request.
Below is a summary of the types of Microsoft Flow resources that contain personal data for a specific Microsoft Account user.

|**Resources containing personal data**|**Purpose**|
|-----|-----|
|Run history|The history of each flow execution for the past 28 days. This data includes the start time, end time, status, and all input/output information for the flow. [Learn more](https://flow.microsoft.com/blog/download-history-recurrence/)|
|Activity feed| Provides a recap of flow activities, including run status, failures, and notifications.|
|Flows|The workflow logic that exists for a flow. [Learn more](https://docs.microsoft.com/flow/get-started-logic-flow)|
|Connections|Used by connectors and allow for connectivity to APIs, systems, databases, etc. [Learn more](https://docs.microsoft.com/flow/add-manage-connections)|

