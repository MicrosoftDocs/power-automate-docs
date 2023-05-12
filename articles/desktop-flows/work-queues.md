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

[This article is prerelease documentation and is subject to change.]

Work queues in Power Automate can be used to store process-relevant data and provide a way to decouple complex processes and automations, allowing them to communicate asynchronously.

They can play a crucial role in improving the efficiency, scalability and resiliency of automations and help prioritize work, with the highest-priority items being completed first, regardless of whether they're processed by digital workers, human workers, or through integrations.

Just as manufacturing assembly lines are designed to decouple different complex stages of production, work queues can help decouple different areas of a process allowing each part to operate independently and exchange prioritized inputs and outputs asynchronously.

The following illustration shows and end-to-end process that uses work queues to communicate prioritized work between process steps and automations.

:::image type="content" source="media/work-queues/work-queue-e2e-automation.png" alt-text="Screenshot of an end-to-end process that leverages work queues to communicate prioritized work between process steps and automations." lightbox="media/work-queues/work-queue-e2e-automation.png":::


> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../articles/includes/cc-preview-features-definition.md)]

## Prerequisites

To use work queues (preview) in Power Automate the following are required:

- Premium Power Automate license
- Environment Maker role (or other roles that include access to work queue tables)

## Work queue benefits

The following table lists some of the benefits of using work queues.

| **Benefit** | **Description** |
|-------------------------|-------------------------|
| **Increased efficiency and scalability** | Work queues can increase the efficiency and throughput of an automation process by ensuring timely and resilient completion of work. They can also help decouple parts of your automation so that you can scale them independently. |
| **Better resource utilization** | By using work queues, you can improve robot utilization, which in turn can reduce the overall cost of the automation process by optimizing the number of robots needed to complete work. |
| **Consistent prioritization** | Work queues help you prioritize work items, with the highest-priority items being completed first, regardless of whether they're processed by digital workers, human workers, or through integrations. |
| **Centralized monitoring** | Work queues provide human-in-the-loop monitoring experiences that allow fusion teams of business users and IT professionals to work hand-in-hand to remediate work queue processing exceptions. |

By using work queues in combination with other digital workforce management tools, such as [hosted machine groups](hosted-machine-groups.md), advanced analytics with Power BI, and [process advisor](/articles/process-advisor-overview.md), organizations can gain deeper insights into the performance of their automation to improve the efficiency, scalability and resiliency while also reducing costs and improving the quality of services.

## Typical use case example

Work queues are a helpful tool for processing work in an ordered, concurrent, and timely manner, regardless of industry, business processes, or organization size. In the following example, the red underlined text can be replaced with any other business process, data volume, or SLA requirement. This makes work queues a versatile solution for managing your workload more effectively and ensuring that important work is completed on time.

:::image type="content" source="media/work-queues/work-queue-sample-usecase.png" alt-text="Showing a *Define Search Criteria* screen with an advanced filter applied.":::

## How to get started

> [!div class="nextstepaction"]
> [Create your first work queue](work-queue.md#create-a-work-queue)

## Learn more

- [Manage work queues](work-queue-manage.md)
- [Process work queues](work-queue-process.md)
- [Monitor work queues](work-queue-monitor.md)
- [Known issues and limitations](work-queue-known-limitations.md)



[Power Automate for desktop using a proxy server](governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server)