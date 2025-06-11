---
title: Boost automation health with Automation center recommendations 
description: Enhance your automation's reliability and efficiency with the Automation Center's targeted recommendations, offering actionable insights and best practice suggestions.
ms.topic: article
ms.date: 01/14/2025
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - maker
---

# Automation center recommendations

The automation center offers targeted recommendations aimed at enhancing the reliability, efficiency, and general health of your automation. You can find actionable insights such as:

- real-time recommendation of automations starting to fail
- warnings of work queues potentially failing to meet their service level agreement (SLA) objectives
- identification of unused machines or machine groups in the environment
- many more

## Key capabilities

Key features of recommendations:

- Get proactive and reactive recommendations, grounded on best practices.
- Enhance the overall health, compliance, and performance of automation across your environment.
- Take corrective actions directly from the list of affected automation artifacts.

## Prerequisites

To see and use recommendations in automation center, the following are required:

- From December 2024 (general availability), a Dataverse environment with [managed environment](/power-platform/admin/managed-environment-enable) enabled.
- Premium Power Automate license
- Environment maker role (or other roles that include access to recommendation data)

## Recommendation details

Recommendations appear as cards in the carousel found at the top of the automation center's overview page. Each recommendation is uniquely generated per recommendation type, user, and refresh interval, and is stored in the `Flow Events` ([flowevent](/power-apps/developer/data-platform/reference/entities/flowevent)) table in Dataverse. This design provides important permission granularity, ensuring that the recommendations each user receives align with their specific access rights to the underlying artifacts. If a user doesn't have permission to view the underlying flow, work queue, or any related artifact related to the recommendation, those recommendations aren't generated for them.

### Recommendation card

The recommendation card shown in the following image is the entry point to your recommendations. Here’s a detailed breakdown of the card’s components:

:::image type="content" source="media/automation-center/recommendation-card.png" alt-text="Screenshot of a recommendation card on automation center overview page." lightbox="media/automation-center/recommendation-card.png":::

- **Type**: Indicated by an exclamation mark in a triangle, shows that this recommendation is a warning or alert.
- **Title**: "Work queue SLA at risk" – this value provides a concise title of the issue.
- **Refresh frequency**: "HOURLY" – this value specifies the refresh frequency of the recommendation data.
- **Impact**: "Medium" – this value indicates the severity or importance of the issue.
- **Recommendation details**: The short text that describes the recommendation.
- **Actions or details**: Call to action or detail that provides more in-depth information about the specific recommendation.
- **Card actions**: Ability to hide recommendations for varying durations such as an hour, day, week, or even indefinitely.

### Recommendation details panel

The recommendation details panel shown in the following image provides a more detailed view with inline, actionable insights. Here’s a detailed breakdown of the panel's components:

- **Type**: Indicated by an exclamation mark in a triangle, showing that this recommendation is a warning or alert.
- **Title**: "Work queue SLA at risk" – this value provides a concise title of the issue.
- **Refresh frequency**: "HOURLY" – this value specifies the refresh frequency of the recommendation data.
- **Recommendation timestamp**: Shows the date when the recommendation was generated.
- **Recommendation details**: Provides context and specifics about the recommendation, including an explanation and suggested actions.
- **Corrective actions or guidance**: Specific actions recommended to mitigate the issue.
- **Call to action or details**: Provides buttons for immediate actions or for further details.
- **Affected artifact details**: A table or chart listing affected recommendation artifacts such as flows, work queues, machines etc.

## All recommendations panel

The all recommendations panel shown in the following image is used for viewing latest and older recommendation with filtering capabilities. The recommendations are categorized by type (Error, Warning, Information) and can be filtered by impact (High, Medium, Low), status (Hidden), and date range. This panel is divided into two main sections: one for displaying the most recent recommendations and another for showing older recommendations along with their timestamps. The most recent recommendations are initially displayed under 'Latest', but are replaced with refreshed content based on the recommendation interval.
:::image type="content" source="media/automation-center/recommendation-history-panel.png" alt-text="Screenshot of a recommendation history panel listing current and previous recommendations on automation center overview page." lightbox="media/automation-center/recommendation-history-panel.png":::

### Category

The **category** classifies the recommendations based on the specific area of automation they target.

| Category | Description |  
|---|---|  
| Orchestration | Insights related to the orchestration of processes, work queues, and machines. |  
| Monitoring | Recommendations related to real-time tracking of automation health, compliance, or performance.  |  
| Governance | Recommendations related to the rules, policies, and processing compliance. |  
| Licensing | Recommendations related to the management of licenses and capacity. |  

### Type

The **type** indicates the severity or urgency of the recommendations.

| Type| Description |  
|---|---|  
| Information | Provides best-practice recommendations you might want to consider. |  
| Warning | Indicates a potential issue that might lead to a problem later if not addressed. |  
| Error | Indicates a problem that needs to be resolved. |  

### Refresh frequency

The **refresh frequency** provides information on how often the recommendation data is updated, ensuring users have the most recent and relevant information for decision making.

| Refresh frequency | Description |  
|---|---|  
| DAILY | A new instance of the recommendation data is regenerated once a day. |  
| HOURLY | A new instance of the recommendation is regenerated every hour. |  
| REAL TIME | The recommendation is an actual live-query to the underlying automation data. |  

## List of recommendations

The following list of recommendations aims to provide proactive guidance and actionable insights for optimizing and troubleshooting various aspects of your automations. From addressing work queue SLA violations and capacity overages to improving system resilience and efficiency, each recommendation offers a detailed proposed solution or more details.

> [!NOTE]
>
> - Recommendations that don't have a real time refresh frequency hold data snapshots from when the recommendation was generated. As a result, if you revisit an older recommendation, the information displayed under artifact details may no longer be accurate or applicable.
> - If you're a premium Power Automate user and it's your first time accessing the automation center, we will begin generating recommendations for you. These should be ready for your review in about an hour or two.
> - Generation of recommendations is paused if you don't return to the automation center within 7 days, your premium license was unassigned by your IT team, or your trial expired.
> - The recommendations shown as part of the automation center are intra-environmental recommendations targeted to makers, operators, and CoE team members. If you are looking for admin related, tenant-wide recommendations in Power Platform admin center, these are part of a separate feature called [**Power Platform Advisor**](/power-platform/admin/power-platform-advisor).

### Work queue SLA violation

> [!NOTE]
> Initially, this recommendation will consider all work queue items with past expiry dates for possible SLA violations. However, we will change this logic in a future update to exclude items in a `Processing` or `Processed` state.

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA violation |  
| Card details | {*number of work queues*} work queues are out of compliance with their service level agreement (SLA). |  
| Recommendation details | One or more work queue items are queued but expired. This usually indicates an SLA violation. |  
| Type| Error |
| Refresh frequency | Hourly |  
| Category | Orchestration |  
| Recommended actions | - Identify the root cause. Was it due to a technical issue, a lack of resources, or some other factor? </br>- First identify the cause. Then notify all relevant stakeholders of the miss and the steps being taken to address it. </br>- Determine which work is impacted by the SLA miss and prioritize it accordingly. </br>- If necessary, allocate extra resources to address the SLA miss (adding more machine capacity, licenses, or other solutions to improve performance). </br>- Monitor progress to ensure the SLA is being met and that work is completed within the agreed-upon time frame. |  

### Work queue SLA at risk

> [!NOTE]
> Initially, this recommendation identifies work queue items that expire within **one hour** as potentially violating the work queue's SLA. However, we will change this logic in a future update to include items that expire within **one day** instead, and exclude items in a `Processing` or `Processed` state. 

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA at risk |  
| Card details | {*number of work queues*} work queues are close to breaching their service level agreement (SLA) or are already breached. |  
| Recommendation details | Based on average handling time, volume, available machine capacity, and expiration dates, {*number of work queues*} work queues are at risk of not meeting their SLA targets. Investigate and adjust work queue capacity and prioritization. All work queue items that are either already expired, or expire within the next hour, will be included in this recommendation. |  
| Type | Warning |  
| Refresh frequency | Hourly |  
| Category | Orchestration |  
| Recommended actions | - Align work queue volumes with machine and license capacity and prioritize processing of at-risk work queues. </br>- Increase machine group capacity where needed, and closely monitor work queue item execution and expiration dates. </br> - Consider moving to a hosted machine group for scalability and cost-effectiveness. Your machines scale automatically to match processing demand and you only pay for what you use. |  

### Power Automate Process capacity overage

| Category or object | Details |  
|---|---|  
| Title | Power Automate Process capacity overage |  
| Card details | Your Power Automate Process capacity is insufficient. Consider requesting {*number of capacities*} more capacity. |  
| Recommendation details | Your current Power Automate Process capacity isn't enough to handle your workload. You need {*number of capacity*} additional Power Automate Process capacity to meet your needs. |  
| Type | Error |  
| Refresh frequency | Real time |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Power Automate Hosted process capacity overage

| Category or object | Details |  
|---|---|  
| Title | Power Automate Hosted process capacity overage |  
| Card details | Your Power Automate Hosted Process capacity is insufficient. Consider requesting {*number of capacities*} more capacity. |  
| Recommendation details | Your current Power Automate Hosted Process capacity isn't enough to handle your workload. You need {*number of capacities*} additional Power Automate Hosted Process capacity to meet your needs. |  
| Type | Error |  
| Refresh frequency | Real time |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Desktop flow suspended due to DLP policy violation

| Category or object | Details |  
|---|---|  
| Title | Desktop flow suspended due to DLP policy violation |  
| Card details | {*number of flows*} desktop flow(s) are suspended due to DLP policy violations |  
| Recommendation details | Investigate why suspended flows aren't in compliance with your organization's DLP (Data Loss Prevention) policy. |  
| Type | Error |  
| Refresh frequency | Hourly |  
| Category | Governance |  
| Recommended action(s) | - Your organization applied DLP policies that resulted in suspended flows that you built or co-own. Review the following action list to get your flows back on track: </br>- Identify the specific desktop flows that have been suspended and review them to determine why they don't adhere to the DLP policy. </br>- Analyze the data being processed by the flows and identify any potential risks or vulnerabilities. </br>- Modify the desktop flows to ensure that they adhere to the DLP policy. This may involve implementing additional security measures or changing the way data is processed or stored. </br>- Test the modified desktop flows to ensure that they're functioning correctly and that they adhere to the DLP policy. |  

### Fix failing automations

| Category or object | Details |  
|---|---|  
| Title | Fix failing automations |  
| Card details | One or more of your automation runs have failed. We'll show you why and help you fix the affected automations. |  
| Recommendation details | There are one or more runs that need your attention. The recommendation considers only failed automations from the past week. Any failures older than one week are not included. |  
| Type | Error |  
| Refresh frequency | Real time |  
| Category | Monitoring |  
| Recommended action(s) | Review the list of runs and open flow or run details to troubleshoot. |  

### Unused or inactive machines

| Category or object | Details |  
|---|---|  
| Title | Unused or inactive machines |  
| Card details | {*number of machines*} machines didn't have any runs in the last 30 days |  
| Recommendation details | Remove inactive machines from this environment. |  
| Type | Information |  
| Refresh frequency | Daily |  
| Category | Monitoring |  
| Recommended action(s) | Consider cleaning up any machine that you know isn't active or used anymore. |  

### Improve performance and resiliency

| Category or object | Details |  
|---|---|  
| Title | Improve performance and resiliency |  
| Card details | You currently have {*number of flows*} flows that are running frequently throughout the day. These flows don't currently utilize work queues. Implementing work queues could potentially enhance your processing throughput, improve resiliency, and simplify troubleshooting. |  
| Recommendation details | Consider using work queues for flows that run frequently throughout the day. This can improve your processing throughput, resilience, and your ability to troubleshoot issues. |  
| Type | Information |  
| Refresh frequency | Daily |  
| Category | Orchestration |  
| Recommended action(s) | - Use work queues to group and process multiple work items in a run. </br>- Prioritize them based on their importance and expiration date, and improve processing throughput, overall efficiency, and resiliency. </br>- You also get robust monitoring capabilities (including the ability to reprioritize or reprocess work as needed). |  

### Desktop flows not running

| Category or object | Details |  
|---|---|  
| Title | Desktop flows not running |  
| Card details | A user session or a connection problem is preventing {*number of flows*} of your desktop flows to run. |  
| Recommendation details | {*number of flows*} of your desktop flows need fixes. These flows were scheduled to run in unattended mode, but another user session or a connection problem prevented them from completing. |  
| Type | Information |  
| Refresh frequency | Real time |  
| Category | Orchestration |  
| Recommended action(s) | Select the identified runs, open the disconnect user menu, and then choose how to end other inactive user sessions on this machine. |  

## Known limitations

- Deletion of older recommendation isn't yet supported through the user experience in automation center. If you want to clean-up recommendations, consider using the Dataverse [bulk-delete](/power-platform/admin/delete-bulk-records) feature.
