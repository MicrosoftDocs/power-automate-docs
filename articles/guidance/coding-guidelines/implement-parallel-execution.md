---
title: Implement parallel execution and concurrency
description: Learn how to implement parallel execution and concurrency
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Parallel execution and concurrency (within For each loop)

## Parallel Execution

Power Automate supports parallel execution, allowing flows to run two or more steps simultaneously. The workflow continues only after all parallel steps are complete. This capability enables more efficient processing, especially for asynchronous tasks.

:::image type="content" source="media/parallel-branch.png" alt-text="A screenshot of a cloud flow with parallel branches":::

By running multiple actions at the same time, you can significantly reduce the overall execution time of your flow. Parallel execution is useful for tasks that don't depend on each other and can be processed independently.

A good rule of thumb is to use parallel branches for actions that take more than 5 seconds to execute. Following this approach helps optimize the flow's performance without overwhelming the system.

Some use cases for parallel branches:

- **[Sending Nonblocking Approval Requests](https://flow.microsoft.com/blog/approval-reminders-using-parallel-branches/)**: Use parallel branches to send approval requests that don't block other actions. 
- **[Creating “Quorum” based approvals](https://flow.microsoft.com/blog/approvals-by-majority/)**: Implement quorum-based approval processes where a decision is made based on most responses. Learn more
- **Creating or updating records in multiple systems**: Ensure data consistency and reduce processing time by simultaneously create or update records across different systems.
- **Consolidating data from multiple sources**: Retrieve data from various sources in parallel and consolidate it into a single dataset for further processing.

## Reducing scheduling overhead

Straight line of actions can run sequentially in the engine. Parallel structuring can help organize the flow better and save time. Specially initializing multiple variables can be done in parallel to save time.

It's important to minimize the number of skipped actions in your flows. Wide switch statements with numerous actions in each branch, or parallel branches where the less frequently used path has more actions, can negatively affect the readability and maintainability of your flow.

Instead of having many skipped actions within a switch branch, you can call child flows from the switch branch. This way, you skip the irrelevant child flows rather than a large number of individual actions. This approach simplifies your main flow and makes it easier to maintain.

By reducing the number of actions within each branch, your flow becomes more readable and easier to understand. Child flows allow you to manage and update specific parts of your workflow independently, making the overall maintenance process more straightforward.

## Concurrency control

Concurrency enables parallel execution in a `Apply to each` loop. By default, `Apply to each` loops execute sequentially. Therefore, when processing large data, it might take a long time. If the items in loop aren't required to run sequentially, concurrency enables X items to process at once. Currently users can set the degree of parallelism between 1 and 50.

Consider a scenario where the status field of 100 records needs to be updated - instead of updating one record after the other, Concurrency control enables up to 50 records to be updated simultaneously.

Be mindful of the degree of parallelism to set:

- There's overhead in dividing the work, queueing up extra threads, delays from the endpoint being called, etc.
- High number (for example, 50) might not necessarily make things go faster

:::image type="content" source="media/concurrency-control.png" alt-text="A screenshot of configuring the concurrency control in an Apply to each action":::

Some other real-world scenarios where this approach is applicable:​

- Sending individual emails to many recipients​
- Updating records in Dataverse, SharePoint Lists, SQL​
- Creating users in Microsoft Entra ID in bulk
- [Creating parallelized approvals](https://flow.microsoft.com/blog/advanced-flow-of-the-week-send-parallel-approval-requests-to-a-dynamic-set-of-approvers/)

Here's a comparison of the impact of concurrency control for array processing within for each loop.

| **Array Length ​** | **Degree of Parallelism ​** | **Time taken to run loop ​** |
|-------------------|----------------------------|-----------------------------|
| **4 ​**            | Off ​                       | 21 seconds ​                 |
| **4 ​**            | 2 ​                         | 11 seconds ​                 |
| **4 ​**            | 4 ​                         | 6 seconds ​                  |
| **4 ​**            | 6 ​                         | 6 seconds ​                  |

Concurrency controls for `Apply to each` actions only take effect on the highest level in the cloud flow. When nesting `Apply to each` actions, the inner actions always execute serially.
