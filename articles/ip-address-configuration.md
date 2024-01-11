---
title: IP address configuration
description: Learn about IP address configuration, the services that Power Automate connect to, various endpoints, and more.
author: masisley
contributors:
  - v-aangie
  - jpapadimitriou
  - whiver
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/17/2023
ms.author: laumar
ms.reviewer: angieandrews
---

# IP address configuration

The [IP addresses](/connectors/common/outbound-ip-addresses#power-platform) from which Power Automate requests are sent depend on the [region](regions-overview.md) where the [environment](environments-overview-admin.md) that contains the flow is located. We don't currently publish FQDNs available for flow scenarios.

Some calls a cloud flow makes may come from IP addresses that are listed in the [Azure Logic Apps](/azure/logic-apps/logic-apps-limits-and-config#firewall-configuration-ip-addresses-and-service-tags) documentation. Some examples of these calls include HTTP or HTTP + OpenAPI.

You should also consult the [Limits and Configuration](limits-and-config.md) article for a supplemental listing for known IP addresses that Power Automate uses.

> [!NOTE]
> If you're restricting inbound or outbound IP addresses on your network (for example, through a firewall), to ensure flows continue to work, update your network configuration to allow both the [IP addresses for Azure Logic Apps](/azure/logic-apps/logic-apps-limits-and-config#firewall-ip-configuration) and the [IP addresses for managed connectors](/connectors/common/outbound-ip-addresses) in the supported regions. To learn more, go to [Azure Logic Apps - Set up zone redundancy with availability zones](/azure/logic-apps/set-up-zone-redundancy-availability-zones).

## Logic Apps

Calls made from a cloud flow go directly through the Azure Logic Apps service. Some examples of these calls include HTTP or HTTP + Open API. To learn which IP addresses are used by that service, go to the [Logic Apps documentation](/azure/logic-apps/logic-apps-limits-and-config#firewall-configuration-ip-addresses-and-service-tags).

## Connectors

Calls made from a connector in a cloud flow (for example, the SQL API or the SharePoint API) come from these [IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

If you must authorize IP addresses for your Azure SQL database, you should use these addresses.

## Required services

The following table lists the services to which Power Automate connects. Ensure none of these services is blocked on your network.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| management.azure.com | https | Access to the Azure Resource Manager. |
| login.microsoft.com<br />login.windows.net<br />login.microsoftonline.com<br />login.live.com<br />secure.aadcdn.microsoftonline-p.com | https | Access to authentication and authorization endpoints. |
| graph.microsoft.com | https | Access to Microsoft graph - for getting user information such as a profile photo. |
| *.azure-apim.net | https | Access to the Runtime for Connectors. |
| *.flow.microsoft.com <br> *.logic.azure.com | https | Access to the Power Automate site. |
| *.powerautomate.com | https | Access to Power Automate site. |
| *.powerapps.com | https | Access to the Power Apps site. |
| *.azureedge.net | https | Access to the Power Automate CDN. |
| *.microsoftcloud.com | https | Access to NPS (Net Promoter Score). |
| webshell.suite.office.com | https | Access to Office for header and search. Refer to [the Office 365 urls and ranges](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) for more details. |
| *.dynamics.com | https | Access to Dataverse tables |
|go.microsoft.com|https|Access to the Power Automate to check for updates|
|download.microsoft.com|https|Access to the Power Automate to check for updates|
|login.partner.microsoftonline.cn|https|Access to the Power Automate for desktop cloud discovery|
|s2s.config.skype.com<br>use.config.skype.com|https|Access to preview features managed through flighting and configuration endpoints.|
|s2s.config.ecs.infra.gov.teams.microsoft.us|https|Access to preview features managed through flighting and configuration endpoints for US government cloud.|
| *.api.bap.microsoft.com | https | Access to several Business App Platform APIs. |
| *.api.bap.microsoft.us | https | Access to several Business App Platform APIs (U.S. Government only). |
| *.api.bap.appsplatform.us | https | Access to several Business App Platform APIs (U.S. Government - DoD only). |
| *.api.bap.partner.microsoftonline.cn | https | Access to several Business App Platform APIs (21Vinaet - China only). |
| *.api.powerplatform.com | https | Access to several Power Platform APIs. |
| *.api.gov.powerplatform.microsoft.us | https | Access to several Power Platform APIs (U.S. Government - GCC only). |
| *.api.high.powerplatform.microsoft.us | https | Access to several Power Platform APIs (U.S. Government - GCC High only). |
| *.api.appsplatform.us | https | Access to several Power Platform APIs (U.S. Government - DoD only). |
| *.api.powerplatform.partner.microsoftonline.cn | https | Access to several Power Platform APIs (21Vinaet - China only). |

### Endpoints needed to use Power Automate mobile app

The following table lists the additional endpoints you need when using Power Automate mobile app.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| *mobile.events.data.microsoft.com   | https   | Send telemetry for all production regions and supported US sovereign clouds from the mobile app. |
| collector.azure.cn   | https  |  Send telemetry for the Mooncake region from the mobile app. |
| officeapps.live.com   | https   | Access to authentication and authorization endpoints for the mobile app.

## Approval email delivery

Refer to the [approvals email delivery article](https://go.microsoft.com/fwlink/?linkid=2128304) for details about approvals email routing.

## Desktop flows services required for runtime

The following table lists endpoint data requirements for connectivity from a user's machine for desktop flows runs. You need to ensure that you authorize Global endpoints and the endpoints corresponding to your cloud.

### Global endpoints

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| server.events.data.microsoft.com|https|Handles telemetry for users outside EMEA, U.S. government, and Chinese clouds. Works as the fallback telemetry endpoint.|
| msedgedriver.azureedge.net<br>chromedriver.storage.googleapis.com | https | Access to desktop flows WebDriver downloaders. WebDriver is used to automate your browser (Microsoft Edge and Google Chrome).|

> [!NOTE]
> If you don’t want to allow the public endpoint **\*.servicebus.windows.net**, you can allow the list of namespaces individually. To learn more about namespace endpoints, go to [Allow list of namespaces endpoints required for runtime](limits-and-config.md#allowlist-of-namespaces-endpoints-required-for-runtime).

### Public endpoints

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
| ocsp.digicert.com<br>ocsp.msocsp.com<br>mscrl.microsoft.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for the public cloud.<br>Needed when connecting through the on-premises data gateway.|
| \*.servicebus.windows.net | https | Listens on Service Bus Relay over TCP.<br>Needed for machine connectivity. |
|\*.gateway.prod.island.powerapps.com | https | Needed for machine connectivity. |
| emea.events.data.microsoft.com|https| Handles telemetry for EMEA users.|
| *.api.powerplatform.com | https | Access to several Power Platform APIs (mandatory for cloud connectors utilization in desktop flows). |
| *.dynamics.com | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(also valid for GCC). |

### U.S. Government endpoints

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
|ocsp.digicert.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for US government cloud.<br>Needed when connecting through the on-premises data gateway.|
| *.servicebus.usgovcloudapi.net | https | Listens on Service Bus Relay for US government cloud.<br>Needed for machine connectivity. |
| \*.gateway.gov.island.powerapps.us | https | Needed for machine connectivity for US government cloud (GCC and GCCH). |
| \*.gateway.gov.island.appsplatform.us | https | Needed for machine connectivity for US government cloud (DOD). |
|tb.events.data.microsoft.com|https|Handles telemetry for U.S. government users.|
| *.api.gov.powerplatform.microsoft.us | https | Access to several Power Platform APIs (mandatory for cloud connector action in desktop flows) (U.S. Government - GCC only). |
| *.api.high.powerplatform.microsoft.us | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (U.S. Government - GCC High only). |
| *.api.appsplatform.us | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (U.S. Government - DoD only). |
| *.microsoftdynamics.us | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(U.S. Government - GCC High only). |
| *.crm.appsplatform.us | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(U.S. Government - DoD only). |
| *.dynamics.com | https | Access to Dataverse tables (mandatory for custom actions in desktop flows)(also valid for public clouds). |

### 21Vinaet endpoints (China)

| Domains | Protocols | Uses |
| ------- |  -------- | ---- |
|crl.digicert.cn<br>ocsp.digicert.cn | http | Access to the CRL servers for 21Vianet operated cloud.<br>Needed when connecting through the on-premises data gateway.|
|apac.events.data.microsoft.com|https|Handles telemetry for users in China.|
| *.api.powerplatform.partner.microsoftonline.cn | https | Access to several Power Platform APIs (mandatory for cloud connector actions in desktop flows) (21Vinaet - China only). |
| *.dynamics.cn | https | Access to Dataverse tables (DesktopFlow modules feature)(21Vinaet - China only). |

[!INCLUDE[footer-include](includes/footer-banner.md)]
