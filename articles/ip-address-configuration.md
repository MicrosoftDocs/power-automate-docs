---
title: IP address configuration
description: Learn about IP address configuration, the services that Power Automate connect to, various endpoints, and more.
author: samathur
contributors:
  - samathur
  - ChrisGarty
  - GiovanniBenitez
  - DBEKI
  - GiovanniBenitez
  - nnyarbro
  - v-aangie
  - jpapadimitriou
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 01/15/2025
ms.author: samathur
ms.reviewer: angieandrews
---

# IP address configuration

The [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform) from which Power Automate requests are sent depend on the [region](regions-overview.md) location of the [environment](environments-overview-admin.md) that contains the flow. FQDNs (fully qualified domain names) aren't published for flow scenarios.

The simplest mechanism to configure a firewall to allow Power Automate cloud flows to call external services through [connectors](/connectors/overview) is to use [Azure service tags](/azure/virtual-network/service-tags-overview). The primary service tag for Logic Apps connectors is **AzureConnectors**, as described in [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

## Logic Apps and connectors for cloud flows runtime

Calls made from a cloud flow go directly through the Azure Logic Apps service. Some examples of these calls include HTTP or HTTP + OpenAPI.

Learn which IP addresses are used by that service in [Azure Logic Apps documentation](/azure/logic-apps/logic-apps-limits-and-config#firewall-configuration-ip-addresses-and-service-tags).

If you're restricting inbound or outbound IP addresses on your network (for example, through a firewall), to ensure flows continue to work, update your network configuration to allow both the [IP addresses for Azure Logic Apps](/azure/logic-apps/logic-apps-limits-and-config#firewall-ip-configuration) and the [IP addresses for managed connectors](/connectors/common/outbound-ip-addresses) in the supported regions. Learn more in [Azure Logic Apps - Set up zone redundancy with availability zones](/azure/logic-apps/set-up-zone-redundancy-availability-zones). In order to automate the process of firewall or configuration updates, you can leverage the Azure IP range downloadable JSON file in the Download Center: [Downloadable IP](https://www.microsoft.com/download/details.aspx?id=56519)

## Required endpoints for Power Automate service

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
| *.azureedge.net | https | Access to Power Automate CDN. |
| *.azurefd.net | https | Access to Power Automate CDN. |
| *.microsoftcloud.com | https | Access to NPS (Net Promoter Score). |
| webshell.suite.office.com | https | Access to Office for header and search. Learn more in [Office 365 URLs and ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide#microsoft-365-common-and-office-online&preserve-view=true). |
| *.dynamics.com | https | Access to Dataverse tables |
|go.microsoft.com|https|Access to the Power Automate to check for updates|
|download.microsoft.com|https|Access to the Power Automate to check for updates|
|login.partner.microsoftonline.cn|https|Access to the Power Automate for desktop cloud discovery|
|s2s.config.skype.com<br>use.config.skype.com<br>config.edge.skype.com|https|Access to preview features managed through flighting and configuration endpoints.|
|s2s.config.ecs.infra.gov.teams.microsoft.us|https|Access to preview features managed through flighting and configuration endpoints for US government cloud.|
| \*.api.powerplatform.com <br> \*.api.powerplatformusercontent.com <br> *.api.bap.microsoft.com | https | Access to several Power Platform APIs. |
| *.api.gov.powerplatform.microsoft.us <br> *.gov.api.bap.microsoft.us | https | Access to several Power Platform APIs (U.S. Government - GCC only). |
| *.api.high.powerplatform.microsoft.us <br> *.high.api.bap.microsoft.us | https | Access to several Power Platform APIs (U.S. Government - GCC High only). |
| *.api.appsplatform.us <br> *.api.bap.appsplatform.us | https | Access to several Power Platform APIs (U.S. Government - DoD only). |
| *.api.powerplatform.partner.microsoftonline.cn <br> *.api.bap.partner.microsoftonline.cn | https | Access to several Power Platform APIs (21Vinaet - China only). |

### Endpoints needed to use Power Automate mobile app

The following table lists the additional endpoints you need when using Power Automate mobile app.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| *.events.data.microsoft.com   | https   | Send telemetry for all production regions and supported US sovereign clouds from the mobile app. |
| collector.azure.cn   | https  |  Send telemetry for the Mooncake region from the mobile app. |
| officeapps.live.com   | https   | Access to authentication and authorization endpoints for the mobile app.

## Services required for desktop flows runtime

The following table lists endpoint data requirements for connectivity from a user's machine for desktop flows runs. Ensure that you authorize Global endpoints and the endpoints corresponding to your cloud.

### Global endpoints for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| server.events.data.microsoft.com|https|Handles telemetry for users outside EMEA, US government, and Chinese clouds. Works as the fallback telemetry endpoint.|
| msedgedriver.azureedge.net<br>chromedriver.storage.googleapis.com | https | Access to desktop flows WebDriver downloaders. WebDriver is used to automate your browser (Microsoft Edge and Google Chrome).|

### Public endpoints for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| ocsp.digicert.com<br>ocsp.msocsp.com<br>mscrl.microsoft.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for the public cloud.<br>Needed when connecting through the on-premises data gateway.|
| \*.servicebus.windows.net | https | Listens on Service Bus Relay over TCP.<br>Needed for machine connectivity. |
|\*.gateway.prod.island.powerapps.com | https | Needed for machine connectivity. |
| emea.events.data.microsoft.com|https| Handles telemetry for EMEA users.|
| *.api.powerplatform.com | https | Access to several Power Platform APIs (mandatory for cloud connectors utilization in desktop flows). |
| *.dynamics.com | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(also valid for GCC). |

> [!NOTE]
> If you don’t want to allow the public endpoint **\*.servicebus.windows.net**, you can allow the list of namespaces individually. Learn more about namespace endpoints in [Allow list of namespaces endpoints required for desktop flows runtime](limits-and-config.md#allowlist-of-namespaces-endpoints-required-for-desktop-flows-runtime).

### US Government endpoints for desktop flows runtime

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

### 21Vinaet endpoints (China) for desktop flows runtime

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
|crl.digicert.cn<br>ocsp.digicert.cn | http | Access to the CRL servers for 21Vianet operated cloud.<br>Needed when connecting through the on-premises data gateway.|
|apac.events.data.microsoft.com|https|Handles telemetry for users in China.|
| *.api.powerplatform.partner.microsoftonline.cn | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (21Vinaet - China only). |
| *.dynamics.cn | https | Access to Dataverse tables (DesktopFlow modules feature)(21Vinaet - China only). |

## Other IP address articles

### Approval email delivery

Learn more about approvals email routing in the [approvals email delivery](https://go.microsoft.com/fwlink/?linkid=2128304) article.

### Azure SQL database

If you need to authorize IP addresses for your Azure SQL database, you should use the [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

## FAQ

### There are lots of details here&mdash;what's the high level recommendation for IP Address configuration?

The simplest mechanism to configure a firewall to allow Power Automate cloud flows to call external services through [connectors](/connectors/overview) is to use [Azure service tags](/azure/virtual-network/service-tags-overview). The primary service tag for Logic Apps connectors is **AzureConnectors**, as described in [Power Platform outbound IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

### If I'm using Azure Firewall, do I need to keep track of individual IP addresses?

You should use [Azure service tags](/azure/virtual-network/service-tags-overview). By using service tags in your network security group rules, you don't need to constantly monitor and manually update IP ranges for each service.

### If I'm using on-premises firewall, do I need to keep track of individual IP addresses?

You should use the [Service Tags with an on-premises firewall](/azure/virtual-network/service-tags-overview#service-tags-on-premises) so you don't need to monitor and manually update IP ranges. The [Service Tag Discovery API](/azure/virtual-network/service-tags-overview#use-the-service-tag-discovery-api) provides access to the latest IP address ranges associated with each service tag, enabling you to stay current with changes.

## Related information

- [Azure service tags](/azure/virtual-network/service-tags-overview)
- [Power Platform URLs and IP address ranges](/power-platform/admin/online-requirements)

[!INCLUDE[footer-include](includes/footer-banner.md)]
