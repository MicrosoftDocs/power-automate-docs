---
title: Working with relevant data
description: Learn how to work with relevant data
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

# Working with relevant data

In Power Automate, using only relevant data is essential for maintaining efficiency and accuracy in your automated workflows.

[Content throughput limits](/power-automate/limits-and-config#throughput-limits) refer to the maximum amount of data that can be read from or written to the run history of a cloud flow within a specific time period. These limits affect how much data can be processed during a specific time period. Throughput limits vary by [performance profile](/power-automate/limits-and-config#performance-profiles).

To optimize performance in your cloud flows, it’s important to limit the data processed to only what is relevant. You can limit the data processed at both the trigger and action levels by specifying OData expressions, setting a top count, and selecting relevant column names. These techniques help filter the data effectively, ensuring that your flow processes only the necessary information.

## Triggers

At the trigger level stage, you can define conditions that must be met for the data to be read and processed in the cloud flow. Using OData expressions, you can filter data based on specific criteria, ensuring only pertinent data is brought in.

:::image type="content" source="media/odata-filter.png" alt-text="A screenshot of using select columns and filter rows in a Dataverse trigger":::

Data sources like SharePoint allow you to specify views to get only relevant columns and filtered records. In trigger, users can specify the view which are relevant to their use case and get only relevant data and selected columns.

:::image type="content" source="media/sharepoint-filter-view.png" alt-text="A screenshot of using the limit columns by view option on a SharePoint trigger":::

## Actions

At the action level, limit the number of records processed by specifying which columns are necessary and setting a top count. This helps in managing data volume and focusing on the most relevant information.

By implementing these strategies, you can optimize data handling and improve the efficiency of your processes.

When using Power Automate to get data from Dataverse, you have several options to limit the data processed in your cloud flow:

- **Select Columns**: Specify which columns to retrieve from the Dataverse table to reduce the amount of data processed by only including the necessary fields. For example, if you only need the Name and Email columns, you can exclude all other columns from the query.
- **Filter Rows**: Use OData filter expressions to define criteria that the data must meet to be included to fetch only the relevant rows. For instance, you can filter rows where the Status is Active or where the CreatedDate is within the last 30 days.
- **Row Count**: Limit the number of rows returned by specifying a maximum count, especially when dealing with large datasets. For example, setting a row count of 100 ensures that only the first 100 rows that meet your criteria are processed.

You can either use one or a combination of these options to minimize the data.

:::image type="content" source="media/dataverse-limit.png" alt-text="A screenshot of a Dataverse action in a cloud flow that specific the select colun, filter row, and row count setting":::

When using Power Automate to get data from SharePoint, you have several options to limit the data processed in your cloud flow:

- **Filter Query**: Use OData filter queries to specify conditions that the data must meet to be included. This helps in fetching only the relevant items based on criteria like date ranges, specific values, etc.
- **Top Count**: This option allows you to limit the number of items returned by the action. For example, setting a top count of 100 ensures that only the first 100 items that meet your criteria are processed1.
- **Limit Columns by View**: You can choose to limit the columns returned by selecting a specific view. This technique reduces the amount of data processed by only including the columns defined in that view.

By using these options, you can optimize your flows to handle only the necessary data, improving performance and efficiency.

:::image type="content" source="media/sharepoint-filter-action.png" alt-text="A screenshot of a SharePoint action showing the filter query, top count and limit colums by view option":::
