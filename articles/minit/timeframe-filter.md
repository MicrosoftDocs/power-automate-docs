---
title: Timeframe filter
description: Learn how to select the timeframe of interest in your analysis in the Power Automate Process Mining desktop app.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/15/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Timeframe filter

Use this filter to select the time frame of interest in your analysis. 

:::image type="content" alt-text="Screenshot of the timeframe filter interval icons." source="media/image007.png":::

On the left side, you can edit the filter rule. The right side shows the visualization of the course of the process divided into equal time intervals. The number of time intervals, (for example, chart detail level), can be changed by the switch.

:::image type="content" alt-text="Screenshot of the course of the process divided into equal time intervals." source="media/image-57.png":::

## Evaluation of presence in a timeframe

Here it is necessary to specify the evaluation method to determine if a case falls in the specified timeframe.

:::image type="content" alt-text="Screenshot of the evaluation method." source="media/image009-1-1.png":::

### Fit in

The case must both start and finish within the specified timeframe.

### Finish in

The case must finish within the specified timeframe and start outside the specified timeframe.

### Start in

The case must start within the specified timeframe and finish outside the specified timeframe.

### Intersecting

Cases extend to the time frame. They may be contained, start or finish in it.

### Pass through

The case must start before the beginning of the specified timeframe and finish after the end of the specified timeframe.

## Timeframe specification

To specify a timeframe, enter its start and finish time in the filter rule.

:::image type="content" alt-text="Screenshot of the start and finish timeframe." source="media/duration1.png":::

Or you can specify a timeframe by marking it on the chart showing the course of the process.

:::image type="content" alt-text="Screenshot of marking the timeframe on the chart." source="media/image-58.png":::

### Selecting which cases to display in the chart

Here you can select the information to be displayed in the chart.

:::image type="content" alt-text="Screenshot of selecting the cades to display in the chart." source="media/image012-3.png":::

#### Ongoing cases

The chart shows how many cases were ongoing in the timeframe.

#### Started cases

The chart shows how many cases started in the timeframe.

#### Ended cases

The chart shows how many cases finished in the timeframe.


