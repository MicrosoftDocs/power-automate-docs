---
title: Set up SAP integration with Power Platform (preview)
description: Learn about the requirements to configure SAP integration, and prepare your on-premises SAP infrastructure to connect with Power Platform.
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set up SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

## Get started

Take the following steps to support a successful deployment of the SAP Integration solution:

- Review the prerequisites and make necessary preparations
- Review [Administer Power Platform](/power-platform/admin/admin-documentation)
- Obtain access to the following IT system administrators:
  - Networking
  - SAP BASIS
  - Power Platform

## Prerequisites

Review the following and make necessary preparations before you connect your SAP ERP system to the Power Platform:

- [Power Apps license](/power-platform/admin/about-powerapps-perapp) and [Power Apps pricing](https://powerapps.microsoft.com/en-us/pricing/) - you'll need a Power Apps license that supports using an on-premises data gateway.
- [SAP](http://www.sap.com/) – You'll need a current SAP subscription.
- [Azure Active Directory tenant](/azure/active-directory/develop/quickstart-create-new-tenant) to register and manage your apps, configure their access to data in Microsoft applications and other web APIs enable features like Conditional Access in the Azure Active Directory (AD) tenant.
- [On-premises data gateway](/data-integration/gateway/service-gateway-install) that enables you to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
- [Azure AD Single Sign-On (SSO) for Gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) with Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO.

## Integrate SAP ERP system with Power Platform

SAP integration with the Power Platform requires IT system administrators to establish a connection and set up security and governance between the two systems. The initial setup includes the following steps:

1. Install the on-premises data gateway
1. Configure Azure Active Directory (AD) and SAP Single Sign-On (SSO)
1. Create and configure an environment in Power Platform admin center
1. Select environment configured for SAP Integration in Power Apps
1. Set up and manage connections in Power Apps
1. Download and import the SAP Integration solution


### Install on-premises data gateway

[Sign in to the Azure portal](http://www.portal.azure.com) to set up an on-premises data gateway. 

To learn about installing on-premises data gateway, see [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

While setting up on-premises data gateway for SAP integration, ensure that you review the following considerations:

- Provision a new Windows Virtual Machine that meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended).

    If you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.

- Change the gateway service account. More information [Change the on-premises data gateway service account](/data-integration/gateway/service-gateway-service-account)

### Configure Azure AD and SAP SSO

Your Azure AD tenant must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO).

Refer to the following articles to learn about configuring Azure AD and SAP SSO:

- [Create and configure an Azure Active Directory Domain Services domain](/azure/active-directory-domain-services/tutorial-create-instance)  
- [SAP ERP Windows Authentication](/connectors/saperp/#authentication)
- [Overview of Kerberos](/data-integration/gateway/service-gateway-service-account)
- [Configure Kerberos-based SSO to on-premises data sources (SAP)](/power-bi/connect-data/service-gateway-sso-kerberos)

### Create and manage environment

The [Power Platform admin center](<https://admin.powerplatform.microsoft.com/environments>) provides a unified portal for administrators to manage environments, connectors, gateways, data sources and other settings for Power Apps and Power Automate.

 [Environments](/power-platform/admin/environments-overview) serve as containers to separate apps that might have different roles, security requirements, stages of deployment, or target audiences.

[Create an environment](/power-platform/admin/create-environment) specifically for the SAP Integration in the Power Platform admin center.


### Set up and manage connectors

[Connectors](/connectors/connectors) are proxies or wrappers around APIs that allow the underlying service to communicate with the Power Platform or Azure Logic Apps.

[Sign in to Power Apps](https://make.powerapps.com)

The following two connectors need to be set up to allow communication between SAP ERP and the Power Platform:

1. Microsoft Dataverse
1. SAP ERP connector



### Import prebuilt solution

SAP integration for Power Platform includes a prebuilt solution containing apps, flows, and other components that work together. To download this solution, go to <https://go.microsoft.com>.

After downloading the solution, refer to [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions) to import the downloaded solution into your Power Platform environment.

## Next steps

[Configure action screens and verify the SAP integration (preview)](action-screen.md)

### See also

- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
