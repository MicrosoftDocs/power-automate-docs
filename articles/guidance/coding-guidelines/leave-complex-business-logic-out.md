---
title: Simplify cloud flows by offloading complex business logic
description: Improve the efficiency of your Power Automate flows by offloading complex business logic with alternatives like Dataverse plugins and custom connectors.
#customer intent: As a Power Automate user, I want to offload complex business logic from cloud flows so that I can improve performance and maintainability.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Simplify cloud flows by offloading complex business logic

Power Automate is an excellent tool for automating daily tasks. However, it isn't the best choice for large-scale data transformation or integration, especially when processing millions of records.

This article explores alternatives to help you offload complex business logic from cloud flows.

## Challenges to embedding complex logic in cloud flows

Embedding complex business logic directly into cloud flows can lead to several challenges, including:

- **Performance issues**: Intricate logic in flows can cause performance bottlenecks and slow down the automation process.

- **Maintenance difficulties**: Complex logic within flows can make them hard to understand, debug, and maintain, leading to increased time and effort for updates and troubleshooting.

- **Scalability concerns**: As business requirements evolve, scaling flows with embedded complex logic can become cumbersome and error-prone.

## Leave complex business logic out

Consider the following alternatives instead of embedding complex business logic in Power Automate:

- **Dataverse plugins**: For moving or processing a large number of Dataverse records, consider using Dataverse plugins as custom actions. This approach allows you to use low-code actions in Dataverse for Power Fx usage, making the process more efficient and manageable.

- **Custom connectors**: Use custom connectors for standalone services like Azure Functions, API Management, and Azure App Services. These connectors handle more sophisticated processing and integrated with custom code, ensuring that the flow remains simple and focused on orchestration rather than on processing.

- **Dataverse and Power Apps**: Use Microsoft Dataverse and Power Apps to manage and execute complex business rules. Handle automation aspects in Power Automate and keep the logic centralized and easier to manage in Dataverse and Power Apps. Learn more: [Integrating cloud flows with Power Apps](integrating-cloud-flows-power-apps.md).

- **Dataflows**: When working with large-scale data transformations, consider whether the task should be handled as an extract, transform, load (ETL) process. For example, instead of using a Power Automate cloud flow to read data from a large Excel spreadsheet, perform data formatting or validations, and then write the data into Dataverse. In such a scenario, use [Power Platform dataflows](/power-query/dataflows/create-use) or another ETL tool. Learn more: [Avoid performing large amount of data transformation operations](avoid-anti-patterns.md#avoid-large-numbers-of-data-transformation-operations).
