---
title: Simplify cloud flows by offloading complex business logic
description: Learn how to improve the efficiency of your Power Automate flows by offloading complex business logic with alternatives like Dataverse plugins and custom connectors.
#customer intent: As a Power Automate user, I want to offload complex business logic from cloud flows so that I can improve performance and maintainability.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/12/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Simplify cloud flows by offloading complex business logic

Power Automate is an excellent tool for automating daily tasks. However, it isn't the best choice for large-scale data transformation or integration. Embedding complex business logic directly into cloud flows can lead to performance bottlenecks, make them hard to understand, debug, and maintain, and be cumbersome to scale. This article explores ways to help you offload complex business logic from cloud flows.

## Leave complex business logic out

Instead of embedding complex business logic in Power Automate flows, consider the following alternatives:

- **Dataverse add-ins**: For moving or processing a large number of Dataverse records, consider using Microsoft Dataverse add-ins as custom actions.

- **Custom connectors**: Use custom connectors for standalone services, like Microsoft Azure Functions, Azure API Management, and Azure App Service. These connectors handle more sophisticated processing and integrate with custom code, ensuring that the flow remains simple and focused on orchestration rather than on processing.

- **Dataverse and Power Apps**: Handle automation aspects in Power Automate and use Dataverse and Microsoft Power Apps to manage and execute complex business rules. Learn more in [Integrate cloud flows with Power Apps](integrating-cloud-flows-power-apps.md).

- **Dataflows**: When you're working with large-scale data transformations, consider whether the task should be handled as an extract, transform, load (ETL) process. For example, instead of using a cloud flow to read data from a large Excel workbook, format and validate the data, and then write it into Dataverse, use an ETL dataflow. Learn more in [Create and use dataflows in Microsoft Power Platform](/power-query/dataflows/create-use).

## Related content

- [Avoid large numbers of data transformation operations](avoid-anti-patterns.md#avoid-large-numbers-of-data-transformation-operations)
