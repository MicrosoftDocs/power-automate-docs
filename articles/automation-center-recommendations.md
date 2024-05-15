---
title: Recommendations within automation center (preview)
description: Recommendations within automation center.
ms.topic: conceptual
ms.date: 05/20/2024
ms.author: appapaio
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

# Automation center recommendations (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

The automation center offers targeted recommendations aimed at enhancing the reliability, efficiency, and general health of your automation. You can find actionable insights such as:

- real-time recommendation of automations starting to fail
- warnings of work queues potentially failing to meet their service level agreement (SLA) objectives
- identification of unused machines or machine groups in the environment
- many more

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Key capabilities

Key features of recommendations:

- Get proactive and reactive recommendations, grounded on best practices.
- Enhance the overall health, compliance, and performance of automation across your environment.
- Take corrective actions directly from the list of affected automation artifacts.

## Prerequisites

To see and use recommendations in automation center, the following are required:

- Premium Power Automate license
- Environment maker role (or other roles that include access to recommendation data)

## Recommendation details

Recommendations are displayed as cards in the carousel located at the top of the automation center's overview page.

### Recommendation card

:::image type="content" source="media/automation-center/recommendation-card.png" alt-text="Screenshot of a recommendation card on automation center overview page." lightbox="media/automation-center/recommendation-card.png":::

### Recommendation details panel

:::image type="content" source="media/automation-center/recommendation-details-panel.png" alt-text="Screenshot of a recommendation details panel on automation center overview page." lightbox="media/automation-center/recommendation-details-panel.png":::

## All recommendations panel

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

### Impact

The **impact** assesses the degree of effect an issue has on the overall automation health, compliance, or performance.

| Impact | Description |  
|---|---|  
| Low | The issue has a minor effect on automation health, compliance, or performance. |  
| Medium | The issue has a moderate effect on automation health, compliance, or performance. |  
| High | The issue has a significant effect on automation health, compliance, or performance. |  

### Refresh frequency

The **refresh frequency** provides information on how often the recommendation data is updated, ensuring users have the most recent and relevant information for decision making.

| Refresh frequency | Description |  
|---|---|  
| DAILY | A new instance of the recommendation data is regenerated once a day. |  
| HOURLY | A new instance of the recommendation is regenerated every hour. |  
| REAL TIME | The recommendation is an actual live-query to the underlying automation data. |  

## List of recommendations

> [!NOTE]
>
> - Recommendations that don't have a real time refresh frequency hold data snapshots from when the recommendation was generated. As a result, if you revisit an older recommendation, the information displayed under artifact details may no longer be accurate or applicable.
> - If you're a premium Power Automate user and it's your first time accessing the automation center, we will begin generating recommendations for you. These should be ready for your review in about an hour or two.
> - Generation of recommendations is paused if:
    > - you don't return to the automation center within 7 days
    > - your premium license was unassigned by your IT team
    > - your trial expired
> - The recommendations shown as part of the automation center are intra-environmental recommendations targeted to makers, operators, and CoE team members. If you are looking for admin related, tenant-wide recommendations in Power Platform admin center, these are part of a separate feature called [**Power Platform Advisor**](/power-platform/admin/power-platform-advisor).

### Work queue SLA violation

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA violation |  
| Card details | {*number of work queues*} work queues are out of compliance with their service level agreement (SLA). |  
| Recommendation details | One or more work queue items are queued but expired. This usually indicates an SLA violation. |  
| Type| Error |  
| Impact | High |  
| Refresh frequency | Hourly |  
| Category | Orchestration |  
| Recommended actions | - Identify the root cause. Was it due to a technical issue, a lack of resources, or some other factor? </br>- Once you identify the cause, notify all relevant stakeholders of the miss and the steps being taken to address it. </br>- Determine which work is impacted by the SLA miss and prioritize it accordingly. </br>- If necessary, allocate extra resources to address the SLA miss (adding more machine capacity, licenses, or other solutions to improve performance). </br>- Monitor progress to ensure the SLA is being met and that work is completed within the agreed-upon time frame. |  

### Work queue SLA at risk

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA at risk |  
| Card details | {*number of work queues*} work queues are close to breaching their service level agreement (SLA) or are already breached. |  
| Recommendation details | Based on average handling time, volume, available machine capacity, and expiration dates, {*number of work queues*} work queues are at risk of not meeting their SLA targets. Investigate and adjust work queue capacity and prioritization. |  
| Type | Warning |  
| Impact | Medium |  
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
| Impact | Medium |  
| Refresh frequency | Live-query |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Power Automate Hosted process capacity overage

| Category or object | Details |  
|---|---|  
| Title | Power Automate Hosted process capacity overage |  
| Card details | Your Power Automate Hosted Process capacity is insufficient. Consider requesting {*number of capacities*} more capacity. |  
| Recommendation details | Your current Power Automate Hosted Process capacity isn't enough to handle your workload. You need {*number of capacities*} additional Power Automate Hosted Process capacity to meet your needs. |  
| Type | Error |  
| Impact | Medium |  
| Refresh frequency | Live-query |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Desktop flow suspended due to DLP policy violation

| Category or object | Details |  
|---|---|  
| Title | Desktop flow suspended due to DLP policy violation |  
| Card details | {*number of flows*} desktop flow(s) are suspended due to DLP policy violations |  
| Recommendation details | Investigate why suspended flows aren't in compliance with your organization's DLP (Data Loss Prevention) policy. |  
| Type | Error |  
| Impact | High |  
| Refresh frequency | Hourly |  
| Category | Governance |  
| Recommended action(s) | - Your organization applied DLP policies that resulted in suspended flows that you built or co-own. Review the following action list to get your flows back on track: </br>- Identify the specific desktop flows that have been suspended and review them to determine why they don't adhere to the DLP policy. </br>- Analyze the data being processed by the flows and identify any potential risks or vulnerabilities. </br>- Modify the desktop flows to ensure that they adhere to the DLP policy. This may involve implementing additional security measures or changing the way data is processed or stored. </br>- Test the modified desktop flows to ensure that they're functioning correctly and that they adhere to the DLP policy. |  

### Fix failing automations

| Category or object | Details |  
|---|---|  
| Title | Fix failing automations |  
| Card details | One or more of your automation runs have failed. We'll show you why and help you fix the affected automations. |  
| Recommendation details | There are one or more runs that need your attention. |  
| Type | Error |  
| Impact | High |  
| Refresh frequency | Live-query |  
| Category | Monitoring |  
| Recommended action(s) | Review the list of runs and open flow or run details to troubleshoot. |  

### Unused or inactive machines

| Category or object | Details |  
|---|---|  
| Title | Unused or inactive machines |  
| Card details | {*number of machines*} machines didn't have any runs in the last 30 days |  
| Recommendation details | Remove inactive machines from this environment. |  
| Type | Information |  
| Impact | Medium |  
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
| Impact | Low |  
| Refresh frequency | Daily |  
| Category | Orchestration |  
| Recommended action(s) | - Use work queues to group and process multiple work items in a run. </br>- Prioritize them based on their importance and expiration date, and improve processing throughput, overall efficiency, and resiliency. </br>- You also get robust monitoring capabilities (including the ability to reprioritize or reprocess work as needed). |  

## Known limitations

- Deletion of older recommendation isn't yet supported through the user experience in automation center. If you want to clean-up recommendations, consider using the Dataverse [bulk-delete](/power-platform/admin/delete-bulk-records) feature.
