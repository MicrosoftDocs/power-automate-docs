---
title: Learn to manage on-premises data gateways | Microsoft Docs
description: View and install an on-premises data gateway in Microsoft Flow
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/05/2018
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Manage an on-premises data gateway in Microsoft Flow

Install and manage an on-premises data gateway to securely integrate a variety of cloud-based apps with your on-premises data and apps through Microsoft Flow.

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

* The user name and password that you used to [sign up](sign-up-sign-in.md) for Microsoft Flow.
* Administrative permissions on a gateway.

  You have these permissions by default for each gateway that you install. Also, an administrator of another gateway can grant you these permissions for that gateway.
* A license that supports gateways. For more information, see the “Connectivity” section of the [pricing page](https://flow.microsoft.com/pricing/).

> [!NOTE]
> You can create a gateway and an on-premises connection only in your [default environment](environments-overview-maker.md).

## Install a gateway

1. Download the [gateway-installation wizard](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409).

1. Run the wizard and provide the same credentials with which you signed into Microsoft Flow.

    After you register and configure your gateway successfully, it shows up in the **Gateways** list in Microsoft Flow.

## View your gateways

In the upper-right corner of the [Microsoft Flow website](https://flow.microsoft.com), select the gear icon, and then select **Gateways**.

![Gateway under manage][1]

> [!NOTE]
> If you created or were given access to a gateway in PowerApps, that gateway appears in the **My gateways** list in Microsoft Flow.


## Cluster your gateways

You can create *high availability clusters of on-premises data gateway installations* to avoid single points of failure in accessing on-premises data resources. 

By default, Microsoft Flow uses the primary gateway in the cluster. If the primary gateway isn't available, the service switches to the next gateway in the cluster, and so on.

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
