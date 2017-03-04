<properties
    pageTitle="Learn to manage on-premises data gateways | Microsoft Flow"
    description="View and install an on-premises data gateway in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="sunaysv"
    manager="erikre"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="02/15/2017"
   ms.author="sunayv"/>

# Manage an on-premises data gateway #
Install and manage an on-premises data gateway to securely integrate a variety of cloud-based apps with your on-premises data and applications through Microsoft Flow.

**Prerequisites**

- The user name and password that you used to [sign up](sign-up-sign-in.md) for Microsoft Flow.
- Administrative permissions on a gateway. (You have these permissions by default for each gateway that you install, and an administrator of another gateway can grant you these permissions for that gateway.)
- A license that supports gateways. For more information, see the “Connectivity” section of the [pricing page](https://flow.microsoft.com/pricing/).
- Gateways and on-premises connections can only be created and used in the user's [default environment](environments-overview-maker.md).

## View accessible gateways
In the top right side of [the Microsoft Flow portal](https://flow.microsoft.com), click or tap the settings menu item, and then click or tap **Gateways**.

![Gateway under manage][1]

**Note**: If you've been granted access to a gateway in PowerApps, that gateway will also show up in the **My gateways** list in Microsoft Flow.

## Install a gateway

>[AZURE.IMPORTANT] Microsoft SharePoint data gateways only support HTTP traffic; they do not support HTTPS traffic.

To create a gateway, click or tap **Create gateway** in the upper-right corner of the **My gateways** page (or [download the installer](http://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409) directly). This downloads the GatewayInstall.exe installation wizard package. Execute the installation wizard, providing all required information. After you register and configure your gateway successfully, it shows up in the **My gateways** list in Microsoft Flow.

**Note**: Be sure to use the same credentials to register your gateway as you use to sign in to Microsoft Flow.

![Gateway installation][2]

For details about how to install and configure a gateway, see [Understand gateways](gateway-reference.md).

<!-- Image references -->
[1]: ./media/manage-gateway/view-gateways.png
[2]: ./media/manage-gateway/list-gateways.png
