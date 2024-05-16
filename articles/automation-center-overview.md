---
title: Automation center (preview)
description: Monitor and manage automations with Automation center.
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
  - flowmaker
  - enduser
---

# Automation center (preview)

[This article is prerelease documentation and is subject to change.]

The automation center provides comprehensive monitoring and troubleshooting experiences for your automation processes across Power Automate, catering to various personas involved in automation. Whether you're a maker, an operator, a Center of Excellence (CoE) team member, or a business analyst, the automation center serves as a centralized hub to monitor and manage automation activity within your environment. With its user friendly interface and dashboard, the automation center enables you to gain a holistic view of all automation related data, including recommendations, execution logs, performance metrics, and an integrated copilot.

:::image type="content" source="media/automation-center/automation-center-overview.png" alt-text="Screenshot of a copilot experience as part of desktop flow activity page." lightbox="media/automation-center/automation-center-overview.png":::

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Data and visualization strategy

The information displayed on the [**Overview**](#overview-tab) and [**Runs**](#runs-tab) pages is based on cloud and desktop flow run data that is stored in Microsoft Dataverse. These pages are designed to provide you with a **top-level** view of your flow run activities, including first-level child cloud or desktop flow runs associated with a particular top-level flow. This approach enables you to monitor the entire automation from start to end. It allows you to determine whether the overall automation succeeded or failed, providing data on the total and average duration of the runs, among many other metrics.

> [!NOTE]
>
> - Some filters may not be available for some pivots because of the nature of the presented data.
> - Data under the **Work queues** tab and **Recommendations** are premium features, which require a Power Automate Premium license.
> - When you navigate between tabs, the tab keeps the active filtering selection. Select **Clear filters** to reset the applied filters.
> - Desktop flow related activities like desktop flow runs and work queues etc. have always been available in Dataverse, however cloud flow run history has only recently been introduced in Dataverse. [Learn more](dataverse/cloud-flow-run-metadata.md).

## Copilot

Copilot is designed to assist with the analysis of automation activity, work queue performance, and to provide answers to common questions about Power Automate capabilities (generative answers). For example, users can ask about the number of flows that ran yesterday, which queue items are put on hold, or how to analyze activity with Copilot. In response, Copilot generates outputs that provide insights and answers to the questions asked. For more information, see [Use Copilot to analyze automation activity and ask product questions](automation-center-copilot.md).

> [!IMPORTANT]
>
> - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
> - Copilot is a new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.
> - During initial preview, you must have an environment in the United States region to use this feature. If you don’t have access to an environment that's based in the United States, you can ask your administrator to [create a new environment in Power Platform admin center and select United States](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) as its region.
> - Read the [responsible AI FAQs for Copilot in automation center (preview)](faqs-copilot-automation-center.md) to learn more about this new copilot experience.

## Overview tab

This tab provides an end-to-end automation health view within the environment and is based on top-level flow reporting. The [Recommendations](#recommendations) section of this tab provides actionable insights to your automation estate. You can prioritize and address the most important issues and recommendations, based on their potential impact.

:::image type="content" source="media/automation-center/automation-center-overview-tab.png" alt-text="Screenshot of the overview page in automation center." lightbox="media/automation-center/automation-center-overview-tab.png":::

| Visual | Description |
| --- | --- |
| **Recommendations** | List of automation health, compliance, best practice insights, and actionable recommendations. |
| **Top-level flows** | Number of top-level flows that had one or more runs based on selected filters. Gives an overall automation health indication and helps identify which top-level runs are failing the most. |
| **Average runs per day**| Average number of flow runs per day based on selected filters. |
| **Average run duration**| Average flow run duration based on selected filters. |
| **Flow runs error rate** | Percentage of errors that occurred during flow execution based on selected filters. |
| **Flow runs by status** | Overview of top-level runs status, can be used as to correlate with other factors such as triggering type, run modes, or machines. |
| **Flow runs error trends** | Tracks usage and reliability trends of top-level runs over time. |
| **Flow runs by trigger type** | Shows top-level flow runs by trigger type. |
| **Top flow runs** | Quickly identify critical and regularly failing automations, in order to improve health, resiliency, and exception handling. |
| **Top error codes** | Identifies most common errors during flow runs. |
| **Top cloud flows with failed desktop flow runs**| Shows which cloud flows are causing the most desktop flow failures and might need to be modified to reduce desktop flow failures. |

### Recommendations

The recommendations section offers both proactive and reactive insights, along with suggestions concerning various elements of your automation landscape. This includes addressing sudden automation failures, work queues at risk of not meeting their service level agreement (SLA) targets, and unused machines or machine groups in the environment. These recommendations can help you identify areas for improvement and take appropriate action based on their impact. For more information, see [automation center recommendations](automation-center-recommendations.md).

## Runs tab

This tab presents a consolidated view of cloud and desktop flow run data displayed in a hierarchical list-view. The data is organized based on top-level cloud flows. If a cloud flow has one or more child flows (supporting both cloud and desktop children), the child flow names are indented and preceded by a *'>'* character. This view is useful in scenarios where individual flow session runs succeeded, but other dependent runs failed, ultimately resulting in the top-level flow's failure. By displaying these runs in connection to their parent, this view enhances automation monitoring and enables efficient root cause analysis of any exceptions.

:::image type="content" source="media/automation-center/automation-center-runs-tab.png" alt-text="Screenshot of the runs page on automation center." lightbox="media/automation-center/automation-center-runs-tab.png":::

## Work queues tab

This tab provides metrics to monitor the health status of work queue items, including throughput, average handling time, and distribution. These metrics help to identify areas for improvement and track performance over time.

:::image type="content" source="media/automation-center/automation-center-workqueue-tab.png" alt-text="Screenshot of the work queues page on automation center." lightbox="media/automation-center/automation-center-workqueue-tab.png":::

| Visual | Description |
| --- | --- |
| **Work queue distribution**| Shows the number of work queues with SLA-specific configuration, such as "default item expiration" applied. |
|**Work queue volumes by status** | Shows the number of work queue items categorized by their processing status, with a breakdown of exception types (available when hovering over the exception category). |
| **Work queue throughput**| Shows the number of items successfully processed in a work queue within a specific time unit, along with their error rate and trend. |
| **Work queue item error distribution** | Shows the distribution of work queue items per error state, such as "Business exception", "IT exception", and "Processing timeout". |
| **Work queue requeue rate** | Shows how often work queue items are being requeued for further processing or manual handling. |
| **Average handling time trend** | Shows the trend of average handling time for work queue items over time. |
| **Top work queues by average handling time**| Shows the top five work queues with the highest average handling time in descending order. |
| **Average handling time**| Shows the average handling time for items in a work queue. |
| **Top work queue handling by processor** | Shows the top five work queues with the highest number of items successfully processed per processor. |
| **Top work queues by expiring items**| Shows the top five work queues ranked by the number of expiring items in the work queue. |
| **Top work queues by error frequency** | Shows the top five work queues with the highest number of items in error state. |

> [!NOTE]
> If you filter work queue items by a specific item status, such as "Business exception", any matching item that has already expired won't be considered in the results. This is due to the fact that expired items are deemed unprocessable unless their expiration date is extended first, which takes precedence over lower-level exception type searches.

## Known limitations

The following are current limitations of the automation center and its underlying data structure. Some of these limitations will be resolved as we continue to develop this feature.

- Visualizations are based on top-level cloud flow runs only.
- Only runs for solution-based cloud flows are available in the automation center.
- Only 1st-level child cloud and desktop flow runs are shown under **Runs**.
- Top-level desktop flow runs aren't supported yet (for local attended or API-based scenarios)
- Co-owned or shared flows aren't supported yet (users don't see runs of flows that are shared with them).
- Child flow run-specific filters or sorting aren't supported yet.
- Users with broader access to run data (such as admins or members of the CoE team) might see *Private flow* as flow names if the corresponding cloud flow isn't explicitly shared with them (or deleted in the meantime).
- Users with broader access to run data might encounter increased latency during data load because of high cloud flow run volumes. Performance can be improved by selecting more filters and reducing date ranges.
- If there's a visual showing "*Too many results*", try to adjust your filter to limit the number of data that is being returned.
- If you see Dataverse or cloud flow run-specific notifications, check the underlying [cloud flow run history documentation](dataverse/cloud-flow-run-metadata.md) to learn more.
- Older cloud flow run history might be missing for the selected date range filter. This might be due to your current environment's [time to live](dataverse/cloud-flow-run-metadata.md#cloud-flow-run-elements) (TTL) configuration, which is set to retain cloud flow runs for a period of *n-days* only.
- Cloud flow run history in Dataverse is a preview feature as well, and comes with its own set of [known limitations](dataverse/cloud-flow-run-metadata.md#known-limitations) that might affect the data shown in the automation center.

## Learn more

- [Recommendations within automation center](automation-center-recommendations.md)
- [Use Copilot in automation center](automation-center-copilot.md)
