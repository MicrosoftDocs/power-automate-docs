---
title: Avoid anti-patterns
description: Learn common anti-patterns that you should avoid using in your Power Automate cloud flows to improve their performance and resource efficiency.
#customer intent: As a Power Automate user, I want to avoid anti-patterns in cloud flows so that I can optimize performance and resource efficiency.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Avoid anti-patterns

*Anti-patterns* are practices that seem beneficial but lead to performance issues, inefficient use of resources, and potential failures in your Power Automate workflows. This article highlights common anti-patterns in cloud flows and provides guidance on how to avoid them.

## Avoid nested For each loops

Nested **For each** loops can be resource-intensive operations in cloud flows, affecting performance and resource consumption. Here are some reasons to avoid them:

- **They can increase execution time**. Nested **For each** loops can quickly increase the total number of iterations. For instance, if you have two loops that each have 10 iterations, the total number of iterations is 10 x 10 = 100. This exponential increase can extend the execution time of your flow, especially if each iteration processes large datasets or performs complex operations.

- **They can exceed limits and quotas**. Power Automate enforces limits and quotas on such things as the number of iterations allowed in a loop and overall execution time. Nested loops can quickly approach these limits, particularly when dealing with large datasets or frequent executions, leading to flow failures or throttling.

- **They can degrade performance**. Each iteration in a nested loop consumes processing power and memory. As the number of iterations grows, the demand on system resources increases, potentially slowing down the entire flow.

Learn more about concurrency, looping, and debatching limits in [Limits of automated, scheduled, and instant flows](../../limits-and-config.md).

Depending on your scenario, you can avoid nested loops by processing related records from a parent table. For example, let's say that your flow has two loops, one inside the other. The outer loop uses the **List rows** action to retrieve a list of product categories from the ProductCategory table where the IsPromotion column is true. An inner loop then processes related records from the Product table for each category the outer loop retrieves.

Instead, use OData query expansion to replace the nested loop with a single **For each** loop. This approach reduces the total number of requests to Dataverse to just one **RetrieveMultiple** call.

- Use the **Expand Query** parameter to specify the name of the lookup column that links the ProductCategory table to the Product table. This approach retrieves related records in a single query. For example, set the Expand Query parameter to `Products($select=ProductName,Price)`.

- Use the **$select** parameter to limit the columns returned from the related table.

- Use the **Filter Rows** parameter to apply conditions directly on the lookup table's columns and retrieve and process relevant records. For example, set the **Filter Rows** parameter to `IsPromotion eq true`.

:::image type="content" source="media/nested-loop.png" alt-text="Screenshot of a loop in a Power Automate flow showing the use of the Expand Query and Filter Rows parameters to implement OData query expansion." lightbox="media/nested-loop.png":::

## Avoid infinite loops

Cloud flows can trigger themselves, creating an infinite loop. For example, if a flow is triggered when a record is updated in the Product table and the flow updates the same record, it can potentially trigger itself forever. Infinite loops can lead to performance degradation, excessive resource consumption, and potential throttling of your flow.

When you save a flow that might result in an infinite loop, Power Automate warns you like this: "Actions in this flow may result in an infinite trigger loop. Please ensure you add appropriate conditional checks to prevent this flow from triggering itself."

To avoid creating infinite loops, put conditions on the trigger or stop the flow if it detects a condition that would cause an infinite loop.

- **Use trigger conditions**: Trigger conditions ensure that the flow runs only when specific criteria are met, preventing unnecessary executions. Add a condition to the trigger to check for certain values or states before the flow proceeds. For example, if your flow updates a status field, set a trigger condition to run the flow only if the status isn't already set to the desired value.

- **Terminate the flow**: An alternative approach is to stop the flow from continuing if it detects a condition that would cause an infinite loop. The **Terminate** action ends the flow when a specific condition is met. Use it as a safeguard to prevent further actions if the flow is about to enter an infinite loop. For example, if the flow detects that it already processed a record, it can terminate itself to avoid processing the record again.

## Avoid large numbers of data transformation operations

When you're working with large-scale data transformations, consider whether the task should be handled as an extract, transform, load (ETL) process. For example, instead of using a cloud flow to read data from a large Excel workbook, format and validate the data, and then write it into Dataverse, use an ETL dataflow. Learn more in [Create and use dataflows in Microsoft Power Platform](/power-query/dataflows/create-use).

Dataflows handle large volumes of data efficiently and provide better performance for ETL tasks than cloud flows do. ETL tools offer specialized features for data transformation, validation, and loading, which can simplify complex data processing tasks.

To manage data load with orchestration logic in cloud flows, combine cloud flows with dataflows, like this:

1. **Invoke dataflow refresh**
   - **Action**: Use the dataflow connector in Power Automate to trigger a refresh action and initiate the ETL process defined in your dataflow.
   - **Example**: Set up a cloud flow that triggers the dataflow refresh based on a schedule, such as daily, or an event, such as when a new file is uploaded to a SharePoint folder.

1. **Post-ETL actions**
   - **Trigger**: Use the **When a dataflow refresh completes** trigger in Power Automate to perform actions after the ETL process finishes.
   - **Example**: After the dataflow completes, use a cloud flow to send notifications, update records, or perform data processing.

  :::image type="content" source="media/use-dataflow.png" alt-text="Screenshot of dataflow actions Refresh a dataflow and When a dataflow refresh completes in a cloud flow in Power Automate designer.":::

## Avoid using a For each loop to update large numbers of records

If you need to create or update thousands of records in a data source, don't use a **For each** loop to process each record sequentially. To avoid latency and delays, try these approaches instead:

- **Batch operations**: Create or update records in batches. Many connectors and services provide API endpoints that support batch requests. This approach allows you to group multiple operations into a single HTTP request. These operations are executed sequentially in the order specified in the batch request. The order of the responses matches the order of the requests in the batch operation.

  :::image type="content" source="media/batch-operation.png" alt-text="Screenshot of the Power Automate designer showing the use of the SharePoint API to execute a batch request.":::

- **Parallelism in the For each loop**: For services that don't support batch operations, use parallel processing in the **For each** loop to handle multiple records simultaneously. You can configure the **For each** loop to process up to 50 records in parallel.

### Use bulk operations in Dataverse

When you're working with Dataverse, use bulk operations to reduce the number of actions required, streamline your processes, and enhance their performance. Learn more in [Use bulk operation messages](/power-apps/developer/data-platform/bulk-operations).

Bulk operations offer a distinct advantage over batch operations. While both methods allow you to group multiple operations into a single request, they differ in how they execute those operations:

- **Batch operations**: Although batch operations are posted in a single request, they're processed separately. If one operation fails, it doesn't affect the others in the batch. However, this behavior can lead to increased overhead and latency, especially when you're dealing with a large number of records.

- **Bulk operations**: Bulk operations are posted *and executed* as a single operation. The entire bulk request is counted as one operation, which can significantly reduce the number of actions and improve efficiency.

To use bulk operations, you have two options:

- Invoke the Bulk operations Web API using HTTP requests authenticated with Microsoft Entra ID.
- Use the HTTP connector in Power Automate with service principals.

In the following example, we use the **CreateMultiple** Web API to process 100 records in JSON format with just one action, instead of using 100 **Create Row** actions in Dataverse. First, we prepare the records in JSON format using the **Select** action.

:::image type="content" source="media/prepare-json.png" alt-text="Screenshot of a flow in the Power Automate designer showing the use of a Select action to prepare the content for the bulk request." lightbox="media/prepare-json.png" :::

Then we use HTTP with Microsoft Entra ID to post the request using the **CreateMultiple** Web API.

:::image type="content" source="media/createmultiple.png" alt-text="Screenshot of the Power Automate designer showing invoking an HTTP request to perform a bulk operation.":::

## Related content

- [Make batch requests with the REST APIs](/sharepoint/dev/sp-add-ins/make-batch-requests-with-the-rest-apis)
- [Execute batch operations using the Web API](/power-apps/developer/data-platform/webapi/execute-batch-operations-using-web-api)
