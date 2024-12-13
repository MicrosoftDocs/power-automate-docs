---
title: Monitoring and alerting
description: Learn how to implement robust monitoring and alerting
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Monitoring and alerting

Regularly monitoring Power Automate flows is vital for businesses to ensure their workflows run smoothly and efficiently. This practice allows organizations to quickly identify and resolve any issues or bottlenecks that could disrupt the automation process. By proactively monitoring flows, businesses can take necessary actions to enhance overall performance.

## Key benefits of monitoring flows

1. **Issue Identification and Resolution**: Monitoring helps in promptly detecting and addressing emerging issues, such as errors or delays in the flow execution. This ensures minimal disruption to business operations.

1. **Performance Enhancement**: By keeping an eye on flow performance, businesses can implement measures to optimize workflows, leading to improved efficiency and productivity.

1. **Security and Compliance**: Regular monitoring aids in identifying potential security vulnerabilities or compliance concerns. This is essential for safeguarding sensitive data and ensuring that workflows adhere to regulatory requirements.

1. **Insight into Usage Patterns**: Monitoring provides valuable insights into how flows are being used. Understanding usage patterns can help businesses make informed decisions about optimizing workflows for better performance and cost-effectiveness.

## How to monitor Power Automate cloud flows

### Automation Center

The Automation Center in Power Automate serves as a central hub for managing and overseeing all your automation activities. It offers a comprehensive interface that allows you to create, monitor, and optimize automated workflows across your entire organization. This feature is designed to streamline operations, boost productivity, and ensure that all automation tasks run efficiently.

Learn more: [Automation center overview](/power-automate/automation-center-overview).

## Use Process Mining

The process mining capability in Power Automate allows you to gain valuable insights and improve your cloud flows. With this feature, you can:

- **Analyze Flow Performance**: See how your flow performs, identify areas where it slows down, and find opportunities for improvement.
- **Track Performance Changes**: Monitor any changes in your flow’s performance over time.
- **Examine Run History**: Use process mining methods to analyze your flow’s run history directly from the flow details page, generating actionable insights.

![A screenshot of a Process Mining report](media/image81.png)

The Runs and actions section also gives information about the total action count that a flow run took. This is important to understand if your flow has a possibility of running into daily action bursts throttling limits. 

![A screen shot of a graph  Description automatically generated](media/image82.png)

Learn more: [Improve cloud flows with process insights](/power-automate/process-mining-cloud-flow-process-insights)

## Cloud Flow Analytics

Power Automate offers built-in analytics capabilities that allow you to monitor flow runs, track execution history, and analyze flow performance. Leverage analytics dashboards and reports to gain insights into flow execution patterns and identify bottlenecks. 

You can access Cloud Flow Analytics using the menu button "Analytics" from each Microsoft Flow detail page.

The analytics page will show the following details: 

- Flow usage (including number of actions requests from the cloud flow runs)
- Detailed flow error analysis (type of error, count and last occurrence)
- History of 30 days

![A screenshot of a the cloud flow analytics](media/image84.png)

## Power Automate Admin Analytics

Environment admins can access analytics for Power Automate in the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com/analytics/flow). The reports provide insights into runs, usage, errors, types of flows created, shared flows, and details on connectors associated with all the different flow types like automated flows, button flows, scheduled flows, approval flows, business process flows. 

Covers following details :

Reports of flow usage based on environments, environment type and region

Flow inventory, including flow state

Maker activity (but only the user ID)

Number of failed runs (no information which flow failed)

28 days history

![A screenshot of a computer  Description automatically generated](media/image85.png)

Learn more: [View analytics for cloud flows](/power-platform/admin/analytics-flow)

## Power Automate Management connectors

Power Automate service also provides ways to automate some of the management activities for Flows via the **Power Automate Management** and **Power Automate for Admins** connectors.

The **Power Automate Management** connector provides actions for managing flows, such as creating, updating, and deleting flows, as well as retrieving flow metadata and run history. It allows you to programmatically interact with flows within your Power Automate environment. Admins can run some of these actions which are suffixed with "As Admin". Learn more: [Power Automate management connector](/connectors/flowmanagement/).

Power Automate for Admins connector on the other hand are used mostly by administrators giving them the ability to enable/disable flows, change flow owners etc. Learn more: [Power Automate for Admins connector](/connectors/microsoftflowforadmins/).

## Power Automate App Insights

Application Insights is a feature of Azure Monitor that provides extensive monitoring and diagnostic capabilities for web applications. Integrating Power Automate with Application Insights allows you to leverage these capabilities to monitor, analyze, and optimize your cloud flows.

## Key features of the integration

1. **Comprehensive Monitoring**: Application Insights collects telemetry data from your Power Automate flows, including flow runs, triggers, and actions. This data is stored in Azure Monitor logs and can be visualized in various panels within Application Insights.

1. **Performance Analysis**: The integration provides detailed performance metrics, such as the duration of flow runs and the frequency of specific actions. This helps identify bottlenecks and optimize flow performance.

1. **Error Tracking**: Application Insights tracks errors and failures in your flows, offering insights into the root causes. This enables quick troubleshooting and resolution of issues.

1. **Custom Alerts**: You can set up custom alerts based on specific criteria, such as flow failures or performance thresholds. These alerts help you stay informed about critical issues and take timely action.

5. **Usage Insights**: The integration provides insights into usage patterns, helping you understand how flows are being used across your organization. This information can guide decisions on optimizing and scaling your automation efforts.

In Power Automate, data from flow runs, triggers, and actions can be linked to Application Insights at the environment level. However, data from multiple environments can be logged into the same Application Insights resource.

Cloud flow runs telemetry get stored in **requests** table and trigger and action level data gets stored in the **dependencies** table.

Learn more: [Set up Application Insights with Power Automate](/power-platform/admin/app-insights-cloud-flow) 

## Flow Run history in Dataverse

The Flow Run History feature in Microsoft Dataverse allows you to track and manage the execution history of your Power Automate cloud flows at scale. This feature leverages Dataverse’s robust data architecture to provide detailed insights and enhanced control over your automation processes.

Each execution of a cloud flow is recorded in the FlowRun table within Dataverse. This includes key elements such as the start time, end time, duration, status (success, failure, or cancellation), and detailed error messages if applicable  

This preview feature (as of June 2024) will allow the flow run details to be stored in Dataverse within the FlowRun table. This will empower Automation center to generate meaningful data about cloud flows execution. Unlike the default retention period in Power Automate, storing run history in Dataverse allows you to retain execution records for longer periods. This is particularly useful for auditing, compliance, and long-term analysis.

With the run history data in Dataverse, you can build custom reports to analyze automation performance, calculate return on investment (ROI), and monitor usage patterns. This helps in making informed decisions to optimize your workflows. 

Learn more:
- [Manage cloud flow run history in Dataverse](/power-automate/dataverse/cloud-flow-run-metadata)
- [Known limitations](/power-automate/dataverse/cloud-flow-run-metadata#known-limitations)

By consistently monitoring Power Automate flows, businesses can ensure their workflows are robust, secure, and optimized for maximum efficiency. This proactive approach not only enhances performance but also helps in maintaining compliance and safeguarding sensitive information.

