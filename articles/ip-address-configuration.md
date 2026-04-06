---
title: IP address configuration
description: Learn about IP address configuration required to use Power Automate, the services that Power Automate connects to, various endpoints, and more.
author: samathur
contributors:
  - kisubedi
  - samathur
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 12/10/2025
ms.author: matow
ms.reviewer: angieandrews
#customer intent: As an IT professional, I want to allow Power Automate flows to connect to external services so that users can automate workflows seamlessly.
---

# IP address configuration for Power Automate

This article describes the required configuration for:

- Power Automate to connect to services in your network by inbound firewall configuration, and
- Your makers and users to access Power Automate to build and use experiences by outbound firewall configuration.

## Find the IP ranges for your scenario

Use this table to find which IP ranges you need to allowlist. Select your scenario to jump to the relevant section.

| I need to allowlist IPs for... | What to allowlist | Section |
|---|---|---|
| **Cloud flows calling my API or service** | Power Automate outbound IPs (varies by Azure region where your environment is hosted) | [Outbound IP addresses](#allow-connector-calls-to-your-services) |
| **My firewall to allow cloud flow connectors** | Connector outbound IPs (the connector makes calls from these addresses) | [Connector outbound IP addresses](#allow-connector-calls-to-your-services) |
| **Desktop flows through a proxy or firewall** | Desktop flow service endpoints | [Desktop flow services required for runtime](#allow-machines--users-on-your-network-to-access-power-automate-desktop-services) |
| **On-premises data gateway** | Gateway relay endpoints and outbound IPs | [On-premises data gateway](#other-ip-address-articles) |
| **Power Automate portal access** | Generally not needed (standard HTTPS). If required by strict firewall, allow `*.powerautomate.com` and `*.flow.microsoft.com` | N/A |

> [!IMPORTANT]
> IP ranges can change. Always verify against the **Azure IP Ranges and Service Tags** JSON file for the most current list: [Download Azure IP Ranges](https://www.microsoft.com/download/details.aspx?id=56519). This JSON file is updated weekly. New ranges that appear in the file don't take effect in Azure for at least one week.

## Determine your environment's Azure region

The IP ranges you need depend on the Azure region where your Power Platform environment is hosted. To find your region:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** in the left navigation.
3. Select your environment.
4. On the environment details page, find the **Region** field (for example, "United States", "Europe", "Asia Pacific").

> [!TIP]
> If your organization has environments in multiple regions, you need to allowlist the IP ranges for each region where flows run. If you're unsure, start with the region of your default environment.

## High-level recommendation for IP address configuration

The simplest mechanism to configure a firewall to allow Power Automate cloud flows to call external services through [connectors](/connectors/overview) is to use [Azure service tags](/azure/virtual-network/service-tags-overview). The primary service tag for Logic Apps connectors is **AzureConnectors**, as described in [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

## Monitor IP ranges

Depending on the firewall you're using, you don't need to monitor and manually update IP ranges, The following table describes the recommended  tracking method for each firewall type.

|Firewall  |Tracking method  |
|---------|---------|
|Azure     | Use [Azure service tags](/azure/virtual-network/service-tags-overview). By using service tags in your network security group rules, you don't need to constantly monitor and manually update IP ranges for each service.        |
|On-premises    | Use the [Service Tags with an on-premises firewall](/azure/virtual-network/service-tags-overview#service-tags-on-premises) so you don't need to monitor and manually update IP ranges. The [Service Tag Discovery API](/azure/virtual-network/service-tags-overview#use-the-service-tag-discovery-api) provides access to the latest IP address ranges associated with each service tag, enabling you to stay current with changes.        |

## Configuration details

For configuration details, use the links in the following table.

|For details in this category  |Select from these links |
|---------|---------|
|[Allow flows to call your services](#allow-flows-to-call-your-services)     | </li><li>[Allow connector calls to your services](#allow-connector-calls-to-your-services)<br/></li><li>[Allowlist 'HTTP' and 'HTTP + Swagger' calls to your services](#allowlist-http-and-http--swagger-calls-to-your-services)        |
|[Allow users on your network to use Power Automate](#allow-users-on-your-network-to-use-power-automate)     | </li><li>[Use the Power Automate web portal](#use-the-power-automate-web-portal)<br/></li><li>[Allow users on your network to use Power Automate mobile app](#allow-users-on-your-network-to-use-power-automate-mobile-app)<br/></li><li>[Allow users on your network to use "When an HTTP request is received" trigger](#allow-users-on-your-network-to-use-when-an-http-request-is-received-trigger)<br/></li><li>[Allow machines & users on your network to access Power Automate desktop services](#allow-machines--users-on-your-network-to-access-power-automate-desktop-services)<br/></li><li>[Global endpoints for desktop flows runtime](#global-endpoints-for-desktop-flows-runtime)<br/></li><li>[Global endpoints for Power Automate for desktop MSI installer](#global-endpoints-for-power-automate-for-desktop-msi-installer)<br/></li><li>[Public endpoints for desktop flows runtime](#public-endpoints-for-desktop-flows-runtime)<br/></li><li>[US Government endpoints for desktop flows runtime](#us-government-endpoints-for-desktop-flows-runtime)<br/></li><li>[21Vianet endpoints (China) for desktop flows runtime](#21vianet-endpoints-china-for-desktop-flows-runtime)       |
|[Other IP address articles](#other-ip-address-articles)     | </li><li>[Approval email delivery](#approval-email-delivery)<br/></li><li>[Azure SQL database](#azure-sql-database)     |

## Allow flows to call your services

The following two sections list the network configuration required for Power Automate to connect to services in your network. This configuration is needed only if you're restricting inbound or outbound IP addresses on your network (for example, through a firewall).

### Allow connector calls to your services

Power Automate flows are comprised of actions. Actions can utilize both *connector actions* and native actions such as 'HTTP' and 'HTTP + Swagger'. To enable *connector actions* to call services hosted in your network, allow traffic into your network from the **AzureConnectors** service tag.

### Allowlist 'HTTP' and 'HTTP + Swagger' calls to your services

For flows consisting of actions including 'HTTP' and 'HTTP + Swagger' actions, allow traffic from *all* the following service tags:

| Service tag | Required? |
|----------| :-------------: |
| **LogicApps** | yes |
|**PowerPlatformPlex** | yes |
|**PowerPlatformInfra** | yes |

:::image type="content" source="media/ip-address-configuration/http.png" alt-text="screenshot of HTTP actions.":::

## Allow users on your network to use Power Automate

This section contains information on providing your makers and users access to the build and use experiences within Power Automate.

### Use the Power Automate web portal

The Power Automate web portal is also known as the maker portal.

The following table lists the services to which Power Automate connects. Ensure none of these services is blocked on your network.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| login.microsoft.com<br />login.windows.net<br />login.microsoftonline.com<br />login.live.com<br />secure.aadcdn.microsoftonline-p.com | https | Access to authentication and authorization endpoints. |
| graph.microsoft.com | https | Access to Microsoft Graph for getting user information such as a profile photo. |
| *.azure-apim.net | https | Access to the Runtime for connectors. |
| *.azure-apihub.net | https | Access to the Runtime for connectors. |
| *.blob.core.windows.net | https | Location of exported flows. |
| *.flow.microsoft.com <br> *.logic.azure.com | https | Access to the Power Automate site. |
| *.powerautomate.com | https | Access to Power Automate site. |
| *.powerapps.com | https | Access to the Power Apps site. |
| *.azureedge.net | https | Access to Power Automate CDN (Content Delivery Network). |
| *.azurefd.net | https | Access to Power Automate CDN (Content Delivery Network). |
| *.microsoftcloud.com | https | Access to NPS (net promoter score). |
| *.ces.microsoftcloud.com<br/>config.centro.core.microsoft<br/>admin.microsoft.com<br/>petrol.office.microsoft.com<br/>oness.microsoft.com  | https  | Access to NPS (net promoter score) and surveys.  |
| config.edge.skype.com  |  https  | Retrieve feature flags for Power Automate.  |
| res.cdn.office.net  |  https  |  Provide stock images to use in your app.  |
| webshell.suite.office.com | https | Access to Office for header and search. Learn more in [Office 365 URLs and ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide#microsoft-365-common-and-office-online&preserve-view=true). |
| *.dynamics.com | https | Access to Dataverse tables. |
|go.microsoft.com|https|Access to the Power Automate to check for updates.|
|download.microsoft.com|https|Access to the Power Automate to check for updates.|
|login.partner.microsoftonline.cn|https|Access to the Power Automate for desktop cloud discovery.|
|s2s.config.skype.com<br>use.config.skype.com<br>config.edge.skype.com|https|Access to preview features managed through flighting and configuration endpoints.|
|s2s.config.ecs.infra.gov.teams.microsoft.us|https|Access to preview features managed through flighting and configuration endpoints for US government cloud.|
| \*.api.powerplatform.com <br> \*.api.powerplatformusercontent.com <br> *.api.bap.microsoft.com <br> *.logic.azure.com | https | Access to several Power Platform APIs. |
| *.api.gov.powerplatform.microsoft.us <br> *.gov.api.bap.microsoft.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - GCC only). |
| *.api.high.powerplatform.microsoft.us <br> *.high.api.bap.microsoft.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - GCC High only). |
| *.api.appsplatform.us <br> *.api.bap.appsplatform.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - DoD only). |
| *.api.powerplatform.partner.microsoftonline.cn <br> *.api.bap.partner.microsoftonline.cn <br> *.logic.azure.cn | https | Access to several Power Platform APIs (21Vianet - China only). |
| *.safelink.emails.azure.net | https | Links in emails from Power Automate. |

### Allow users on your network to use Power Automate mobile app

The following table lists additional endpoints you need when using Power Automate mobile app.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| *.events.data.microsoft.com   | https   | Send telemetry for all production regions and supported US sovereign clouds from the mobile app. |
| collector.azure.cn   | https  |  Send telemetry for the Mooncake region from the mobile app. |
| officeapps.live.com   | https   | Access to authentication and authorization endpoints for the mobile app.

### Allow users on your network to use "When an HTTP request is received" trigger

We recommend allowlisting the list of domains in the [Use the Power Automate web portal](#use-the-power-automate-web-portal) section to ensure your makers and admins can take advantage of the Power Automate services. For customers looking to narrowly allow network traffic to support the `When an HTTP request is received` trigger, allowlist the following domains in your firewall's outbound configuration.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| \*.api.powerplatform.com <br> *.logic.azure.com | https | Access to several Power Platform APIs. |
| *.api.gov.powerplatform.microsoft.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - GCC only). |
| *.api.high.powerplatform.microsoft.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - GCC High only). |
| *.api.appsplatform.us <br> *.logic.azure.us | https | Access to several Power Platform APIs (U.S. Government - DoD only). |
| *.api.powerplatform.partner.microsoftonline.cn <br> *.logic.azure.cn | https | Access to several Power Platform APIs (21Vianet - China only). |

### Allow machines & users on your network to access Power Automate desktop services

The following table lists endpoint data requirements for connectivity from a user's machine for desktop flows runs. Ensure that you authorize global endpoints and the endpoints corresponding to your cloud.

#### Global endpoints for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| server.events.data.microsoft.com|https|Handles telemetry for users outside EMEA, US government, and Chinese clouds. Works as the fallback telemetry endpoint.|
| msedgedriver.azureedge.net<br>chromedriver.storage.googleapis.com | https | Access to desktop flows WebDriver downloaders. WebDriver is used to automate your browser (Microsoft Edge and Google Chrome).|

#### Global endpoints for Power Automate for desktop MSI installer

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| aka.ms|https| Used to determine the latest version of the .NET 8 installer. |
| builds.dotnet.microsoft.com|https| Downloads the .NET 8 runtime if it isn't already installed on the machine. |

#### Public endpoints for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| ocsp.digicert.com<br>ocsp.msocsp.com<br>mscrl.microsoft.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for the public cloud.<br>Needed when connecting through the on-premises data gateway.|
| \*.servicebus.windows.net | https | Listens on Service Bus Relay over TCP.<br>Needed for machine connectivity. |
|\*.gateway.prod.island.powerapps.com | https | Needed for machine connectivity. |
| emea.events.data.microsoft.com|https| Handles telemetry for EMEA users.|
| *.api.powerplatform.com | https | Access to several Power Platform APIs (mandatory for cloud connectors utilization in desktop flows). |
| *.dynamics.com | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(also valid for GCC). |

> [!NOTE]
> If you don’t want to allow the public endpoint **\*.servicebus.windows.net**, you can allow the list of namespaces individually. Learn more about namespace endpoints in [Allowlist of namespaces endpoints required for desktop flows runtime](limits-and-config.md#allowlist-of-namespaces-endpoints-required-for-desktop-flows-runtime).

#### Public endpoints for hosted machines and hosted machine groups

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| go.microsoft.com | https | Required for downloading the Power Automate for desktop installer during provisioning. |
| enterpriseregistration.windows.net | https | Required for joining machines to Microsoft Entra. |
| device.login.microsoftonline.com | https | Required for joining machines to Microsoft Entra. |
| login.microsoftonline.com | https | Required for joining machines to Microsoft Entra. |

> [!NOTE]
> You must also configure all endpoints listed in the [desktop flows runtime](#public-endpoints-for-desktop-flows-runtime) and [desktop MSI installer](#global-endpoints-for-power-automate-for-desktop-msi-installer) sections in addition to these endpoints.

#### US Government endpoints for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
|ocsp.digicert.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for US government cloud.<br>Needed when connecting through the on-premises data gateway.|
| *.servicebus.usgovcloudapi.net | https | Listens on Service Bus Relay for US government cloud.<br>Needed for machine connectivity. |
| \*.gateway.gov.island.powerapps.us | https | Needed for machine connectivity for US government cloud (GCC and GCCH). |
| \*.gateway.gov.island.appsplatform.us | https | Needed for machine connectivity for US government cloud (DOD). |
|tb.events.data.microsoft.com|https|Handles telemetry for US government users.|
| *.api.gov.powerplatform.microsoft.us | https | Access to several Power Platform APIs (mandatory for cloud connector action in desktop flows) (US Government - GCC only). |
| *.api.high.powerplatform.microsoft.us | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (US Government - GCC High only). |
| *.api.appsplatform.us | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (US Government - DoD only). |
| *.microsoftdynamics.us | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(US Government - GCC High only). |
| *.crm.appsplatform.us | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(US Government - DoD only). |
| *.dynamics.com | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(also valid for public clouds). |

#### 21Vianet endpoints (China) for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
|crl.digicert.cn<br>ocsp.digicert.cn | http | Access to the CRL servers for 21Vianet operated cloud.<br>Needed when connecting through the on-premises data gateway.|
|apac.events.data.microsoft.com|https|Handles telemetry for users in China.|
| \*.gateway.mooncake.island.powerapps.cn | https | Needed for machine connectivity (21Vianet - China only). |
| *.api.powerplatform.partner.microsoftonline.cn | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (21Vianet - China only). |
| *.dynamics.cn | https | Access to Dataverse tables (DesktopFlow modules feature)(21Vianet - China only). |
| *.api.powerautomate.cn | https | Access to Power Automate (21Vianet - China only). |

## Other IP address articles

### Approval email delivery

Learn more about approvals email routing in [Power Automate approval email delivery information](/troubleshoot/power-platform/power-automate/approvals/power-automate-approval-email-information).

### Azure SQL database

If you need to authorize IP addresses for your Azure SQL database, use the [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

## Common issues with IP allowlisting

### My flow fails with a connection timeout after I configured the firewall

- Verify you allowlisted the **outbound** IPs (the IPs Power Automate calls FROM), not the inbound IPs.
- Check that you included IP ranges for the correct Azure region. If you recently migrated your environment, the region may have changed.
- Some connectors use their own IP ranges separate from the general Power Automate ranges. See [Allow connector calls to your services](#allow-connector-calls-to-your-services).

### I allowlisted the IPs but they changed

Azure IP ranges are updated weekly. Subscribe to the [Azure IP Ranges and Service Tags change notifications](https://www.microsoft.com/download/details.aspx?id=56519) to be notified of updates. When possible, use **Azure Service Tags** instead of individual IP addresses in your firewall rules -- service tags are updated automatically.

Available service tags for Power Automate:
- `PowerPlatformInfra` -- Power Platform infrastructure (recommended for broad allowlisting)
- `AzureConnectors` -- Managed connector outbound IPs

### Desktop flows fail through our proxy server

Desktop flow agents need to reach several Microsoft endpoints over HTTPS (port 443). Ensure your proxy allows traffic to:
- `*.servicebus.windows.net` (agent communication relay)
- `*.powerautomate.com` (flow service)
- `*.microsoftonline.com` (authentication)

If your proxy performs TLS inspection, you may need to add exceptions for these endpoints. See [Allow machines & users on your network to access Power Automate desktop services](#allow-machines--users-on-your-network-to-access-power-automate-desktop-services) for the complete list.

## Related information

- [Azure service tags](/azure/virtual-network/service-tags-overview)
- [Power Platform URLs and IP address ranges](/power-platform/admin/online-requirements)

[!INCLUDE[footer-include](includes/footer-banner.md)]
