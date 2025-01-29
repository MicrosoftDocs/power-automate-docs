---
title: Anti-patterns to avoid
description: Learn how to avoid anti-patterns
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/28/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Avoiding anti-patterns

Anti-patterns in Power Automate refer to inefficient, error-prone, or resource-intensive design practices that negatively impact performance, maintainability, and reliability. Avoiding these practices ensures optimal flow execution.

Nested For each loops are resource-intensive operations in cloud flows, impacting both performance and resource consumption.

Impact of Nested For each Loops in Cloud Flows

- **Execution time**: Nested loops can multiple the total number of iterations rapidly. For instance, if you have two loops, each with 10 iterations, the total number of iterations becomes 10 x 10 = 100. This exponential increase can extend the execution time of your flow, especially if each iteration processes large datasets or performs complex operations.
- **Limits and quotas**: Power Automate enforces limits and quotas, such as the maximum number of iterations allowed within a loop and the overall execution time. Nested loops can quickly approach these limits, leading to flow failures or throttling, particularly when dealing with large datasets or frequent executions.
- **Performance impact**: Each iteration within a nested loop consumes processing power and memory. As the number of iterations grows, the demand on system resources increases, potentially slowing down the entire flow.

Learn more: [Concurrency looping and debatching limits](../../limits-and-config.md)

Depending on your scenarios, you can avoid nested loops by processing related records from a parent table:

**Scenario:** An outer loop uses the **List Rows** action to retrieve a list of product categories from the *ProductCategory* table where the *IsPromotion* column is true. An inner loop then processes related-records from the *Product* table for each category retrieved by the outer-loop.

**Alternative approach:** Use OData Query Expansion to streamline this process. This method allows you to work with a single **For each** loop, reducing the total number of requests to Dataverse to just one *RetrieveMultiple* call.

To implement OData query expansion:

- Use the **Expand Query** parameter to specify the lookup column name that links the *ProductCategory* table to the *Product* table. This approach retrieves related records in a single query. For example, set the Expand Query parameter to `Products($select=ProductName,Price)`.
- Use the **$select** parameter to limit the columns returned from the related table.
- Retrieve and process relevant records by applying conditions directly on the lookup table’s columns using the **Filter Rows** parameter. For example, set the Filter parameter to  `IsPromotion eq true`.

:::image type="content" source="media/nested-loop.png" alt-text="Screenshot of using the Expand Query and Filter parameter to implement OData query expansion":::

## Avoiding infinite loops

With Power Automate, it's easy to encounter a situation where flows start to trigger infinitely, for example when the flow updates the same table that triggers it.

When saving a flow that might result in an infinite trigger loop, Power Automate provides a warning to the maker.

:::image type="content" source="media/infinite-loop.png" alt-text="Screenshot of the warning a maker receives when trying to save a flow that can result in an infinite loop":::

To avoid infinite loops:

- **Use trigger conditions**: Trigger conditions ensure that the flow only runs when specific criteria is met, preventing unnecessary executions. Implement trigger conditions by adding a condition to the trigger to check for certain values or states before the flow proceeds. For example, if your flow updates a status field, you can set a trigger condition to only run the flow if the status isn't already set to the desired value.
- **Terminate the flow**: An alternative approach is to stop the flow from continuing if it detects a condition that would cause an infinite loop. End the flow when a specific condition is met by using the **Terminate** action. This approach can be used as a safeguard to prevent further actions if the flow is about to enter an infinite loop. For example, if the flow detects that it has already processed a record, it can terminate itself to avoid reprocessing.

## Avoiding large numbers of data transformation operations

When working with large-scale data transformations, consider whether the task should be handled as an Extract-Transform-Load (ETL) process. For example, instead of using a Power Automate cloud flow to read data from a large Excel spreadsheet, perform data formatting or validations, and then write the data into Dataverse, consider using [Power Platform dataflows](/power-query/dataflows/create-use) or another ETL tool instead of cloud flows.

Dataflows are designed to handle large volumes of data efficiently, providing better performance for ETL tasks compared to cloud flows. ETL tools offer specialized features for data transformation, validation, and loading, which can simplify complex data processing tasks.

To manage data load with orchestration logic in cloud flows, consider combining cloud flows with dataflows. Here’s how:

1. **Invoke dataflow refresh**:
   - **Action**: Use the dataflow connector in Power Automate to trigger a refresh action and initiate the ETL process defined in your dataflow.
   - **Example**: Set up a Cloud Flow that triggers the dataflow refresh based on a schedule, for example daily, or an event, for example when a new file is uploaded to a SharePoint folder.

1. **Post-ETL Actions**:
   - **Trigger**: Use *when a dataflow refresh completes* trigger in Power Automate to perform actions after the ETL process is finished.
   - **Example**: After the dataflow completes, you can use a cloud flow to send notifications, update records, or perform data processing.

  :::image type="content" source="media/use-dataflow.png" alt-text="Screenshot of using dataflow actions in a cloud flow" border="true":::

## Avoiding using For each loop to update large numbers of records

Often, users need to create or update thousands of records in a data source when a flow is triggered in Power Automate. Many users end up using a For each loop to process each record sequentially, which can cause latency and delays.

To improve the performance, try these two approaches:

1. **Batch operations**:
   - **Description**: Create or update records in batches. Many connectors and services provide API endpoints that support batch requests. This approach allows you to group multiple operations into a single HTTP request.
   - **Implementation**: Use the batch operation feature to send multiple create or update requests in one go. These operations are executed sequentially in the order specified in the batch request. The order of the responses matches the order of the requests in the batch operation.
   - **Benefits**: Reduces the number of individual requests sent to the data source and minimizing latency and improving performance.

   :::image type="content" source="media/batch-operation.png" alt-text="A screenshot using the SharePoint API to execute a batch request":::

2. **Parallelism in For each loop**:
   - **Description**: Enable parallel processing within the **For Each** loop to handle multiple records simultaneously.
   - **Implementation**: Configure the **For Each** loop to process up to 50 records in parallel. This approach is useful for services that don't support batch operations.
   - **Benefits**: Significantly reduces the overall processing time by handling multiple records at the same time.

For information on making batch requests, refer to the following REST API documentation:

- [SharePoint REST API](/sharepoint/dev/sp-add-ins/make-batch-requests-with-the-rest-apis)
- [Dataverse Web API](/power-apps/developer/data-platform/webapi/execute-batch-operations-using-web-api)

When working with dataverse, you can utilize the [Bulk Operations Web APIs](/power-apps/developer/data-platform/bulk-operations). These APIs offer a distinct advantage over Batch operations:

- **Batch operations**: Although batch operations are posted in a single request, they're executed as multiple individual operations. Each operation within the batch is processed separately.
- **Bulk operations**: In contrast, bulk operations are posted and executed as a single operation which means that the entire bulk request is counted as one operation, which can significantly reduce the number of actions and improve efficiency.

To invoke Bulk operations:

- **Using HTTP with Microsoft Entra ID**: You can invoke the Bulk operations web API using HTTP requests authenticated with Microsoft Entra ID.
- **Using HTTP Connector with Service Principals**: Alternatively, you can use the HTTP connector in Power Automate when working with Service Principals to invoke these APIs.

Prepare the records in JSON format using **Select** action:

:::image type="content" source="media/prepare-json.png" alt-text="A screenshot of a using a Select action to prepare the content for the bulk request":::

Use HTTP with Entra ID to post the request using **CreateMultiple Web API**:

:::image type="content" source="media/createmultiple.png" alt-text="A screenshot of invoking an HTTP request to perform a bulk operation":::

If you have 100 records in the JSON output, this approach only incurs one single action instead of 100 Create Row actions in Dataverse.

By using Dataverse Bulk Operations, you can reduce the number of actions required, streamline your processes, and enhance performance.