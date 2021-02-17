---
title: Learn to manage on-premises data gateways | Microsoft Docs
description: View and install an on-premises data gateway in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/13/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage an on-premises data gateway in Power Automate


Install and manage an on-premises data gateway to securely integrate a variety of cloud-based apps with your on-premises data and apps through Power Automate.

With a gateway, you can connect to on-premises data over these connections:

* Apache Impala
* Custom connectors that you create
* DB2
* File System
* Http with Azure AD
* Informix
* MySQL
* Oracle Database
* PostgreSQL
* SharePoint
* SQL Server
* Teradata (Preview)

> [!IMPORTANT]
> Microsoft SharePoint data gateways now support both HTTP and HTTPS traffic.

## Prerequisites

* The user name and password that you used to [sign up](sign-up-sign-in.md) for Power Automate.
* Administrative permissions on a gateway.

  You have these permissions by default for each gateway that you install. Also, an administrator of another gateway can grant you these permissions for that gateway.
* A license that supports gateways. For more information, see the “Connectivity” section of the [pricing page](https://flow.microsoft.com/pricing/).

> [!TIP]
> You can create a gateway and an on-premises connection for [any environment](environments-overview-maker.md).

## Install a gateway

To install a gateway, follow the steps in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install). Install the gateway in standard mode because the _on-premises data gateway (personal mode)_ is available only for Power BI.

## View your gateways

Sign in to [Power Automate](https://flow.microsoft.com), and then select **Data** > **Gateways** in the navigation pane on the left side.

> [!NOTE]
> If you created or were given access to a gateway in Power Apps, that gateway appears in the **My gateways** list in Power Automate.

## Cluster your gateways

You can create [high availability clusters of on-premises data gateway installations](/data-integration/gateway/service-gateway-high-availability-clusters) to avoid single points of failure in accessing on-premises data resources.

By default, Power Automate uses the primary gateway in the cluster. If the primary gateway isn't available, the service switches to the next gateway in the cluster, and so on.

Once you've set up a gateway cluster, you can allow traffic to be distributed across all gateways in the cluster.

Follow these steps to distribute your traffic across your gateways:

1. Select **Data** on the navigation bar on the left side.
1. Select **Gateways**.
1. Select any of your gateways.
1. Select **Distribute requests across all active gateways in this cluster**.
1. Select **Apply** to save your changes.

For more information, see [Understand gateways](gateway-reference.md).

<!-- Image references -->
[1]: ./media/manage-gateway/view-gateways.png


[!INCLUDE[footer-include](includes/footer-banner.md)]