---
title: Implement parallel execution and concurrency
description: Learn how to implement parallel execution and concurrency
ms.subservice: guidance
ms.topic: conceptual
ms.date: 10/15/2024
ms.author: rachaudh
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

## Parallel execution and concurrency (within For each loop)

### Parallel Execution

Power Automate supports parallel execution meaning flows can have two or more steps that run simultaneously, after which the workflow is only priced when all parallel steps are complete.

This enables flow to do more processing at the same time, specifically when the tasks are asynchronous.

![A screenshot of a computer Description automatically generated](media/024956b844f470589ee62c9f96a9681b.png)

A good rule of thumb is to parallelize only when actions **take more than 5 seconds to execute**.​

You can use parallel branches to achieve some of the following scenarios:​

- Sending nonblocking approval requests ([blog post](https://flow.microsoft.com/blog/approval-reminders-using-parallel-branches/))​
- Creating “Quorum” based approvals ([blog post](https://flow.microsoft.com/blog/approvals-by-majority/))​
- Creating or updating records in multiple systems​
- Getting data from multiple sources and consolidating them in one

### Reducing scheduling overhead

Straight line of actions can run sequentially in the engine. Parallel structuring can help organize the flow better and save time. Specially initializing multiple variables can be done in parallel to save time.

![A screenshot of a computer Description automatically generated](media/3865c8bec55921f043efbb95d83140d0.png)

> [!NOTE]
> One thing to always keep in mind is to avoid a huge number of skipped actions. Very wide switch statements with lots of actions in each branch or parallel branches where the less used path has significantly more actions impact flow readability.
>
> Mitigation: Using child flows can address this. Instead of having lots of skipped actions in a switch branch, call child flows from the switch branch instead, so we skip the irrelevant child flows instead of a sizeable number of actions. This makes it easier to maintain.

![Microsoft Flow performance](media/968f09d92a419bcdc277932d9a7b71c2.png)

### Concurrency control

Concurrency enables Parallel execution in For Each loop. By default, For each loop executes sequentially. Therefore, when processing large data, it might take a long time. If the items in loop aren't required to run sequentially, concurrency enables X items to process at once. Currently users are allowed to see the degree of parallelism from 1 to 50.

Consider a scenario where 100 records need to be updated with status as Active, instead of updating one record after the other, Concurrency control enables up to 50 records to be updated simultaneously.

Be mindful of the degree of parallelism to set:

- There's overhead in dividing the work, queueing up extra threads, delays from the endpoint being called, etc.
- High number (for example, 50) might not necessarily make things go faster

![A screenshot of a computer Description automatically generated](media/daa1b1ef51d391f0acd81051842b3f63.png)

Some other real-world scenarios where this approach is applicable:​

- Sending individual emails to many recipients​
- Updating records in Dataverse, SharePoint Lists, SQL​
- Bulk creating users in Microsoft Entra ID
- Creating parallelized approvals ([more details](https://flow.microsoft.com/blog/advanced-flow-of-the-week-send-parallel-approval-requests-to-a-dynamic-set-of-approvers/))​
- Fanning out operations in SharePoint ([more details](http://johnliu.net/blog/2018/2/serverless-parallelism-in-microsoft-flow-and-sharepoint))​

Here's a comparison of the impact of concurrency control for array processing within for each loop.

| **Array Length ​** | **Degree of Parallelism ​** | **Time taken to run loop ​** |
|-------------------|----------------------------|-----------------------------|
| **4 ​**            | Off ​                       | 21 seconds ​                 |
| **4 ​**            | 2 ​                         | 11 seconds ​                 |
| **4 ​**            | 4 ​                         | 6 seconds ​                  |
| **4 ​**            | 6 ​                         | 6 seconds ​                  |

Concurrency control for `Apply to each` actions only take effect on the highest level in the cloud flow. When nesting `Apply to each` actions, the inner actions always execute serially.
