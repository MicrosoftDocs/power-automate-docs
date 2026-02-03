# Process Intelligence Studio

## Overview

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Process Intelligence Studio is the next-generation interface for process analysis in Power Automate Process Mining. It replaces and enhances the previous Process Overview by providing a fully customizable, tab-based dashboard that enables you to visualize, analyze, and monitor your business processes through interactive cards and visualizations.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

![Process Intelligence Studio Main Interface](media/process-mining-studio/pi-studio-main.png)

As shown in the screenshot above, Process Intelligence Studio provides a comprehensive analytical workspace with multiple components working together to deliver powerful process insights.

## What is Process Intelligence Studio?

Process Intelligence Studio transforms how you interact with process mining data by offering:

- A flexible, card-based dashboard system that adapts to your analysis needs
- Multiple tabs for organizing different analytical perspectives
- Dynamic filtering capabilities that apply across all visualizations
- Real-time data refresh to ensure you're working with current information
- Customizable layouts where you can arrange, resize, and configure cards

Unlike the previous Process Overview, Process Intelligence Studio gives you complete control over what you see and how you see it, enabling you to create personalized analytical workspaces for different stakeholders and use cases.

## Key Components of the Interface

The main interface (visible in pi-studio-main.png) consists of several key areas:

### Tab Bar

Located at the top of the interface, the tab bar organizes your analytical views:
- Multiple tabs such as "Overview", "Case Duration", "Variant Analysis", and "Top 3 Countries"
- Each tab can display a different set of cards and visualizations
- A "+" button on the right allows you to create additional tabs
- "Edit tabs" button in the top-right corner provides tab management capabilities

### Filter Bar

Positioned below the tab bar, the filter bar enables data refinement:
- Active filters displayed as removable pills (e.g., "SupplierState: Falkland Isl...", "Variant: 55, Variant 15...")
- Each filter pill includes an X button for quick removal
- "Add Filters" button to apply additional filtering criteria
- Filters apply to all cards and visualizations on the current tab

### Dashboard Area

The main canvas displays multiple cards arranged in a grid layout:

**Left Column - KPI Cards:**
- Cases: 5 / 5330
- Events: 119 / 66074
- AVG Throughput Time: 28d 13:21:32
- MED Throughput Time: 26d 06:17:04
- Rework Cases: 100.00%
- Resources Involved: 19

**Center Column - Analytical Cards:**
- Countries bar chart showing "Falkland Islands" data
- Variants horizontal bar chart displaying process variants with execution counts
- Rework Distribution by Resource donut chart with a value of 83
- Activity by Rework combination chart showing main duration and rework cases

**Right Column - Process Map:**
- Visual flow diagram showing the complete process structure
- Circular nodes representing activities
- Connecting lines showing process paths and transitions
- Interactive visualization for exploring process flows

### Control Bar

The top-right section provides key controls:
- "Last updated November 4 at 12:08 AM" timestamp
- "Refresh data" button to update with latest process data
- "Edit tabs" button for tab management
- "Edit layout" button to enter customization mode

## How It Enhances Process Analysis

Process Intelligence Studio improves upon the traditional Process Overview by:

1. **Flexibility**: Create multiple tabs with different card configurations instead of a single fixed view
2. **Personalization**: Arrange and size cards to match your specific analysis workflow
3. **Organization**: Group related metrics and visualizations together logically
4. **Efficiency**: Switch between pre-configured analytical perspectives instantly
5. **Collaboration**: Share specific tabs or entire dashboard configurations with team members

## Getting Started

To begin using Process Intelligence Studio:

1. Navigate to your process in Power Automate Process Mining
2. Select the "Process Intelligence Studio" view
3. Explore the default tabs and cards provided
4. Use "Edit layout" to customize card arrangements
5. Create new tabs for specific analytical scenarios
6. Apply filters to focus on particular process segments

For detailed information on specific features, see:
- [Tab Management](process-mining-studio-tab-management.md) - Creating and organizing tabs
- [Dynamic Layouting](process-mining-studio-dynamic-layouting.md) - Customizing card layouts
- [Filtering Overview](process-mining-studio-filtering-overview.md) - Applying and managing filters
