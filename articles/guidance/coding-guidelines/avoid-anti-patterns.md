---
title: Avoid anti-patterns
description: Learn how to avoid common anti-patterns in cloud flows to improve performance and resource efficiency.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/03/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Avoid anti-patterns

Anti-patterns are practices that seem beneficial but lead to performance issues, resource inefficiencies, and potential failures in your workflows. By understanding and avoiding these anti-patterns, you optimize your cloud flows for better performance and reliability.

## Avoid nested For each loops

Nested For each loops can be resource intensive operations in cloud flows and affect performance and resource consumption.

- **Execution time**: Nested loops can multiple the total number of iterations rapidly. For instance, if you have two loops, each with 10 iterations, the total number of iterations becomes 10 x 10 = 100. This exponential increase can extend the execution time of your flow, especially if each iteration processes large datasets or performs complex operations.
- **Limits and quotas**: Power Automate enforces limits and quotas, such as the maximum number of iterations allowed within a loop and the overall execution time. Nested loops can quickly approach these limits, leading to flow failures or throttling, particularly when dealing with large datasets or frequent executions.
- **Performance impact**: Each iteration within a nested loop consumes processing power and memory. As the number of iterations grows, the demand on system resources increases, potentially slowing down the entire flow.

Learn more: [Concurrency looping and debatching limits](../../limits-and-config.md)

Depending on your scenario, you can avoid nested loops by processing related records from a parent table. Consider the following:

- **Scenario:** An outer loop uses the **List Rows** action to retrieve a list of product categories from the *ProductCategory* table where the *IsPromotion* column is true. An inner loop then processes related records from the *Product* table for each category retrieved by the outer loop.

- **Alternative approach:** Use OData Query Expansion to streamline this process. This method allows you to work with a single For each loop, reducing the total number of requests to Dataverse to just one *RetrieveMultiple* call.

To implement OData query expansion:

- Use the **Expand Query** parameter to specify the lookup column name that links the *ProductCategory* table to the *Product* table. This approach retrieves related records in a single query. For example, set the Expand Query parameter to `Products($select=ProductName,Price)`.
- Use the **$select** parameter to limit the columns returned from the related table.
- Retrieve and process relevant records by applying conditions directly on the lookup table's columns using the **Filter Rows** parameter. For example, set the **Filter Rows** parameter to `IsPromotion eq true`.

:::image type="content" source="media/nested-loop.png" alt-text="Screenshot of using the Expand Query and Filter Rows parameter to implement OData query expansion." lightbox="media/nested-loop.png":::

## Avoid infinite loops

With Power Automate, flows can trigger infinitely, such as when the flow updates the same table that triggers it.

When you save a flow that might result in an infinite trigger loop, Power Automate warns you.

:::image type="content" source="media/infinite-loop.png" alt-text="Screenshot of the warning a maker receives when trying to save a flow that can result in an infinite loop.":::

To avoid infinite loops:

- **Use trigger conditions**: Trigger conditions ensure that the flow only runs when specific criteria are met, preventing unnecessary executions. Implement trigger conditions by adding a condition to the trigger to check for certain values or states before the flow proceeds. For example, if your flow updates a status field, you can set a trigger condition to only run the flow if the status isn't already set to the desired value.
- **Terminate the flow**: An alternative approach is to stop the flow from continuing if it detects a condition that would cause an infinite loop. End the flow when a specific condition is met by using the **Terminate** action. This approach can be used as a safeguard to prevent further actions if the flow is about to enter an infinite loop. For example, if the flow detects that it has already processed a record, it can terminate itself to avoid reprocessing.

## Avoid large numbers of data transformation operations

When working with large-scale data transformations, consider using an extract, transform, load (ETL) process. For example, instead of using a Power Automate cloud flow to read data from a large Excel spreadsheet, perform data formatting or validations, and then write the data into Dataverse. It might be more appropriate to use [Power Platform dataflows](/power-query/dataflows/create-use) or another ETL tool.

Dataflows handle large volumes of data efficiently and provide better performance for ETL tasks than cloud flows. ETL tools offer specialized features for data transformation, validation, and loading, which can simplify complex data processing tasks.

To manage data load with orchestration logic in cloud flows, combine cloud flows with dataflows. Here's how:

1. **Invoke dataflow refresh**
   - **Action**: Use the dataflow connector in Power Automate to trigger a refresh action and initiate the ETL process defined in your dataflow.
   - **Example**: Set up a cloud flow that triggers the dataflow refresh based on a schedule (such as daily) or an event (for example, when a new file is uploaded to a SharePoint folder).

1. **Post-ETL actions**
   - **Trigger**: Use the **When a dataflow refresh completes** trigger in Power Automate to perform actions after the ETL process finishes.
   - **Example**: After the dataflow completes, use a cloud flow to send notifications, update records, or perform data processing.

  :::image type="content" source="media/use-dataflow.png" alt-text="Screenshot of using dataflow actions in a cloud flow.":::

## Avoid using For each loop to update large numbers of records

Users often need to create or update thousands of records in a data source when a flow triggers in Power Automate. Many users use a For each loop to process each record sequentially, causing latency and delays.

To improve performance, try these two approaches:

1. **Batch operations**
   - **Description**: Create or update records in batches. Many connectors and services provide API endpoints that support batch requests. This approach allows you to group multiple operations into a single HTTP request.
   - **Implementation**: Use the batch operation feature to send multiple create or update requests at once. These operations are executed sequentially in the order specified in the batch request. The order of the responses matches the order of the requests in the batch operation.
   - **Benefits**: Reduces the number of individual requests sent to the data source, minimizing latency and improving performance.

   :::image type="content" source="media/batch-operation.png" alt-text="Screenshot demonstrating using the SharePoint API to execute a batch request.":::

2. **Parallelism in For each loop**
   - **Description**: Enable parallel processing within the **For Each** loop to handle multiple records simultaneously.
   - **Implementation**: Configure the **For Each** loop to process up to 50 records in parallel. This approach is useful for services that don't support batch operations.
   - **Benefits**: Significantly reduces the overall processing time by handling multiple records at the same time.

For information on making batch requests, refer to the following REST API documentation:

- [SharePoint REST API](/sharepoint/dev/sp-add-ins/make-batch-requests-with-the-rest-apis)
- [Dataverse Web API](/power-apps/developer/data-platform/webapi/execute-batch-operations-using-web-api)

### Use Bulk operations in Dataverse

When working with Dataverse, use the [Bulk Operations Web APIs](/power-apps/developer/data-platform/bulk-operations) to reduce the number of actions required, streamline your processes, and enhance performance.

Bulk operations Web APIs offer a distinct advantage over batch operations. Here's how they differ:

- **Batch operations**: Although batch operations are posted in a single request, they're executed as multiple individual operations. Each operation within the batch is processed separately.
- **Bulk operations**: In contrast, bulk operations are posted and executed as a single operation. The entire bulk request is counted as one operation, which can significantly reduce the number of actions and improve efficiency.

To invoke Bulk Operations:

- **Use HTTP with Microsoft Entra ID**: You can invoke the Bulk operations Web API using HTTP requests authenticated with Microsoft Entra ID.
- **Use the HTTP Connector with service principals**: Alternatively, you can use the HTTP connector in Power Automate when working with service principals to invoke these APIs.

In this example, we prepare the records in JSON format using the **Select** action:

:::image type="content" source="media/prepare-json.png" alt-text="Screenshot of a using a Select action to prepare the content for the bulk request." lightbox="media/prepare-json.png" :::

Then, we use HTTP with Microsoft Entra ID to post the request using the **CreateMultiple Web API**:

:::image type="content" source="media/createmultiple.png" alt-text="Screenshot of invoking an HTTP request to perform a bulk operation.":::

If you have 100 records in the JSON output, this approach only incurs one single action instead of 100 Create Row actions in Dataverse.