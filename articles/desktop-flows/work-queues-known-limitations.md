---
title: Known limitations or issues 
description: Known limitations or issues for work queues (preview).

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

# Known issues and limitations

[This article is prerelease documentation and is subject to change.]

## Known limitations

The following table includes known limitations

| **Limitation** | **Details** | **Potential workaround**
|-------------------------|-------------------------|-------------------------|
| No work queue actions in Power Automate desktop | Work queue action support in Power Automate desktop is planned for Q3 CY23. | You can use input variables to send work queue item values into Power Automate Desktop, and output variables to return processing notes and status back to the calling cloud flow. To set the processing results of a work queue item, you can use the Dataverse **Update a row** action.
| Dequeuing concurrency | Keep work queue dequeueing concurrency within moderate levels. | When applying concurrency patterns in cloud flows, it's recommended to align the concurrency level to available machine capacity to ensure that the number of work items being processed in parallel matches the number of machines available to process them. |
| Dataverse limits | Work queues are based on Dataverse technologies, hence the same service protection and API limits etc. apply. [Learn more](/powerapps/developer/data-platform/api-limits-overview). |
| Throughput & Scaling | Work queues aren't suited for high throughput (sub-second processing time) scenarios, where hundreds or thousands of items need to be processed in seconds. If you do have such throughput requirements, consider using other queuing solutions such as Azure Service Bus Queues. |

## Known issues

Known issues will be listed here.

## Learn more

- [Manage work overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Bulk-import work queue data](work-queues-bulk-import.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
