---
title: Set up SAP integration with Power Platform (preview)
description: Learn about the requirements to configure SAP integration, and prepare your on-premises SAP infrastructure to connect with Power Platform.
author: EllenWehrle
ms.subservice: cloud-flow
ms.topic: article
ms.date: 10/28/2022
ms.author: ellenwehrle
ms.reviewer:
  - jongilman
  - dgalitsky
search.app: 
  - Flow
search.audienceType: 
  - administrator
  - stakeholder
  - flowmaker

---

# Set up SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

A successful SAP integration with Microsoft Power Platform requires coordination with your organization's IT administrators. With some planning, setup, and configuration, you'll be able to ensure that your SAP system can communicate with Power Platform.

## Prepare for SAP integration

Take the following steps to support a successful deployment of the preview SAP Integration solution:

1. Join the [Power Apps community forum](https://aka.ms/sap-powerusers-community). Ask questions, get helpful guidance, and share feedback about your organization's experience setting up and using the SAP Integration solution.

1. Assemble a team with the following IT system administrators:
    1. Network
    1. SAP BASIS
    1. Power Platform

1. Review the following with your team:
    1. SAP Integration requirements
    1. [Administer Power Platform](/power-platform/admin/admin-documentation)

1. Assign setup tasks to the appropriate IT system team members and track progress.

1. Invite functional business users to work with SAP data via Power Apps, and to provide feedback.

## Requirements

The assembled team of IT system administrators need to review the following requirements and make necessary preparations before connecting your organization's SAP system to the Power Platform:

- [Power Apps license](/power-platform/admin/about-powerapps-perapp) and [Power Apps pricing](https://powerapps.microsoft.com/pricing/) - Determine if your organization has the necessary licensing to proceed with the setup. It's important to consider:
  - Power Apps licensing that supports using an on-premises data gateway and premium applications, flows, and connectors.
  - All administrators setting up the integration and functional business users testing the solution have the required licenses to do so.

- [SAP](<https://www.sap.com/>) subscription
  - Ensure that the users testing the SAP Integration solution have appropriate access to the appropriate SAP functional modules.
  - The solution can work with any SAP system that utilizes RFC and BAPI calls

- [SAP .NET Connector 3.0 SDK from SAP](https://support.sap.com/en/product/connectors/msnet.html)
  - Access to the download requires a valid S-user.
  - Select the 64-bit version of the connector.
  - Select _Install assemblies to GAC_ in the Optional setup steps window during installation.

- [Azure Active Directory](/azure/active-directory/develop/quickstart-create-new-tenant) - Create a new tenant for the SAP Integration.  It's important to consider:
  - The tenant has at least 1 GB of database storage capacity available for the sandbox environment.
  - All members of the IT systems team have the necessary administrator roles to perform the setup.
  - All functional business users testing the SAP Integration are added to the tenant.

- [Windows Virtual Machine (VM)](https://azure.microsoft.com/products/virtual-machines/#overview) or your own server - Provision a separate Windows VM or server with your SAP system connected to it to connect to the on-premises data gateway.

- [On-premises data gateway](https://www.microsoft.com/download/details.aspx?id=53127) - Download and [install](/data-integration/gateway/service-gateway-install) the most recent version (9/23/2022 or newer) of the on-premises data gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).

- [Azure AD single sign-on (SSO) for Gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) - Set up the new Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO.

## Integrate SAP ERP system with Power Platform

SAP integration with Power Platform requires IT system administrators to establish a connection and set up security and governance between the two systems. Perform the following steps.

### Step 1: Install on-premises data gateway

An on-premises data gateway acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services.

SAP integration with the Power Platform requires that you install the latest version (9/23/2022 or newer) of the [on-premises data gateway](/data-integration/gateway/service-gateway-install).

While setting up the on-premises data gateway for SAP integration, ensure that you review the following considerations:

- Provision a new or repurposed Windows VM or server specifically for SAP integration with the Power Platform that meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended).
  - If you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.
- [Change the on-premises data gateway service account](/data-integration/gateway/service-gateway-service-account)
- [Install SAP .NET Connector 3.0 SDK from SAP](https://support.sap.com/en/product/connectors/msnet.html)onto the data gateway
  - Access to the download requires a valid S-user.
  - Select the 64-bit version of the connector.
  - Select _Install assemblies to GAC_ in the Optional setup steps window during installation.
  
More information: [About on-premises gateway](/power-platform/admin/wp-onpremises-gateway)

### Step 2: Configure Azure AD and SAP SSO

> [!NOTE]
> A direct connection with your credentials is all that is necessary for preview and testing.

An [Azure Active Directory (AD) tenant](/azure/cloud-adoption-framework/ready/landing-zone/design-area/azure-ad-define) provides identity and access management. The Azure AD tenant created for SAP Integration must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO).

[Sign in to the Azure portal](<https://www.portal.azure.com>) to configure Azure AD and SAP SSO.

The following articles will help you configure and manage your tenants and authorizations:

- [Create and configure an Azure Active Directory Domain Services domain](/azure/active-directory-domain-services/tutorial-create-instance)  
- [SAP ERP Windows Authentication](/connectors/saperp/#authentication)
- [Overview of Kerberos](/data-integration/gateway/service-gateway-service-account)
- [Configure Kerberos-based SSO to on-premises data sources (SAP)](/power-bi/connect-data/service-gateway-sso-kerberos)
- [Establish DLP policies](/power-platform/guidance/adoption/dlp-strategy)

### Step 3: Create and manage an environment

[Environments](/power-platform/admin/environments-overview) serve as containers to separate apps that might have different roles, security requirements, stages of deployment, or target audiences.

Sign in to the [Power Platform admin center](<https://go.microsoft.com/fwlink/p/?linkid=2208369>). The admin center provides a unified portal for administrators to manage environments, connectors, gateways, data sources and other settings for Power Apps and Power Automate.

Follow the directions in [Create and manage an environment](/power-platform/admin/create-environment). While creating the environment for public preview SAP Integration, be sure to do the following actions:

1. Select **Sandbox** for environment type.
1. Select **Yes** to create a database for the environment.
1. Restrict environment access by selecting the newly created Azure AD tenant as the security group. This will ensure that only the resources in that tenant have access to the environment.

More information: [Establish an environment strategy](/power-platform/guidance/adoption/environment-strategy)

### Step 4: Set up and manage connectors

[Connectors](/connectors/connectors) are proxies or wrappers around APIs that allow the underlying service to communicate with the Power Platform or Azure Logic Apps.

The following two connectors need to be set up to allow communication between SAP ERP and Power Platform:

- Microsoft Dataverse
- SAP ERP connector

To set up connections:

1. Sign in to [Power Apps](https://make.powerapps.com)

1. In the left navigation pane, expand **Data** and select **Connections**.

1. Select **New connection** in the command bar.

1. Go to **Search** in the command bar if you need to search for the connectors.

1. Select each connector as it appears and follow the prompts to set up the connections.

More information: [Create new connections](/power-apps/maker/canvas-apps/add-manage-connections#create-a-new-connection).

### Step 5: Import the prebuilt solution

The SAP integration [prebuilt solution](solutions.md) contains apps, flows, and other components that work together to simplify the SAP ERP integration with the Power Platform.

Take the following steps to download and then import the solution:

1. Download the solution (.zip file) from the [GitHub repo](https://github.com/jongilman88/PowerPlatformSAPIntegration).
  
1. Sign in to [Power Apps](https://make.powerapps.com).

1. Select the environment from the top-right corner where you want to import the solution.

1. Import the solution. More information: [Import solutions in Power Apps](/power-apps/maker/data-platform/import-update-export-solutions).

## Next steps

[Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)

### See also

- [Overview of SAP integration with Power Platform (preview)](overview.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [SAP ERP connector](/connectors/saperp/#sap-authentication)
- [Microsoft Power Platform guidance documentation](/power-platform/guidance/)
- [Microsoft Power Platform Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit)
