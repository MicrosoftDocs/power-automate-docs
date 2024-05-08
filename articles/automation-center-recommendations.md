---
title: Recommendations within automation center (preview)
description: Recommendations within automation center (preview)
ms.topic: conceptual
ms.date: 05/06/2024
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - maker
---

# Automation center recommendations

Automation center recommendations provides targeted recommendations that help optimize your automation reliability, throughput, and overall health. Insights such as automations starting to fail, work queues being at risk of breaching their SLA targets, or unused machines or machine groups in the environment are jus a few of the recommendations we provide.

## Key capabilities

Key features of recommendations:

- Get proactive and reactive recommendation that are based on best practices and data you have access to.
- Improve the overall health and throughput of automations across the environment.
- Take contextual corrective actions, right where issue are.

## Recommendations

### Recommendation categories and levels

:::image type="content" source="media/automation-center/recommendation-card.png" alt-text="Screenshot of the overview page on automation center." lightbox="media/automation-center/recommendation-card.png":::

The **category** classifies the recommendations based on the specific area of automation they target.

| Category | Description |  
|---|---|  
| Orchestration | Insights related to the orchestration of processes, work queues and machines. |  
| Monitoring | Recommendations related to real-time tracking of automation health, compliance or performance.  |  
| Governance | Recommendations related to the rules, policies, and processing compliance. |  
| Licensing | Recommendations related to the management of licenses and capacity. |  

The **level** indicates the severity or urgency of the recommendations.

| Level | Description |  
|---|---|  
| Information | Provides best-practice recommendations you may want to consider. |  
| Warning | Indicates a potential issue that might lead to a problem later if not addressed. |  
| Error | Indicates a problem that needs to be resolved. |  

The **impact** assesses the degree of impact an issue has on the overall automation health, compliance, or performance. 

| Impact | Description |  
|---|---|  
| Low | The issue has a minor effect on automation health, compliance or performance. |  
| Medium | The issue has a moderate effect on automation health, compliance or performance. |  
| High | The issue has a significant effect on automation health, compliance or performance. |  

This **refresh frequency** provides information on how often the recommendation data is updated, ensuring users have the most recent and relevant information for decision-making.

| Refresh frequency | Description |  
|---|---|  
| DAILY | A new instance of the recommendation data is regenerated once a day. |  
| HOURLY | A new instance of the recommendation is regenerated every hour. |  
| REAL TIME | The recommendation is an actual live-query to the underlying automation data. |  

### Work queue SLA violation

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA violation |  
| Card details | {0} work queue(s) are out of compliance with their service level agreement (SLA). |  
| Recommendation details | One or more work queue items are queued but expired. This usually indicates an SLA violation. |  
| Level | Error |  
| Impact | High |  
| Refresh frequency | Hourly |  
| Category | Orchestration |  
| Recommended action(s) | - Identify the root cause. Was it due to a technical issue, a lack of resources, or some other factor? </br>- Once you've identified the cause, notify all relevant stakeholders of the miss and the steps being taken to address it. </br>- Determine which work is impacted by the SLA miss and prioritize it accordingly. </br>- If necessary, allocate additional resources to address the SLA miss (adding more machine capacity, licenses, or other solutions to improve performance). </br>- Monitor progress to ensure the SLA is being met and that work is completed within the agreed-upon time frame. |  

### Work queue SLA at risk

| Category or object | Details |  
|---|---|  
| Title | Work queue SLA at risk |  
| Card details | {0} work queues are close to breaching their service level agreement (SLA) or have already been breached. |  
| Recommendation details | Based on average handling time, volume, available machine capacity, and expiration dates, {0} work queues are at risk of not meeting their SLA targets. Investigate and adjust work queue capacity and prioritization. |  
| Level | Warning |  
| Impact | Medium |  
| Refresh frequency | Hourly |  
| Category | Orchestration |  
| Recommended action(s) | - Align work queue volumes with machine and license capacity and prioritize processing of at-risk work queues. </br>- Increase machine group capacity where needed, and closely monitor work queue item execution and expiration dates. </br> -  Consider moving to a hosted machine group for scalability and cost-effectiveness. Your machines scale automatically to match processing demand and you only pay for what you use. |  

### Power Automate Process capacity overage

| Category or object | Details |  
|---|---|  
| Title | Power Automate Process capacity overage |  
| Card details | Your Power Automate Process capacity is insufficient. Consider requesting {0} more capacity. |  
| Recommendation details | Your current Power Automate Process capacity is not enough to handle your workload. You need {0} additional Power Automate Process capacity to meet your needs. |  
| Level | Error |  
| Impact | Medium |  
| Refresh frequency | Live-query |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Power Automate Hosted process capacity overage

| Category or object | Details |  
|---|---|  
| Title | Power Automate Hosted process capacity overage |  
| Card details | Your Power Automate Hosted Process capacity is insufficient. Consider requesting {0} more capacity. |  
| Recommendation details | Your current Power Automate Hosted Process capacity is not enough to handle your workload. You need {0} additional Power Automate Hosted Process capacity to meet your needs. |  
| Level | Error |  
| Impact | Medium |  
| Refresh frequency | Live-query |  
| Category | Licensing |  
| Recommended action(s) | We recommend requesting additional hosted process capacity to avoid any potential issues and disruptions. |  

### Desktop flow suspended due to DLP policy violation

| Category or object | Details |  
|---|---|  
| Title | Desktop flow suspended due to DLP policy violation |  
| Card details | {0} desktop flow(s) are suspended due to DLP policy violations |  
| Recommendation details | Investigate why suspended flows aren't in compliance with your organization's DLP (Data Loss Prevention) policy. |  
| Level | Error |  
| Impact | High |  
| Refresh frequency | Hourly |  
| Category | Governance |  
| Recommended action(s) | Your organization applied DLP policies that resulted in suspended flows that you built or co-own. Review the following action list to get your flows back on track: </br>- Identify the specific desktop flows that have been suspended and review them to determine why they do not adhere to the DLP policy. </br>- Analyze the data being processed by the flows and identify any potential risks or vulnerabilities. </br>- Modify the desktop flows to ensure that they adhere to the DLP policy. This may involve implementing additional security measures or changing the way data is processed or stored. </br>- Test the modified desktop flows to ensure that they are functioning correctly and that they adhere to the DLP policy. |  

### Fix failing automations

| Category or object | Details |  
|---|---|  
| Title | Fix failing automations |  
| Card details | One or more of your automation runs have failed. We'll show you why and help you fix the affected automations. |  
| Recommendation details | There are one or more runs that need your attention. |  
| Level | Error |  
| Impact | High |  
| Refresh frequency | Live-query |  
| Category | Monitoring |  
| Recommended action(s) | Review the list of runs and open flow or run details to troubleshoot. |  

### Unused or inactive machines

| Category or object | Details |  
|---|---|  
| Title | Unused or inactive machines |  
| Card details | {0} machines didn't have any runs in the last 30 days |  
| Recommendation details | Remove inactive machines from this environment. |  
| Level | Information |  
| Impact | Medium |  
| Refresh frequency | Daily |  
| Category | Monitoring |  
| Recommended action(s) | Consider cleaning up any machine that you know is not active or used anymore. |  

### Improve performance and resiliency

| Category or object | Details |  
|---|---|  
| Title | Improve performance and resiliency |  
| Card details | You currently have {0} flows that are running frequently throughout the day. These flows do not currently utilize work queues. Implementing work queues could potentially enhance your processing throughput, improve resiliency, and simplify troubleshooting. |  
| Recommendation details | Consider using work queues for flows that run frequently throughout the day. This can improve your processing throughput, resilience, and your ability to troubleshoot issues. |  
| Level | Information |  
| Impact | Low |  
| Refresh frequency | Daily |  
| Category | Orchestration |  
| Recommended action(s) | - Use work queues to group and process multiple work items in a run. </br>- Prioritize them based on their importance and expiration date, and improve processing throughput, overall efficiency, and resiliency. </br>- You also get robust monitoring capabilities (including the ability to reprioritize or reprocess work as needed). |  
