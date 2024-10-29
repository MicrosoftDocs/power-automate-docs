---
title: Work queues
description: Work queue management with Power Automate.
ms.topic: conceptual
ms.date: 10/14/2024
ms.author: appapaio
ms.reviewer: angieandrews
contributors:
author: rpapostolis
search.audienceType: 
  - flowmaker
  - enduser
---
# Work queues overview

Work queues in Power Automate can be used to store process-relevant data and provide a way to decouple complex processes and automations, allowing them to communicate asynchronously.

They can play a crucial role in improving the efficiency, scalability and resiliency of automations and help prioritize work, with the highest-priority items being completed first, regardless of whether they've been processed by digital workers, human workers, or through integrations.

Just as manufacturing assembly lines are designed to decouple different complex stages of production, work queues can help decouple different areas of a process allowing each part to operate independently and exchange prioritized inputs and outputs asynchronously.

The following illustration shows and end-to-end process that uses work queues to communicate prioritized work between process steps and automations.

:::image type="content" source="media/work-queues/work-queue-e2e-automation.png" alt-text="Screenshot of an end-to-end process that leverages work queues to communicate prioritized work between process steps and automations." lightbox="media/work-queues/work-queue-e2e-automation.png":::

## Prerequisites

To use work queues in Power Automate the following are required:

- Premium Power Automate license
- Environment maker role (or other roles that include access to work queue tables)
- Power Automate URL and IP address configurations
  - [Public cloud](/power-automate/ip-address-configuration#required-services)
  - [Government cloud](/power-automate/us-govt#power-automate-us-government-service-urls)

## Work queue benefits

The following table lists some of the benefits of using work queues.

| **Benefit** | **Description** |
|-------------------------|-------------------------|
| **Increased efficiency and scalability** | Work queues can increase the efficiency and throughput of an automation process by helping to ensure timely and resilient completion of work. They can also help decouple parts of your automation so that you can scale them independently. |
| **Better resource utilization** | By using work queues, you could improve robot utilization, and optimize the number of robots needed to complete work. |
| **Consistent prioritization** | Work queues can help you prioritize work items, with the highest-priority items being completed first, regardless of whether they've been processed by digital workers, human workers, or through integrations. |
| **Centralized monitoring** | Work queues provide human-in-the-loop monitoring experiences that allow fusion teams of business users and IT professionals to work hand-in-hand to remediate work queue processing exceptions. |

By using work queues in combination with other digital workforce management tools, such as [hosted machine groups](hosted-machine-groups.md), advanced analytics with Power BI, and [process mining](../../articles/process-advisor-overview.md), organizations can gain deeper insights into the performance of their automation to improve the efficiency, scalability and resiliency while also reducing costs and improving the quality of services.

## When to use work queues

Work queues are a highly versatile tool for managing workloads more effectively and ensuring that important work is completed on time, regardless of the complexity of the process or the size of the automation they're being used for.

### Example of a typical work queue use case

As part of a **supply chain** process, **thousands** of transactions have to be processed **every day**.

Process completion is based on a strict **SLA** and has to be complete by **11PM** since the outcome is used as input to another process.

To conform with the SLA, automations need to be built that:

1. Push transactions to a **centrally managed and monitored work queue**.
2. Process transactions **concurrently** across a dedicated machine group of **20** machines.

In cases where the automation is unable to process a particular transaction within the SLA, users are notified to have the transaction processed manually instead.

## How to get started

> [!div class="nextstepaction"]
> [Create your first work queue](work-queues-manage.md#create-a-work-queue)

## Learn more

- [Manage work queues](work-queues-manage.md)
- [Bulk-import work queue data](work-queues-bulk-import.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
- [Known issues and limitations](work-queues-known-limitations.md)
- [Work queues actions](actions-reference/workqueues.md)