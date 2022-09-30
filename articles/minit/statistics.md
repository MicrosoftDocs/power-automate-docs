---
title: Statistics
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Statistics

This section provides a brief and easy-to-understand overview of the properties of the process undergoing analysis and contains the information about the process through summary charts and statistics. Statistics are shown in the upper part, the bottom part contains the listings of specific records displayed in the statistics.

**The displayed statistics always reflect the data after filters, if any, have been applied.**

#### Detailed table information

This section contains a summary header and table with a detailed list of cases, activities, or other attribute values.

:::image type="content" alt-text="media/image-32.png" source="media/image-32.png":::

The following types of statistics are available:

- Case overview - statistics per single cases with case level metrics – a detailed description is in the relevant [sub-page](case-overview-statistics.md).

- Activity statistics - the statistic refers to activities and display their various event level properties - see [sub-page](activities-event-level-statistics.md).

- Edge statististcs - the statistic refers to process paths (edges) metrics - see [sub-page](edge-statistics.md).

- Cases duration influence - analytical insight that evaluates the influence of case-level attributes (including financial) on the mean case duration, for more details scroll below on this page.

- Business rules - the statistic refers to overview of defined business rules. More details can be found on [Business rules](business-rules.md) page.

### Statistics for other attributes

Attributes imported with the process marked as Others and Source have the same statistical summary as the statistics for the activity.

### Exporting statistics

The displayed statistics chart can be exported as a PNG image. The table of specific records shown in the statistics can be exported to CSV format. In the cases overview, you can click the button to go to the export screen with the pre-selected cases export.

### Sample uses of statistics

By means of statistics, issues in the process can be identified quickly – a few examples are given below.

#### Average resource activity time

The picture shows the average activity time of resources, and at first glance, it is apparent that some resources need much longer time to complete their activities than others.

:::image type="content" alt-text="media/image-33.png" source="media/image-33.png":::

#### Cases duration

The picture shows the number of cases with varying duration intervals. If it is evident from the chart that there are rare cases in the data that distort the average values, such cases require attention or possibly should be excluded from process analysis as non-standard.

:::image type="content" alt-text="media/image-31.png" source="media/image-31.png":::

### Events filter for process attributes

You can use the quick filter as part of the statistics for the attributes. The filter allows you to filter out the statistics of process attributes based on selected values or a set of values of the selected attribute. To activate the filter, click the **Checkmark** button next to the attribute name.

:::image type="content" alt-text="media/image-34.png" source="media/image-34.png":::

### Filtering in statistics charts

You can filter selected values in the summary charts in the statistics of process instances and in the statistics of attributes by selecting each column. When you make a selection, the filter screen will automatically appear with the default values of the filter.

### Sorting in the Statistics grid

You can sort the statistics grid by clicking the header of any column. This will change ascending and descending sorting order (visually represented by the small arrow next to the column header):

:::image type="content" alt-text="media/image007-4.png" source="media/image007-4.png":::

### Case duration influence

Case duration influence is a complex analytical insight that automatically evaluates the influence of case-level attributes (including financial) on the mean case duration. Minit takes all case-level attribute values and based on the mean duration of the cases having the specific case-level attribute value weighted by the volume of cases having this value calculates the percental influence of cases having this value on the overall mean case duration.

:::image type="content" alt-text="media/image-35.png" source="media/image-35.png":::

In other words, as seen in the screenshot, if the Article is Software Licenses, the mean duration is longer than for article Hardware, but the influence on the overall case duration is not so strong as the case frequency is much smaller for Software Licenses than it is for Hardware.

A positive percentage number (in RED) means, that the corresponding attribute value is slowing the process. A negative percentage number (in GREEN) is, on the other hand, making the process faster and its influence on the mean duration is represented by the percentage value.

To access the Case duration influence, select Case duration influence statistics from the selection control in the top left corner.




