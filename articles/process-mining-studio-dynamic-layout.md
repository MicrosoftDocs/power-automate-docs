---
title: Customize layouts in process intelligence studio
description: Learn how to arrange, resize, and organize visualization cards in process intelligence studio to create customized dashboard layouts for your analytical workflows.
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

# Customize layouts in process intelligence studio

## Overview

Dynamic layout mode is the feature that enables you to customize how cards are arranged, sized, and organized within each tab of *process intelligence studio*. In edit layout mode, you have complete control over your dashboard's visual structure, allowing you to create layouts optimized for specific analytical workflows.

## Enter edit layout mode

To begin to customize your layout, select **Edit layout** in the top-right corner of the interface. This action enables edit mode, allowing you to rearrange and resize cards on the canvas.

- The interface enters edit mode, making cards moveable and resizable.
- The **Add card** panel becomes accessible.
- Card resize handles become visible on selected cards.


In edit layout mode, the **Add card** panel appears on the right side of the interface. This panel displays all card types in a grid layout.

The following screenshot is an example of the **Add card** panel.

:::image type="content" source="media/process-mining-studio-dynamic-layout/add-card.png" alt-text="Screenshot of the Add Card panel in Process Intelligence Studio.":::

### Card types

The **Add card** panel shows the following card type options:
.
1. **KPI**: Display key performance indicators with large numeric values
1. **Donut chart**: Show proportional data in a circular, segmented format.
1. **Process map**: Visualize the process flow with activities and connections.
1. **Vertical bar chart**: Compare values across categories using vertical bars.
1. **Horizontal bar chart**: Compare values using horizontal bars.
1. **Line chart**: Display trends and changes over time.
1. **Statistical grid**: Present detailed data in a tabular format.
1. **Variant DNA**: Analyze process variant patterns and characteristics

### Add a card

To add a card to your layout:

1. In the **Add card** panel, select a card type tile.
    - The card is immediately added to your dashboard.
    - The new card appears in an uncustomized state.

1. Configure the card's data and appearance.

## Drag and drop positioning

The following screenshot demonstrates the drag and drop capabilities in edit mode.

:::image type="content" source="media/process-mining-studio-dynamic-layout/drag-and-drop-layout.png" alt-text="Screenshot of drag and drop positioning in edit mode.":::

 Notice the following in the screenshot:

- Multiple cards are visible: **Donut chart**, **Vertical bar chart**, and **Line chart**.
- A **Line chart** card is being repositioned. It shows with a blue selection border.
- Cards display in an uncustomized state with the **Customize card** button visible.
- The **Add card** panel remains accessible on the right side.

### Move cards

The layout system uses a grid-based arrangement, which allows cards to snap to alignment positions as you move them. This arrangement ensures a clean, organized appearance.

To reposition a card:

1. In edit layout mode, hover over a card.
1. Select and hold (or click and hold) on the card's header area.
1. Drag the card to your desired position on the canvas.

    As you drag, other cards automatically adjust to make room.

1. To drop the card in its new location, release your navigation device (or mouse button).

## Resize cards

When you select a card in edit mode, it displays a blue border with circular *resize handles*, as shown in the following screenshot.

:::image type="content" source="media/process-mining-studio-dynamic-layout/card-resize-handles.png" alt-text="Screenshot of card resize handles in Process Intelligence Studio.":::

The resize handles appear in the following positions around the card's perimeter:

- **Four corners**: Top-left, top-right, bottom-left, and bottom-right.
- **Four edge midpoints**: Top center, bottom center, left center, and right center.

In the screenshot, you can see a **Line chart** card with bright blue circular handles at all eight positions around its perimeter.

To change a card's size:

1. Select the card. A blue border appears with handles.
1. Select and hold (or click and hold) on any resize handle.
1. Drag the handle to expand or contract the card:

   - **Corner handles**: Resize both width and height simultaneously.
   - **Edge handles**: Resize in one dimension only.

1. Release to apply the new size.

To ensure content remains readable and the layout stays functional, cards have minimum and maximum size constraints.

## Uncustomized card state

When you first add a card or didn't yet configure it, the card displays in an uncustomized state.

To open the configuration panel where you can select data sources, choose metrics, and configure visualization settings specific to that card type, select **Customize card**.

## Edit mode controls

While in edit layout mode, more controls display:

- **Add card panel**: Right-side panel for selecting new cards to add.
- **Add persistent filters**: Button to create filters that apply across all cards. They're saved with the tab layout and can't be removed when viewing the tab.
- **Card context menus**: Three-dot menus on each card for more options.
- **Save/Exit controls**: Options to save your layout changes or exit edit mode.

## Layout best practices

- **Group related metrics**: Place connected visualizations near each other.
- **Size by importance**: Make critical KPIs and charts larger for visibility.
- **Balance the layout**: Distribute cards evenly across the canvas.
- **Consider flow**: Arrange cards in a logical reading order. Arrangement is typically left-to-right, top-to-bottom.
- **Test at different screen sizes**: Ensure your layout works well on various display resolutions.

## Save your layout

Save changes made in edit layout mode by selecting **Save** when exiting edit mode.

## Related information

Learn about configuring individual card types in the following specific card articles:

- [KPI card](process-mining-studio-kpi-card.md)
- [Process map](process-mining-studio-process-map.md)
- [Donut chart](process-mining-studio-donut-chart.md)
- [Vertical bar chart](process-mining-studio-vertical-bar-chart.md)
- [Horizontal bar chart](process-mining-studio-horizontal-bar-chart.md)
- [Line chart](process-mining-studio-line-chart.md)
- [Statistical grid](process-mining-studio-statistical-grid.md)
- [Variant DNA](process-mining-studio-variant-dna.md)
