---
title: Monitor your flows
description: Learn how to monitor your Power Automate flows to ensure that they run correctly, efficiently, and securely.
#customer intent: As a Power Automate user, I want to monitor flows so that I can ensure workflows run smoothly and efficiently.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/11/2025
ms.author: rachaudh
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Monitor your flows

Power Automate flows aren't "set it and forget it" solutions. Regular monitoring of your flows is vital to make sure that they run correctly, efficiently, and securely. This article provides guidance on how to monitor your flows effectively.

## Key benefits of monitoring flows

Monitoring your Power Automate flows is essential for several reasons:

- Detect and address emerging issues faster, before they escalate into significant problems.

- Ensure that your flows are running as expected and delivering the intended results.

- Get insights that can help you optimize your workflows for improved efficiency and productivity.

- Identify potential security vulnerabilities or compliance concerns, safeguarding sensitive data and ensuring that your workflows comply with regulatory requirements.

- Understand how your flows are used, which can help you make more informed decisions about optimizing them for better performance and cost-effectiveness.

## How to monitor your flows

The following sections describe the tools and features that are available in Power Platform to help you monitor, enhance, and troubleshoot your workflows.

### Get a bird's-eye view in the Automation Center

The Automation Center is a central hub for managing all your automation activities. Its user-friendly interface and dashboard make it easy to get a holistic view of all data related to your Power Automate flows, including recommendations, execution logs, and performance metrics. Learn more in [Automation Center](/power-automate/automation-center-overview).

### Improve efficiency with process mining

Process mining digs deep into the details of your flows to offer valuable insights that you can use to help them perform more efficiently. It can:

- Show you how your flow performs, identify areas where it slows down, and find opportunities for improvement.

- Detect changes in your flow's performance over time.

- Analyze your flow's run history to generate actionable insights.

The following example shows a process mining report for a cloud flow in Power Automate. It provides insights into the flow's performance, including the average duration of each action and the overall execution time. This information can help you identify bottlenecks and optimize your flow for better performance.

:::image type="content" source="media/process-mining.png" alt-text="Screenshot of a process mining report for a cloud flow in Power Automate.":::

The **# of Runs and Actions** section of the report includes the number of actions that executed during a run, helping you understand if your flow might run into daily action bursts throttling limits.

:::image type="content" source="media/process-mining-runs.png" alt-text="Screenshot of a process mining report focusing on a pop-up detail in the Runs and Actions section.":::

The process mining report is available on your flow's details page. In the **Process insights** card, select **Improve your flow**. Learn more in [Improve cloud flows with process insights](/power-automate/process-mining-cloud-flow-process-insights).

### View analytics for individual cloud flows

Power Automate offers built-in analytics that provide insights into flow execution patterns and help you identify bottlenecks. The analytics dashboard summarizes a flow's performance, including the number of runs, success and failure rates, and average execution time. You can also view detailed information about specific runs, including the actions that were executed, their duration, and any errors that occurred; a detailed analysis of errors, including the type and number of errors and when they last occurred; and a rolling 30-day run history.
  
:::image type="content" source="media/cloud-flow-analytics.png" alt-text="Screenshot of the Usage tab in the cloud flow Analytics page in Power Automate." lightbox="media/cloud-flow-analytics.png":::

The analytics dashboard is available on your flow's details page. In the menu at the top of the page, select **Analytics**.

### View analytics at the environment level

Environment admins can view Power Automate analytics at the environment level in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/analytics/flow). These reports provide information about runs, usage, errors, connectors, and sharing for all automated flows, button flows, scheduled flows, approval flows, and business process flows in a Power Platform environment. The analytics include:

- Flow usage based on environment, environment type, and region
- Flow inventory, including flow state
- Maker activity (only the user ID)
- Number of failed runs (no information about which flows failed)
- The last 28 days of run history

:::image type="content" source="media/ppac-flow-analytics.png" alt-text="Screenshot of flow analytics in the Power Platform admin center." lightbox="media/ppac-flow-analytics.png":::

Learn more in [View analytics for cloud flows](/power-platform/admin/analytics-flow).

## Retrieve flow data programmatically with a connector

Power Automate provides a connector that lets you programmatically retrieve metadata and run history for your flows. The **Power Automate Management** connector provides actions for listing all the flows, flow owners, and connectors in an environment, as well as all the environments you have access to and the flows you created in a specific environment. Admins can run some of these actions suffixed with "As Admin." Learn more in [Power Automate Management](/connectors/flowmanagement/).

## Monitor flows with Application Insights

Application Insights is a feature of Azure Monitor that provides extensive monitoring and diagnostic capabilities for web applications. You can integrate Application Insights with your cloud flows to gain deeper insights into their performance and usage, such as:

- Telemetry data from your flows, including flow runs, triggers, and actions, which is stored in Azure Monitor logs and can be visualized in Application Insights.

- Detailed metrics, such as the duration of flow runs and the frequency of specific actions, to help you identify bottlenecks and optimize flow performance.

- Error tracking that offers insights into the root causes for quicker troubleshooting and resolution of issues.

- Custom alerts based on specific criteria, such as flow failures or performance thresholds.

- Insights into usage patterns to help you understand how flows are being used across your organization. This information can guide decisions on optimizing and scaling your automation efforts.

Data from flow runs, triggers, and actions can be linked to Application Insights at the environment level. Data from multiple environments can be logged into the same Application Insights resource. Learn more in [Set up Application Insights with Power Automate](/power-platform/admin/app-insights-cloud-flow).

## Track flow run history in Dataverse

Flow run history in Microsoft Dataverse lets you track the execution history of your cloud flows at scale. It uses Dataverse's robust data architecture to provide detailed insights and enhanced control over your automation processes.

Each execution of a cloud flow is recorded in the **FlowRun** table in Dataverse. The information includes key elements such as start and end times, duration, status, and detailed error messages, if any. The Automation Center uses the data in the **FlowRun** table to generate meaningful insights about the execution of cloud flows.

The run history that's stored in Dataverse is retained longer than the run history that's available in Power Automate. The extended retention period allows you to keep a comprehensive record of flow executions, which is useful for auditing, compliance, and long-term analysis. You can build custom reports to analyze automation performance, calculate return on investment, and monitor usage patterns to inform decisions around workflow optimization.

Learn more in [Manage cloud flow run history in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata) and [Known limitations](/power-automate/dataverse/cloud-flow-run-metadata#known-limitations).
