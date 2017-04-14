<properties
    pageTitle="Regions overview for Microsoft Flow | Microsoft Flow"
    description="Overview with question and answer about regions in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="MSFTMan"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="02/16/2017"
   ms.author="deonhe"/>

# FAQ for regions in Microsoft Flow #

## How do I find out where my flow is deployed? ##
Your flow is deployed in the region that hosts the environment. For example, if your environment is created in the Europe region, your flow is deployed in Europe data centers.

Administrators can identify the region by if they sign in to the Microsoft Flow [admin center](https://admin.flow.com). The **Environments** tab lists all existing environments and the regions where your flows are deployed.

![](media/regions-overview/environments-list.png)

## What regions are available? ##
- United States
- Europe
- Asia
- Australia
- India
- Japan

## What features are specific to a given region? ##
Environments can be created in different regions and are bound to that geographic location. When you create a flow in an environment, that flow is deployed in data centers in that geographic location. This applies to any items you create in that environment, including the common data model, flows, connections, gateways, apps, and custom APIs.

For optimal performance, if your users are in Europe, create and use the environment in the Europe region. If your users are in the United States, create and use the environment in the U.S. region.

**Gateways**:
- Not available in the India region.
- Supported in the default environment only, not in custom environments.

## Is Microsoft Flow available in national clouds?

No, Microsoft Flow is not currently available in the US Gov, Germany or China regions. Availability for national clouds is planned for 2017.

## What outbound IP addresses are used in each region?

See [Limits and configuration](limits-and-config.md).
