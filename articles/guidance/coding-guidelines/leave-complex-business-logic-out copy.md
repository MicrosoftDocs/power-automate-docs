---
title: Leave complex business logic out
description: Learn how leave complex business logic out
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

# Leave complex business logic out

Many times we see use cases where millions of records are required to process via flows. In general while flows can be used to automate day to day jobs, for large scale data transformation or integration, Power Automate might not be the right tool. Here are some recommendations.

If the requirement is to move or process large number of Dataverse records, consider using Dataverse plugins as custom actions. Using plug-ins as custom actions enables users to use low-code actions in Dataverse for Power Fx usage.

Refer to this [section](#PAutoComplexIntegration) to learn more about when to integrate flows with other solutions to reduce complexity.

Additionally, use custom connectors for standalone services like Azure Functions, API Management, Azure App services or use custom connectors with custom code.