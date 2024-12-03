---
title: Learn to manage on-premises data gateways | Microsoft Docs
description: View and install an on-premises data gateway in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/16/2024
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage an on-premises data gateway in Power Automate

Install and manage an on-premises data gateway to securely integrate a variety of cloud-based apps with your on-premises data and apps through Power Automate.

With a gateway, you can connect to on-premises data over the following connections.

* Apache Impala
* BizTalk Server
* Custom connectors that you create
* DB2
* File System
* Http with Microsoft Entra ID
* Informix
* MySQL
* Oracle Database
* PostgreSQL
* SAP ERP
* SharePoint
* SQL Server
* Teradata

> [!IMPORTANT]
> Microsoft SharePoint data gateways now support both HTTP and HTTPS traffic.

## Prerequisites

* The user name and password that you used to [sign up](sign-up-sign-in.md) for Power Automate.
* Administrative permissions on a gateway.

  You have these permissions by default for each gateway that you install. Also, an administrator of another gateway can grant you these permissions for that gateway.
* A license that supports gateways. For more information, see the “Connectivity” section of the [pricing page](https://make.powerautomate.com/pricing/).

> [!TIP]
> You can create a gateway and an on-premises connection for [any environment](environments-overview-maker.md).

## Install a gateway

To install a gateway, follow the steps in [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install). Install the gateway in standard mode because the _on-premises data gateway (personal mode)_ is available only for Power BI.

## View your gateways

Sign in to [Power Automate](https://make.powerautomate.com), and then select **Data** > **Gateways** in the navigation pane on the left side.

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
