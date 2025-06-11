---
title: Work only with relevant data
description: Discover techniques to limit data processed in Power Automate, optimizing performance and ensuring only necessary information is handled.
#customer intent: As a Power Automate user, I want to limit data processed in Power Automate so that I can optimize efficiency and accuracy in automated workflows.
author: manuelap-msft
ms.service: power-automate
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

# Work only with relevant data

In Power Automate, using only relevant data is essential for maintaining efficiency and accuracy in automated workflows.

[Content throughput limits](/power-automate/limits-and-config#throughput-limits) refer to the maximum amount of data that can be read from or written to the run history of a cloud flow within a specific time period. These limits affect how much data can be processed during a specified time period. Throughput limits vary by [performance profile](/power-automate/limits-and-config#performance-profiles).

To optimize performance in cloud flows, it's important to limit the data processed to only what is relevant.

You can limit the data processed at both the trigger and action levels by:

- Specifying OData expressions
- Setting a top count 
- Selecting relevant column names 

These techniques help filter the data effectively, ensuring that your flow processes only the necessary information.

## Triggers

At the trigger level stage, you can define conditions that must be met for the data to be read and processed in the cloud flow. Using OData expressions, you can filter data based on specific criteria, ensuring only pertinent data is brought in.

:::image type="content" source="media/odata-filter.png" alt-text="Screenshot of using select columns and filter rows in a Dataverse trigger." lightbox="media/odata-filter.png":::

Data sources like SharePoint allow you to specify views to get only relevant columns and filtered records. In the trigger,  specify the view relevant to your use case.

:::image type="content" source="media/sharepoint-filter-view.png" alt-text="Screenshot of using the Limit Columns By View option on a SharePoint trigger." lightbox="media/sharepoint-filter-view.png":::

## Actions

At the action level, limit the number of records processed by specifying which columns are necessary and setting a top count. This approach helps to manage data volume and focus on the most relevant information.

By implementing these strategies, you can optimize data handling and improve the efficiency of your processes.

When using Power Automate to get data from Dataverse, you can use the following options to limit the data processed in your cloud flow:

- **Select columns**: Specify which columns to retrieve from the Dataverse table to reduce the amount of data processed by only including the necessary fields. For example, if you only need the Name and Email columns, exclude all other columns from the query.
- **Filter rows**: Use OData filter expressions to define criteria that the data must meet to be included to fetch only the relevant rows. For instance, you can filter rows where the Status is Active or where the CreatedDate is within the last 30 days.
- **Row count**: Limit the number of rows returned by specifying a maximum count, especially when dealing with large datasets. For example, setting a row count of 100 ensures that only the first 100 rows that meet your criteria are processed.

You can either use one or a combination of these options to minimize the data.

:::image type="content" source="media/dataverse-limit.png" alt-text="Screenshot of a Dataverse action in a cloud flow that specifies the Select Column, Filter Row, and Row Count settings." lightbox="media/dataverse-limit.png":::

When using Power Automate to get data from SharePoint, you have similar options to limit the data processed:

- **Filter query**: Use OData filter queries to specify conditions that the data must meet to be included. This option helps to fetch only the relevant items based on criteria like date ranges and specific values.
- **Top count**: This option allows you to limit the number of items returned by the action. For example, setting a top count of 100 ensures that only the first 100 items that meet your criteria are processed.
- **Limit columns by view**: You can choose to limit the columns returned by selecting a specific view. This technique reduces the amount of data processed by only including the columns defined in that view.

:::image type="content" source="media/sharepoint-filter-action.png" alt-text="Screenshot of a SharePoint action showing the Filter Query, Top Count, and Limit Columns By View options." lightbox="media/sharepoint-filter-action.png":::

By using these options, you can optimize your flows to handle only the necessary data, improving performance and efficiency.