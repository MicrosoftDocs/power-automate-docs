---
title: Timeframe filter
description: Learn how to select the timeframe of interest in your analysis in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Timeframe filter

The timeframe filter lets you specify time related options for your analysis. On the left side, you can edit the filter rule. The right side shows the visualization of the course of the process divided into equal time intervals.

1. On the left panel, select your timeframe filter.

1. On the **Level** row, select the detail level of the chart by selecting number.

1. On the center panel, specify you filter results.

1. On the center panel, select the cases to display in the chart (**ongoing**, **started**, and **ended**).

    The colors of your selections match the colors in the visual on the right.

1. Select **Apply**.
    :::image type="content" alt-text="Screenshot of the course of the process divided into equal time intervals." source="media/timeframe-level.png":::

## Evaluation of presence in a timeframe

Specify the evaluation method to determine if a case falls in the specified timeframe.

The following list describes the options:

- **Fit in:** The case must start and finish within the specified timeframe.

- **Finish in:** The case must finish within the specified timeframe and start outside the specified timeframe.

- **Start in:** The case must start within the specified timeframe and finish outside the specified timeframe.

- **Intersecting:** Cases extend to the time frame. They might be contained, start, or finish in it.

- **Pass through:** The case must start before the beginning of the specified timeframe and finish after the end of the specified timeframe.

## Timeframe specification

To specify a timeframe, enter its start and finish time.

1. In the **in range** field, select the calendar icon and select the start date.

1. At the bottom of the calendar, set the start time by selecting the hour, minute, and AM or PM.

1. In the **and** field, select the calendar icon and select the end date.

1. At the bottom of the calendar, set the end time by selecting the hour, minute, and AM or PM.

