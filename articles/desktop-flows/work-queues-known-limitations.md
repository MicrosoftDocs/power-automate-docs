---
title: Known limitations for work queues 
description: Known limitations for work queues.
ms.topic: conceptual
ms.date: 04/28/2023
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
---

# Known limitations for work queues (preview)

[This article is prerelease documentation and is subject to change.]

The following table lists known limitations for work queues in Power Automate for desktop.

| **Limitation** | **Details** | **Potential workaround**
|-------------------------|-------------------------|-------------------------|
| No work queue actions in Power Automate desktop | Power Automate desktop support for work queue processing is currently planned for late Q2 or early Q3 CY23. Make sure to follow our blog post for latest announcements [here](https://powerautomate.microsoft.com/blog/). | You can use input variables to send work queue item values into Power Automate Desktop, and output variables to return processing notes and status back to the calling cloud flow. To set the processing results of a work queue item, you can use the Dataverse **Update a row** action.
| Work queue tables not available in Power BI when using the [Dataverse](/power-query/connectors/dataverse) connector | The work queue and work queue item tables are not present yet in the TDS endpoint, which is why the [Dataverse](/power-query/connectors/dataverse) connector (that is based on [TDS](/power-query/connectors/dataverse#prerequisites)) is not listing those. | Consider using the [Common Data Service (Legacy)](/power-query/connectors/common-data-service-legacy) or [OData Feed](/power-query/connectors/odata-feed) connector to connect to the underlying work queue tables.|
| Dequeuing concurrency | Keep work queue dequeueing concurrency within moderate levels. | When applying concurrency patterns in cloud flows, it's recommended to align the concurrency level to available machine capacity to ensure that the number of work items being processed in parallel matches the number of machines available to process them. |
| Dataverse limits | Work queues are based on Dataverse technologies, hence the same service protection and API limits apply. Learn more: [Service protection API limits](/power-apps/developer/data-platform/api-limits). |
| Throughput & Scaling | Work queues aren't suited for high throughput (subsecond processing time) scenarios, where hundreds or thousands of items need to be processed in seconds. If you do have such throughput requirements, consider using other queuing solutions such as Azure Service Bus Queues. |

## Learn more

- [Work queue overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Bulk-import work queue data](work-queues-bulk-import.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
