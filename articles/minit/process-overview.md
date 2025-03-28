---
title: Process Overview (preview)
description: Descprtion of Process Overview for imported process in Power Automate Process Mining.
author: janpidych
contributors:
  - janpidych
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 03/28/2025
ms.author: janpidych
ms.reviewer: angieandrews
ms.custom: bap-template
ms.collection: bap-ai-copilot
search.audienceType:
- enduser
---

# Process overview (preview)

After you import process data the Process overview tab is displayed. Tab contains metrics and visuals to gain insights from process analysis.

 :::image type="content" source="media/process-overview.png" alt-text="Screenshot of the 'Process Overview' tab.":::


## Components

Tab displayes process map, KPIs and charts related to variants, activities and edges(paths between two activities).

### Process map

The process map empowers you to visualize and gain insights from processes. Activities describe tasks or actions, the sequence of which makes up a business process. By looking at a graphical representation of how your business processes are performed, you can glean insights about where opportunities exist.

Process map offer visualization of different metrics grouped into 3 layers or context types - Performance, Freqeuncy and Rework. It is possible to selected the same or different metrics for nodes (activities) and paths (edges). To automatically set complexity of diplayed map user can turn on autoslider settings (set on by default). It automatically displayes only most relevant (frequent) process map elements. When autoslider setting is turned off, user can manually set sliders for activities and paths to control how many activities or paths are displayed).

To learn more about process map visual go to [(Process map overview)](process-map.md).

### KPIs

Process Overview contains 4 tiles to display global KPIs for imported process. In each tile you are select one of process KPIs. These are grouped into 3 categories.

Process:
- Event count - event count in actual process view.
- Total Event count - event count in actual process.
- Case Count - case count in actual process view.
- Total Case count - case caount in actual process.
- Activties -  count of activities in actual process view.
- Resources - count of resources in actual process view.
- Variants count - count of variants in actual process view.

Duration:
- Median case duration - median case duration for cases in actual view
- Average case duration - mean case duration for cases in actual view
- Average active time - mean active case for cases in actual view
- Average waiting time - mean waiting time for cases in actual view
- Average utilization - mean case utilization for cases in actial view

Type: 
- Start - start of the process, defined by timestamp of the earliest event in the process.
- End - end of the process, defined by timestamp of the latest event in the process.
- Relative case rework count - ratio of process cases which contains rework. Rework is any repeated activity.
- Relative case self-loop count - ratio of process cases with self-loop. Self-loop is a specific repetition where an activity is directly followed by the same activity.
- Relative case loop count - ratio of process cases with loops. Loop represents repetition where activity is not directly followed by the same activity (at least one another activity is between them).

### Charts

Charts components visualize the following KPIs:

- Top 10 variants - case count distribution for top 10 variants.
- Top 5 edges - total counts for 5 most frequent edges in the process.
- Top 10 activities - displays mean duration and case count for top 10 most frequent activities.

### Filter pane

The topmost part of Process overview tab contains filter pane. There are four filters in total for filtering:

- View - selects the process view. Process always contains at least one view.
- Date & time - filter view data based on event's time.
- Variant - filter data based on view variants
- Attribute filter - filter data based on attribute values. It is possible to filter data using any process attribute.

## Embeded PowerBI tabs

As part of process import PowerBI report is also generated with the process insights. This report is accessible through tabs next to Process Ovierview. Generation of PowerBI report represnts the last step, so it is usaully available later then Process overview tab.

:::image type="content" source="media/process-overview-pbi.png" alt-text="Screenshot of the default PowerBI tab embeded in process page.":::

To learn more, go to [Visualize and gain insights from PowerBI report](..\process-mining.visualize.md).


