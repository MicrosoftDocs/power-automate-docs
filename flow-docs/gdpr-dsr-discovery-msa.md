---
title: Microsoft Flow GDPR Data Subject Discovery Requests for Microsoft Accounts (MSA) | Microsoft Docs
description: Learn how to use Microsoft Flow to respond to GPDR Data Subject Discovery Requests for Microsoft Accounts.  
services: ''
suite: flow
documentationcenter: na
author: KentWeareMSFT
manager: KFile
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

The first step in responding to a DSR request is finding personal data that is the subject of the request.
Below is a summary of the Microsoft Flow resources that contain personal data for a who authenticates with a Microsoft Account (MSA).

|Resource|Purpose|
|-----|-----|
|Run history|The history of each flow execution for the past 28 days. This data includes start time, end time, status, and all input/output information for each flow run. Learn more about [flow run history](https://flow.microsoft.com/blog/download-history-recurrence/).|
|Activity feed| Provides a recap of flow activities, including run status, failures, and notifications.|
|Flows|The workflow logic for a [flow](https://docs.microsoft.com/flow/get-started-logic-flow).|
|Connections|Used by connectors and allow connectivity to APIs, systems, databases, and more. Learn more about [connections](add-manage-connections.md).|

