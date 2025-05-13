---
title: Monitor and troubleshoot your automation processes
description: Monitor and troubleshoot your automation processes with actionable insights to ensure reliability and efficiency. Learn how to optimize and maintain seamless operations.
# customer intent: As a Power Automate user, I want to monitor desktop flow action logs so that I can ensure seamless operation and troubleshoot issues effectively.
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Monitor and troubleshoot your automation processes

Monitor and troubleshoot your automation activities to ensure seamless operation. Get insights into maintaining and optimizing your automation processes so they stay reliable and efficient. Whether you're managing desktop flows or analyzing tenant-level performance, these strategies help ensure smooth operations and resolve issues effectively.

## Capture desktop flow run action logs

- Configure the desktop flow action log version to **V2**. Logs V2 uses Elastic Tables, provides automatic data retention, and can scale up to gigabytes of action logs per run. Learn more about [Desktop flow action logs configuration](/power-automate/desktop-flows/configure-desktop-flow-logs).

- With logs V2, you get near real-time updates of actions as your desktop flow runs. Learn more about [progressive action logging](/power-automate/desktop-flows/monitor-run-details#progressive-action-logging).

:::image type="content" source="media/monitor-automation-processes/desktop-flow-run.png" alt-text="Screenshot of desktop flow action logs configuration screen." lightbox = "media/monitor-processes/desktop-flow-run.png":::

- Use the [**Log message** action](/power-automate/desktop-flows/actions-reference/logging) to log custom text messages with a severity level of Info, Warning, or Error in the flow run action details.

- Use the **Display message** action to show messages on the user’s screen that are also logged in the flow run details. These messages are useful for interacting with attended flow runs and debugging.

- As an alternative logging method, use your own custom logging mechanism. For example, use the **Microsoft Dataverse**, **SharePoint**, or **File** actions to log custom messages to a cloud or local location.

- Use log messages to track flow progress and record important details such as input values, output values, intermediate results, or error messages.

- Use the **Get last error** action to capture and log the last error in the flow.

## Use the Automation center and other out-of-the-box reports

There are two types of reports - Environment level reports and Tenant level reports.

### Environment level reports

The [Automation center](/power-automate/automation-center-overview) in the Power Automate portal is a centralized hub to monitor and manage automation activity within an environment.

It shows all automation-related data, including a process map, recommendations, execution logs, performance metrics, and an integrated copilot.

Here's a list of additional automation-related out-of-the-box reports:

- **Cloud flow activity** - View a summary of daily cloud flow activity.

- [**Desktop flow activity**](/power-automate/desktop-flows/desktop-flow-activity) - Monitor and manage your desktop automations and machines.

- [**Desktop flow runs**](/power-automate/desktop-flows/monitor-desktop-flow-runs) - Troubleshoot issues using an overview of your desktop automations.

- [**Capacity utilization**](/power-automate/desktop-flows/capacity-utilization) - Get an overview of your capacity utilization and recommendations to manage your automations and the desktop infrastructure more efficiently.

### Tenant level reports

The [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center shows **detailed analytics** to help you understand the health of your enterprise automations and **proactive recommendations** to improve your flows’ health and efficiency.

It lets you measure and improve the operational health metrics of your automation-related assets across environments and highlights resources with degraded operational health that might need improvement.

:::image type="content" source="media/monitor-automation-processes/tenant-reports.png" alt-text="Screenshot of the Monitor page in the Power Platform admin center showing analytics and recommendations." lightbox = "media/monitor-automation-processes/tenant-reports.png":::

## Build your own reports on MS Fabric

For more advanced or custom monitoring, reporting, and analysis, integrate with Microsoft Fabric. The **Link to Microsoft Fabric** feature in Power Platform lets you access all your Power Automate data in Microsoft OneLake, the built-in data lake for Microsoft Fabric.

:::image type="content" source="media/monitor-automation-processes/fabric.png" alt-text="Screenshot of Microsoft Fabric interface showing Power Automate data in OneLake." lightbox = "media/monitor-automation-processes/fabric.png":::

Learn how to [generate automation-centric data analytics with Fabric](/power-automate/automation-analytics-with-fabric-introduction) and [create automation-related SQL queries](/power-automate/automation-analytics-with-fabric-queries) on the SQL Analytical Endpoint in Fabric.
