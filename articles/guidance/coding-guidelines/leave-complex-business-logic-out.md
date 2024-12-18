---
title: Leave complex business logic out
description: Learn how to offload complex business logic
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Simplify cloud flows by offloading complex business logic

Power Automate is an excellent tool for automating daily tasks, but it might not be the best choice for large-scale data transformation or integration, especially when processing millions of records. Embedding complex business logic directly into cloud flows can lead to several challenges:

1. **Performance Issues**: Flows with intricate logic can suffer from performance bottlenecks, slowing down the entire automation process.
1. **Maintenance Difficulties**: Complex logic within flows can make them hard to understand, debug, and maintain, leading to increased time and effort for updates and troubleshooting.
3. **Scalability Concerns**: As business requirements evolve, scaling flows with embedded complex logic can become cumbersome and error-prone.

## Alternatives to embedding complex logic in Power Automate

Consider the following alternatives instead of embedding complex business logic in Power Automate: 

1. **Dataverse Plugins**: For moving or processing a large number of Dataverse records, consider using Dataverse plugins as custom actions. This approach allows you to use low-code actions in Dataverse for Power Fx usage, making the process more efficient and manageable.

1. **Custom Connectors**: Use custom connectors for standalone services like Azure Functions, API Management, and Azure App Services. These connectors can handle more sophisticated processing and can be integrated with custom code, ensuring that the flow remains simple and focused on orchestration rather than processing.

1. **Dataverse and Power Apps**: Utilize Microsoft Dataverse and Power Apps to manage and execute complex business rules. Handle automation aspects in Power Automate and keep the logic centralized and easier to manage in Dataverse and Power Apps. Learn more: [Integrate cloud flows with Power Apps](integrating-cloud-flows-with-power-apps.md)

1. **Dataflows**: When working with large-scale data transformations, consider whether the task should be handled as an Extract-Transform-Load (ETL) process. For example, instead of using a Power Automate cloud flow to read data from a large Excel spreadsheet, perform data formatting or validations, and then write the data into Dataverse, considering using [Power Platform Dataflows](/power-query/dataflows/create-use) or another ETL tool. Learn more: [Avoid performing large amount of data transformation operations](avoid-anti-patterns.md#avoid-performing-large-amount-of-data-transformation-operations)
