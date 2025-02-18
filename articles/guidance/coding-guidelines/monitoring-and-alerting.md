---
title: Monitoring and alerting
description: Discover the key benefits of monitoring Power Automate flows, including issue resolution, performance enhancement, and security compliance.
#customer intent: As a Power Automate user, I want to monitor flows so that I can ensure workflows run smoothly and efficiently.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/07/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Monitoring and alerting

Regularly monitoring Power Automate flows is vital for businesses to ensure their workflows run smoothly and efficiently. This practice allows organizations to quickly identify and resolve any issues or bottlenecks that disrupt the automation process. 

## Key benefits of monitoring flows

Proactively monitor flows to take necessary actions to enhance overall performance. Here are some key benefits:

- **Issue identification and resolution**: Monitoring helps promptly detect and address emerging issues, such as errors or delays in the flow execution.

- **Performance enhancement**: Monitor flow performance to implement measures to optimize workflows, leading to improved efficiency and productivity.

- **Security and compliance**: Regular monitoring helps identify potential security vulnerabilities or compliance concerns. This approach is essential for safeguarding sensitive data and ensuring that workflows adhere to regulatory requirements.

- **Insight into usage patterns**: Monitoring provides valuable insights into how flows are used. Understanding usage patterns helps businesses make informed decisions about optimizing workflows for better performance and cost-effectiveness.

## How to monitor Power Automate cloud flows

The Automation Center in Power Automate serves as a central hub for managing and overseeing all your automation activities. It offers a comprehensive interface that allows you to create, monitor, and optimize automated workflows across your entire organization. The Automation Center is designed to streamline operations, boost productivity, and ensure that all automation tasks run efficiently.

Learn more: [Automation center overview](/power-automate/automation-center-overview)

## Use process mining

The Process Mining capabilities in Power Automate provides valuable insights and helps you improve your cloud flows. You can:

- **Analyze flow performance**: See how your flow performs, identify areas where it slows down, and find opportunities for improvement.
- **Track performance changes**: Monitor any changes in your flow's performance over time.
- **Examine run history**: Use process mining methods to analyze your flow's run history directly from the flow details page, generating actionable insights.

:::image type="content" source="media/process-mining.png" alt-text="Screenshot of a Process Mining report.":::

> [!TIP]
> The **Runs and actions** section also provides information about the total action count of a flow run, helping you understand if your flow might run into daily action bursts throttling limits.

:::image type="content" source="media/process-mining-runs.png" alt-text="Screenshot of a Process Mining report showing the runs and actions section." lightbox="media/process-mining-runs.png":::

Learn more: [Improve cloud flows with process insights](/power-automate/process-mining-cloud-flow-process-insights)

## Cloud flow analytics

Power Automate offers built-in analytics capabilities that allow you to monitor flow runs, track execution history, and analyze flow performance. Use analytics dashboards and reports to gain insights into flow execution patterns and identify bottlenecks. 

Access **Cloud flow analytics** by selecting **Analytics** from the flow detail page.

The analytics page shows the following details:

- Flow usage (including number of actions requests from the cloud flow runs)
- Detailed flow error analysis (type of error, count, and last occurrence)
- History of last 30 days

:::image type="content" source="media/cloud-flow-analytics.png" alt-text="Screenshot of the Usage tab the cloud flow Analytics page." lightbox="media/cloud-flow-analytics.png":::

## Power Automate admin analytics

Environment admins can access analytics for Power Automate in the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com/analytics/flow). The reports provide insights into runs, usage, errors, types of flows created, shared flows, and details on connectors associated with all the different flow types, including automated flows, button flows, scheduled flows, approval flows, and business process flows. 

The Power Platform admin center also provides:

- Reports of flow usage based on environments, environment type, and region
- Flow inventory, including flow state
- Maker activity (but only the user ID)
- Number of failed runs (no information which flows failed)
- 28 days history

:::image type="content" source="media/ppac-flow-analytics.png" alt-text="Screenshot of the flow analytics in the Power Platform Admin Center." lightbox="media/ppac-flow-analytics.png":::

Learn more: [View analytics for cloud flows](/power-platform/admin/analytics-flow)

## Power Automate management connectors

The Power Automate service also provides ways to automate some of the management activities for flows via the **Power Automate Management** and **Power Automate for Admins** connectors.

The **Power Automate Management** connector provides actions for managing flows, such as creating, updating, and deleting flows, as well as retrieving flow metadata and run history. It allows you to programmatically interact with flows within your Power Automate environment. Admins can run some of these actions suffixed with "As Admin." Learn more: [Power Automate Management connector](/connectors/flowmanagement/).

The Power Automate for Admins connector is used primarily by administrators to enable/disable flows, change flow owners, and so on. Learn more: [Power Automate for Admins connector](/connectors/microsoftflowforadmins/).

## Power Automate app insights

Application Insights is a feature of Azure Monitor that provides extensive monitoring and diagnostic capabilities for web applications. Integrating Power Automate with Application Insights lets you monitor, analyze, and optimize your cloud flows.

Key features of the integration include:

- **Comprehensive monitoring**: Application Insights collects telemetry data from your Power Automate flows, including flow runs, triggers, and actions. This data is stored in Azure Monitor logs and can be visualized in various panels within Application Insights.

- **Performance analysis**: Integration with Application Insights provides detailed performance metrics, such as the duration of flow runs and the frequency of specific actions. This data helps identify bottlenecks and optimize flow performance.

- **Error tracking**: Application Insights tracks errors and failures in your flows, offering insights into the root causes. This information enables quick troubleshooting and resolution of issues.

- **Custom alerts**: You can set up custom alerts based on specific criteria, such as flow failures or performance thresholds. These alerts help you to stay informed about critical issues and to take timely action.

- **Usage insights**: The integration provides insights into usage patterns, helping you understand how flows are being used across your organization. This information can guide decisions on optimizing and scaling your automation efforts.

In Power Automate, data from flow runs, triggers, and actions can be linked to Application Insights at the environment level. Data from multiple environments can be logged into the same Application Insights resource.

Cloud flow runs telemetry is stored in the *requests* table, and trigger and action level data is stored in the *dependencies* table.

Learn more: [Set up Application Insights with Power Automate](/power-platform/admin/app-insights-cloud-flow) 

## Flow run history in Dataverse

Flow run history in Microsoft Dataverse lets you track and manage the execution history of your Power Automate cloud flows at scale. This feature uses Dataverse's robust data architecture to provide detailed insights and enhanced control over your automation processes.

Each execution of a cloud flow is recorded in the *FlowRun* table in Dataverse. This information includes key elements such as the start time, end time, duration, status (success, failure, or cancellation), and detailed error messages if applicable  

The *FlowRun* table empowers the Automation Center to generate meaningful data about cloud flows execution. Unlike the default retention period in Power Automate, storing run history in Dataverse allows you to retain execution records for longer periods. This data is useful for auditing, compliance, and long-term analysis.

With the run history data in Dataverse, you can build custom reports to analyze automation performance, calculate return on investment (ROI), and monitor usage patterns. These reports inform decisions around workflow optimization. 

Learn more:
- [Manage cloud flow run history in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata)
- [Known limitations](/power-automate/dataverse/cloud-flow-run-metadata#known-limitations)

By consistently monitoring Power Automate flows, businesses can ensure their workflows are robust, secure, and optimized for maximum efficiency. This proactive approach not only enhances performance but also helps in maintaining compliance and safeguarding sensitive information.
