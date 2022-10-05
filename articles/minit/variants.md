---
title: Variants overview (preview)
description: Learn about the process performance variants in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Variants overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This section deals with process performance variants.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

## What Is a Variant?

A process performance variant is an organized sequence of activities that corresponds to the course of at least one case in the process under analysis. All cases in the process in which the same activities are performed in the same sequence fall under one variant.

The decisive condition for determining the respective variant and the arrangement of events is the** event start** time.

## Variant Mining Attribute

Similar to a process map, which is by default generated using activities but can be switched to a resource viewpoint (similar to a social chart in the process map), the list of variants is generated using the selected mining attribute. In the same way, the variants overview can be generated using different relevant event log attributes (e.g. department, plant, or region). This selection is independent of the selection of mining attributes on the process map.

## Variant Names

Process variants are among the results of process mining and are labeled by a number that is used consistently on all process analysis screens regardless of any applied filters.

## Use of Variants in Process Analysis

By means of process variants, it is possible to accurately explore all possibilities of how a process can develop and identify problematic scenarios (for example a transition variant with an unusually high number of events).

The quantity of variants makes it possible to accurately identify the most frequent scenarios occurring in the process. In this way, we can easily and quickly determine which process scenarios require our attention.

The careful examination of process variants can help us uncover various scenarios and situations that occur in the process. With filtering by variants, the analyzed process can be easily restricted to only those parts or scenarios that are of interest for achieving the final objective of the analysis.

## The Variants Screen

### Variants

On the left side of the screen, there is a list of process variants, which is by default sorted by the count of occurrences of cases under the given variant.

Click the **...** button to sort the list of variants based on different sorting criteria.

:::image type="content" alt-text="media/image006-v53.png" source="media/image006-v53.png":::

Performance and finance sorting criteria also contain a list of available sub-criteria which enable further options for sorting. The option Finance is available only when there is a finance attribute available in the process.

:::image type="content" alt-text="media/image007-v53.png" source="media/image007-v53.png":::

There is always a variant name under the displayed number of variant cases, the second value shows the parameter value used to sort the variants list. In this case, it is *Performance / Maximum duration* as selected in the picture above.

:::image type="content" alt-text="media/image008-v53.png" source="media/image008-v53.png":::

Sorting by Case Count or Event Count always displays a total number of cases for a given variant and the number of events in a single case. By clicking on the arrow icon *up/down* next to the sorting criteria name, the user controls sorting order (ascending or descending).

:::image type="content" alt-text="media/image009-v53.png" source="media/image009-v53.png":::

When you click on a variant, all its cases are displayed on the right side of the screen.

To search for individual cases, enter the name of the case to the search box and click Enter.

:::image type="content" alt-text="media/image001-v53.png" source="media/image001-v53.png":::

## Variant DNA

To get a visual overview of all the process variants found in the current open process view and in order to get a glimpse of process characteristics, variations of the process and better identify differences or repeated patterns, and similarities of variations, a Variant DNA view is available.

To display Variant DNA, make sure that no variant is selected in the list; to achieve this, click the currently selected variant to deselect.

:::image type="content" alt-text="media/image-17.png" source="media/image-17.png":::

To show the Variant detail view, select any of the available variants by clicking on it in the list.

If the activity label is defined in the actual process, control is displayed in the bottom right corner, enabling the user to choose a color scheme by the label. By default, each activity has its own color, but with an activity label, it is possible to display the same color for all activities with the same label. The screenshot below displays the same Variant overview, with color scheme per label – in this case Resource attribute.

## Variant Overview

The overview contains a map of activities on the left, where you can observe the duration of activities and edges of the variant. The statistical indicators of selected variant metrics are present on the right. The graph shows the distribution of cases over time. The blue part represents the overall distribution, the orange part represents the selected variant.

:::image type="content" alt-text="media/variantchart.png" source="media/variantchart.png":::

### Cases

In the center of the screen, there is a list of all cases under the variant sorted by their case ID. Each issue can be explored individually; click a case to see the details of its development on the right.

:::image type="content" alt-text="media/image003-v53-1.png" source="media/image003-v53-1.png":::

### Case and Variant Details

The details of the selected cases are shown on the right side of the screen.

## Cases Table

The development of the case is shown in the table with detailed information about events under the case.

:::image type="content" alt-text="media/image004-8.png" source="media/image004-8.png":::

## Cases Gantt

Cases Gantt displays the development of the case on a timeline. The following information about each case is available:

:::image type="content" alt-text="media/image005-v45-1.png" source="media/image005-v45-1.png":::

1. Start and end time for the case

1. Name of the performed activity

1. Visualization of the duration of the activity on the timeline

1. The **parallel** flag means that the activity runs in parallel with another activity.

1. The parallel conduct of the two activities can be clearly seen on the timeline.

1. Waiting time for another activity after the completion of the current activity

When you click on the black dot within the time progress of the activity, all available information about the activity is shown.


