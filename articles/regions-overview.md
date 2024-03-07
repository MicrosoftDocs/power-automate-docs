---
title: Regions overview for Power Automate | Microsoft Docs
description: Overview with question and answer about regions in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/18/2022
ms.author: hamenon
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Power Automate regions overview

In Power Automate, your flows are created within your Microsoft Power Platform environment. These environments are specific to a region, which corresponds to the location of the data centers where your Microsoft Power Platform environment is stored.

In other words, your flows are deployed in the [data center region](https://azure.microsoft.com/regions/) that hosts your Microsoft [Power Platform environment](environments-overview-admin.md).

## More information about Microsoft Power Platform regions

[Overview of Power Platform regions](/power-platform/admin/regions-overview)

[Azure geographies](https://azure.microsoft.com/global-infrastructure/geographies/)

## Region mappings for Power Automate and gateways

The region where the gateway is installed must map to your Power Automate region. Cross geographic boundaries aren't supported.

Here's the mapping information:

Power Platform region|Gateway region
-----|-----
Asia|East Asia, Southeast Asia
Australia|Australia East, Australia Southeast, Australia Central
Canada|Canada Central, Canada East
Europe|North Europe, West Europe
France|France Central, France South
Germany | Germany North, Germany West Central
India|Central India, South India, West India, North India
Japan|Japan East, Japan West
Korea | Korea South
Norway | Norway East, Norway West
Singapore | Southeast Asia, East Asia
South Africa | South Africa North
South America|Brazil South
Switzerland|Switzerland North, Switzerland West
United Arab Emirates | UAE Central, UAE North
United Kingdom|UK South, UK West, UK East
United States including Preview|Central US, East US, East US 2, East US 3, North Central US, South Central US, West US, West US 2, West US 3, West Central US

## Frequently asked questions

### What region should I use?

It's a good idea to create your flow in an environment that's in the region closest to your customers. When the data centers that host your environment are closer to the people accessing the information, you're likely to see better performance.

### How can I find out the region where my flow is deployed?

Administrators can identify the region by signing in to the Power Platform [admin center](https://admin.powerplatform.microsoft.com/). The **Environments** tab lists all existing environments and their regions.

### Is Power Automate available in national clouds?

Yes. [Learn more](./us-govt.md).

### What outbound IP addresses are used in each region?

See [Limits and configuration](limits-and-config.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
