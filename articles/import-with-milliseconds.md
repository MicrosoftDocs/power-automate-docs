---
title: How to setup milisecond support when ingesting data via Dataflows
description: Learn how to setup milisecond part for start and end timestamps for events.
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

# Get started with process import

Use the Power Automate Process Mining home page to create new process and select for Data Source select Dataflow. Upload the source file with process event log. Continue until step Transform your data (optional).

## Step by step setup

## 1 In step Transform your data (optional) you see Power Query component.

:::image type="content" source="media/process-mining-import-milliseconds/power-query-component.png" alt-text="Screenshot of the Power Query web component.":::

## 2 At first with definition of start timestamp for event.

1. Click on **Add column** tab in the top bar.

1. Click on **Custom column** button. Custom column window is displayed.

1. For **New column name** enter StartTimestamp.millisecondsEpoch.

1. For **Data type** select Whole number.

1. For **Custom column formula** enter value Duration.TotalSeconds(DateTimeZone.From([StartDate]) - #datetimezone(1970, 1, 1, 0, 0, 0, 0, 0)) * 1000.

1. For **Available column(s)** selects the source column from your event log StartDate.

Definiton of Custom column must be exact match as following picture:

:::image type="content" source="media/process-mining-import-milliseconds/custom-column-start.png" alt-text="Screenshot of the custom definition of event's start time":::

## 3 Custom definition for event's end timestamp

Repeat the same steps for customization of event's end timestamp, using EndDate column. Use column name EndTimestamp.millisecondsEpoch.

:::image type="content" source="media/process-mining-import-milliseconds/custom-column-end.png" alt-text="Screenshot of the custom definition of event's start time":::

The end result of mapping displays two new custom columns at part of event log.

:::image type="content" source="media/process-mining-import-milliseconds/mapped-event-log.png" alt-text="Screenshot of the custom definition of event's start time":::

Click next to continue with mapping your attributes.

## 4 Map your data

On screen Step 4 of 4: Map your data choose corrent mapping. Assign to custom columns attribute type Event Start respectively Event End.

Note: Our attribute mapping screen will intentionally hide these 2 custom columns in case user map to the wrong data type, it must be whole number.

[!INCLUDE[footer-include](includes/footer-banner.md)]
