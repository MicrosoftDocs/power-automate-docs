---
title: Prepare and set up SAP integration with Power Platform (preview)
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

# Prepare and set up SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

Before you begin, ensure that you have the necessary environment setup to integrate SAP with Power Platform. The initial preparation for SAP integration includes the following steps:

1. Install the on-premises data gateway
1. Configure Azure Active Directory (AD) and SAP Single Sign-On (SSO)
1. Import prebuilt templates

## Prerequisites

You'll need the following before you begin with the SAP integration:

- [Azure Active Directory tenant](/azure/active-directory/develop/quickstart-create-new-tenant) to register and manage your apps, configure their access to data in Microsoft applications and other web APIs enable features like Conditional Access in the Azure Active Directory (AD) tenant.
- [Power Apps license](/power-platform/admin/about-powerapps-perapp). If you don't have a license, you can also sign up for [a Power Apps Developer Plan,](/power-apps/maker/developer-plan) or a [Power Apps trial](/power-apps/maker/signup-for-powerapps).
- [On-premises data gateway](/data-integration/gateway/service-gateway-install) that enables you to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
- [Azure AD Single Sign-On (SSO) for Gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) with Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO.
- [SAP](http://www.sap.com/) – You'll need a current SAP subscription. 

## Install on-premises data gateway

To learn about installing on-premises data gateway, see [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

While setting up on-premises data gateway for SAP integration, ensure that you review the following considerations:

- Provision a new Windows Virtual Machine that meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended).

    If you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.

- Change the gateway service account. More information [Change the on-premises data gateway service account](/data-integration/gateway/service-gateway-service-account)

## Configure Azure AD and SAP SSO

Your Azure AD tenant must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO).

Refer to the following articles to learn about configuring Azure AD and SAP SSO:

- [Create and configure an Azure Active Directory Domain Services domain](/azure/active-directory-domain-services/tutorial-create-instance)  
- [SAP ERP Windows Authentication](/connectors/saperp/#authentication)
- [Overview of Kerberos](/data-integration/gateway/service-gateway-service-account)
- [Configure Kerberos-based SSO to on-premises data sources (SAP)](/power-bi/connect-data/service-gateway-sso-kerberos)

## Import prebuilt solution

SAP integration for Power Platform includes prebuilt solution containing several apps and flows. To download this solution, go to https://go.microsoft.com.

After downloading the solution, refer to [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions) to import the downloaded solution into your Power Platform environment.

## Next steps

[Configure action screens and verify the SAP integration (preview)](action-screen.md)

### See also

- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
