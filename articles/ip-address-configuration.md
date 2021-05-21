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
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/29/2020
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# IP address configuration
The IP address from which Power Automate requests are sent depends on the [region](regions-overview.md) where the [environment](environments-overview-admin.md) that contains the flow is located. We don't currently publish FQDNs available for flow scenarios.

>[!IMPORTANT]
> Some calls a cloud flow makes may come from IP addresses that are listed in the [Logic apps](/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) documentation. Some examples of these calls include HTTP or HTTP + OpenAPI.

You should also consult the [Limits and Configuration](limits-and-config.md) article for a supplemental listing for known IP addresses that Power Automate uses.

## Logic Apps
Calls made from a cloud flow go directly through the Azure Logic App service. Some examples of these calls include HTTP or HTTP + Open API. Please reference [the Logic apps documentation](/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) for which IP addresses are used by that service.

## Connectors
Calls made from a connector in a cloud flow (for example, the SQL API or the SharePoint API) will come from the IP addresses listed here:

| Region | Outbound IP |
| --- | --- |
| Asia Pacific | 13.75.36.64 - 13.75.36.79, 13.67.8.240 - 13.67.8.255, 52.175.23.169, 52.187.68.19 |
| Australia  | 13.70.72.192 - 13.70.72.207, 13.72.243.10, 13.77.50.240 - 13.77.50.255, 13.70.136.174 |
| Canada | 13.71.170.208 - 13.71.170.223, 13.71.170.224 - 13.71.170.239, 52.237.24.126, 40.69.106.240 - 40.69.106.255, 52.242.35.152 |
| Europe | 13.69.227.208 - 13.69.227.223, 52.178.150.68, 13.69.64.208 - 13.69.64.223, 52.174.88.118, 137.117.161.181 |
| Germany | 51.116.60.192, 51.116.158.97, 51.116.158.96, 51.116.211.212 and 51.116.236.78 |
| India  | 104.211.81.192 - 104.211.81.207, 52.172.211.12, 40.78.194.240 - 40.78.194.255, 13.71.125.22, 104.211.146.224 - 104.211.146.239, 104.211.189.218 |
| Japan | 13.78.108.0 - 13.78.108.15, 13.71.153.19, 40.74.100.224 - 40.74.100.239, 104.215.61.248 |
| South America | 191.233.203.192 - 191.233.203.207, 104.214.19.48 - 104.214.19.63, 13.65.86.57, 104.41.59.51 |
| United Arab Emirates | 40.120.8.0 - 40.120.8.31, 20.37.74.192 - 20.37.74.207, 20.45.67.28 |
| United Kingdom | 51.140.148.0 - 51.140.148.15, 51.140.80.51, 51.140.211.0 - 51.140.211.15, 51.141.47.105 |
| United States | 13.89.171.80 - 13.89.171.95, 52.173.245.164, 40.71.11.80 - 40.71.11.95, 40.71.249.205, 40.70.146.208 - 40.70.146.223, 52.232.188.154, 52.162.107.160 - 52.162.107.175, 52.162.242.161, 40.112.243.160 - 40.112.243.175, 104.42.122.49 |
| Preview (United States)  | 13.71.195.32 - 13.71.195.47, 52.161.102.22, 13.66.140.128 - 13.66.140.143, 52.183.78.157 |

For example, if you must authorize IP addresses for your Azure SQL database, you should use these addresses.

## Required services
The following table lists the services to which Power Automate connects. Ensure none of these services are blocked on your network.

| Domains | Protocols | Uses |
| --------|  ---------| ---- |
| management.azure.com | https | Access to the Azure Resource Manager. |
| login.microsoft.com<br />login.windows.net<br />login.microsoftonline.com<br />secure.aadcdn.microsoftonline-p.com | https | Access to Active Directory Authentication Library (ADAL). |
| graph.microsoft.com <br />graph.windows.net<br /> | https | Access to Azure AD Graph API - for getting user information such as a profile photo. |
| *.azure-apim.net | https | Access to the Runtime for Connectors. |
| *.flow.microsoft.com | https | Access to the Power Automate site. |
| *.powerapps.com | https | Access to the Power Apps site. |
| *.azureedge.net | https | Access to the Power Automate CDN. |
| nps.onyx.azure.net | https | Access to NPS (Net Promoter Score). |
| webshell.suite.office.com | https | Access to Office for header and search. Please see [the Office 365 urls and ranges](/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) for more details. |
| *.dynamics.com | https | Access to Dataverse tables |

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
| All endpoints| *.servicebus.windows.net | https | Listens on Service Bus Relay over TCP.<br>Needed for new machine connectivity (Preview). |


[!INCLUDE[footer-include](includes/footer-banner.md)]
