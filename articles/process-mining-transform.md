---
title: Transform and map data
description: Learn how to transform and map data with the process mining capability in Power Automate.
author: donums
contributors:
  - rosikm
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 04/16/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Transform and map data

After you select the data source you want to use, you're taken to the Power Query Editor. The Query Editor is a powerful tool to transform your data. To learn more, go to [The Power Query user interface](/power-query/power-query-ui).

Here are some reasons why you might want to transform the data:

- You might not be interested in all the activity names that are logged, and so you want to filter for specific activity names that are important to the process you're trying to mine.

- You might want to rename some of the activity names to be more descriptive and understandable. This is often not the case with names in a database.

- You might be interested in only a specific date range, and not the entire history of data.

- You might want to combine multiple ID columns to form the case ID. This is often done when the ID you want to use for process mining doesn't exist or is a combination of multiple IDs in the application. For example, when a customer files support tickets, the support ticket might be assigned to multiple customer service agents. If you want to analyze how each agent handles each ticket, you would combine the agent ID and the ticket ID into the case ID.

## Filter activity names

1. Select the caret next to the activity name column to bring up the sort and filter menu.
1. If there's a message that says **List may be incomplete**, select **Load more**.
1. Select only the activity names that you want to analyze. Uncheck any name you want to exclude.

    :::image type="content" source="media/process-mining-transform/filter-activity.png" alt-text="Screenshot of filtering activity names.":::

1. Alternatively, you can use the **Text filter** menu for more advanced filtering. For more information on filtering by value, go to [Filter by values in a column](/power-query/filter-values).

## Rename activities

1. Ensure that the **Activity Name** column is selected.
1. Above the toolbar, select the **Transform** tab.
1. On the toolbar, select **Replace values**.
1. Under **Values to find**, type the activity name as it appears in the data source that you want to replace.
1. Under **Replace with**, type the activity name you want to show in the process map.
1. Repeat this process for all the values you want to replace.

## Reduce the number of total records

One strategy for reducing the total number of records is to use only the latest records. To do this, you need to first sort the data by time.

1. Open the sort and filter menu by selecting the caret next to the **startTimestamp** column.

    :::image type="content" source="media/process-mining-transform/reduce-records.png" alt-text="Screenshot of reducing the number of total records.":::

1. To have the most recent records show up first, select **Sort descending**.
1. Select **OK**, and then select **Keep rows** on the toolbar.
1. Enter **150000** under **Number of rows**.
1. Select **OK** to filter for the top 150,000 rows.

## Combine multiple IDs

You can use **Ctrl** + **click** to select multiple columns that you want to combine.

1. On the Transform tab toolbar, select **Merge columns**.
1. (Optional) Select a separator from the dropdown list. Alternatively, you can select **none**.
1. Change the name (or make a note of the default name that's generated), so you can select it when mapping to a case ID.

## Map data

Mapping tells the process mining capability what column is mapped to which attribute type (for example, case ID, activity name, or timestamp).

1. To navigate to the Mapping screen, select **Next**.
1. Use the dropdown menus next to the respective columns to select their attribute type. For more information, follow the [description of the attribute types](process-mining-processes-and-data.md#data-requirements).
1. When the data is ingested from Azure Data Lake Gen2 using a CSV file format, you can use the dropdown menus in the **Data type** column to change the data types for the import. For columns having numeric values, consider their analytical usage of whether the attribute is a continuous value (for example, invoice amount set to *Number*) or a categorical value (for example, material code set to *Text*).
1. Case ID, Activity, and Start timestamp are mandatory attributes to continue with the analysis.
1. To start the analysis of your process, select **Save and analyze**.
