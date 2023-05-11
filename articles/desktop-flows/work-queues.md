---
title: Work queues (preview)
description: Work queue management with Power Automate.

ms.topic: conceptual
ms.date: 04/28/2023
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
search.audienceType: 
  - flowmaker
  - enduser
---

# Work queues (preview) overview

[This article is pre-release documentation and is subject to change.]

Work queues can be used to store process-relevant data and provide a way to decouple complex processes and automations, allowing them to communicate asynchronously. Data processing is based on priorities and must be scalable to ensure that each item can be processed within agreed SLAs.

:::image type="content" source="media/work-queues/work-queue-e2e-automation.png" alt-text="Screenshot of an end-o-end automation process that uses work queues as input and output." lightbox="media/work-queues/work-queue-e2e-automation.png":::

They play a crucial role in improving the efficiency, scalability, concurrency, and resiliency of automation processes and help prioritize work items, with the highest-priority items being completed first, regardless of whether they're processed by digital workers, human workers, or through integrations.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../articles/includes/cc-preview-features-definition.md)]

## Prerequisites

To use work queues (preview) in Power Automate the following are required:

- Premium Power Automate license
- Environment Maker role (or higher privileges)

## Work queue benefits

The following table lists some of the benefits of using work queues.

| **Benefit** | **Description** |
|-------------------------|-------------------------|
| **Increased efficiency and scalability** | Work queues can increase the efficiency and throughput of an automation process by ensuring timely and resilient completion of work. They can also help decouple parts of your automation so that you can scale them independently. |
| **Better resource utilization** | By using work queues, you can improve robot utilization, which in turn can reduce the overall cost of the automation process by minimizing the number of robots needed to complete work. |
| **Consistent prioritization** | Work queues help you prioritize work items, with the highest-priority items being completed first, regardless of whether they're processed by digital workers, human workers, or through integrations. |
| **Centralized monitoring** | Work queues provides human-in-the-loop monitoring experiences that allow fusion teams of business users and IT professional to work hand-in-hand to remediate work queue processing anomalies. |

By using work queues in combination with other digital workforce management tools, such as [hosted machine groups](/articles/hosted-machine-groups.md), advanced analytics with Power BI, and [process advisor](/articles/process-advisor-overview.md), organizations can gain deeper insights into the performance of their automation to improve the efficiency, scalability and resiliency while also reducing costs and improving the quality of services.

## Typical use case example

Work queues are a helpful tool for processing work in an ordered, concurrent, and timely manner, regardless of industry, business processes, or organization size. In the example below, the red underlined text can be replaced with any other business process, data volume, or SLA requirement. This makes work queues a versatile solution for managing your workload more effectively and ensuring that important work is completed on time, no matter the size or type of your organization.

:::image type="content" source="media/work-queues/work-queue-sample-usecase.png" alt-text="Showing a *Define Search Criteria* screen with an advanced filter applied.":::

## How to get started

- [Create work queues](/articles/work-queue-create.md)
- [Manage work queues](/articles/work-queue-manage.md)
- [Process work queues](/articles/work-queue-process.md)
- [Monitor work queues](/articles/work-queue-monitor.md)
- [Known issues and limitations](/articles/work-queue-known-limitations.md)
