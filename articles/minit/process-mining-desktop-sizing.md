---
title: Power Automate Process Mining desktop client hardware requirements
description: Learn about the sizing requirements to run Power Automate Process Mining desktop app.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 05/24/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- enduser
---

# Power Automate Process Mining desktop client hardware requirements

**Power Automate Process Mining** desktop client application enables users to discover, analyze, and improve business processes from event log data. Power Automate Process Mining uses a stateful process mining engine that requires a significant amount of hardware resources, especially RAM memory, disk drive capacity and speed, and CPU cores. This document provides the recommended hardware specifications for running Power Automate Process Mining on different sizes of event log files. The document also explains the factors that affect the performance of Power Automate Process Mining and how to optimize the hardware configuration for the best user experience.

## Hardware specifications

The following table summarizes the recommended hardware specifications for running Power Automate Process Mining on different sizes of event log files. These requirements assume minimal impact of other applications on memory consumption and CPU utilization. Otherwise, it's necessary to increase the requirements based on the demands of these applications. The table assumes that the event log files are in CSV format and that they're transformed into Process Model files before loading them into Power Automate Process Mining. The size of the Process Model file is typically 20-30% of the original CSV file. The table covers the minimal requirements and the optimal requirements for each size of event log file. The minimal requirements are the minimum hardware specifications that are needed to run Power Automate Process Mining without encountering errors or timeouts. The optimal requirements are the hardware specifications that are needed to run Power Automate Process Mining with fast and smooth performance.

|Event log size (CSV) |Process Model file size |Minimal requirements |Optimal requirements |
|---------|---------|---------|---------|
|0 - 10 GB |0 - 3 GB |<li>RAM: 8 GB</li><li>Disk: HDD (50 GB free)</li><li>CPU: 2 cores</li>|<li>RAM: 16 GB</li><li>Disk: SSD (100 GB free)</li><li>CPU: 4 cores</li>|
|10 - 50 GB |3 - 15 GB |<li>RAM: 16 GB</li><li>Disk: SSD (100 GB free)</li><li>CPU: 4 cores</li>|<li>RAM: 32 GB</li><li>Disk: NVMe SSD (200 GB free)</li><li>CPU: 8 cores</li>|
|50 - 100 GB |15 - 30 GB |<li>RAM: 32 GB</li><li>Disk: SSD (200 GB free)</li><li>CPU: 8 cores</li>|<li>RAM: 48 GB</li><li>Disk: NVMe SSD (400 GB free)</li><li>CPU: 16 cores</li>|
|100 - 150 GB |30 - 45 GB |<li>RAM: 48 GB</li><li>Disk: NVMe SSD (400 GB free)</li><li>CPU: 8 cores</li>|<li>RAM: 64 GB</li><li>Disk: NVMe SSD (600 GB free)</li><li>CPU: 16 cores</li>|

> [!NOTE]
>
> The previous table shows the minimal and optimal hardware configuration for running Process Mining desktop app. The minimal configuration is the lowest configuration that can run Power Automate Process Mining without crashing but user might experience delays in the upper volume boundaries. The optimal configuration is the configuration that can run Process Mining desktop app smoothly and efficiently. For the boundary values of the process model size, we suggest choosing a stronger hardware configuration.  

## Performance factors

The performance of Power Automate Process Mining depends on several factors, such as the size and complexity of the event log data, the type and number of analyses performed by the user, and the hardware configuration of the machine running Power Automate Process Mining. The following sections explain how each of these factors affects the performance of Power Automate Process Mining and how to optimize them for the best user experience.

### Data size and complexity

The size and complexity of the event log data have a direct impact on the performance of Power Automate Process Mining. The larger and more complex the data, the more hardware resources are needed to process and analyze them. The size of the data is determined by the number of events, the number of attributes, and the cardinality of the attribute values. The complexity of the data is determined by the number of variants, the number of activities, and the degree of concurrency and loops in the process. The following are some general guidelines to reduce the size and complexity of the data:

- Filter out irrelevant or redundant events and attributes before data ingestion. 
- Reduce the number of unique values of the attributes by grouping or aggregating them into meaningful categories.
- Use a suitable mining attribute that captures the main behavior of the process and avoids creating too many variants.
- Use a suitable time granularity that reflects the temporal dynamics of the process and avoids creating too many events.

### Amount of analysis and their types

The type and number of analyses performed by the user also have an impact on the performance of Power Automate Process Mining. The more analyses the user performs, the more hardware resources are needed to compute and display them. The type of analysis determines the amount of data that needs to be accessed and processed, and the level of detail that needs to be shown. The following are some general guidelines to optimize the type and number of analyses:

- Use filters to focus on the most relevant or interesting cases, activities, or attributes for the analysis.
- Avoid creating custom metrics that aren't relevant for the current analysis. Custom metrics that are already created can be disabled without the need for deletion.
- Avoid performing too many analyses at the same time.

### Hardware configuration

The hardware configuration of the machine running Power Automate Process Mining is the most important factor that affects the performance of Power Automate Process Mining. The hardware configuration determines the amount of data that can be loaded into memory, the speed of reading data from disk, and the speed of processing data in parallel. The following are some general guidelines to optimize the hardware configuration:

- To load the data into memory, use a machine with enough RAM. This amount significantly improves the performance of Power Automate Process Mining, as it avoids the need to stream data from disk, which is slower. The recommended RAM size for each data size is shown in the previous table.
- To store and read the data, use a machine with a fast disk drive. This usage improves the performance of Power Automate Process Mining, especially if the data can't be loaded into memory. The recommended disk type and speed for each data size are shown in the previous table.
- To process the data in parallel, use a machine with enough CPU cores. This usage improves the performance of Power Automate Process Mining, as it enables Power Automate Process Mining to split the computation into multiple threads and use the full potential of the CPU. The recommended CPU core number for each data size is shown in the previous table.
