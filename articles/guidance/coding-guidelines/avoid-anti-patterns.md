---
title: Anti-patterns to avoid
description: Learn how to avoid anti-patterns
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

# Avoid Anti-patterns

## Avoid nested for-each loops

Nested "For Each" loops can be an expensive operation in cloud flows due to their potential impact on performance and resource consumption.

- **Increased Execution Time**: With nested loops, the number of iterations multiply. For example, if you have two loops, each with 10 iterations, the total number of iterations becomes 10 x 10 = 100. This can significantly increase the execution time of your flow, especially if the loops process large datasets or perform complex operations within each iteration.

- **Limits and Quotas**: Power Automate imposes limits and quotas on various aspects of flow execution, such as the number of iterations allowed within a loop or the maximum execution time. Nested loops can quickly reach these limits, causing the flow to fail or be throttled, particularly if it operates on large datasets or runs frequently.

Learn more: [Concurrency looping and debatching limits](../../limits-and-config.md)

Depending on your scenarios – you can avoid nested loops with the following alternatives.

- When using nested loops to process related records from a parent table: For example, an outer loop might use List Rows in Dataverse for ProductCategory table to retrieve list of Product Categories where a column IsPromotion = true, and an inner loop is used to loop through the related records in Product table that belongs to a given category from the first loop.

    :::image type="content" source="media/nested-loop-1.png" alt-text="Screenshot of the cloud flow actions that make up a nested loop.":::

    A more efficient implementation is to use OData Query Expansion where we only need to work with a single Apply-for-Each loop. This also reduces the total requests against Dataverse to just one RetrieveMultiple call. Use the Expand Query parameter to specify the lookup column name. We can also add (\$select=…) to reduce the number of columns returned from the related table. The filter rows parameter can be used to apply conditions on the lookup table’s column.

    :::image type="content" source="media/nested-loop-2.png" alt-text="Screenshot of configuring expand query instead of a nested loop.":::

## Avoid infinite runs

With Power Automate, it's easy to run into a trap where the flows start to trigger infinitely when it's required to update the same table on which the flow is supposed to be triggered.

The Maker gets a warning when saving a flow that can result in an infinite trigger loop.

:::image type="content" source="media/infinite-loop.png" alt-text="Screenshot of the warning a maker receives when trying to save a flow that can result in an infinite loop":::

To address infinite runs problem, you can follow given steps:

- **Use Trigger Conditions to avoid flow infinite loops -** Incorporate trigger conditions within your flow to check if certain criteria are met before proceeding with subsequent actions. This ensures that the flow only executes when necessary, reducing the likelihood of triggering an infinite loop. An alternative is to terminate the flow when the condition causing the loop is met.

<!-- TODO add screenshots of terminate and trigger condition -->

## Avoid performing large amount of data transformation operations

When you need to work with large amount of data transformation, consider if it really should be an Extract-Transform-Load scenario (ETL). For example, using a Power Automate cloud flow to read data off a large Excel spreadsheet, perform some data formatting or validations, and then write it into Dataverse. In such scenario, it's more appropriate to use Power Platform Dataflow or other equivalent ETL tool instead of Cloud Flows.

If you need to manage the data load using some form of orchestration logic that you can implement in Cloud Flows, consider combining it with Dataflow. We can use the Dataflow connector to invoke a refresh action, and use its trigger “When a dataflow refresh completes” to perform post-ETL actions.

:::image type="content" source="media/use-dataflow.png" alt-text="Screenshot of using dataflow actions in a cloud flow" border="true":::

# Avoid using a for each loop to update a large number of records

Often users find using Power Automate to create/updated thousands of records to the data source when a flow is triggered. Most user would end up using For Each loop which goes through each of the records, and push them to the data source sequentially causing latency and delays.

To address this issue, try these two approaches:

- Create/Patch records to the data source in BATCH. Most of the connectors/services expose API services to post request in BATCH. You can group multiple operations into a single HTTP request using a batch operation. These operations are performed sequentially in the order they're specified. The order of the responses matches the order of the requests in the batch operation.
- Parallelism in For Each loop provides up to 50 records to be processed for the services which don't have capability to accept BATCH requests.

Refer to the following links of rest APIs from [Sharepoint](https://learn.microsoft.com/sharepoint/dev/sp-add-ins/make-batch-requests-with-the-rest-apis) and [Dataverse](https://learn.microsoft.com/power-apps/developer/data-platform/webapi/execute-batch-operations-using-web-api) which shows how to make batch requests.

![A screenshot of a computer  Description automatically generated](media/image27.png)

When working with Dataverse, you can take advantage of the new [Bulk Operations Web APIs](/power-apps/developer/data-platform/bulk-operations). Bulk Operations API differs from Batch Operations - while Batch Operations are posted in a single request, it is executed as multiple operations. Bulk Operations are posted in a single request and counted as a single Operation. Bulk Operations Web API can be invoked using HTTP with Entra ID, or with HTTP connector when using with Service Principals. Additionally, Using Dataverse Bulk Operations to reduce number of actions. 

![A screenshot of a computer  Description automatically generated](media/image28.png)

![A screenshot of a computer  Description automatically generated](media/image29.png)

In the example, we prepare the records in JSON format using Select action, and use HTTP with Entra ID to post the request using CreateMultiple Web API. If we have 100 records in the JSON output, this only incurs one single action instead of 100 Create Row actions in Dataverse.