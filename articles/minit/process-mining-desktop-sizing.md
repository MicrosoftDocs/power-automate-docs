---
title: Power Automate Process Mining desktop application sizing guide
description: Learn what are the sizing requirements to run Power Automate Process Mining desktop app.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 04/12/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- enduser
---

# Power Automate Process Mining Desktop Client Hardware Requirements

**Power Automate Process Mining (PAPM)** desktop client application enables users to discover, analyze, and improve business processes from event log data. PAPM uses a stateful process mining engine that requires a significant amount of hardware resources, especially RAM memory, disk drive capacity and speed, and CPU cores. This document provides the recommended hardware specifications for running PAPM on different sizes of event log files. The document also explains the factors that affect the performance of PAPM and how to optimize the hardware configuration for the best user experience.

## Hardware Specifications 

The following table summarizes the recommended hardware specifications for running PAPM on different sizes of event log files. These requirements assume minimal impact of other applications on memory consumption and CPU utilization. Otherwise, it is necessary to increase the requirements based on the demands of these applications. The table assumes that the event log files are in CSV format and that they are transformed into Process Model files before loading them into PAPM. The size of the Process Model file is typically 20-30% of the original CSV file. The table covers the minimal requirements and the optimal requirements for each size of event log file. The minimal requirements are the minimum hardware specifications that are needed to run PAPM without encountering errors or timeouts. The optimal requirements are the hardware specifications that are needed to run PAPM with fast and smooth performance. 


|Event log size (CSV) |Process Model file size |Minimal requirements |Optimal requirements | 
|---------|---------|---------|---------|
|0 - 10 GB |0 - 3 GB |RAM: 8 GB,\s\s Disk: HDD (50 GB free),\s\s CPU: 2 cores| RAM: 16 GB, Disk: SSD (100 GB free), CPU: 4 cores |
|10 - 50 GB |3 - 15 GB |RAM: 16 GB, Disk: SSD (100 GB free), CPU: 4 cores |RAM: 32 GB, Disk: NVMe SSD (200 GB free), CPU: 8 cores |
|50 - 100 GB |15 - 30 GB |RAM: 32 GB, Disk: SSD (200 GB free), CPU: 8 cores |RAM: 48 GB, Disk: NVMe SSD (400 GB free) , CPU: 16 cores |
|100 - 150 GB |30 - 45 GB |RAM: 48 GB, Disk: NVMe SSD (400 GB free), CPU: 8 cores |RAM: 64 GB, Disk: NVMe SSD (600 GB free), CPU: 16 cores |

> [!NOTE]
>
> The table above shows the minimal and optimal hardware configuration for running PAPM Desktop App. The minimal configuration is the lowest configuration that can run PAPM without crashing but user might experience delays in the upper volume boundaries. The optimal configuration is the configuration that can run PAPM Desktop App smoothly and efficiently. For the boundary values of the process model size, we suggest choosing a stronger hardware configuration.  

## Performance Factors 

The performance of PAPM depends on several factors, such as the size and complexity of the event log data, the type and number of analyses performed by the user, and the hardware configuration of the machine running PAPM. The following sections explain how each of these factors affects the performance of PAPM and how to optimize them for the best user experience. 

### Data Size and Complexity 

The size and complexity of the event log data have a direct impact on the performance of PAPM. The larger and more complex the data, the more hardware resources are needed to process and analyze them. The size of the data is determined by the number of events, the number of attributes, and the cardinality of the attribute values. The complexity of the data is determined by the number of variants, the number of activities, and the degree of concurrency and loops in the process. The following are some general guidelines to reduce the size and complexity of the data: 

- Filter out irrelevant or redundant events and attributes before transforming the CSV file into SQLite file. 
- Reduce the number of unique values of the attributes by grouping or aggregating them into meaningful categories. 
- Use a suitable mining attribute that captures the main behavior of the process and avoids creating too many variants. 
- Use a suitable time granularity that reflects the temporal dynamics of the process and avoids creating too many events. 

### Amount of analysis and their types 

The type and number of analyses performed by the user also have an impact on the performance of PAPM. The more analyses the user performs, the more hardware resources are needed to compute and display them. The type of analysis determines the amount of data that needs to be accessed and processed, and the level of detail that needs to be shown. The following are some general guidelines to optimize the type and number of analyses: 

- Use filters to focus on the most relevant or interesting cases, activities, or attributes for the analysis. 
- Avoid creating custom metrics that are not relevant for the current analysis. Custom metrics that have already been created can be disabled without the need for deletion. 
- Avoid performing too many analyses at the same time. 

### Hardware Configuration 

The hardware configuration of the machine running PAPM is the most important factor that affects the performance of PAPM. The hardware configuration determines the amount of data that can be loaded into memory, the speed of reading data from disk, and the speed of processing data in parallel. The following are some general guidelines to optimize the hardware configuration: 

- Use a machine with enough RAM to load the data into memory. This will significantly improve the performance of PAPM, as it will avoid the need to stream data from disk, which is much slower. The recommended RAM size for each data size is shown in the table above. 
- Use a machine with a fast disk drive to store and read the data. This will improve the performance of PAPM, especially if the data cannot be loaded into memory. The recommended disk type and speed for each data size is shown in the table above. 
- Use a machine with enough CPU cores to process the data in parallel. This will improve the performance of PAPM, as it will enable PAPM to split the computation into multiple threads and use the full potential of the CPU. The recommended CPU core number for each data size is shown in the table above. 