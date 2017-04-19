<properties
    pageTitle="Learn to manage on-premises data gateways | Microsoft Flow"
    description="View and install an on-premises data gateway in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="02/15/2017"
   ms.author="deonhe"/>

# Manage an on-premises data gateway in Microsoft Flow #

Install and manage an on-premises data gateway to securely integrate a variety of cloud-based apps with your on-premises data and apps through Microsoft Flow.

With a gateway, you can connect to on-premises data over these connections:

- SharePoint
- SQL Server
- Oracle
- Informix
- Filesystem
- DB2

>[AZURE.IMPORTANT] Microsoft SharePoint data gateways support HTTP traffic, but not HTTPS traffic.

## Prerequisites ##

- The user name and password that you used to [sign up](sign-up-sign-in.md) for Microsoft Flow.
- Administrative permissions on a gateway.

  You have these permissions by default for each gateway that you install, and an administrator of another gateway can grant you these permissions for that gateway.
- A license that supports gateways. For more information, see the “Connectivity” section of the [pricing page](https://flow.microsoft.com/pricing/).

- You can create a gateway and an on-premises connection only in your [default environment](environments-overview-maker.md).

## View your gateways ##

In the upper-right corner of the [Microsoft Flow website](https://flow.microsoft.com), click or tap the gear icon, and then click or tap **Gateways**.

![Gateway under manage][1]

**Note**: If you created or were given access to a gateway in PowerApps, that gateway appears in the **My gateways** list in Microsoft Flow.

## Install a gateway ##

1. Download the [gateway-installation wizard](http://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409).

	You can also download this wizard by clicking or tapping the gear icon in the upper-right corner of the [Microsoft Flow website](https://flow.microsoft.com), clicking or tapping **Gateways**, and then clicking or tapping **Create gateway**.

	![Gateway installation][2]

1. Run the wizard, providing the same credentials with which you signed into Microsoft Flow.

	After you register and configure your gateway successfully, it shows up in the **My gateways** list in Microsoft Flow.

For more information, see [Understand gateways](gateway-reference.md).

<!-- Image references -->
[1]: ./media/manage-gateway/view-gateways.png
[2]: ./media/manage-gateway/list-gateways.png
