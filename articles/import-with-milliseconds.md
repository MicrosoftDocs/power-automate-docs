---
title: Set up millisecond support when ingesting data with Dataflows
description: Learn how to set up the start and end timestamps for events.
author: janpidych
contributors:
  - janpidych
  - v-aangie
ms.subservice: process-mining
ms.topic: conceptual
ms.date: 02/11/2025
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.collection:
  - get-started
---

# Set up millisecond support when ingesting data with Dataflows

To get started with setting up millisecond support when ingesting data with Dataflows, go to the Power Automate Process mining home page to create a new process. Learn more in [Get started with the process mining capability](process-mining-tutorial.md#create-a-process).

## Step 1: Customize your data

Follow these steps to customize your data for the Power Query component:

1. In the **Create new process** section of the Power Automate Process mining home page, select **Start here**.
1. In the **Create a new process** screen, enter a process name.
1. Enter a description for the process.
1. In **Data Source**, select **Import data**.
1. Select **Dataflow**.
1. Select **Continue**.
1. Upload the source file that contains the process event log. Continue until you reach the **Transform your data (optional)** step to see the Power Query component.

:::image type="content" source="media/process-mining-import-milliseconds/power-query-component.png" alt-text="Screenshot of the Power Query web component.":::

## Step 2: Define the event's start timestamp

Follow these steps to define the custom column for the event's start timestamp:

1. Select the **Add column** tab in the top bar.
1. Select the **Custom column** button to open the custom column window.
1. In the  **New column name** field, enter `StartTimestamp.millisecondsEpoch`.
1. For **Data type**, select `Whole number`.
1. In **Custom column formula** field, enter `Duration.TotalSeconds(DateTimeZone.From([StartDate]) - #datetimezone(1970, 1, 1, 0, 0, 0, 0, 0)) * 1000`.
1. In **Available column(s)**, select the source column from your event log, such as `StartDate`.

The custom column values must match the values in the following screenshot exactly:

:::image type="content" source="media/process-mining-import-milliseconds/custom-column-start.png" alt-text="Screenshot of the custom definition of event's start time.":::

## Step 3: Define the event's end timestamp

Repeat the steps mentioned in [Step 2: Define the event's start timestamp](#step-2-define-the-events-start-timestamp) to customize the event's end timestamp, using the `EndDate` column. In the **New column name** field, use `EndTimestamp.millisecondsEpoch` instead.

:::image type="content" source="media/process-mining-import-milliseconds/custom-column-end.png" alt-text="Screenshot of the custom definition of event's end time.":::

The following screenshot displays the end result of mapping two new custom columns as part of the event log.

:::image type="content" source="media/process-mining-import-milliseconds/mapped-event-log.png" alt-text="Screenshot of the mapped event log.":::

Select **Next** to continue mapping your attributes.

## Step 4: Map your data

To map your data, choose the correct mapping. Assign the custom columns' attribute type as Event Start and Event End, respectively.

:::image type="content" source="media/process-mining-import-milliseconds/mapped-attributes.png" alt-text="Screenshot of the mapped attributes Event Start and vent End.":::

> [!NOTE]
>
> The attribute mapping screen intentionally hides these two custom columns in case the user maps to the wrong data type. It must be a whole number.

[!INCLUDE[footer-include](includes/footer-banner.md)]
