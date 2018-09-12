---
title: Regions overview for Microsoft Flow | Microsoft Docs
description: Overview with question and answer about regions in Microsoft Flow
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/28/2017
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# FAQ for regions in Microsoft Flow
This document provides a list of frequently asked questions about Microsoft Flow.

## How do I find out where my flow is deployed?
Your flow is deployed in the [region](https://azure.microsoft.com/regions/) that hosts the [environment](environments-overview-admin.md). For example, if your environment is created in the Europe region, your flow is deployed in Europe data centers.

Administrators can identify the region if they sign in to the Microsoft Flow [admin center](https://admin.flow.microsoft.com). The **Environments** tab lists all existing environments and their regions.

![view environments](media/regions-overview/environments-list.png)

## What regions are available?
* United States
* Europe
* Asia
* Australia
* India
* Japan
* Canada

## What features are specific to a given region?
Environments can be created in different regions and are bound to that geographic location. When you create a flow in an environment, that flow is deployed in data centers in that geographic location. This applies to any items you create in that environment, including the common data model, flows, connections, gateways, apps, and custom connectors.

For optimal performance, create your environment in the region that's closest to your users. For example, if your users are in Europe, create your environments in the Europe region. If your users are in the United States, create your environments in the United States region.

## Gateways
Gateways are:

* Not available in the India region.
* Supported in the default environment only, not in custom environments.

## Is Microsoft Flow available in national clouds?
No, Microsoft Flow isn't available in national clouds. Support for national clouds is planned for 2018.

## What outbound IP addresses are used in each region?
See [Limits and configuration](limits-and-config.md).

