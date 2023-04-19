---
title: Set up SAP integration with Power Platform
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
ms.date: 03/31/2023

---

# Set up SAP integration with Power Platform

A successful SAP integration with Microsoft Power Platform requires coordination with your organization's IT administrators. With some planning, setup, and configuration, you'll be able to ensure that your SAP system can communicate with Power Platform.

## Prepare for SAP integration

Take the following steps to support a successful deployment of the preview SAP Integration solution:

1. Join the [Power Platform Community](https://powerusers.microsoft.com/). Ask questions, get helpful guidance, and share feedback about your organization's experience setting up and using the SAP Integration solution.

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

- [Power Platform licensing](/power-platform/admin/pricing-billing-skus). Determine if your organization has the necessary [licensing](https://www.microsoft.com/licensing/default) to proceed with the setup. It's important to consider:
  - Power Apps, Power Automate, and Power BI licensing that supports setting up and using an on-premises data gateway with premium applications, flows, and connectors (SAP ERP and Dataverse).
  - All administrators implementing and functional business users testing and using SAP Integration have the required licenses to do so.
    - A [Power BI license](/power-bi/fundamentals/service-features-license-type) is required for the admin who is setting up the on-premises data gateway.

- [SAP](<https://www.sap.com/>) subscription:
  
  - The SAP ERP connector can work with any SAP system that uses RFC and BAPI calls.
  - Set up requires an administrator who has valid S-User access to the SAP system(s). The S-User is an SAP super administrator and has all of the authorizations for the portal and can manage other necessary SAP roles as necessary.

- [Windows Virtual Machine (VM)](https://azure.microsoft.com/products/virtual-machines/#overview) or your own server. Create a Windows VM or provision a server specifically for hosting the on-premises data gateway for SAP integration with Power Platform.
  - Ensure it meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended) for gateway installation and management.
  - Review other [related considerations](/data-integration/gateway/service-gateway-install#related-considerations).
  For instance, if you're planning to use Windows authentication, ensure you install the gateway on a computer that's a member of the same active directory environment as the data sources.
- [On-premises data gateway](/data-integration/gateway/). The gateway is to be installed on the newly created Windows VM or provisioned server by an Azure AD Global or Gateway (default user permission for anyone performing the install) administrator  working with an SAP Super administrator (S-User).
  - Review [on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management) for Power Platform to learn more.
  - Go to the [Microsoft Download Center's on-premises data gateway page](https://www.microsoft.com/download/details.aspx?id=53127) and download the most recent version (December 16, 2022 or newer) of the gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
    - In the _System Requirements_ section on the gateway download page, identify the operating systems and .NET Frameworks required to support the most recent version of the gateway.
- [Microsoft .NET Framework.](https://dotnet.microsoft.com/download/dotnet-framework) Download the .NET Framework that supports the most recent version of the gateway.
- [Microsoft C++ Runtime DLLs version 10.x (this version is contained in Microsoft Visual C++ 2010 Redistributables)](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true). SAP's NCo 3.0 download requires this library to support the .NET Framework.
- [SAP Connector for Microsoft .NET 3.0 (NCo 3.0)](https://support.sap.com/en/product/connectors/msnet.html) SDK from SAP:
  - An administrator with valid S-User access is required to set up the connector.
  - Select **NCo 3.0 compiled with .NET Framework 4.0 - SAP Connector for Microsoft. NET 3.0.25.0 for Windows 64 bit (x64), July 20, 2022 (ZIP archive, 7,126 KB)**.
- [Azure Active Directory (AD)](/azure/active-directory/). [Set up a new Azure AD tenant](/azure/active-directory/develop/quickstart-create-new-tenant) or reconfigure an existing tenant to meet the requirements. It's important to consider:
  
  - The tenant has at least 1 GB of database storage capacity available for the environments within it.
  - Set up requires an Azure AD Global administrator to set up the necessary [Azure AD administrator roles](/azure/active-directory/roles/permissions-reference#global-administrator) and to [configure the Power Platform admin portal](/power-platform/admin/wp-work-with-admin-portals) so gateways, tenants, environments, and user access can be managed.
- [Azure AD single sign-on (SSO) for gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway). Set up the new Azure AD tenant configured with an on-premises data gateway having constrained delegation to support SSO. You can also reconfigure an existing tenant to meet the requirements.
  
> [!IMPORTANT]
>
> - NCo 3.0 works with .NET Framework releases 4.0 or later. Download the most recent .NET Framework listed in the _Systems Requirements_ section of the gateway download page.
> - Don't download NCo 3.1. It's not supported yet.

## Set up an on-premises data gateway

An [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) acts as a bridge to provide secure data transfer between on-premises data that isn't in the cloud and Microsoft cloud services.

The on-premises data gateway installation encompasses multiple components installed on the same domain as the Windows VM. Each dedicated machine can only have one gateway installed on it. The same gateway can be used in multiple environments as long as the gateway region and the environment region match. Administrators need to take the following steps to set up the gateway:

1. Create a new [Windows VM](/azure/virtual-machines/overview) or provision a new or repurposed server specifically for SAP integration with the Power Platform.
1. Install the most recent [Microsoft .NET Framework](https://dotnet.microsoft.com/download/dotnet-framework) listed in the _System Requirements_ section on the [gateway download page](https://www.microsoft.com/download/details.aspx?id=53127) on to the machine.
1. Install the most recent version of the [on-premises data gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) on to the machine (December 16, 2022 or newer).
1. Install the [Microsoft C++ Runtime DLLs version 10.x](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true) framework package onto the machine and configure. This version is contained in Microsoft Visual C++ 2010 Redistributables.
1. Install [SAP Connector for Microsoft .NET 3.0 (NCo3.0)](https://support.sap.com/en/product/connectors/msnet.html) on to the machine.
      - Select [Install assemblies to GAC](/dotnet/framework/app-domains/install-assembly-into-gac) in the Optional setup steps window during the installation of NCo3.0.

The installed gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. Update the service account to a domain account if setting up Windows or Azure single sign-on (SSO). Additional information is provided in [Step 1](#step-1-configure-kerberos-constrained-delegation).

 On-premises data gateway clusters can be created to avoid single points of failure when accessing on-premises data resources. For SAP Integration, calls should be forced to the primary gateway in a cluster. Calls are only directed to the second gateway when the primary gateway call fails. To support this scenario, ensure that random load balancing is turned off.

1. Go to the [**Settings**](/power-platform/admin/onpremises-data-gateway-management#settings) panel in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Make sure the checkbox next to "Distribute requests across all active gateways in this cluster" **remains unchecked** on the on-premises data Settings panel.

More information:

- [On-premises data gateways documentation](/data-integration/gateway/)
- [Power Platform on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management)
- [Manage on-premises data gateway high-availability clusters and load balancing](/data-integration/gateway/service-gateway-high-availability-clusters)

## Configure authentication

> [!NOTE]
>
> A direct connection with your credentials is all that is necessary for testing.

The SAP ERP connector is designed to be used by multiple users of an application, therefore, the connections aren't shared. The user credentials are provided in the connection, while other details required to connect to the SAP system (like the server details, security configuration) are provided as part of the action.

Enabling single sign-on (SSO) makes it easy to refresh data from SAP while adhering to user-level permissions configured in SAP. There are several ways you can set up SSO for streamlined identity and access management. Be sure to obtain the necessary administrative privileges in Azure and SAP to set up SSO.

The following authentication types are supported by the SAP ERP connector:

| Authentication type | How a user connects  | Additional configuration steps |
|--------------|--------------|----------------|
| [SAP authentication](/connectors/saperp/#sap-authentication)     | Use SAP username and password to access SAP server.  | Step 4        |
| [Windows authentication](/connectors/saperp/#windows-authentication)     | Use Windows username and password to access SAP server. |   Steps 1,2,3,4      |
| [Azure AD authentication](/connectors/saperp/#azure-ad-integrated)    | Use Azure AD to access SAP server. | Steps 1,2,3,4     |

More information:

- [Azure Active Directory documentation](/azure/active-directory/)
- [SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)

### Step 1: Configure Kerberos constrained delegation

[Kerberos constrained delegation (KCD)](/windows-server/security/kerberos/kerberos-constrained-delegation-overview) provides secure user or service access to resources permitted by administrators without multiple requests for credentials. Kerberos constrained delegation needs to be configured for Windows and Azure AD authentication.

Run the gateway Windows service as a domain account with  Service Principal Names (SPNs) (SetSPN).

Configuration tasks:

1. [Configure an SPN for the gateway service account](/power-bi/connect-data/service-gateway-sso-kerberos#configure-an-spn-for-the-gateway-service-account). A domain  administrator uses the [Setspn tool](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc731241(v=ws.11)) that comes with Windows to enable delegation.

1. [Adjust communication settings for the gateway](/data-integration/gateway/service-gateway-communication). Enable outbound Azure connections and review your firewall and port setups to ensure communication.
1. [Configure for standard Kerberos constrained delegation](/power-bi/connect-data/service-gateway-sso-kerberos#option-a-standard-kerberos-constrained-delegation). A domain administrator is required to configure a domain account for a service and it restricts the account to run on a single domain.

1. [Grant the gateway service account local policy rights on the gateway machine](/power-bi/connect-data/service-gateway-sso-kerberos#step-6-grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine).
1. [Add gateway service account to Windows Authorization and Access Group](/power-bi/connect-data/service-gateway-sso-kerberos#add-gateway-service-account-to-windows-authorization-and-access-group).
1. [Set user-mapping configuration parameters on the gateway machine](/power-bi/connect-data/service-gateway-sso-kerberos#set-user-mapping-configuration-parameters-on-the-gateway-machine).
1. [Change the gateway service account to a domain account](/data-integration/gateway/service-gateway-service-account). In a standard installation, the gateway runs as the default machine-local service account, _NT Service\PBIEgwService_. It must run as a domain account in order to facilitate Kerberos tickets for SSO.

More information:

- [Kerberos constrained delegation overview](/windows-server/security/kerberos/kerberos-constrained-delegation-overview)
- [Configure Kerberos-based SSO to on-premises data sources](/power-bi/connect-data/service-gateway-sso-kerberos)

### Step 2: Configure SAP ERP to enable using Common CryptoLib (sapcrypto.dll)

To use SSO to access your SAP server, ensure that your SAP server is correctly configured for Kerberos SSO using CommonCryptoLib as its Secure Network Communication (SNC) library and has an SNC name that starts with CN.

> [!IMPORTANT]
>
> Ensure that SAP Secure Login Client (SLC) isn't running on the computer the gateway is installed on. SLC caches Kerberos tickets in a way that can interfere with the gateway's ability to use Kerberos for SSO. For more information, review [SAP Note 2780475](https://support.sap.com/en/my-support/knowledge-base.html?anchorId=section_1391401241) (s-user required).

1. [Download](https://help.sap.com/docs/help/a76169f317b44b1e87bd0bd2573cba2b/6f6d555ceb0a4e2fb6d1376331f4d34c.html?version=SP6) 64-bit CommonCryptoLib (`sapcrypto.dll`) version 8.5.25 or greater from the SAP Launchpad, and copy it to a folder on your gateway machine.

1. In the same directory where you copied `sapcrypto.dll`, create a file named `sapcrypto.ini`, with the following content:

    `ccl/snc/enable_kerberos_in_client_role = 1`

    The `.ini` file contains configuration information required by CommonCryptoLib to enable SSO in the gateway scenario. Ensure that the path (i.e.,`c:\sapcryptolib\`) contains both `sapcrypto.ini` and `sapcrypto.dll`. The `.dll` and `.ini` files must exist in the same location.

1. Grant permissions to both the `.ini` and `.dll` files to the Authenticated Users group. Both the gateway service user and the Active Directory (AD) user that the service user impersonates need _read_ and _execute_ permissions for both files.
1. Create a `CCL_PROFILE` system environment variable and set its value to the path `sapcrypto.ini`.
1. Restart the gateway service.

More information: [Use Kerberos single sign-on for SSO to SAP BW using CommonCryptoLib](/power-bi/connect-data/service-gateway-sso-kerberos-sap-bw-commoncryptolib)

### Step 3: Enable SAP SNC for Azure AD and Windows authentication

The SAP ERP connector supports Azure AD and Windows authentication by enabling SAP's [Secure Network Communication (SNC)](https://help.sap.com/doc/saphelp_nw74/7.4.16/en-us/e6/56f466e99a11d1a5b00000e835363f/content.htm?no_cache=true). SNC is a software layer in the SAP system architecture that provides an interface to external security products so secure single sign-on to SAP environments can be established.  The following guidance helps with setup.

| Property | Description |
|---------|---------|
| Use SNC     |  Set to **Yes** if you want to enable SNC.       |
| SNC library     |  The SNC library name or path relative to NCo installation location or absolute path. Examples are ``sapcrypto.dll``, or `c:\sapcryptolib\sapcryptolib.dll`.      |
| SNC SSO     | Specifies whether the connector uses the identity of the service or the end user credentials. Set to **On** to use the identity of the end user.   |
| SNC My Name     | If necessary, specify the identity to be used. |
| SNC Partner Name     | The name of the back-end SNC server. Example, `p:CN=SAPserver`. |
| SNC Quality of Protection     |  The quality of service used for SNC communication of this particular destination or server. The default value is defined by the back-end system. The maximum value is defined by the security product used for SNC. |

### Step 4: Set up SAP server and user accounts to allow actions

For more information, which includes the supported user account types and the minimum required authorization for each action type (RFC, BAPI, IDOC), review [SAP Note 460089 - Minimum authorization profiles for external RFC programs](https://accounts.sap.com/).

SAP user accounts need to access `RFC_Metadata` function group and the respective function modules for the following operations:

| Operations | Access to function modules  |
|------------|-----------------------------|
|RFC actions    | `RFC_GROUP_SEARCH` and `DD_LANGU_TO_ISOLA`  |
|Read Table action   | Either `RFC BBP_RFC_READ_TABLE` `RFC_READ_TABLE` |
|Grant strict minimum access to SAP server for your SAP connection  | `RFC_METADATA_GET` and `RFC_METADATA_GET_TIMESTAMP`|

More information on setup and configuration:

- [SAP Single Sign-On](https://help.sap.com/docs/SAP_SINGLE_SIGN-ON)
- [Secure Login for SAP Single Sign-On Implementation Guide](https://help.sap.com/docs/SAP_SINGLE_SIGN-ON/df185fd53bb645b1bd99284ee4e4a750/631b1669678d41d79d94601c238e218b.html)
- [SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)
- [Azure documentation](/azure/?product=networking)
- [SAP ERP connector](/connectors/saperp/)
- [Azure Logic Apps SAP connector](/azure/logic-apps/logic-apps-using-sap-connector)
- [Data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention)
- [Hybrid architecture design](/azure/architecture/hybrid/hybrid-start-here)

## Create and manage environments

[Environments](/power-platform/admin/environments-overview) serve as containers to separate applications that might have different roles, security requirements, stages of deployment, or target audiences.

Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home). The admin center provides a unified portal for administrators to manage environments, connectors, gateways, data sources, and other settings for Power Apps and Power Automate.

Follow the directions in [Create and manage an environment](/power-platform/admin/create-environment). SAP Integration is implemented by administrators and deployed to the organization. Review the [types of environments](/power-platform/admin/environments-overview#types-of-environments) your organization needs to support the implementation and production phases. Each environment with or without Dataverse consumes at least 1-GB capacity. To get started, you can set up a sandbox environment. Be sure to do the following actions:

1. Select **Sandbox** for environment type.
1. Select **Yes** to create a database for the environment.
1. Set [data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention) for new or existing tenants and environments to establish guardrails that protect your organization's data.

More information: [Establish an environment strategy](/power-platform/guidance/adoption/environment-strategy)

## Set up and manage connectors

[Connectors](/connectors/connectors) are proxies or wrappers around APIs that allow the underlying service to communicate with Power Platform or Azure Logic Apps.

Set up the following two connectors to allow communication between SAP ERP and Power Platform:

- [Microsoft Dataverse](/connectors/commondataserviceforapps/)
- [SAP ERP connector](/connectors/saperp/)

To set up connections:

1. Sign in to [Power Apps](https://make.powerapps.com).

1. In the left navigation pane, expand **Data** and select **Connections**.

1. Select **New connection** in the command bar.

1. Go to **Search** in the command bar if you need to search for the connectors.

1. Select each connector as it appears and follow the prompts to set up the connections.

More information:

- [Connectors overview](/connectors/connectors)
- [Create new connections](/power-apps/maker/canvas-apps/add-manage-connections#create-a-new-connection)
- [Manage connections in Power Automate](/power-automate/add-manage-connections)
- [Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Import the prebuilt solution

Solutions are used for [application lifecycle management](/power-platform/alm/overview-alm) and provide additional capabilities for managing the lifecycle of data sources. If a canvas app is in a solution, connection references and environment variables may be created to store information about the data sources. Storing this information in the solution ensures data sources can be changed or re-established when solutions are migrated to different environments.

The SAP integration [prebuilt solution](solutions.md) contains apps, flows, connection references and other components that work together to simplify the SAP ERP integration with the Power Platform.

Take the following steps to download and then import the solution:

1. Download the solution (.zip file) from the [GitHub repo](https://github.com/jongilman88/PowerPlatformSAPIntegration).
  
1. Sign in to [Power Apps](https://make.powerapps.com).

1. Select the environment from the upper-right corner where you want to import the solution.

1. Import the solution.

More information: [Import solutions in Power Apps](/power-apps/maker/data-platform/import-update-export-solutions)

## Next steps

[Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)

### See also

- [Overview of SAP integration with Power Platform (preview)](overview.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [SAP ERP connector](/connectors/saperp/#sap-authentication)
- [Microsoft Power Platform guidance documentation](/power-platform/guidance/)
- [Microsoft Power Platform Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit)
