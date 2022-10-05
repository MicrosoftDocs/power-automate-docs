---
title: Minit desktop application overview (preview)
description: Get an overview of minit desktop application for process advisor.
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

# Minit desktop application overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With minit desktop application for process advisor, you can easily delve into process details. There are many ways you can break down your process cycles into smaller pieces for analysis. It can be a key driver in making intelligent, day-today improvements on every level. Discover and model processes for which you have data readily available, giving you an X-ray visualization of what goes on in your organization.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

With the minit desktop application, you can understand where and why problem occurs and can identify points of inefficiencies. You can also standardize, optimize and improve operations, while staying informed about progress towards defined key process indicators.

:::image type="content" alt-text="Screenshot of the minit desktop application." source="media/image-24.png":::

## Features

Minit desktop application is a bridge between raw data and your organization&mdash;access and analyze process data from a process created in process advisor. Get deep insights into how your processes run, uncover root cause of problems, and build useful outputs for the rest of your organization using the following minit features:


|Feature  |Description |
|---------|---------|
|Process map   | A process map represents the behavior of a process captured in data by means of activities and directed edges. The displayed process map always corresponds with the mining result of the process, reflects filter settings above the data, and chosen frequency or time metrics. When filters are applied, mining is performed again, metrics are recalculated, and a new process map is generated.        |
|Statistics    | This functionality provides a brief and easy-to-understand overview of the properties of the process undergoing analysis and contains the information about the process through summary charts and statistics.        |
|Variant DNA    | To get a visual overview of all the process variants found in the current open process view and in order to get a glimpse of process characteristics, variations of the process and better identify differences or repeated patterns, and similarities of variations, a Variant DNA view is available. |
|Process compare    | Comparison of the processes allows an intuitive and efficient comparison of processes. You can compare the processes at the level of the process map, where the generated visualization allows you to identify the differences in the flow and frequency or time metrics. By using the Detail panel, you can also compare in detail values of metrics and attributes at the level of activities and edges. |
|Root cause analysis     | Have you ever wondered why some cases take longer time to complete than other? Or why some cases get stuck in reworks and others go smoothly through the process? Root Cause analysis (RCA) will show you what the key differences are between such cases. |
|Filtering     | A filter is a very convenient tool in a process analysis as we can use it to focus only on certain parts of the process in analysis. For example, it can be used to define only a certain time period, only specific resources or scenarios in the process, or modify cases by excluding activities that are not important for the current analytical problem. It can also be helpful in identifying and focusing on the problematic parts of the process.        |
|Custom metrics     | The custom metrics (calculated metrics) module allows you to use pre-defined metrics in the application, different aggregations, mathematical, datetime, string and other operations and functions and constants in a formula editor to define your own custom metrics. It is then possible to visualize them for example in the process map or according to their context in other parts of the application in a similar way as the static ones.        |
|Business rules     | The business rules module allows you to define and evaluate KPIs based on given thresholds and limits. Each defined threshold contains also a category flag&mdash;error, warning, or OK&mdash;for a quick visualization of the resulted value. Except for thresholds definitions, each business rule can have its own calculation formula and/or set of its own filters, which are applied over the data set in the actual view. Business rules are defined in the process context of the current process, therefore are available in any view for the given process. In application, business rules are displayed in Process Map and Statistics. |
