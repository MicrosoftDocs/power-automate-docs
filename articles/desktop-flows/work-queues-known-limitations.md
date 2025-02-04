---
title: Known limitations for work queues 
description: Known limitations for work queues.
ms.topic: conceptual
ms.date: 04/02/2024
ms.author: appapaio
ms.reviewer: 
contributors: DanaMartens
author: rpapostolis
---

# Known limitations for work queues

The following table lists known limitations for work queues in Power Automate for desktop.

| **Limitation** | **Details** | **Potential workaround**
|-------------------------|-------------------------|-------------------------|
| Dequeuing concurrency | Keep work queue dequeueing concurrency within moderate levels. Five parallel dequeue operations per work queue are currently supported. | When applying concurrency patterns in cloud flows, it's recommended to align the concurrency level to available machine capacity to ensure that the number of work items being processed in parallel matches the number of machines available to process them. |
| Dataverse limits | Work queues are based on Dataverse technologies, hence the same service protection and API limits apply. Learn more: [Service protection API limits](/power-apps/developer/data-platform/api-limits). |
| Work queue connector disabled in GCC High and DoD environments | The work queue connector that is applicable to Power Automate for desktop only, is disabled by default for customers operating in GCC High and DoD environments. | You can enable the work queue connector and its actions. More information: [Disable new connectors by default in GCC High and DoD](/power-platform/admin/connector-off-by-default). |
| Work queue DLP policy configuration support | There may be a delay before new work queue connector actions added to Power Automate desktop are visible and configurable through DLP policies in Power Platform Admin Center. <br><br>Additionally, if you want to limit the use of work queues in cloud flow and API-based scenarios, you should use Dataverse RBAC to control access to the underlying tables. This is because work queues are built on the Dataverse platform, and their actions (such as adding, updating, deleting and dequeueing) are accessible by-design through the native Dataverse connector, which cannot be completely blocked by DLP policies. |
| Throughput and scaling | Work queues aren't suited for high throughput (subsecond processing time) scenarios, where hundreds or thousands of items need to be processed in seconds. If you do have such throughput requirements, consider using other queuing solutions such as Azure Service Bus Queues. |

## Related information

- [Work queue overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Bulk-import work queue data](work-queues-bulk-import.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
