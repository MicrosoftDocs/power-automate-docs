---
title: Process Intelligence Studio overview (preview)
description: Learn about Process Intelligence Studio, the next-generation interface for process analysis in Power Automate Process Mining with customizable dashboards and interactive visualizations.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 02/17/2026
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- enduser
---

# Process Intelligence Studio overview (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Process Intelligence Studio is the next-generation interface for process analysis in Power Automate Process Mining. It provides a fully customizable, tab-based dashboard that enables you to visualize, analyze, and monitor your business processes through interactive cards and visualizations. It extends and enhances the previous Process overview.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

As shown in the following screenshot, Process Intelligence Studio provides a comprehensive analytical workspace with multiple components working together to deliver powerful process insights.

:::image type="content" source="media/process-mining-studio-overview/process-intelligence-studio-main.png" alt-text="Screenshot of the Process Intelligence Studio main interface.":::

## Benefits of Process Intelligence Studio

Process Intelligence Studio transforms how you interact with process mining data by offering:

- A flexible, card-based dashboard system that adapts to your analysis needs
- Multiple tabs for organizing different analytical perspectives
- Dynamic filtering capabilities that apply across all visualizations
- Real-time data refresh to ensure you're working with current information
- Customizable layouts where you can arrange, resize, and configure cards

Unlike the previous Process Overview, Process Intelligence Studio gives you complete control over what you see and how you see it, enabling you to create personalized analytical workspaces for different stakeholders and use cases.

## Key components of the interface

The main interface consists of several key areas:

### Active process view

Name of the process and the selected process view. Process views can be defined in the Process Mining desktop application. You can have an independent set of analytical tabs per view. Default view is provided automatically after the creation of the process.

### Tab bar

The tab bar organizes your analytical views. It's located at the top of the interface.

- Multiple tabs such as **Overview**, **Case Duration**, **Variant Analysis**, and **Top 3 Countries/Regions**.
- Each tab can display a different set of cards and visualizations.
- A (**+**) button on the right allows you to create more tabs.
- **Edit tabs** button in the top-right corner provides tab management capabilities.

### Filter bar

The filter bar enables data refinement. It's positioned below the tab bar.

- Active filters displayed as removable pills (for example, **SupplierState: Falkland Isl...**, **Variant: 55, Variant 15...**).
- Each filter pill includes an X button for quick removal.
- **Add Filters** button to apply more filtering criteria.
- Filters apply to all cards and visualizations on the current tab.

### Dashboard area

The main canvas displays multiple cards arranged in a grid layout.

### Control bar

The top-right section provides key controls.

- **Timestamp of the last data refresh**.
- **Refresh data** button to update with latest process data.
- **Edit tabs** button for tab management.
- **Edit layout** button to enter customization mode.

## How Process Intelligence Studio enhances process analysis

Process Intelligence Studio improves upon the traditional process overview with these key enhancements:

- **Flexibility**: Create multiple tabs with different card configurations instead of a single fixed view.
- **Personalization**: Arrange and size cards to match your specific analysis workflow.
- **Organization**: Group related metrics and visualizations together logically.
- **Efficiency**: Switch between preconfigured analytical perspectives instantly.
- **Collaboration**: Share specific tabs or entire dashboard configurations with team members.

## Get started

To begin using Process Intelligence Studio, do the following steps.

1. Navigate to your process in Power Automate Process Mining.
1. Select the Process Intelligence Studio view.
1. Explore the default [tabs](process-mining-studio-tab-management.md) and [cards](process-mining-studio-tiles-overview.md) provided.
1. Use [Edit layout](process-mining-studio-dynamic-layout.md) to customize card arrangements.
1. [Create new tabs](process-mining-studio-tab-management.md#create-new-tabs) for specific analytical scenarios.
1. [Apply filters](process-mining-studio-filtering-overview.md) to focus on particular process segments.

## Related information

- [Tab management](process-mining-studio-tab-management.md): Create and organize tabs
- [Dynamic layout mode](process-mining-studio-dynamic-layout.md): Customize card layouts
- [Filtering overview](process-mining-studio-filtering-overview.md): Apply and manage filters
- [Cards](process-mining-studio-tiles-overview.md): Visualize process insights and configure cards
