---
title: Customize layouts in Process Intelligence Studio
description: Learn how to arrange, resize, and organize visualization cards in Process Intelligence Studio to create customized dashboard layouts for your analytical workflows.
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

# Dynamic Layouting

## Overview

Dynamic layouting is the feature that enables you to customize how cards are arranged, sized, and organized within each tab of Process Intelligence Studio. In edit layout mode, you have complete control over your dashboard's visual structure, allowing you to create layouts optimized for specific analytical workflows.

## Entering Edit Layout Mode

To begin customizing your layout:

1. Click the "Edit layout" button in the top-right corner of the interface
1. The interface enters edit mode, making cards moveable and resizable
1. The "Add card" panel becomes accessible
1. Card resize handles become visible on selected cards

## Adding Cards to Your Layout

:::image type="content" source="media/process-mining-studio/add-card.png" alt-text="Screenshot of the Add Card panel in Process Intelligence Studio.":::

### Opening the Add Card Panel

In edit layout mode, the Add card panel appears on the right side of the interface (as shown in the screenshot above). This panel displays all available card types in a grid layout.

### Available Card Types

The Add card panel shows eight card type options:

1. **KPI**: Display key performance indicators with large numeric values
1. **Donut chart**: Show proportional data in a circular, segmented format
1. **Process map**: Visualize the process flow with activities and connections
1. **Vertical bar chart**: Compare values across categories using vertical bars
1. **Horizontal bar chart**: Compare values using horizontal bars
1. **Line chart**: Display trends and changes over time
1. **Statistical grid**: Present detailed data in a tabular format
1. **Variant DNA**: Analyze process variant patterns and characteristics

### Adding a Card

To add a card to your layout:

1. Click on any card type tile in the Add card panel
1. The card is immediately added to your dashboard
1. The new card appears in an uncustomized state
1. You can then configure the card's data and appearance

## Drag and Drop Positioning

:::image type="content" source="media/process-mining-studio/drag-and-drop-layout.png" alt-text="Screenshot of drag and drop positioning in edit mode.":::

The screenshot above demonstrates the drag and drop capabilities in edit mode. Notice how:

- Multiple cards are visible: "Donut chart", "Vertical bar chart", and "Line chart"
- A "Line chart" card is being repositioned (shown with a blue selection border)
- Cards display in an uncustomized state with the "Customize card" button
- The Add card panel remains accessible on the right side

### Moving Cards

To reposition a card:

1. In edit layout mode, hover over a card
1. Click and hold on the card's header area
1. Drag the card to your desired position on the canvas
1. As you drag, other cards automatically adjust to make room
1. Release the mouse button to drop the card in its new location

The layout system uses a grid-based arrangement, so cards snap to alignment positions as you move them, ensuring a clean, organized appearance.

## Resizing Cards

:::image type="content" source="media/process-mining-studio/card-resize-handles.png" alt-text="Screenshot of card resize handles in Process Intelligence Studio.":::

### Understanding Resize Handles

When a card is selected in edit mode, it displays a blue border with circular resize handles (as shown in the screenshot above). The resize handles appear at:

- **Four corners**: Top-left, top-right, bottom-left, bottom-right
- **Four edge midpoints**: Top center, bottom center, left center, right center

In the screenshot, you can see a "Line chart" card with bright blue circular handles at all eight positions around its perimeter.

### Resizing a Card

To change a card's size:

1. Select the card by clicking on it (blue border appears with handles)
1. Click and hold on any resize handle
1. Drag the handle to expand or contract the card:
   - **Corner handles**: Resize both width and height simultaneously
   - **Edge handles**: Resize in one dimension only
1. Release to apply the new size

Cards have minimum and maximum size constraints to ensure content remains readable and the layout stays functional.

## Uncustomized Card State

When you first add a card or haven't yet configured it, the card displays in an uncustomized state.
Click the "Customize card" button to open the configuration panel where you can select data sources, choose metrics, and configure visualization settings specific to that card type.

## Edit Mode Controls

While in edit layout mode, you'll see additional controls:

- **Add card panel**: Right-side panel for selecting new cards to add
- **Add persistent filters**: Button to create filters that apply across all cards and are saved with the tab layout and cannot be removed when viewing the tab 
- **Card context menus**: Three-dot menus on each card for additional options
- **Save/Exit controls**: Options to save your layout changes or exit edit mode

## Layout Best Practices

- **Group related metrics**: Place connected visualizations near each other
- **Size by importance**: Make critical KPIs and charts larger for visibility
- **Balance the layout**: Distribute cards evenly across the canvas
- **Consider flow**: Arrange cards in a logical reading order (typically left-to-right, top-to-bottom)
- **Test at different screen sizes**: Ensure your layout works well on various display resolutions

## Saving Your Layout

Changes made in edit layout mode are saved by clicking on the **Save** button when exiting edit mode.

For information about configuring individual card types, see the specific card documentation:
- [KPI Card](process-mining-studio-kpi-card.md)
- [Process Map](process-mining-studio-process-map.md)
- [Donut Chart](process-mining-studio-donut-chart.md)
- [Vertical Bar Chart](process-mining-studio-vertical-bar-chart.md)
- [Horizontal Bar Chart](process-mining-studio-horizontal-bar-chart.md)
- [Line Chart](process-mining-studio-line-chart.md)
- [Statistical Grid](process-mining-studio-statistical-grid.md)
- [Variant DNA](process-mining-studio-variant-dna.md)
