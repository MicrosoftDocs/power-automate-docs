---
title: Optimize flows with parallel execution and concurrency
description: Learn how to implement parallel execution and concurrency in Power Automate to optimize your workflows and reduce execution time.
#customer intent: As a Power Automate user, I want to implement parallel execution and concurrency in Power Automate so that I can optimize workflow efficiency.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/12/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Optimize flows with parallel execution and concurrency

Optimizing the execution of your workflows is crucial for making them efficient. Parallel execution and concurrency allow you to run multiple actions simultaneously, significantly reducing execution time.

## Execute in parallel

In parallel execution, flows run two or more steps simultaneously. The workflow continues only after all parallel steps are complete. This capability makes processing more efficient, especially for asynchronous tasks.

Consider parallel execution for tasks that don't depend on each other and can be processed independently, and for those that take more than five seconds to execute. This approach optimizes the flow's performance without overwhelming the system.

Here are some use cases for parallel execution:

- Send approval requests that don't block other actions.

- Create quorum-based approval processes, where a decision is made based on the most responses.

- Create or update records in multiple systems simultaneously.

- Retrieve data from multiple sources simultaneously and consolidate it into a single dataset for further processing.

- Initialize multiple variables in parallel to avoid sequential execution delays.

  :::image type="content" source="media/parallel-branch.png" alt-text="Screenshot of the Power Automate designer showing a cloud flow with parallel branches." lightbox="media/parallel-branch.png":::

### Minimize skipped actions

When using parallel execution, be cautious about skipped actions. Skipped actions occur when a condition isn't met and the action isn't executed. Skipped actions can lead to confusion and make it difficult to understand the flow's logic. They can also cause performance issues, because they still consume resources even if they don't execute.

Skipped actions often occur in switch branches. A switch branch is a way to define different actions for multiple possible values of a single variable or expression. If you have many actions in each branch, it can lead to a lot of skipped actions.

Call child flows from the switch branch instead of adding many individual actions. Skipping irrelevant child flows rather than a large number of individual actions simplifies your main flow and makes it easier to maintain.

## Control concurrency

**Apply to each** loops execute sequentially by default. If the items in the loop don't need to run sequentially, concurrency allows multiple items to process at the same time. The maker sets the degree of concurrency, or parallelism, from 1 to 50.

Keep in mind that dividing the work, queuing extra threads, and delays from the endpoint being called add overhead. And a high number (for example, 50) might not necessarily make things go faster.

:::image type="content" source="media/concurrency-control.png" alt-text="Screenshot of the Power Automate designer showing the concurrency control in an Apply to Each action." lightbox="media/concurrency-control.png":::

Here are some examples of when to use concurrency:

- Sending individual emails to many recipients​.
- Updating records in Dataverse, SharePoint Lists, and SQL​.
- Creating users in Microsoft Entra ID in bulk.
- Creating parallelized approvals.

The following table compares the effect of concurrency control on array processing in an **Apply to each** loop.

| Array length | Degree of parallelism | Time to run loop |
|--------------|-----------------------|------------------|
| **4**        | Off                   | 21 seconds       |
| **4**        | 2                     | 11 seconds       |
| **4**        | 4                     | 6 seconds        |
| **4**        | 6                     | 6 seconds        |

Concurrency controls for **Apply to each** actions take effect only on the highest level in the cloud flow. When you nest **Apply to each** actions, the inner actions always execute sequentially.
