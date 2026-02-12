---
title: Manage tabs in Process Intelligence Studio (preview)
description: Learn how to create, organize, and manage tabs in Process Intelligence Studio to create multiple specialized analytical views within a single process.
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

# Manage tabs in Process Intelligence Studio (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Tabs are the organizational backbone of Process Intelligence Studio. They allow you to create multiple specialized views within a single process. Each tab maintains its own collection of cards, visualizations, and layout configuration, making it easy to switch between different analytical perspectives without losing your work.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Tab bar features

The tab bar is located at the top of the Process Intelligence Studio interface. It's immediately below the navigation breadcrumb.

:::image type="content" source="media/process-mining-studio-tab-management/tabs.png" alt-text="Screenshot of the tab bar in Process Intelligence Studio.":::

 The tab bar displays the following features:

- **Tab names**: **Overview**, **Case Duration**, **Variant Analysis**, **Top 3 Countries**.
- **Indicator of private/public tab**: Each tab shows a small person icon indicating visibility settings.
- **Active tab indicator**: The currently selected tab (in this case, **Top 3 Countries**) is highlighted with a blue underline.
- **Add button**: A (**+**) button on the right for creating new tabs.

Select a tab name to switch to that view and show its configured cards and visualizations.

## Create new tabs

Create a new tab you want to appear in the tab bar. It becomes the active tab. The new tab displays an empty state where you can begin adding cards.

### Use the (+) button

:::image type="content" source="media/process-mining-studio-tab-management/add-tab-dialog.png" alt-text="Screenshot of the Add tab dialog in Process Intelligence Studio.":::

To create a new tab:

1. At the end of the tab bar, select (**+**).

    The **Add tab** dialog opens.

1. In the text field, enter a descriptive name (for example, **High Throughput Time**).

    The text field includes an (**X**) button on the right side to quickly clear your entered text if needed.

1. To create the tab, select **Add tab**.

    Alternatively, select **Cancel** to dismiss the dialog without creating a tab.

## Manage tabs with the Edit menu

The **Edit tabs** menu provides comprehensive tab management capabilities. Access it by selecting the gear icon labeled **Edit tabs** in the top-right area of the interface.

:::image type="content" source="media/process-mining-studio-tab-management/tab-management-menu.png" alt-text="Screenshot of the Edit tabs menu in Process Intelligence Studio.":::

### The Edit tabs context menu

The **Edit tabs** context menu displays:

- **Tab count**: "Tabs (4)" showing the total number of tabs.
- **Tab list**: All tabs in your dashboard with management controls.
- **Add tab button**: **+ Add tab** option at the bottom.

### Tab context menu options

The context menu appears as a white panel overlaying the tab list. Each option shows an icon next to the label.

:::image type="content" source="media/process-mining-studio-tab-management/tab-context-menu.png" alt-text="Screenshot of the tab context menu options in Process Intelligence Studio.":::

Each tab in the list has an ellipsis (**...**) that opens a context menu with the following options:

- **Rename tab**: Change the tab's name.
- **Duplicate tab**: Create a copy of the tab with all its cards and layout.
- **Delete tab**: Remove the tab from the dashboard.
- **Make public**: Share the tab with other users (indicated by person icon with lock).
- **Move up**: Shift the tab one position to the left in the tab bar.
- **Move down**: Shift the tab one position to the right in the tab bar.

### Reorder tabs

Tabs can be reordered in two ways:

#### Use Move commands

1. Open the tab's context menu with the ellipses (**...**).
1. To move the tab to the left, select **Move up**.

    Alternatively, to move the tab to the right, select **Move down**.

#### Drag handles

1. Locate the six-dot drag handle icon on the left side of a tab in the list.
1. Select and hold (or click and hold) the drag handle.
1. Drag the tab to your desired position.
1. Release your navigation device to drop the tab in place.

The tab order in this management panel directly corresponds to the order that displays in the tab bar.

### Tab indicators

In the tab list, the following displays:

- **Drag handle**: Six dots on the left for reordering.
- **Person icon**: Next to each tab name, indicating sharing status.
- **Checkmark**: Appears next to the currently active tab.
- **Ellipsis (...)**: On the right side, for accessing context menu options.

## Empty tab state

When you create a new tab or navigate to a tab without any content, Process Intelligence Studio displays an empty state.

:::image type="content" source="media/process-mining-studio-tab-management/empty-tab.png" alt-text="Screenshot of an empty tab state in Process Intelligence Studio.":::

This state includes:

- **Empty tab illustration**: A visual showing a magnifying glass over colorful charts
- **Message**: "Your dashboard is currently empty".
- **Instructions**: "To get started, add a few cards and customize your dashboard layout in edit mode."
- **Edit layout button**: A blue button to enter edit mode.

The empty tab screenshot shows the tab bar at the top with tabs **Overview**, **Case Duration**, **Variant Analysis**, **Top 3 Countries**, and the newly created **High Throughput Time** tab. The new tab is active and empty.

To enter customization mode and begin adding cards to populate your tab, select **Edit layout**. Learn more about adding and arranging cards in [Customize layouts in process intelligence studio (preview)](process-mining-studio-dynamic-layout.md).

## Best practices

- **Name tabs descriptively**: Use clear names that indicate the analytical purpose (for example, *Top 3 Countries*, *High Throughput Time*).
- **Organize by audience**: Create separate tabs for different stakeholders (executives, analysts, operations).
- **Group related metrics**: Keep logically connected visualizations on the same tab.
- **Use duplication**: Start from an existing tab and modify it rather than building from scratch.
- **Order strategically**: Place most frequently accessed tabs on the left for quick access.
