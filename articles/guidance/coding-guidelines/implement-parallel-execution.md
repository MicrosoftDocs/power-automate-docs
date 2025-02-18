---
title: Implement parallel execution and concurrency
description: Learn how to implement parallel execution and concurrency in Power Automate to optimize your workflows and reduce execution time.
#customer intent: As a Power Automate user, I want to implement parallel execution and concurrency in Power Automate so that I can optimize workflow efficiency.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Implement parallel execution and concurrency

Optimizing workflow execution is crucial for efficiency and productivity. Power Automate offers robust features for parallel execution and concurrency, enabling you to run multiple actions simultaneously and significantly reduce execution time.

## Parallel execution

Power Automate supports parallel execution, allowing flows to run two or more steps simultaneously. The workflow continues only after all parallel steps are complete. This capability enables more efficient processing, especially for asynchronous tasks.

Running multiple actions simultaneously reduces the overall execution time of your flow. Parallel execution is useful for tasks that don't depend on each other and can be processed independently.

### Parallel branches

Use parallel branches for actions that take more than 5 seconds to execute. This approach optimizes the flow's performance without overwhelming the system.

:::image type="content" source="media/parallel-branch.png" alt-text="Screenshot of a cloud flow with parallel branches." lightbox="media/parallel-branch.png":::

Use cases for parallel branches:

- **Sending nonblocking approval requests**: Use parallel branches to send approval requests that don't block other actions. 
- **Creating quorum-based approvals**: Implement quorum-based approval processes where a decision is made based on most responses.
- **Creating or updating records in multiple systems**: Ensure data consistency and reduce processing time by simultaneously creating or updating records across different systems.
- **Consolidating data from multiple sources**: Retrieve data from various sources in parallel and consolidate it into a single dataset for further processing.

## Reducing scheduling overhead

A straight line of actions can run sequentially in the engine. Parallel structuring helps organize the flow better and saves time. Initializing multiple variables in parallel can save time.

It's important to minimize the number of skipped actions in your flows. Wide switch statements with numerous actions in each branch, or parallel branches where the less frequently used path has more actions, can negatively affect the readability and maintainability of your flow.

Instead of having many skipped actions within a switch branch, call child flows from the switch branch. This way, you skip the irrelevant child flows rather than a large number of individual actions. This approach simplifies your main flow and makes it easier to maintain.

Reducing the number of actions within each branch makes your flow more readable and easier to understand. Child flows let you manage and update specific parts of your workflow independently, simplifying the overall maintenance process.

## Concurrency control

Concurrency enables parallel execution in an **Apply to each** loop. By default, **Apply to each** loops execute sequentially, which can take a long time when processing large data. If the items in the loop don't need to run sequentially, concurrency enables X items to process at once. Users can set the degree of parallelism between 1 and 50.

Consider a scenario where the status field of 100 records needs to be updated. Instead of updating one record after another, concurrency control enables up to 50 records to be updated simultaneously.

Be mindful of the degree of parallelism to set:

- There's overhead in dividing the work, queueing up extra threads, and delays from the endpoint being called.
- High number (for example, 50) might not necessarily make things go faster.

:::image type="content" source="media/concurrency-control.png" alt-text="Screenshot of configuring the concurrency control in an Apply to each action." lightbox="media/concurrency-control.png":::

Some other real-world scenarios where this approach might apply:​

- Sending individual emails to many recipients​
- Updating records in Dataverse, SharePoint Lists, SQL​
- Creating users in Microsoft Entra ID in bulk
- Creating parallelized approvals

Here's a comparison of the impact of concurrency control on array processing within a **For each** loop.

| **Array length ​** | **Degree of parallelism ​** | **Time taken to run loop ​** |
|-------------------|----------------------------|-----------------------------|
| **4 ​**            | Off ​                       | 21 seconds ​                 |
| **4 ​**            | 2 ​                         | 11 seconds ​                 |
| **4 ​**            | 4 ​                         | 6 seconds ​                  |
| **4 ​**            | 6 ​                         | 6 seconds ​                  |

Concurrency controls for **Apply to each** actions only take effect on the highest level in the cloud flow. When you nest **Apply to each** actions, the inner actions always execute serially.
<!-- Many links in this doc, which pointed to flow.microsoft.com/blog/*, did not resolve and were thus removed. -->