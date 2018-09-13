---
title: Limits and configuration | Microsoft Docs
description: Limits and configuration
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/19/2018
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Limits and configuration in Microsoft Flow
This topic contains information about the current limits and configuration details for flows.

## Request limits
These are limits for a single outgoing request.

### Timeout

| Name | Limit |
| --- | --- |
| Request Timeout for synchronous calls |120 Seconds |
| Request Timeout for Async calls|Configurable. Max is 30 days. |

### Message size

| Name | Limit | Notes |
| --- | --- | --- |
| Message size |100 MB |Not all APIs support the full 100MB. |
| Expression evaluation limit |131,072 characters |`@concat()`, `@base64()`, `string` can't exceed this limit. |

### Retry policy

| Name | Limit |
| --- | --- |
| Retry attempts |90 | The default is 4. To change the default use action settings | 
| Retry max delay |1 day | |
| Retry min delay |5 seconds | |

## Run duration and retention
These are the limits for a single flow run.

| Name | Limit | Notes |
| --- | --- | --- |
| Run duration |30 days |Includes workflows with pending steps like approvals. After 30 days, any pending steps time-out. Timed-out approvals are removed from the approvals center. If someone attemps to approve a timed-out request, they’ll receive an error message. |
| Storage retention |30 days |This is from the run start time. |
| Min recurrence interval |1 minute | |
| Max recurrence interval |500 days | |
| Max run history retention |28 days, per GDPR rules. | |

## Looping and debatching limits
These are limits for a single flow run.

| Name | Limit | Notes |
| --- | --- | --- |
| Apply to each items |100,000 |100,000 is only available for the premium plans. Otherwise, you are limited to 5,000. You can use the filter action to filter larger arrays as needed. |
| Until iterations |5,000 | |
| SplitOn items |100,000 |Like Apply to each, the limit is 5,000 unless you are on a premium plan. |
| Apply to each Parallelism |50 |By default, loops run in sequence (essentially, parallelism is 1). You can configure up to 50 in parallel. |
| Actions executions per 5 minutes | 100,000 | Also, you can distribute a workload across more than one flow as needed. |
| Actions concurrent outgoing calls | ~2,500 | Reduce the number of concurrent requests or reduce the duration as needed. | 

## Definition limits
These are limits for a single flow.

| Name | Limit | Notes |
| --- | --- | --- |
| Actions per workflow |250 |You can add nested workflows to extend this as needed. |
| Allowed action nesting depth |5 |You can add nested workflows to extend this as needed. |
| Max characters per expression |8,192 | |
| `action`/`trigger` name limit |80 | |
| `description` length limit |256 | |

## SharePoint limits
There are [limitations](https://powerapps.microsoft.com/tutorials/connection-sharepoint-online/) on how you can use Microsoft SharePoint with Microsoft Flow and PowerApps.

## IP address configuration
The IP address from which Microsoft Flow requests are sent depends on the [region](regions-overview.md) where the [environment](environments-overview-admin.md) that contains the flow is located. We don't currently publish FQDNs available for flow scenarios.

### Logic App Service
Calls made from a flow go directly through the Azure Logic App service. Some examples of these calls include HTTP or HTTP + OpenAPI. These calls come from the following IP addresses:

| Region | Outbound IP |
| --- | --- |
| Asia |168.63.200.173, 13.75.89.159, 23.97.68.172, 13.75.94.173, 40.83.127.19, 52.175.33.254, 52.163.93.214, 52.187.65.81, 52.187.65.155, 13.76.133.155, 52.163.228.93, 52.163.230.166 |
| Australia |13.75.153.66, 104.210.89.222, 104.210.89.244, 13.75.149.4, 104.210.91.55, 104.210.90.241, 13.73.115.153, 40.115.78.70, 40.115.78.237, 13.73.114.207, 13.77.3.139, 13.70.159.205 |
| Canada |52.233.29.92, 52.228.39.241, 52.228.39.244, 52.232.128.155, 52.229.120.45, 52.229.126.25 |
| Europe |13.79.173.49, 52.169.218.253, 52.169.220.174, 40.113.12.95, 52.178.165.215, 52.178.166.21, 13.95.155.53, 52.174.54.218, 52.174.49.6, 40.68.222.65, 40.68.209.23, 13.95.147.65 |
| India |52.172.157.194, 52.172.184.192, 52.172.191.194, 52.172.154.168, 52.172.186.159, 52.172.185.79, 52.172.9.47, 52.172.49.43, 52.172.51.140, 52.172.50.24, 52.172.55.231, 52.172.52.0 |
| Japan |13.71.146.140, 13.78.84.187, 13.78.62.130, 13.71.158.3, 13.73.4.207, 13.71.158.120, 40.74.140.173, 40.74.81.13, 40.74.85.215, 40.74.140.4, 104.214.137.243, 138.91.26.45 |
| United States |137.135.106.54, 40.117.99.79, 40.117.100.228, 13.92.98.111, 40.121.91.41, 40.114.82.191, 52.160.90.237, 138.91.188.137, 13.91.252.184, 52.160.92.112, 40.118.244.241, 40.118.241.243 |

### Services

> [!IMPORTANT]
>   If you have existing configurations, please update them as soon as possible before September 1, 2018 so they include and match the IP addresses in this list for the regions where your flows exist.

Calls made from an API connected through a flow (for example, the SQL API or the SharePoint API) will come from the IP address specified below:

| Region | Outbound IP |
| --- | --- |
| Asia |13.75.36.64 - 13.75.36.79, 13.67.8.240 - 13.67.8.255, 52.175.23.169, 52.187.68.19, 52.163.91.227, 52.163.89.40, 52.163.89.65, 52.163.95.29, 52.187.53.78, 13.75.89.9, 13.75.91.198, 13.75.92.202, 13.75.92.124, 23.97.72.250 |
| Australia |13.70.72.192 - 13.70.72.207, 13.72.243.10, 13.77.50.240 - 13.77.50.255, 13.70.136.174, 13.77.7.172, 13.70.191.49, 13.70.189.7, 13.70.187.251, 13.70.188.38, 13.70.82.210, 13.73.203.158, 13.73.207.42, 13.73.205.35, 13.70.88.23 |
| Brazil |191.233.203.192 - 191.233.203.207, 104.214.19.48 - 104.214.19.63, 13.65.86.57, 104.41.59.51 |
| Canada |13.71.170.208 - 13.71.170.223, 13.71.170.224 - 13.71.170.239, 52.237.24.126, 40.69.106.240 - 40.69.106.255, 52.242.35.152, 52.233.30.222, 52.233.30.148, 52.233.30.199, 52.233.29.254, 52.232.130.205, 52.229.126.118, 52.229.126.28, 52.229.123.56, 52.229.123.161, 52.233.27.68 |
| Europe |13.69.227.208 - 13.69.227.223, 52.178.150.68, 13.69.64.208 - 13.69.64.223, 52.174.88.118, 52.166.241.149, 52.166.244.232, 52.166.245.173, 52.166.243.169, 52.178.37.42, 40.69.45.126, 40.69.45.11, 40.69.45.93, 40.69.42.254, 52.164.249.26, 137.117.161.181 |
| India |104.211.81.192 - 104.211.81.207, 52.172.211.12, 40.78.194.240 - 40.78.194.255, 13.71.125.22, 104.211.146.224 - 104.211.146.239, 104.211.189.218, 52.172.54.172, 52.172.55.107, 52.172.55.84, 52.172.51.70, 52.172.49.180, 52.172.158.185, 52.172.159.100, 52.172.158.2, 52.172.155.245, 52.172.153.107 |
| Japan |13.78.108.0 - 13.78.108.15, 13.71.153.19, 40.74.100.224 - 40.74.100.239, 104.215.61.248, 104.214.137.186, 104.214.139.29, 104.214.140.23, 104.214.138.174, 104.214.151.229, 13.78.85.193, 13.78.84.73, 13.78.85.200, 13.78.86.229, 13.78.121.151 |
| United Kingdom |51.140.148.0 - 51.140.148.15, 51.140.80.51, 51.140.211.0 - 51.140.211.15, 51.141.47.105 |
| United States |13.89.171.80 - 13.89.171.95, 52.173.245.164, 40.71.11.80 - 40.71.11.95, 40.71.249.205, 40.70.146.208 - 40.70.146.223, 52.232.188.154, 52.162.107.160 - 52.162.107.175, 52.162.242.161, 40.112.243.160 - 40.112.243.175, 104.42.122.49, 104.43.232.28, 104.43.232.242, 104.43.235.249, 104.43.234.211, 40.78.144.221, 52.160.93.247, 52.160.91.66, 52.160.92.131, 52.160.95.100, 13.93.159.171, 40.117.101.91, 40.117.98.246, 40.117.101.120, 40.117.100.191, 23.96.11.216 |
| United States (Early Access) |13.71.195.32 - 13.71.195.47, 52.161.102.22, 13.66.140.128 - 13.66.140.143, 52.183.78.157, 52.161.26.191, 52.161.27.42, 52.161.29.40, 52.161.26.33, 52.161.31.35, 13.66.213.240, 13.66.214.51, 13.66.210.166, 13.66.213.29, 13.66.208.24 |

For example, if you must authorize IP addresses for your Azure SQL database, you should use these addresses.

The following table lists the services to which Microsoft Flow connects. Ensure none of these services are blocked on your network.

Domains | Protocols | Uses
--------|  ---------| -----
management.azure.com|https|Access to the Azure Resource Manager.
login.microsoft.com</br>login.windows.net</br>login.microsoftonline.com</br>secure.aadcdn.microsoftonline-p.com|https|Access to Active Directory Authentication Library (ADAL).
graph.microsoft.com </br>graph.windows.net</br>|https|Access to Azure AD Graph API - for getting user information such as a profile photo.
*.azure-apim.net|https|Access to the Runtime for Connectors.
*.flow.microsoft.com|https|Access to the Microsoft Flow site.
*.powerapps.com|https|Access to the PowerApps site.
psux.azureedge.net|https|Access to the Microsoft Flow CDN.
nps.onyx.azure.net|https|Access to NPS (Net Promoter Score).

