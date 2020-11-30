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
ms.service: flow
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
> Some calls a flow makes may come from IP addresses that are listed in the [Logic apps](https://docs.microsoft.com/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) documentation. Some examples of these calls include HTTP or HTTP + OpenAPI.

## Logic Apps
Calls made from a flow go directly through the Azure Logic App service. Some examples of these calls include HTTP or HTTP + Open API. Please reference [the Logic apps documentation](https://docs.microsoft.com/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) for which IP addresses are used by that service.

## Connectors

Calls made from a connector in a flow will come from the IP addresses listed here:

Region | Outbound IP addresses
-------|--------------------
| Asia | 13.75.113.224, 52.187.147.27, 52.175.23.169, 52.187.68.19, 13.75.36.64 - 13.75.36.79, 104.214.164.0 - 104.214.164.31, 13.67.8.240 - 13.67.8.255, 13.67.15.32 - 13.67.15.63 |
| Australia  | 13.75.139.0, 13.77.45.34, 13.72.243.10, 13.70.136.174, 13.70.72.192 - 13.70.72.207, 13.70.78.224 - 13.70.78.255, 13.77.50.240 - 13.77.50.255, 13.77.55.160 - 13.77.55.191 |
| Brazil | 191.234.180.112, 104.214.107.148, 104.41.59.51, 191.233.203.192 - 191.233.203.207, 191.233.207.160 - 191.233.207.191 |
| Canada | 52.242.36.40, 40.85.206.95, 52.237.24.126, 52.242.35.152, 40.69.106.240 - 40.69.106.255, 40.69.111.0 - 40.69.111.31, 13.71.170.208 - 13.71.170.223, 13.71.175.160 - 13.71.175.191|
| Europe | 52.169.216.196, 40.89.131.3, 52.174.180.160, 52.178.150.68, 94.245.91.93, 52.174.88.118, 40.91.208.65, 137.117.161.181, 13.69.171.0, 13.69.227.208 - 13.69.227.223, 13.69.231.192 - 13.69.231.223, 13.69.64.208 - 13.69.64.223, 13.69.71.192 - 13.69.71.223 |
| France  | 40.89.155.59, 40.89.135.2, 52.136.133.184, 40.79.130.208 - 40.79.130.223, 40.79.148.96 - 40.79.148.127, 40.79.178.240 - 40.79.178.255, 40.79.180.224 - 40.79.180.255 |
| Germany  | 51.116.158.96, 51.116.211.212, 51.116.236.78, 51.116.155.80 - 51.116.155.95, 51.116.158.96 - 51.116.158.127, 51.116.59.16 - 51.116.59.31, 51.116.60.192 - 51.116.60.223 |
| India  | 13.71.127.169, 13.71.30.211, 52.172.211.12, 13.71.125.22, 104.211.189.218, 20.192.184.32 - 20.192.184.63, 40.78.194.240 - 40.78.194.255, 20.38.128.224 - 20.38.128.255, 104.211.146.224 - 104.211.146.239, 20.43.123.0 - 20.43.123.31, 104.211.81.192 - 104.211.81.207 |
| Japan | 104.215.28.128, 13.71.128.159, 13.71.153.19, 104.215.61.248, 40.74.100.224 - 40.74.100.239, 40.80.180.64 - 40.80.180.95, 13.78.108.0 - 13.78.108.15, 40.79.189.64 - 40.79.189.95 |
| Switzerland | 51.103.143.163, 51.107.86.217, 51.107.231.190, 51.107.59.16 - 51.107.59.31, 51.107.60.224 - 51.107.60.255, 51.107.155.16 - 51.107.155.31, 51.107.156.224 - 51.107.156.255 |
| United Arab Emirates | 20.45.67.36, 20.45.67.28, 20.37.74.192 - 20.37.74.207, 40.120.8.0 - 40.120.8.31 |
| United Kingdom | 51.140.77.227, 51.140.245.29, 51.140.80.51, 51.140.61.124, 51.141.47.105, 51.141.124.13, 51.105.77.96 - 51.105.77.127, 51.140.148.0 - 51.140.148.15, 51.140.211.0 - 51.140.211.15, 51.140.212.224 - 51.140.212.255  |
| United States | 104.41.132.180, 13.91.93.63, 52.173.245.164, 40.71.249.205, 40.114.40.132, 52.232.188.154, 104.209.247.23, 52.162.242.161, 104.42.122.49, 40.112.195.87, 13.91.97.196, 40.71.193.203, 104.210.14.156, 13.66.130.243, 65.52.197.64, 40.113.242.246, 40.71.11.80 - 40.71.11.95, 40.71.15.160 - 40.71.15.191, 52.162.107.160 - 52.162.107.175, 52.162.111.192 - 52.162.111.223, 13.89.171.80 - 13.89.171.95, 13.89.178.64 - 13.89.178.95, 40.70.146.208 - 40.70.146.223, 40.70.151.96 - 40.70.151.127, 13.86.223.32 - 13.86.223.63, 40.112.243.160 - 40.112.243.175 |
| Preview (United States)  | 13.78.178.187, 52.151.42.172, 52.161.102.22, 13.78.132.82, 52.183.78.157, 13.71.195.32 - 13.71.195.47, 13.71.199.192 - 13.71.199.223, 13.66.140.128 - 13.66.140.143, 13.66.145.96 - 13.66.145.127 |
|United States Government (GCC)|20.140.137.128 - 20.140.137.159, 52.127.5.224 - 52.127.5.255, 127.0.0.1|
|Department of Defense (DoD) in Azure Government|52.127.61.192 - 52.127.61.223, 127.0.0.1|

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
| webshell.suite.office.com | https | Access to Office for header and search. Please see [the Office 365 urls and ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) for more details. |

## Approval email delivery
Please see the [approvals email delivery article](https://go.microsoft.com/fwlink/?linkid=2128304) for details about approvals email routing.

## UI flows required services
The following table lists endpoint data requirements for connectivity from a user's machine for a successful UI flows installation and runs.

| Endpoint type | Domains | Protocols | Uses |
| ------------- | ------- |  -------- | ---- |
| Worldwide endpoints|ocsp.digicert.com<br>ocsp.msocsp.com<br>mscrl.microsoft.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for the public cloud. |
| U.S. Government GCC and GCC High endpoints|ocsp.digicert.com<br>crl3.digicert.com<br>crl4.digicert.com | http | Access to the CRL server for US government cloud. |
| 21Vianet operated endpoints|crl.digicert.cn<br>ocsp.digicert.cn | http | Access to the CRL servers for 21Vianet operated cloud. |
| All endpoints|msedgedriver.azureedge.net<br>chromedriver.storage.googleapis.com | https | Access to UI Flows WebDriver downloaders. |
