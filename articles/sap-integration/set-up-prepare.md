---
title: Set up SAP integration with Power Platform (preview)
description: Learn about the requirements to configure SAP integration, and prepare your on-premises SAP infrastructure to connect with Power Platform.
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman88
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
  - administrator
  - stakeholder
  - flowmaker
---

# Set up SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

## Get started

Take the following steps to support a successful deployment of the public preview SAP Integration solution:

1. Join the Power Platform + SAP Public Preview Teams site to ask questions, get helpful guidance, and share feedback about your organization's experience setting up and using the SAP Integration solution.
1. Assemble a team with the following IT system administrators:
    1. Networking
    1. SAP BASIS
    1. Power Platform
1. Review the following with the team to make necessary preparations:
    1. SAP Integration prerequisites
    1. [Administer Power Platform](/power-platform/admin/admin-documentation)
1. Assign setup tasks to the appropriate IT system team members and track progress.
1. Once SAP Integration is set up, invite functional business users to work with SAP data via Power Apps and to provide feedback.

## Prerequisites

The assembled team of IT system administrators need to review the following prerequisites and make necessary preparations before connecting your organization's SAP ERP system to the Power Platform:

- [Power Apps license](/power-platform/admin/about-powerapps-perapp) and [Power Apps pricing](https://powerapps.microsoft.com/en-us/pricing/) - Determine if your organization has the necessary licensing to proceed with the setup. It is important to consider:
  - Power Apps licensure that supports using an on-premises data gateway and premium applications, flows, and connectors.
  - All administrators setting up the integration and functional business users testing the solution have the required licensure to do so.
- [SAP](http://www.sap.com/)ERP subscription - Make sure your organization has a current subscription and that the users testing the SAP Integration solution have appropriate access to the corresponding SAP modules.
- [Azure Active Directory](/azure/active-directory/develop/quickstart-create-new-tenant) - Create a new tenant for the SAP Integration.  It is important to consider:
  - The tenant has at least 1GB of database storage capacity available for the sandbox environment.
  - All members of the IT systems team have the necessary administrator roles to perform the setup.
  - All functional business users testing the SAP Integration are added to the tenant.
- [Windows Virtual Machine](/virtualization/hyper-v-on-windows/quick-start/quick-create-virtual-machine) - Provision a new Windows Virtual Machine to connect to the on-premises data gateway.
- [On-premises data gateway](/data-integration/gateway/service-gateway-install) - Set up the on-premises data gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
- [Azure AD Single Sign-On (SSO) for Gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) - Set up the new Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO.

## Integrate SAP ERP system with Power Platform

SAP integration with the Power Platform requires IT system administrators to establish a connection and set up security and governance between the two systems. The initial setup includes the following steps:

1. Install the on-premises data gateway
1. Configure Azure Active Directory (AD) and SAP Single Sign-On (SSO)
1. Create and configure an environment in Power Platform admin center
1. Select environment configured for SAP Integration in Power Apps
1. Set up and manage connections in Power Apps
1. Download and import the SAP Integration solution

### Install on-premises data gateway

SAP integration with the Power Platform requires that an on-premises data gateway be set up.
To learn about installing on-premises data gateway, see [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

[Sign in to the Azure portal](http://www.portal.azure.com) to set up an on-premises data gateway.

While setting up the on-premises data gateway for SAP integration, ensure that you review the following considerations:

- Provision a new Windows Virtual Machine that meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended).

    If you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.

- Change the gateway service account. More information [Change the on-premises data gateway service account](/data-integration/gateway/service-gateway-service-account)

### Configure Azure AD and SAP SSO

The Azure AD tenant created for SAP Integration must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO).

Refer to the following articles to learn about configuring Azure AD and SAP SSO:

- [Create and configure an Azure Active Directory Domain Services domain](/azure/active-directory-domain-services/tutorial-create-instance)  
- [SAP ERP Windows Authentication](/connectors/saperp/#authentication)
- [Overview of Kerberos](/data-integration/gateway/service-gateway-service-account)
- [Configure Kerberos-based SSO to on-premises data sources (SAP)](/power-bi/connect-data/service-gateway-sso-kerberos)

### Create and manage an environment

[Environments](/power-platform/admin/environments-overview) serve as containers to separate apps that might have different roles, security requirements, stages of deployment, or target audiences.

Sign in to the [Power Platform admin center](<https://admin.powerplatform.microsoft.com>). The admin center provides a unified portal for administrators to manage environments, connectors, gateways, data sources and other settings for Power Apps and Power Automate.

Follow the directions in [Create and manage an environment](/power-platform/admin/create-environment). While creating the environment for public preview SAP Integration, be sure to do the following:

1. Select **Sandbox** for environment type.
1. Select **Yes** to create a database for the environment.
1. Restrict environment access by selecting the newly created Azure AD tenant as the security group. This will ensure that only the resources in that tenant have access to the environment.

### Set up and manage connectors

[Connectors](/connectors/connectors) are proxies or wrappers around APIs that allow the underlying service to communicate with the Power Platform or Azure Logic Apps.

The following two connectors need to be set up to allow communication between SAP ERP and the Power Platform:

1. Microsoft Dataverse
1. SAP ERP connector

Sign in to [Power Apps](https://make.powerapps.com) and take the following steps to [create new connections](/power-apps/maker/canvas-apps/add-manage-connections#create-a-new-connection):

1. In the left navigation panel, expand **Data** and select **Connections**.
1. Select **New connection** in the command bar.
1. Go to **Search** in the command bar if you need to search for the connectors.
1. Select each connector as it appears and follow the prompts to set up the connections.

> [!Important]
>
> - After you import the solution into Power Apps, you will need to sign in to Power Automate to enter user- and system- connection reference details.

### Import prebuilt solution

The SAP Integration prebuilt solution contains apps, flows, and other components that work together to simplify the SAP ERP integration with the Power Platform.

Take the following steps to download and then import the solution:

1. Download
    1. Go to [Microsoft Download Center](<https://go.microsoft.com/fwlink/p/?linkid=2208156>).
    2. Click on **Developer Tools**.
    3. Select **SAP Integration**.
    4. Follow the instrucions on the page to download the solution to your computer.

1. Import
    1. Sign in to [Power Apps](<https://make.preview.powerapps.com>)
    1. [Import the solution](/power-apps/maker/data-platform/import-update-export-solutions) into Power Apps.

## Next steps

[Configure complex APIs with new function detail screen (preview)](action-screen.md)

### See also

- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
