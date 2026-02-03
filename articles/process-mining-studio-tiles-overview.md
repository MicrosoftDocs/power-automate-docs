---
title: Visualization cards overview in Process Intelligence Studio
description: Learn about the different types of visualization cards available in Process Intelligence Studio including KPI cards, charts, process maps, and statistical grids.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 02/03/2026
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Cards overview

## What are cards?

Cards, also called tiles, are visualization components that display process analytics data on your dashboard. Each card type is designed to present specific types of insights, from key performance indicators to complex process flows. You can add multiple cards to a dashboard and arrange them to create a comprehensive view of your process performance.

## Card types

### KPI

Displays a single key performance indicator value or a combination of primary and secondary indicator values. Use KPI cards to highlight critical metrics such as case counts, average throughput time, or rework rates. These cards provide at-a-glance insights into your most important process measures.

### Donut chart

Visualizes proportional data in a circular format with a center hole. Ideal for showing distribution across categories, such as resource allocation, case status breakdown, or percentage of total values. The donut chart makes it easy to compare parts to a whole.

### Process map

Displays an interactive visual representation of your process flow, showing activities as nodes and their connections. Use process maps to understand the actual flow of your process, identify bottlenecks, and analyze process variants. This is one of the most powerful visualization types for process mining.

### Vertical bar chart

Presents data using vertical bars, making it easy to compare values across different categories. Effective for displaying metrics like case counts by variant, activity frequency, or performance comparisons across different process dimensions.

### Horizontal bar chart

Similar to vertical bar charts but with horizontal orientation. Particularly useful when category names are long or when you need to display many categories, as it provides more space for labels. Commonly used for showing top variants or ranking activities.

### Line chart

Displays data trends over time using connected points. Use line charts to track how process metrics evolve, identify patterns, and spot anomalies in time-series data. Perfect for monitoring throughput, cycle times, or case volumes across different time periods.

### Statistical grid

Presents data in a tabular format with rows and columns. Use statistical grids when you need to display detailed numeric information, compare multiple metrics side by side, or provide drill-down capabilities into specific data points.

### Variant DNA

Visualizes process variants in a compact, DNA-like pattern that shows the sequence of activities for each variant. This specialized visualization helps you quickly compare different process paths, identify common patterns, and spot deviations from the standard process flow.

## Adding cards to your dashboard

To add a card to your dashboard:

1. Click the **Add card** button on your dashboard in Edit mode
1. Select the card type you want to add from the list of 8 available options
1. The card will be added to your dashboard in an uncustomized state
1. Click "Customize card" to configure the card with your specific data and visualization settings
1. Arrange cards on your dashboard using drag-and-drop to create your preferred layout

Each card requires customization after being added to display meaningful data. The customization panel allows you to select attributes, metrics and configure visualization-specific settings.

## Next steps

Learn about each tile type in detail:
- [KPI card](process-mining-studio-kpi-card.md)
- [Process map](process-mining-studio-process-map.md)
- [Variant DNA](process-mining-studio-variant-dna.md)
- [Horizontal bar chart](process-mining-studio-horizontal-bar-chart.md)
- [Vertical bar chart](process-mining-studio-vertical-bar-chart.md)
- [Donut chart](process-mining-studio-donut-chart.md)
- [Line chart](process-mining-studio-line-chart.md)
- [Statistical grid](process-mining-studio-statistical-grid.md)
