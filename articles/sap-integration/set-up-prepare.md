---
title: Set up SAP integration with Power Platform (preview)
description: Learn about the requirements to configure SAP integration, and prepare your on-premises SAP infrastructure to connect with Power Platform
author: jongilman88
contributors: 
- EllenWehrle
- galitskyd
- microsoft-dustin
- ryanb58
- scottwoodallmsft
- Wrighttyler
ms.author: jongilman
ms.reviewer: ellenwehrle
ms.subservice: power-automate-connections
ms.topic: how-to
ms.date: 01/24/2023

---

# Set up SAP integration with Power Platform (preview)

[This article is prerelease documentation and is subject to change.]

A successful SAP integration with Microsoft Power Platform requires coordination with your organization's IT administrators. With some planning, setup, and configuration, you'll be able to ensure that your SAP system can communicate with Power Platform.

## Prepare for SAP integration

Take the following steps to support a successful deployment of the preview SAP Integration solution:

1. Join the [Power Automate Community](https://powerusers.microsoft.com/t5/Microsoft-Power-Automate/ct-p/MPACommunity). Ask questions, get helpful guidance, and share feedback about your organization's experience setting up and using the SAP Integration solution.

1. Assemble a team with the following IT system administrators:
    - Network
    - SAP BASIS
    - Power Platform

1. Review the following with your team:
    - SAP Integration requirements
    - [Administer Power Platform](/power-platform/admin/admin-documentation)

1. Assign setup tasks to the appropriate IT system team members and track progress.

1. Invite functional business users to work with SAP data via Power Apps, and to provide feedback.

## Requirements

The assembled team of IT system administrators needs to review the following requirements and make necessary preparations before connecting your organization's SAP system to Power Platform:

- [Power Apps license](/power-platform/admin/about-powerapps-perapp) and [Power Apps pricing](https://powerapps.microsoft.com/pricing/). Determine if your organization has the necessary licensing to proceed with the setup. It's important to consider:

  - Power Apps licensing that supports using an on-premises data gateway and premium applications, flows, and connectors.
  - All administrators setting up the integration and functional business users testing the solution have the required licenses to do so.

- [SAP](<https://www.sap.com/>) subscription:
  
  - The SAP ERP connector can work with any SAP system that uses RFC and BAPI calls.
  - Set up requires an administrator who valid S-User access to the SAP system(s). The S-User is an SAP super administrator and has all of the authorizations for the portal and can manage other necessary SAP roles as necessary.

- [Windows Virtual Machine (VM)](https://azure.microsoft.com/products/virtual-machines/#overview) or your own server. Provision a separate Windows VM or server with only your SAP system(s) connected to it. This machine will connect to the on-premises data gateway.

- [Azure Active Directory (AD)](/azure/active-directory/). [Set up a new Azure AD tenant](/azure/active-directory/develop/quickstart-create-new-tenant). It's important to consider:
  
  - The tenant has at least 1 GB of database storage capacity available for the environments within it.
  - Set up requires an Azure AD Global administrator to set up the necessary [Azure AD administrator roles](/azure/active-directory/roles/permissions-reference#global-administrator) and to [configure the Power Platform admin portal](/power-platform/admin/wp-work-with-admin-portals) so gateways, tenants, environments, and user access can be managed.
  
- [On-premises data gateway](/data-integration/gateway/). The gateway is to be installed on the provisioned Windows VM or server by an Azure AD Global or Gateway administrator working with the SAP Super administrator (S-User).
  - Review [on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management) for Power Platform to learn more.
  - Go to the [Microsoft Download Center's on-premises data gateway page](https://www.microsoft.com/download/details.aspx?id=53127) to download the most recent version (12/16/2022 or newer) of the gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference). In the _System Requirements_ section on the gateway download page, identify what operating systems and .NET Frameworks are required to support the most recent version of the gateway.
- [Azure AD single sign-on (SSO) for gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway). Set up the new Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO.
- [Microsoft .NET Framework.](https://dotnet.microsoft.com/download/dotnet-framework) Download the.NET Framework that supports the most recent version of the gateway.
- [Microsoft C++ Runtime DLLs version 10.x (this version is contained in Microsoft Visual C++ 2010 Redistributables)](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true). SAP's NCo 3.0 download requires this library to support the .NET Framework.
- [SAP Connector for Microsoft .NET 3.0 (NCo 3.0)](https://support.sap.com/en/product/connectors/msnet.html) SDK from SAP:
  - An administrator with valid S-User access is required to set up the connector.
  - Select NCo 3.0 compiled with .NET Framework 4.0 - **SAP Connector for Microsoft. NET 3.0.25.0 for Windows 64 bit (x64)**, July 20, 2022 (ZIP archive, 7,126 KB).
  
> [!IMPORTANT]
>
> - DO NOT download NCo 3.1.
> - NCo 3.0 will work with .NET Framework release 4.0 or later. Download the most recent release of the .NET Framework.

## Integrate SAP ERP system with Power Platform

SAP integration with Power Platform requires IT system administrators to establish a connection and set up security and governance between the two systems. Perform the following steps.

### Step 1: Set up an on-premises data gateway

An on-premises data gateway acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services. A single data gateway deployed centrally allows you to manage data connections for multiple cloud apps and on-premises data connections.

The following guidance supports a successful setup of the [on-premises data gateway](/data-integration/gateway/) on a local computer.

- Go to the [Microsoft Download Center's on-premises data gateway page](https://www.microsoft.com/download/details.aspx?id=53127) to download the latest version of the on-premises data gateway.
  - SAP integration with Power Platform requires a version of the gateway that is published on or after 12/16/2022.
  - In the _System Requirements_ section on the gateway download page, identify the latest operating systems and .NET Frameworks that are required to support the most recent version of the gateway.
- Go to the [Microsoft .NET Framework download page](https://dotnet.microsoft.com/download/dotnet-framework) to download the required .NET Framework.
- Provision a new or repurposed Windows VM or server specifically for SAP integration with the Power Platform that meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended) for gateway installation and management.
  - Review [related considerations](/data-integration/gateway/service-gateway-install#related-considerations).
  For instance, if you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.
- [Install](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) the on-premises data gateway onto the provisioned Windows VM or server.
- [Change the on-premises data gateway service account.](/data-integration/gateway/service-gateway-service-account)
  - The default account for this service is _NT SERVICE\PBIEgwService_. Change this account to a domain user account within your Windows Server Active Directory domain, or use a managed service account to avoid having to change the password.
- Install the required package SAP NCo requires [Microsoft C++ Runtime DLLs version 10.x (this version is contained in Microsoft Visual C++ 2010 Redistributables)](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true).
- Install the [SAP Connector for Microsoft .NET 3.0 (NCo3.0)](https://support.sap.com/en/product/connectors/msnet.html) onto the data gateway.

  - Select NCo 3.0 compiled with .NET Framework 4.0 - **SAP Connector for Microsoft. NET 3.0.25.0 for Windows 64 bit (x64)**, July 20, 2022 (ZIP archive, 7,126 KB) .

- Select **Install assemblies to GAC** in the Optional setup steps window during installation.

More information: [About on-premises gateway](/power-platform/admin/wp-onpremises-gateway)

### Step 2: Configure Azure AD and SAP for SSO

> [!NOTE]
>
> A direct connection with your credentials is all that is necessary for testing.

An [Azure Active Directory (AD) tenant](/azure/cloud-adoption-framework/ready/landing-zone/design-area/azure-ad-define) provides identity and access management. The Azure AD tenant created for SAP Integration must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO).

[Sign in to the Azure portal](<https://www.portal.azure.com>) to configure Azure AD and SAP SSO.

The following articles will help you configure and manage your tenants and authorizations:

- [Establish DLP policies](/power-platform/guidance/adoption/dlp-strategy)
- [Create and configure an Azure Active Directory Domain Services managed domain](/azure/active-directory-domain-services/tutorial-create-instance)  
- [SAP ERP Windows Authentication](/connectors/saperp/#authentication)
- [Overview of Kerberos](/data-integration/gateway/service-gateway-service-account)
- [Configure Kerberos-based SSO to on-premises data sources (SAP)](/power-bi/connect-data/service-gateway-sso-kerberos)

### Step 3: Create and manage an environment

[Environments](/power-platform/admin/environments-overview) serve as containers to separate apps that might have different roles, security requirements, stages of deployment, or target audiences.

Sign in to the [Power Platform admin center](<https://go.microsoft.com/fwlink/p/?linkid=2208369>). The admin center provides a unified portal for administrators to manage environments, connectors, gateways, data sources, and other settings for Power Apps and Power Automate.

Follow the directions in [Create and manage an environment](/power-platform/admin/create-environment). While creating the environment for public preview SAP Integration, be sure to do the following actions:

1. Select **Sandbox** for environment type.
1. Select **Yes** to create a database for the environment.
1. Restrict environment access by selecting the newly created Azure AD tenant as the security group. This will ensure that only the resources in that tenant have access to the environment.

More information: [Establish an environment strategy](/power-platform/guidance/adoption/environment-strategy)

### Step 4: Set up and manage connectors

[Connectors](/connectors/connectors) are proxies or wrappers around APIs that allow the underlying service to communicate with Power Platform or Azure Logic Apps.

The following two connectors need to be set up to allow communication between SAP ERP and Power Platform:

- Microsoft Dataverse
- SAP ERP connector

To set up connections:

1. Sign in to [Power Apps](https://make.powerapps.com).

1. In the left navigation pane, expand **Data** and select **Connections**.

1. Select **New connection** in the command bar.

1. Go to **Search** in the command bar if you need to search for the connectors.

1. Select each connector as it appears and follow the prompts to set up the connections.

More information: [Create new connections](/power-apps/maker/canvas-apps/add-manage-connections#create-a-new-connection)

### Step 5: Import the prebuilt solution

The SAP integration [prebuilt solution](solutions.md) contains apps, flows, and other components that work together to simplify the SAP ERP integration with the Power Platform.

Take the following steps to download and then import the solution:

1. Download the solution (.zip file) from the [GitHub repo](https://github.com/jongilman88/PowerPlatformSAPIntegration).
  
1. Sign in to [Power Apps](https://make.powerapps.com).

1. Select the environment from the upper-right corner where you want to import the solution.

1. Import the solution. More information: [Import solutions in Power Apps](/power-apps/maker/data-platform/import-update-export-solutions)

## Next steps

[Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)

### See also

- [Overview of SAP integration with Power Platform (preview)](overview.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [SAP ERP connector](/connectors/saperp/#sap-authentication)
- [Microsoft Power Platform guidance documentation](/power-platform/guidance/)
- [Microsoft Power Platform Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit)
