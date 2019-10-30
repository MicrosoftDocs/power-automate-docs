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
ms.date: 05/30/2019
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Limits and configuration in Microsoft Flow
[!INCLUDE [view-pending-approvals](includes/cc-rebrand.md)]
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
| Run duration |30 days |Includes workflows with pending steps like approvals. After 30 days, any pending steps time-out. Timed-out approvals are removed from the approvals center. If someone attempts to approve a timed-out request, they’ll receive an error message. |
| Storage retention |30 days |This is from the run start time. |
| Min recurrence interval |1 minute | |
| Max recurrence interval |500 days | |
| Max run history retention |28 days, per GDPR rules. | |
|Minimum postpone interval - Free and Plan 1 license|5 seconds||
|Minimum postpone interval - Plan 2 license|1 second||

## Looping and debatching limits
These are limits for a single flow run.

| Name | Limit | Notes |
| --- | --- | --- |
| Apply to each items - Free license|5,000 |You can use the filter action to filter larger arrays as needed. |
| Apply to each items - Plan 1 and Plan 2 license|100,000 |You can use the filter action to filter larger arrays as needed. |
| Until iterations |5,000 | |
| SplitOn items - Free license |5,000 ||
| SplitOn items - Plan 1 and Plan 2 license |100,000 ||
| Apply to each Parallelism |50 |By default, loops run in sequence (essentially, parallelism is 1). You can configure up to 50 in parallel. |
| Actions executions per 5 minutes – Free, Office365, Plan 1 licenses, and trial plans | 2,000 | Also, you can distribute a workload across more than one flow as needed. |
|Actions executions per 5 minutes – Paid Plan 2 licenses|100,000|Also, you can distribute a workload across more than one flow as needed.|
|Actions executions per 5 minutes – Paid Plan 2 licenses|150,000|Also, you can distribute a workload across more than one flow as needed.|
| Actions concurrent outgoing calls - Free and Plan 1 license | ~500 | Reduce the number of concurrent requests or reduce the duration as needed. |
| Actions executions per 24 hours – Free, Office365, Plan 1 licenses, and trial plans | ~2,500 | Reduce the number of concurrent requests or reduce the duration as needed. | 

## Throughput limits

|Name|Limit|Notes|
|---|---|---|
|Runtime endpoint - Number of read calls allowed per 5 minutes - Free and Plan 1 license|6,000||
|Runtime endpoint - Number of read calls allowed per 5 minutes - Plan 2 license|60,000||
|Runtime endpoint: Invoke calls per 5 minutes - Free and Plan 1 license|4,500||
|Runtime endpoint: Number of invoke calls per 5 minutes - Plan 2 license|45,000||
|Amount of throughput allowed per 5 minutes - Free and Plan 1 license|600 MB||
|Amount of throughput allowed per 5 minutes - Plan 2 license|6 GB||
|Amount of content flows are allowed to produce (actions inputs/outputs) per hour - Free, Plan 1 and Plan 2 license|200 GB||


## Definition limits
These are limits for a single flow.

| Name | Limit | Notes |
| --- | --- | --- |
| Actions per workflow |250 |You can add nested workflows to extend this as needed. |
| Allowed action nesting depth |8 |You can add nested workflows to extend this as needed. |
| Max characters per expression |8,192 | |
| `action`/`trigger` name limit |80 | |
| `description` length limit |256 | |

## SharePoint limits
There are [limitations](https://powerapps.microsoft.com/tutorials/connection-sharepoint-online/) on how you can use Microsoft SharePoint with Microsoft Flow and PowerApps.

## IP address configuration
The IP address from which Microsoft Flow requests are sent depends on the [region](regions-overview.md) where the [environment](environments-overview-admin.md) that contains the flow is located. We don't currently publish FQDNs available for flow scenarios.

>[!IMPORTANT]
> Some calls a flow makes may come from IP addresses that are listed in the [Logic apps](https://docs.microsoft.com/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) documentation. Some examples of these calls include HTTP or HTTP + OpenAPI.

### Logic Apps
Calls made from a flow go directly through the Azure Logic App service. Some examples of these calls include HTTP or HTTP + OpenAPI. Please reference [the Logic apps documentation](https://docs.microsoft.com/azure/logic-apps/logic-apps-limits-and-config#configuration-ip-addresses) for which IP addresses are used by that service.

### Connectors
Calls made from a connector in a flow (for example, the SQL API or the SharePoint API) will come from the IP addresses listed here:

| Region | Outbound IP |
| --- | --- |
| Asia Pacific | 13.75.36.64 - 13.75.36.79, 13.67.8.240 - 13.67.8.255, 52.175.23.169, 52.187.68.19 |
| Australia  | 13.70.72.192 - 13.70.72.207, 13.72.243.10, 13.77.50.240 - 13.77.50.255, 13.70.136.174 |
| Canada | 13.71.170.208 - 13.71.170.223, 13.71.170.224 - 13.71.170.239, 52.237.24.126, 40.69.106.240 - 40.69.106.255, 52.242.35.152|
| Europe | 13.69.227.208 - 13.69.227.223, 52.178.150.68, 13.69.64.208 - 13.69.64.223, 52.174.88.118, 137.117.161.181 |
| India  | 104.211.81.192 - 104.211.81.207, 52.172.211.12, 40.78.194.240 - 40.78.194.255, 13.71.125.22, 104.211.146.224 - 104.211.146.239, 104.211.189.218 |
| Japan | 13.78.108.0 - 13.78.108.15, 13.71.153.19, 40.74.100.224 - 40.74.100.239, 104.215.61.248 |
| South America | 191.233.203.192 - 191.233.203.207, 104.214.19.48 - 104.214.19.63, 13.65.86.57, 104.41.59.51 |
| United Kingdom | 51.140.148.0 - 51.140.148.15, 51.140.80.51, 51.140.211.0 - 51.140.211.15, 51.141.47.105 |
| United States | 13.89.171.80 - 13.89.171.95, 52.173.245.164, 40.71.11.80 - 40.71.11.95, 40.71.249.205, 40.70.146.208 - 40.70.146.223, 52.232.188.154, 52.162.107.160 - 52.162.107.175, 52.162.242.161, 40.112.243.160 - 40.112.243.175, 104.42.122.49|
| Preview (United States)  | 13.71.195.32 - 13.71.195.47, 52.161.102.22, 13.66.140.128 - 13.66.140.143, 52.183.78.157 |

For example, if you must authorize IP addresses for your Azure SQL database, you should use these addresses.

### Required services
The following table lists the services to which Microsoft Flow connects. Ensure none of these services are blocked on your network.

Domains | Protocols | Uses
--------|  ---------| -----
management.azure.com|https|Access to the Azure Resource Manager.
login.microsoft.com</br>login.windows.net</br>login.microsoftonline.com</br>secure.aadcdn.microsoftonline-p.com|https|Access to Active Directory Authentication Library (ADAL).
graph.microsoft.com </br>graph.windows.net</br>|https|Access to Azure AD Graph API - for getting user information such as a profile photo.
*.azure-apim.net|https|Access to the Runtime for Connectors.
*.flow.microsoft.com|https|Access to the Microsoft Flow site.
*.powerapps.com|https|Access to the PowerApps site.
*.azureedge.net|https|Access to the Microsoft Flow CDN.
nps.onyx.azure.net|https|Access to NPS (Net Promoter Score).
