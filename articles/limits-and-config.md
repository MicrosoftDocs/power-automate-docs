<properties
	pageTitle="Limits and Configuration | Microsoft Flow"
	description="Limits and Configuration"
	services=""
	suite="flow"
	documentationCenter="na"
	authors="stepsic-microsoft-com"
	manager="erikre"
	editor=""
	tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="01/14/2017"
   ms.author="stepsic"/>

# Flow limits and configuration

Below are information on the current limits and configuration details for flows.

## Limits

### Request limits

These are limits for a single outgoing request.

#### Timeout

|Name|Limit|
|----|----|
|Request Timeout|90 Seconds|

#### Message size

|Name|Limit|Notes|
|----|----|----|
|Message size|50 MB|Some connectors and APIs may not support 50MB |
|Expression evaluation limit|131,072 characters|`@concat()`, `@base64()`, `string` cannot be longer than this|

#### Retry policy

|Name|Limit|
|----|----|
|Retry attempts|4|

### Run duration and retention

These are the limits for a single flow run.

|Name|Limit|Notes|
|----|----|----|
|Run duration|90 days||
|Storage retention|90 days|This is from the run start time|
|Min recurrence interval|1 minute||
|Max recurrence interval|500 days||


### Looping and debatching limits

These are limits for a single flow run.

|Name|Limit|Notes|
|----|----|----|
|ForEach items|5,000|You can use the filter action to filter larger arrays as needed|
|Until iterations|5,000||
|SplitOn items|5,000||
|ForEach Parallelism|20||

### Definition limits

These are limits for a single flow.

|Name|Limit|Notes|
|----|----|----|
|Actions per workflow|250|You can add nested workflows to extend this as needed|
|Allowed action nesting depth|5|You can add nested workflows to extend this as needed|
|Max characters per expression|8,192||
|`action`/`trigger` name limit|80||
|`description` length limit|256||

## Configuration

### IP Address

The IP Address of requests from Flows depends on the region that the Enviornment which contains the flow is in. [Read about Enviornments here](environments-overview-admin.md).

#### Logic App Service

Calls made from a flow directly go through the Azure Logic App service. Some examples of these inclue HTTP or HTTP + Swagger. These will come from the following IPs:

|Region|Outbound IP|
|-----|----|
|Asia|168.63.200.173, 13.75.89.159, 23.97.68.172, 13.75.94.173, 40.83.127.19, 52.175.33.254, 52.163.93.214, 52.187.65.81, 52.187.65.155, 13.76.133.155, 52.163.228.93, 52.163.230.166|
|Australia|13.75.153.66, 104.210.89.222, 104.210.89.244, 13.75.149.4, 104.210.91.55, 104.210.90.241, 13.73.115.153, 40.115.78.70, 40.115.78.237, 13.73.114.207, 13.77.3.139, 13.70.159.205|
|Europe|13.79.173.49, 52.169.218.253, 52.169.220.174, 40.113.12.95, 52.178.165.215, 52.178.166.21, 13.95.155.53, 52.174.54.218, 52.174.49.6, 40.68.222.65, 40.68.209.23, 13.95.147.65|
|India|52.172.157.194, 52.172.184.192, 52.172.191.194, 52.172.154.168, 52.172.186.159, 52.172.185.79, 52.172.9.47, 52.172.49.43, 52.172.51.140, 52.172.50.24, 52.172.55.231, 52.172.52.0|
|Japan|13.71.146.140, 13.78.84.187, 13.78.62.130, 13.71.158.3, 13.73.4.207, 13.71.158.120, 40.74.140.173, 40.74.81.13, 40.74.85.215, 40.74.140.4, 104.214.137.243, 138.91.26.45|
|United States|137.135.106.54, 40.117.99.79, 40.117.100.228, 13.92.98.111, 40.121.91.41, 40.114.82.191, 52.160.90.237, 138.91.188.137, 13.91.252.184, 52.160.92.112, 40.118.244.241, 40.118.241.243|

#### Services

Calls made from an API connected to through a flow will come from the IP Address specified below:

|Logic App Region|Outbound IP|
|-----|----|
|Australia East|40.126.251.213|
|Australia Southeast|40.127.80.34|
|Brazil South|191.232.38.129|
|Central India|104.211.98.164|
|Central US|40.122.49.51|
|East Asia|23.99.116.181|
|East US|191.237.41.52|
|East US 2|104.208.233.100|
|Japan East|40.115.186.96|
|Japan West|40.74.130.77|
|North Central US|65.52.218.230|
|North Europe|104.45.93.9|
|South Central US|104.214.70.191|
|Southeast Asia|13.76.231.68|
|South India|104.211.227.225|
|West Europe|40.115.50.13|
|West India|104.211.161.203|
|West US|104.40.51.248|
