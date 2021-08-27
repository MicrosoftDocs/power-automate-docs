---
title: Limits and configuration | Microsoft Docs
description: Limits and configuration
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/07/2021
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Limits for automated, scheduled, and instant flows

This topic contains information about the current limits and configuration details for automated, scheduled, and instant flows.

>[!TIP]
>Check out the [pricing](https://flow.microsoft.com/pricing) for details on the different plans that are available.

## Performance profiles

Flows have different limits depending on their *performance profile*. There are five possible values, depending on the flow owner's plan.

| Performance profile | Plans |
|---------------------|-------|
| Low                 | - Free <br />- Microsoft 365 plans <br /> - Power Apps Plan 1, Per App plans <br /> - Power Automate Plan 1 <br /> - All license trials | 
| MediumLow1          | - Power Apps Plan 2, Power Apps per user plan <br />- Power Automate Plan 2, Power Automate per user, Power Automate per user with Attended RPA plans <br />- Dynamics 365 Team Member |
| MediumLow2          | - Dynamics 365 Enterprise plans, Dynamics 365 Professional plans<br /> - [Dynamics 365 non-licensed users, application users, users with special free licenses](/power-platform/admin/api-request-limits-allocations#non-licensed-usersapplication-usersusers-with-special-free-licenses) |
| Medium              | - Power Apps triggered flows, or child flows |
| High                | - Power Automate per flow plan |

If a user has multiple plans, such as a Microsoft 365 plan and a Dynamics 365 plan, the flow will have the performance profile of the higher of the two plans. For the exact set of plans that include Power Automate, see the Microsoft [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/p/?linkid=2085130).

If needed, users can see their current plan by opening the session debugging information by pressing Ctrl+Alt+A in the maker portal. The current plan being used will have isCurrent=true.

The flow uses the plan of the owner of a cloud flow. If a cloud flow has been shared with multiple people then generally the owner is the original creator. If unsure, you can see and change the owner a cloud flow using the [Web API](web-api.md). At this time, if the original owner leaves an organization, the flow will continue to use the same performance profile until next updated, although in the future, it may be reverted to the Low performance profile.

## Flow definition limits

Here are the limits for a single flow definition:

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Actions per workflow | 500 | To extend this limit, you can add child flows as needed. |
| Allowed nesting depth for actions | 8 | To extend this limit, you can add child flows as needed. |
| Switch scope cases limit | 25 | |
| Variables per workflow | 250 | |
| Name for `action` or `trigger` | 80 characters | |
| Characters per expression | 8,192 | |
| Length of `description` | 256 characters | |
| Maximum size for `trackedProperties` | 16,000 characters | |


## My flows limit

Here is the limit for the My flow and Team flows tab:

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Number of flows owned by a single user | 600 | To extend this limit, use flows under solutions. |


## Duration and retention limits

### Duration limits
Duration limits for a single flow run:

| Name | Limit | Notes |
|------|-------|-------|
| Run duration | 30 days |  Run duration is calculated by using a run's start time. Includes flows with pending steps like approvals. After 30 days, any pending steps time-out.|
| Run retention in storage | 30 days |  Run retention is calculated by using a run's start time. |
| Minimum recurrence interval | 60 seconds |
| Maximum recurrence interval | 500 days |
| Minimum postpone interval | 5 seconds for Low, 1 second for all others |

### Expiration limits
Limits on how long flows will remain turned on before they expire and get turned off

| Name                 | Limit   | Notes |
|----------------------|---------|-------|
| Flows with errors    | 14 days |  A cloud flow that has a trigger or actions which fail continuously will be turned off. Fix your trigger or actions and turn on the  flow. |
| Not triggered (dormant) flows | 90 days for Free, Trial, Community and Microsoft 365 Plans.No expiration limit for all others | A cloud flow that has no successful triggers will expire and be turned off. After 90 days of inactivity, the flow creator will receive an email. If no action is taken in next 30 days, the flow will be systematically turned off and the creator will be notified in an email. For enterprise scenarios, we recommend you buy a standalone Power Automate license listed in [Pricing article](https://flow.microsoft.com/pricing) to ensure your flow isn’t turned off due to inactivity. You can turn your cloud flows back on anytime. |
| Consistently throttled flows | 14 days |A cloud flow that is consistently throttled for 14 days will be turned off. The flow creator will get an email when the flow starts throttling and when the flow is turned off. For enterprise scenarios, we recommend you buy a standalone Power Automate license listed in [Pricing article](https://flow.microsoft.com/pricing) to get higher action limits. You can turn your cloud flows back on anytime.|

## Concurrency, looping, and debatching limits

Here are the limits for a single flow run:

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Trigger concurrency | - Unlimited when the concurrency control is turned off <br />- 25 is the default limit when the concurrency control is turned on, which you can't undo after you enable concurrency. You can change the default to a value between 1 and 50 inclusively. | This limit describes the highest number of flow runs that can run at the same time, or in parallel. <br />**Note**: When concurrency is turned on, the SplitOn limit is reduced to 100 items for debatching arrays. |
| Maximum waiting runs | - Without concurrency, the minimum number of waiting runs is 1, while the maximum number is 50. <br />- With concurrency, the minimum number of waiting runs is 10 plus the number of concurrent runs (trigger concurrency). You can change the maximum number in the settings for the trigger under **Concurrency Control**. | This limit describes the highest number of flow runs that can wait to run when your flow is already running the maximum concurrent instances. |
| Apply to each array items | 5,000 for Low, 100,000 for all others | This limit describes the highest number of array items that a "apply to each" loop can process. <br />To filter larger arrays, you can use the query action. |
| Apply to each concurrency | 1 is the default limit. You can change the default to a value between 1 and 50 inclusively. | This limit is highest number of "apply to each" loop iterations that can run at the same time, or in parallel. |
| Split on items | - 5,000 for Low without trigger concurrency  <br />- 100,000 for all others without trigger concurrency <br />- 100 with trigger concurrency | For triggers that return an array, you can specify an expression that uses a 'SplitOn' property that splits or debatches array items into multiple workflow instances for processing, rather than use a "Foreach" loop. This expression references the array to use for creating and running a workflow instance for each array item. <br />**Note**: When concurrency is turned on, the Split on limit is reduced to 100 items. |
| Until iterations | - Default: 60 <br />- Maximum: 5,000 | |
| Paginated items | 5,000 for Low, 100,000 for all others | To process more items, trigger multiple flow runs over your data. |

## Throughput limits

Here are the time-bound limits for a single version of a cloud flow definition. These limits apply across all runs of the flow version, and are calculated on sliding windows.

If a cloud flow exceeds one of the limits, activity for the flow will be slowed and will automatically resume when the sliding window has activity below the limit. However, if a cloud flow consistently remains above the limits for 14 days, it will be turned off (see above duration limits). Be sure to monitor email for notifications about such flows. If a cloud flow consistently exceeds the limits, you will need to update the flow to remain below the limits to prevent it from being turned off.

>[!TIP]
>Because these limits are for a single version, if you update your flow it will reset these limits.

### Action request limits

There are limits to the number of *actions* a cloud flow can run. These runs are counted for all types of actions, including connector actions, HTTP actions, and built-in actions from initializing variables to a simple compose action. Both succeeded and failed actions count towards these limits. Additionally, retries and additional requests from pagination count as action runs. You can see the number of actions your flow has run by selecting **Analytics** from the flow details page and looking at the **Actions** tab.

| Name | Plan limit | Interim limit | Notes |
| ---- | ----- | ----- |----- |
| Actions per 5 minutes | 100,000 |n/a| Distribute the workload across more than one flow as necessary. |
| Actions per 24 hours | 2,000 for Low, 5,000 for MediumLow1, 20,000 for MediumLow2, 25,000 for Medium, and 15,000 for High|10,000 for Low, 25,000 for MediumLow1, 100,000 for MediumLow2, 125,000 for Medium and 500,000 for High | Because of the current transition period (in the year of 2020) these limits are less strict than the values called out in the [requests limits and allocations document](/power-platform/admin/api-request-limits-allocations). These limits represent approximations of how many requests will be allowed daily. They are not not guarantees. Actual amounts may be smaller, but will be greater than the documented requests limits and allocations during the transition period. These limits will change after the transition period ends. Distribute the workload across more than one flow as necessary. | 
| Concurrent outbound calls | 500 for Low, 2,500 for all others |n/a| You can reduce the number of concurrent requests or reduce the duration as necessary. |

As of October 2019, there are limits on the number of Microsoft Power Platform requests an account can make across **all** of their flows, Power Apps, or any applications calling into the Microsoft Dataverse. No performance is guaranteed above these limits, although enforcement of these limits is not as strict during the transition period (as mentioned earlier). For more information about these, refer to [requests limits and allocations](/power-platform/admin/api-request-limits-allocations).

>[!TIP]
>Individual connectors have their own limits as well, which often will be reached before the limits mentioned earlier. Be sure to check [the documentation for your connector](/connectors/).

### Runtime endpoint request limits

The runtime endpoint is the direct access URL for a given flow. It starts with something like: `https://prod-00.westus.logic.azure.com:443/`.

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Concurrent inbound calls | ~1,000 | You can reduce the number of concurrent requests or reduce the duration as necessary. |
| Read calls per 5 minutes  | 6,000 for Low, 60,000 for all others | This limit applies to calls that get the raw inputs and outputs from a cloud flow's run history. You can distribute the workload across more than one flow as necessary. |
| Invoke calls per 5 minutes | 4,500 for Low, 45,000 for all others | You can distribute workload across more than one flow as necessary. |

### Content throughput limits

The content throughput limits refer to the amount of data that is read from or written to the run history of the cloud flow. 

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Content throughput per 5 minutes | 600 MB for Low, 6 GB for all others | You can distribute workload across more than one flow as necessary. |
| Content throughput per 24 hours | 1 GB for Low, 10 GB for MediumLow1, MediumLow2 and Medium,  50 GB for High | You can distribute workload across more than one flow as necessary. |

## Gateway limits

Power Automate supports write operations, including inserts and updates, through the gateway. However, these operations have [limits on their payload size](/data-integration/gateway/service-gateway-onprem#considerations).

## HTTP limits

Here are the limits for a single outgoing or incoming HTTP call:

### Timeout

Some connector operations make asynchronous calls or listen for webhook requests, so the timeout for these operations might be longer than these limits. For more information, see the technical details for the specific connector.

| Name | Limit | Notes |
|------|-------|-------|
| Outbound synchronous request | 120 seconds <br>(2 minutes) | Examples of outbound requests include calls made by HTTP triggers. <br />**Tip**: For longer running operations, use an asynchronous polling pattern or an until loop. To work around timeout limits when you call another flow that has a callable endpoint, you can use the built-in action instead, which you can find in the connector picker under **Built-in**. |
| Outbound asynchronous request | Configurable up to 30 days |  |
| Inbound request | 120 seconds <br>(2 minutes) | Examples of inbound requests include calls received by request triggers and webhook triggers. <br />**Note**: For the original caller to get the response, all steps in the response must finish within the limit unless you call another flow as a child flow. |

>[!NOTE]
>If you test a cloud flow that runs for longer than 10 minutes, you may get a timeout message in Power Automate, even though the flow continues to run in the background. If this happens, reopen the view to receive the current status. 


### Message size

| Name | Limit | Notes |
|------|-------|-------|
| Message size | 100 MB | To work around this limit, consider allowing chunking under the action content transfer settings. However, some connectors and APIs might not support chunking or even the default limit.|
| Message size with chunking | 1 GB | This limit applies to actions that either natively support chunking or let you enable chunking in their runtime configuration. |

### Character limits

| Name | Notes |
|------|-------|
| Expression evaluation limit | 131,072 characters | The `@concat()`, `@base64()`, `@string()` expressions can't be longer than this limit. |
| Request URL character limit | 16,384 characters |


### Retry policy

| Name | Limit | Notes |
| ---- | ----- | ----- |
| Retry attempts | 90 | The default is 2. To change the default, use the retry policy parameter. |
| Retry max delay | 1 day | To change the default, use the retry policy parameter. |
| Retry min delay | 5 seconds | To change the default, use the retry policy parameter. |


## Turning off or deleting flows

When you turn off a cloud flow, no new runs are instantiated. All in-progress and pending runs continue until they finish, which might take time to complete.

When you delete a cloud flow, no new runs are instantiated. All in-progress and pending runs are canceled. If you have thousands of runs, cancellation might take significant time to complete.


## Custom connector limits

Here are the limits for custom connectors that you can create from web APIs.

| Name | Limit |  Notes |
|------|-------|-------|
| Number of custom connectors | 50 per user |Microsoft 365 users can run one flow with a custom connector.  |
| Number of requests per minute for a custom connector | 500 requests per minute per connection |  |

>[!NOTE]
>To run any flow that has a custom connector, a premium license (or trial) is required.


## SharePoint limits

There are [limitations](/connectors/sharepointonline/#limits) on how you can use Microsoft SharePoint with Power Automate and Power Apps.

[!INCLUDE [sharepoint-detailed-docs](includes/sharepoint-detailed-docs.md)]

## Other configuration

See [IP address configuration](ip-address-configuration.md) for additional details on how to permit access to automated, scheduled and instant flows, including required endpoints. 

## IP addresses

Requests from Power Automate use IP addresses that are associated with the region of the [environment](./environments-overview-maker.md) in which your flow exists.

Use these IP address in your allow list to facilitate communications from Power Automate. 

Calls made from a connector in a cloud flow will come from the IP addresses listed here:

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
| United Arab Emirates | 20.45.67.36, 20.45.67.28, 20.37.74.192 - 20.37.74.207, 40.119.162.44, 40.120.8.0 - 40.120.8.31 |
| United Kingdom | 51.140.77.227, 51.140.245.29, 51.140.80.51, 51.140.61.124, 51.141.47.105, 51.141.124.13, 51.105.77.96 - 51.105.77.127, 51.140.148.0 - 51.140.148.15, 51.140.211.0 - 51.140.211.15, 51.140.212.224 - 51.140.212.255  |
| United States | 104.41.132.180, 13.91.93.63, 52.173.245.164, 40.71.249.205, 40.114.40.132, 52.232.188.154, 104.209.247.23, 52.162.242.161, 104.42.122.49, 40.112.195.87, 13.91.97.196, 40.71.193.203, 104.210.14.156, 13.66.130.243, 65.52.197.64, 40.113.242.246, 40.71.11.80 - 40.71.11.95, 40.71.15.160 - 40.71.15.191, 52.162.107.160 - 52.162.107.175, 52.162.111.192 - 52.162.111.223, 13.89.171.80 - 13.89.171.95, 13.89.178.64 - 13.89.178.95, 40.70.146.208 - 40.70.146.223, 40.70.151.96 - 40.70.151.127, 13.86.223.32 - 13.86.223.63, 40.112.243.160 - 40.112.243.175 |
| Preview (United States)  | 13.78.178.187, 52.151.42.172, 52.161.102.22, 13.78.132.82, 52.183.78.157, 13.71.195.32 - 13.71.195.47, 13.71.199.192 - 13.71.199.223, 13.66.140.128 - 13.66.140.143, 13.66.145.96 - 13.66.145.127 |
|United States Government (GCC)|20.140.137.128 - 20.140.137.159, 52.127.5.224 - 52.127.5.255|
|Department of Defense (DoD) in Azure Government|52.127.61.192 - 52.127.61.223|





[!INCLUDE[footer-include](includes/footer-banner.md)]
