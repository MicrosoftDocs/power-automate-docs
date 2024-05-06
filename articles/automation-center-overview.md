---
title: Automation center (preview)
description: Monitor and manage automations with Automation center
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
  - flowmaker
  - enduser
---

# Automation center (preview)

[This article is prerelease documentation and is subject to change.]

The **Automation center** provides comprehensive monitoring and troubleshooting experiences for your automation processes across Power Automate, and the needs of a diverse set of personas involved in automation. Whether you're a maker, an operator, a Center of Excellence (CoE) team member or a business analyst, the Automation center provides you with a centralized platform to monitor and manage automation activity within your environment. With its user-friendly interface and dashboard, the Automation center enables you to gain a holistic view of all automation-related data, including test results, execution logs, and performance metrics.

:::image type="content" source="media/automation-center/automation-center-overview.png" alt-text="Screenshot of a copilot experience as part of desktop flow activity page." lightbox="media/automation-center/automation-center-overview.png":::

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Data and visualization strategy

The information displayed on the [**Overview**](#overview-tab) and [**Runs**](#runs-tab) pages is based on cloud and desktop flow run data that is stored in Dataverse. These pages are designed to provide you with a **top-level** view of your flow run activities, including first-level child cloud or desktop flow runs associated with a particular top-level flow. This approach enables you to monitor the entire automation from beginning to end, allowing you to determine whether the automation succeeded or failed, as well as providing data on the total and average duration of the runs, among many other metrics.

> [!NOTE]
>
>- Some filters may not be available for some pivots because of the nature of the presented data.
>- When you move between pivots, the tab keeps the active filtering selection. Select **Clear filters** to reset the applied filters.
>- Desktop flow-related activities like desktop flow runs and work queues etc. have always been available in Dataverse, however cloud flow run history has only recently been introduced in Dataverse. [Learn more](dataverse/cloud-flow-run-metadata.md).

## Overview tab

This tab provides a top-level monitoring view of end-to-end automation health within the environment and is based on top-level flow reporting.

:::image type="content" source="media/automation-center/automation-center-overview-tab.png" alt-text="Screenshot of the overview page on automation center." lightbox="media/automation-center/automation-center-overview-tab.png":::

| Visual | Description |
| --- | --- |
| **Top-level flows** | Number of top-level flows that had one or more run based on selected filters. Gives an overall automation health indication and helps identify which top-level runs are failing the most. |
| **Average runs per day**| Average number of flow runs per day based on selected filters. |
| **Average run duration**| Average flow run duration based on selected filters. |
| **Flow runs error rate** | Percentage of errors that occurred during flow execution based on selected filters. |
| **Flow runs by status** | Overview of top-level runs status, can be used as to correlate with other factors such as triggering type, run modes, machines. |
| **Flow runs error trends** | Tracks usage and reliability trend of top-level runs over time. |
| **Flow runs by trigger type** | Shows top-level flow runs by trigger type. |
| **Top flow runs** | Quickly identify critical and regularly failing automations, in order to improve health, resiliency and exception handling. |
| **Top error codes** | Identifies most common errors during flow runs. |
| **Top cloud flows with failed desktop flow runs**| Shows which cloud flows are causing the most desktop flow failures and may need to be modified to reduce desktop flow failures. |

## Runs tab

This tab presents a consolidated view of cloud and desktop flow run data, displayed in a *hierarchical* list-view. The data is organized based on top-level cloud flows, and if a cloud flow has one or more child flows (supporting both cloud and desktop children), the child flow names are indented and preceded by a *'>'* character. This view is useful in scenarios where individual flow session runs may have succeeded, but other dependent runs failed, ultimately resulting in the top-level flow's failure. By displaying these runs in connection to their parent, this view enhances automation monitoring and enables efficient root cause analysis in the event of exceptions.

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

## Learn more

- [Get started with recommendations](automation-center-recommendations.md)
- [Analyze automation activity with Copilot](automation-center-copilot.md)
