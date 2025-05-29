---
title: Monitor and troubleshoot automation processes
description: Learn how to monitor desktop flow action logs and troubleshoot issues effectively to ensure smooth automation processes in Power Automate.
#customer intent: As a Power Automate user, I want to capture detailed logs of my automation runs so that I can troubleshoot errors efficiently.
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/14/2025
---

# Monitor and troubleshoot automation processes

Monitor and troubleshoot your automation activities to ensure seamless operation. This article provides advice on maintaining and optimizing your automation processes to keep them reliable and efficient. 

## Capture desktop flow run action logs

To monitor and troubleshoot your desktop flow runs, capture action logs. Action logs provide detailed information about the execution of each action in your desktop flow, including input and output values, errors, and warnings.

- Configure the desktop flow action log version to **V2**. Logs V2 uses Elastic Tables, provides automatic data retention, and can scale up to gigabytes of action logs per run. Learn more about [Desktop flow action logs configuration](../../desktop-flows/configure-desktop-flow-logs.md).

    Logs V2 also provides near real-time updates of actions as your desktop flow runs. Learn more about [progressive action logging](../../desktop-flows/monitor-run-details.md#progressive-action-logging).

    :::image type="content" source="media/monitor-automation-processes/desktop-flow-run.png" alt-text="Screenshot from the Power Platform admin center showing the configuration of desktop flow run action logs." lightbox="media/monitor-automation-processes/desktop-flow-run.png":::

- Use the [**Log message** action](../../desktop-flows/actions-reference/logging.md) to log custom text messages with a severity level of Info, Warning, or Error in the flow run action details.

- Use the **Display message** action to show messages on the user's screen that are also logged in the flow run details. These messages are useful for interacting with attended flow runs and debugging.

- Use your own custom logging mechanism. For example, use the **Microsoft Dataverse**, **SharePoint**, or **File** actions to log custom messages to a cloud or local location.

- Use log messages to track flow progress and record important details such as input values, output values, intermediate results, or error messages.

- Use the **Get last error** action to capture and log the last error in the flow.

## Use Automation center reports

There are two types of reports: environment-level reports and tenant-level reports.

### Environment level reports

The [Automation center](../../automation-center-overview.md) in the Power Automate portal is a centralized hub to monitor and manage automation activity within an environment. It shows all automation-related data, including a process map, recommendations, execution logs, performance metrics, and an integrated copilot.

Other out-of-the-box reports include:

- **Cloud flow activity**: View a summary of daily cloud flow activity.
- [**Desktop flow activity**](../../desktop-flows/desktop-flow-activity.md): Monitor and manage your desktop automations and machines.
- [**Desktop flow runs**](../../desktop-flows/monitor-desktop-flow-runs.md): Troubleshoot issues using an overview of your desktop automations.
- [**Capacity utilization**](../../desktop-flows/capacity-utilization.md): Get an overview of capacity utilization and recommendations to manage automations and desktop infrastructure efficiently.

### Tenant level reports

The [Monitor page](/power-platform/admin/monitoring/monitoring-overview) in the Power Platform admin center provides detailed analytics to help you understand the health of your enterprise automations and offers proactive recommendations to improve the health and efficiency of your flows across environments. The Monitor page also highlights resources with degraded operational health that might need improvement.

:::image type="content" source="media/monitor-automation-processes/tenant-reports.png" alt-text="Screenshot of the Monitor page in the Power Platform admin center showing Power Automate analytics." lightbox="media/monitor-automation-processes/tenant-reports.png":::

## Build your own reports using Microsoft Fabric

For more advanced or custom monitoring, reporting, and analysis, integrate with Microsoft Fabric. The **Link to Microsoft Fabric** feature in Power Platform lets you access all your Power Automate data in Microsoft OneLake, the built-in data lake for Microsoft Fabric.

:::image type="content" source="media/monitor-automation-processes/fabric.png" alt-text="Screenshot of Power Apps interface showing integration with Microsoft Fabric." lightbox="media/monitor-automation-processes/fabric.png":::

Learn how to [generate automation-centric data analytics with Fabric](../../automation-analytics-with-fabric-introduction.md) and [create automation-related SQL queries](../../automation-analytics-with-fabric-queries.md) on the SQL Analytical Endpoint in Fabric.

## Related information

- [Run static analysis in the portal](/power-automate/desktop-flows/static-analysis#run-static-analysis-in-the-portal)