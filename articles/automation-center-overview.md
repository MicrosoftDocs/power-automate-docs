---
title: Explore Power Automate's automation center
description: Explore the comprehensive monitoring and troubleshooting experiences offered by Power Automate's Automation Center, a hub for managing automation activity.
ms.topic: article
ms.date: 02/26/2026
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
ms.custom: ignite-2024
search.audienceType:
  - admin
  - coe
  - flowmaker
  - enduser
---

# Explore Power Automate's automation center

The automation center provides comprehensive monitoring and troubleshooting experiences for your automation processes across Power Automate, catering to various personas involved in automation. Whether you're a maker, an operator, a Center of Excellence (CoE) team member, or a business analyst, the automation center serves as a centralized hub to monitor and manage automation activity within your environment. With its user friendly interface and dashboard, the automation center enables you to gain a holistic view of all automation related data, including recommendations, execution logs, performance metrics, and an integrated copilot.

## Automation center navigation

The automation center is organized into two main sections: **Monitor** and **Value**. These sections provide access to different aspects of your automation environment.

### Monitor section

The Monitor section contains pages for tracking and analyzing automation execution and resources:

- **Runs** - View and analyze cloud and desktop flow execution data with filtering options for overview, run history, and current desktop flow runs
- **Process map** - Visualize your automation processes with a hierarchical view of main flows and their child flows
- **Work queues** - Monitor work queue health, throughput, and service level agreements (SLAs)
- **Machines** - Manage and monitor machine and machine group status and connectivity
- **Errors** - Track and troubleshoot errors across your automation environment
- **AI Builder activity** - Monitor AI Builder model usage and performance within your flows

### Value section

The Value section focuses on measuring the business impact of your automation investments:

- **Savings** - Track cost savings and efficiency gains from your automation efforts
- **Capacity utilization** - Monitor how effectively your automation resources are being used

## Data and visualization strategy

The information displayed on the **Overview**, **Runs** and **Process map (preview)** pages is based on cloud and desktop flow run data that is stored in Microsoft Dataverse. These pages are designed to provide you with a top-level view of your flow run activities, including child cloud or desktop flow runs associated with a particular top-level flow. This approach enables you to monitor the entire automation from start to end. It allows you to determine whether the overall automation succeeded or failed, providing data on the total of the runs, among many other metrics.

> [!NOTE]
> - Some filters might not be available for some tabs because of the nature of the presented data.
> - Data under the **Work queues** tab is a premium feature, which requires a Power Automate Premium license.
> - Recommendations is a premium feature, which requires a [Managed Environment](/power-platform/admin/managed-environment-enable).
> - When you navigate between tabs, the tab keeps the active filtering selection. Select **Clear filters** to reset the applied filters.
> - Desktop flow related activities like desktop flow runs and work queues etc. have always been available in Dataverse, however cloud flow run history has only recently been introduced in Dataverse. [Learn more](dataverse/cloud-flow-run-metadata).
> - Cloud flow run history shown on the overview and runs tab might take up to an hour to be available in Dataverse and the automation center.
> - By default, visualizations are based on top-level cloud flow runs only. By using filters, you can also see visualizations for child flows.

## Required permissions

The Automation Center's underlying data is managed through Dataverse tables, secured via role-based access control (RBAC). In standard Dataverse environments (production, trial, sandbox, developer), necessary privileges are included in the default environment maker role. Administrators can assign users to this role as needed. In **Default** environments with a provisioned Dataverse database, all users automatically become environment makers. Additionally, administrators can create custom security roles with row-level privileges to control the data users can view and interact with.

Here are the main tables used in the Automation Center:

| Table name | Privilege name | Description |
|---|---|---|
| Process | `prvReadWorkflow` | Stores desktop flows and solution-aware cloud flows. |
| Flow Session | `prvReadflowsession` | Stores desktop flow run data. |
| Flow Run | `prvReadflowrun` | Stores cloud flow run data ingested through the feature [Manage cloud flow run history in Dataverse](dataverse/cloud-flow-run-metadata). |
| Flow Log | `prvReadflowlog` | Stores atomic logs such as Power Automate desktop flow run action logs (requires [logs V2 enablement](desktop-flows/configure-desktop-flow-logs)), machine run logs, etc. |
| Flow Event | `prvReadflowevent` | Stores recommendation-related data and more. |
| Work Queue | `prvReadworkqueue` | Stores work queue data. |
| Work Queue Item | `prvReadworkqueueitem` | Stores work queue item data belonging to a particular work queue. |

> [!NOTE]
> - In Dataverse for Teams environments, users must be members of the Dataverse for Teams environment to access the Automation Center. [Learn more](/power-apps/teams/data-platform-faqs#how-does-security-and-governance-differ-between-dataverse-and-microsoft-dataverse-for-teams). Consider upgrading your environment for more granular control over privileges and additional features.
> - The **Work Queue** tab isn't available in Dataverse for Teams environments.

## Runs page

The Runs page, located in the Monitor section, presents a consolidated view of cloud and desktop flow run data displayed in a hierarchical list view. The data is organized based on top-level flows. This view is useful in scenarios where individual flow session runs succeeded, but other dependent runs failed, ultimately resulting in the top-level flow's failure. By displaying these runs in connection to their parent, we're enhancing automation monitoring and efficient root cause analysis of exceptions.

### Overview tab

The Overview tab provides an end-to-end automation health view within the environment and is based on top-level flow reporting. The Recommendations section of this tab provides actionable insights to your automation estate. You can prioritize and address the most important issues and recommendations, based on their potential impact.

| Visual | Description |
|---|---|
| **Recommendations** | List of automation health, compliance, best practice insights, and actionable recommendations. |

#### Activity

| Visual | Description |
|---|---|
| **Top-level flows** | Number of top-level flows that had one or more runs based on selected filters. Gives an overall automation health indication and helps identify which top-level runs are failing the most. |
| **Total runs** | Number of flow runs based on selected filters. |
| **Flow runs error rate** | Percentage of errors that occurred during flow execution based on selected filters. |
| **Flow runs error trends** | Tracks usage and reliability trends of top-level runs over time. |
| **Average desktop flow runs duration** | Shows the average duration of desktop flow runs based on selected filters. This metric helps you understand the typical execution time of your desktop flows and identify performance trends. |
| **Flow runs by status** | Displays the proportion of flow runs by their completion status (succeeded, failed, canceled). This donut chart provides a quick visual overview of your automation health. |
| **Top flow runs** | Quickly identify critical and regularly failing automations, in order to improve health, resiliency, and exception handling. |
| **Flow run failures** | Shows latest flows that failed and might need to be modified to reduce desktop flow failures. |

#### Recommendations

The recommendations section offers both proactive and reactive insights, along with suggestions concerning various elements of your automation landscape. Suggestions might include addressing sudden automation failures, work queues at risk of not meeting their service level agreement (SLA) targets, and unused machines or machine groups in the environment. These recommendations can help you identify areas for improvement and take appropriate action based on their effect. For more information, see [automation center recommendations](automation-center-recommendations.md).

### Run history tab

The Run history tab shows detailed execution history for all flows in your environment, allowing you to drill down into specific run details and troubleshoot issues.

### Current desktop flow runs tab

The Current desktop flow runs tab allows you to monitor active desktop flow runs. These pivot tables provide information about the number of running and queued desktop flows, and lists with the running and queued desktop flows.

By selecting **Auto refresh**, all the cards will be refreshed automatically.

| Visual | Description |
|---|---|
| **Currently running** | Displays the total number of desktop flows that are currently running. |
| **Currently queued** | Displays the total number of desktop flows that are in queue. |
| **Running desktop flows** | Shows the number of running flows per period of time. It allows you to see if some of your desktop flows are stacked during their execution or if there's throttling on specific machines. |
| **Running desktop flows** | Displays the list of flows that are currently running. You can select **Requested** items to reach the run details page, **Desktop flow** items to reach the desktop flow details page, and **Target** items to reach the machine or machine group details page. |
| **Desktop flow in run queue** | Displays the list of flows that are currently in queue. You can select **Requested** items to reach the run details page, **Desktop flow** items to reach the desktop flow details page, and **Target** items to reach the machine or machine group details page. |

> [!NOTE]
> **Target** for run queue table doesn't display information for standalone machines.

## Process map page

The Process map page is designed to make troubleshooting and monitoring in Power Automate more efficient and transparent. It provides a clear process-centric view of the main orchestrating flow and all its child flows that run during a process run. It also understands important structural details about the flows, like conditions, so it can show flows that are part of the process but didn't run because of certain conditional logic or errors. [Learn more](automation-center-process-map.md)

## Work queues page

The Work queues page provides metrics to monitor the health status of work queue items, including throughput, average handling time, and distribution. These metrics help to identify areas for improvement and track performance over time.

### Overview tab

| Visual | Description |
|---|---|
| **Work queue distribution** | Shows the number of work queues with SLA-specific configuration, such as "default item expiration" applied. |
| **Work queue SLA status (preview)** | Shows the number of work queues items for each SLA status, such as "In", "At risk", "Out", "Not Set". |
| **Work queue volumes by status** | Shows the number of work queue items categorized by their processing status, with a breakdown of exception types (available when hovering over the exception category). |
| **Work queue throughput** | Shows the number of items successfully processed in a work queue within a specific time unit, along with their error rate and trend. |
| **Work queue item error distribution** | Shows the distribution of work queue items per error state, such as "Business exception," "IT exception," and "Processing timeout". |
| **Work queue requeue rate** | Shows how often work queue items are being requeued for further processing or manual handling. |
| **Average handling time trend** | Shows the trend of average handling time for work queue items over time. |
| **Top work queues by average handling time** | Shows the top five work queues with the highest average handling time in descending order. |
| **Average handling time** | Shows the average handling time for items in a work queue. |
| **Top work queue handling by processor** | Shows the top five work queues with the highest number of items successfully processed per processor. |
| **Top work queues by expiring items** | Shows the top five work queues ranked by the number of expiring items in the work queue. |
| **Top work queues by error frequency** | Shows the top five work queues with the highest number of items in error state. |

### Items tab

The Items tab displays individual work queue items with detailed information about their status, priority, enqueue date, completion date, and assigned processors. You can filter items by various criteria including queue name, status, priority, SLA status, and user.

> [!NOTE]
> If you filter work queue items by a specific item status, such as "Business exception," any matching item that has already expired isn't considered in the results. This is because expired items are deemed unprocessable unless their expiration date is extended first, which takes precedence over lower-level exception type searches.

## Machines page

The Machines page allows you to monitor your machines and machine groups. These pivot tables provide information about the number of machines, groups, connection status, Power Automate for desktop versions installed on machines, and lists of machines and machine groups.

| Visual | Description |
|---|---|
| **Connection status** | Displays the connection status of your machines (connected, disconnected, action needed). If you want to see machines that are disconnected, select **See more**. In the pane, you can see all the machines per connection status. You can select the machine name to reach its details page. |
| **Versions on machines** | Displays for each version of Power Automate for desktop, the number of machines that use this version. This feature is useful to understand which machines require updates (you should update your application regularly). From filters, you can select a dedicated version and see machines that are using this version. |
| **Machines** | Displays the 10 last modified machines (name, description, version, status). Select **See all** to view the full list of items, if you have more than 10 machines. |
| **Machine groups** | Displays the 10 last modified machine groups (name, description, version, status). Select **See all** to view the full list of items, if you have more than 10 groups. |

> [!NOTE]
> There is a limit of 40 connection statuses displayed at one time. If you have more machines in your environment, use the filters to reduce the current selection.

## Errors page

The Errors page helps you identify the most common errors that occur while your flows run. These pivot tables provide information about desktop flows, cloud flows, and machines in which errors occurred, allowing you to view details to identify the source of errors.

By default, this page displays the desktop flow run errors for the last seven days. Optionally, you can select another time period and filter on specific errors.

| Visual | Description |
|---|---|
| **Top errors** | Displays the errors that occur most frequently during your desktop flow runs. If you can't see a specific error in the card, select the **All errors** filter, and then choose the error that you want to see. |
| **Top failed desktop flows** | Displays the desktop flows that failed the most in your environment. You can select each desktop flow to display its details page. |
| **Top cloud flows with failed desktop flows** | Provides a list of cloud flows that are the most impacted by failures in desktop flows. For example, if a cloud flow contains two desktop flows and these desktop flows failed two times each, you'll see this cloud flows with a count of four errors. |
| **Top machine failures** | Displays information about the machines on which desktop flow runs failed most frequently. You can select each machine name to display its details page. |
| **Error trends** | Displays daily trends for errors in desktop flow runs. These trends can help you to identify if an error started to appear recently or several days ago. In addition to trends per error, the chart can display trends per desktop flow and machine. Select the dropdown menu of the table to display the type of pivot you prefer. |

## AI Builder activity page

The AI Builder activity page tracks the usage and performance of AI Builder models integrated with your flows, helping you understand how AI capabilities are being utilized in your automation environment.

## Savings page

The Savings page, located in the Value section, helps you quantify the return on investment (ROI) from your automation efforts by tracking cost savings, time saved, and efficiency gains. To enable savings tracking in your environment, see [savings in Power Automate](savings.md)

## Capacity utilization page

The Capacity utilization page provides insights into how effectively your automation resources are being used, helping you optimize resource allocation and plan for future capacity needs. For more information, see [Capacity utilization within Power Automate](/power-automate/desktop-flows/capacity-utilization.md)

## Copilot

Copilot is designed to assist with the analysis of automation activity, work queue performance, and to provide answers to common questions about Power Automate capabilities (generative answers). For example, users can ask about the number of flows that ran yesterday, which queue items are put on hold, or how to analyze activity with Copilot. In response, Copilot generates outputs that provide insights and answers to the questions asked. For more information, see [Use Copilot to analyze automation activity and ask product questions](automation-center-copilot.md).

> [!IMPORTANT]
> - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
> - Copilot is a new technology that is still being developed. It's optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.
> - Read the [responsible AI FAQs for Copilot in automation center](faqs-copilot-automation-center.md) to learn more about this new copilot experience.

## Known limitations

The following are current limitations of the automation center and its underlying data structure:

- Cloud flow-based filtering only lists cloud flows that exist within a solution in the current environment.
- Only runs for solution-based cloud flows are available in the automation center.
- Visibility of flows and their run history in automation center requires you to be the owner (coownership isn't sufficient) of the flows or to have environment wide access to the relevant data in the environment. The main Dataverse tables that power the data shown in the automation center are:
  - `workflow`: Solution-aware cloud flow and desktop flows
  - `flowrun`: [Cloud flow run history](dataverse/cloud-flow-run-metadata.md)
  - `flowsession`: Desktop flow run history
  - `flowevent`: Recommendations and notifications
  - `workqueue`: Work queues
  - `workqueueitem`: Work queue items
  - `businessprocess`: Process map details and definition
- Child cloud and desktop flow runs are shown under **Runs**.
- Top-level desktop flow runs aren't supported yet (for local attended or API-based scenarios)
- Co-owned or shared flows aren't supported yet (users don't see runs of flows that are shared with them).
- Users with broader access to run data (such as admins or members of the CoE team) might see *Unknown flow* as flow names. This name might appear if the corresponding cloud flow isn't explicitly shared with the user or the flow was deleted in the meantime.
- Users with broader access to run data might encounter increased latency during data load because of high cloud flow run volumes. Performance can be improved by selecting more filters and reducing date ranges.
- If there's a visual showing "*Too many results*," try to adjust your filter to limit the amount of data that is being returned.
- If you see Dataverse or cloud flow run-specific notifications, check the underlying [cloud flow run history documentation](dataverse/cloud-flow-run-metadata.md) to learn more.
- Older cloud flow run history might be missing for the selected date range filter. Missing run history might be due to your current environment's [time to live](dataverse/cloud-flow-run-metadata.md#storage-use-for-flowrun-records) (TTL) configuration, which is set to retain cloud flow runs for *n-days* only.

## Related information

- [Use process map](automation-center-process-map.md)
- [Recommendations within automation center](automation-center-recommendations.md)
- [Use Copilot in automation center](automation-center-copilot.md)
- [Manage cloud flow run history in Dataverse](dataverse/cloud-flow-run-metadata.md)
