---
title: Regions overview for Power Automate | Microsoft Docs
description: Overview with question and answer about regions in Power Automate
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
# FAQ for regions in Power Automate

This document provides a list of frequently asked questions about Power Automate.

## How do I find out where my flow is deployed?
Your flow is deployed in the [region](https://azure.microsoft.com/regions/) that hosts the [environment](environments-overview-admin.md). For example, if your environment is created in the Europe region, your flow is deployed in Europe data centers.

Administrators can identify the region if they sign in to the Power Automate [admin center](https://admin.flow.microsoft.com). The **Environments** tab lists all existing environments and their regions.

![view environments](media/regions-overview/environments-list.png)

## What regions are available?
* United States
* Europe
* Asia
* Australia
* India
* Japan
* Canada
* South America
* United Kingdom
* US Government (GCC)
* France

## What features are specific to a given region?
Environments can be created in different regions and are bound to that geographic location. When you create a flow in an environment, that flow is deployed in data centers in that geographic location. This applies to any items you create in that environment, including the common data model, flows, connections, gateways, apps, and custom connectors.

For optimal performance, create your environment in the region that's closest to your users. For example, if your users are in Europe, create your environments in the Europe region. If your users are in the United States, create your environments in the United States region.

## Region mappings for Power Automate and gateways

The region where the gateway is installed must map to your Power Automate region becasue we do not support cross geographic boundaries. 

Here's the mapping information:

Power Platform region|Gateway region
-----|-----
United States including Preview|Central US, East US 2, East US, North Central US, South Central US, West US 2, West Central US, West US
Asia|East Asia, Southeast Asia
Australia|Australia East, Australia Southeast
Canada|Canada Central, Canada East
Europe|North Europe, West Europe
France|France Central, France South
India|Central India, South India, West India
Japan|Japan East, Japan West
South America|Brazil South
United Kingdom|UK South, UK West

## Is Power Automate available in national clouds?
Yes. [Learn more](./us-govt.md).

## What outbound IP addresses are used in each region?
See [Limits and configuration](limits-and-config.md).

