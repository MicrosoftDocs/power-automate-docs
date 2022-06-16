---
title: IP address configuration | Microsoft Docs
description: IP address configuration
services: ''
suite: flow
documentationcenter: na
author: masisley
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/27/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# IP address configuration

The [IP addresses](/connectors/common/outbound-ip-addresses#power-platform) from which Power Automate requests are sent depends on the [region](regions-overview.md) where the [environment](environments-overview-admin.md) that contains the flow is located. We don't currently publish FQDNs available for flow scenarios.

>[!IMPORTANT]
> Some calls a cloud flow makes may come from IP addresses that are listed in the [Logic apps](/azure/logic-apps/logic-apps-limits-and-config#firewall-configuration-ip-addresses-and-service-tags) documentation. Some examples of these calls include HTTP or HTTP + OpenAPI.

You should also consult the [Limits and Configuration](limits-and-config.md) article for a supplemental listing for known IP addresses that Power Automate uses.

>[!NOTE]
> Starting May 2022, Azure Logic Apps begins to enable availability zones in select regions for new Consumption logic apps. To support this capability, new IP addresses have been published for the Azure Logic Apps service and managed connectors. If you are restricting inbound or outbound IP addresses on your network (via a firewall, for example), to ensure flows continue to work after this date, update your network configuration to allow both the [IP addresses for Azure Logic Apps](/azure/logic-apps/logic-apps-limits-and-config#firewall-ip-configuration) and the [IP addresses for managed connectors](/connectors/common/outbound-ip-addresses) in the supported regions. For more information, see [Azure Logic Apps - Set up zone redundancy with availability zones](/azure/logic-apps/set-up-zone-redundancy-availability-zones).

## Logic Apps

Calls made from a cloud flow go directly through the Azure Logic App service. Some examples of these calls include HTTP or HTTP + Open API. Please reference [the Logic apps documentation](/azure/logic-apps/logic-apps-limits-and-config#firewall-configuration-ip-addresses-and-service-tags) for which IP addresses are used by that service.

## Connectors

Calls made from a connector in a cloud flow (for example, the SQL API or the SharePoint API) come from these [IP addresses](/connectors/common/outbound-ip-addresses#power-platform).

If you must authorize IP addresses for your Azure SQL database, you should use these addresses.

## Required services

The following table lists the services to which Power Automate connects. Ensure none of these services are blocked on your network.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| management.azure.com | https | Access to the Azure Resource Manager. |
| login.microsoft.com<br />login.windows.net<br />login.microsoftonline.com<br />login.live.com<br />secure.aadcdn.microsoftonline-p.com | https | Access to authentication and authorization endpoints. |
| graph.microsoft.com | https | Access to Microsoft graph - for getting user information such as a profile photo. |
| *.azure-apim.net | https | Access to the Runtime for Connectors. |
| *.flow.microsoft.com | https | Access to the Power Automate site. |
| *.powerautomate.com | https | Access to Power Automate site. |
| *.powerapps.com | https | Access to the Power Apps site. |
| *.azureedge.net | https | Access to the Power Automate CDN. |
| nps.onyx.azure.net | https | Access to NPS (Net Promoter Score). |
| webshell.suite.office.com | https | Access to Office for header and search. Please see [the Office 365 urls and ranges](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) for more details. |
| *.dynamics.com | https | Access to Dataverse tables |
|go.microsoft.com|https|Access to the Power Automate to check for updates|
|download.microsoft.com|https|Access to the Power Automate to check for updates|
|login.partner.microsoftonline.cn|https|Access to the Power Automate for desktop cloud discovery|

## Approval email delivery

Please see the [approvals email delivery article](https://go.microsoft.com/fwlink/?linkid=2128304) for details about approvals email routing.

## Desktop flows services required for runtime

The following table lists endpoint data requirements for connectivity from a user's machine for desktop flows runs.

| Endpoint type | Domains | Protocols | Uses |
| ------------- | ------- |  -------- | ---- |
| Worldwide endpoints|ocsp.digicert.com<br>ocsp.msocsp.com<br>mscrl.microsoft.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for the public cloud.<br>Needed when connecting through the on-premises data gateway.|
| U.S. Government GCC and GCC High endpoints|ocsp.digicert.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for US government cloud.<br>Needed when connecting through the on-premises data gateway.|
| 21Vianet operated endpoints|crl.digicert.cn<br>ocsp.digicert.cn | http | Access to the CRL servers for 21Vianet operated cloud.<br>Needed when connecting through the on-premises data gateway.|
| All endpoints|msedgedriver.azureedge.net<br>chromedriver.storage.googleapis.com | https | Access to UI Flows WebDriver downloaders. |
| Worldwide endpoints| *.servicebus.windows.net | https | Listens on Service Bus Relay over TCP.<br>Needed for new machine connectivity. |
| U.S. Goverment endpoints| *.servicebus.usgovcloudapi.net | https | Listens on Service Bus Relay for US government cloud.<br>Needed for new machine connectivity. |
|Worldwide telemetry endpoints|server.events.data.microsoft.com|https|Handles telemetry for users outside EMEA, US Government, and Chinese clouds. Works as the fallback telemetry endpoint.|
|EMEA telemetry endpoints|emea.events.data.microsoft.com|https|Handles telemetry for EMEA users.|
|U.S. Government telemetry endpoints|tb.events.data.microsoft.com|https|Handles telemetry for U.S. Government users.|
|Chinese telemetry endpoints|apac.events.data.microsoft.com|https|Handles telemetry for users in China.|

[!INCLUDE[footer-include](includes/footer-banner.md)]
