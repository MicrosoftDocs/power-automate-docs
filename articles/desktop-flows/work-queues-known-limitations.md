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

The following table includes known limitations

| **Limitation** | **Details** | **Potential workaround**
|-------------------------|-------------------------|-------------------------|
| No work queue actions in Power Automate desktop | Work queue action support in Power Automate desktop is planned for Q3 CY23. | You can use input variables to send work queue item values into Power Automate Desktop, and output variables to return processing notes and status back to the calling cloud flow. To set the processing results of a work queue item, you can use the Dataverse **Update a row** action.
| Machine run queue size limit is 500 per machine or machine group | If you're trying to add more than **500** runs to a machine's or machine group run queue, you'll receive an **UIFlowRunQueueFull** stating that "The desktop flow run queue is full. Run queue max size: '500'" | Try to add less than 500 run queues per machine or machine group.
| Dequeuing concurrency | Keep work queue dequeueing concurrency within moderate levels. | When applying concurrency patterns in cloud flows, it's recommended to align the concurrency level to available machine capacity to ensure that the number of work items being processed in parallel matches the number of machines available to process them. |
