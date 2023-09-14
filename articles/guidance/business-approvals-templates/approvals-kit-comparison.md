---
title: Approvals Kit Comparison | Microsoft Docs
description: Approvals Kit Comparison.
documentationcenter: na
author: author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Approvals Kit Comparison

When navigating the landscape of approval workflows, it's important to understand the differences between the Power Platform Approvals connector and the Approvals Kit. The Approvals kit is a low code innovative enhancement that seamlessly integrates the Approvals connector with a user-friendly, no-code configurable power platform solution components.

The Approvals Kit takes the solid foundation of the Approvals connector and enhances it significantly. It offers a range of features that can help you manage complex approval processes efficiently. These capabilities provide features like:

- Configuring multi-stage approvals
- Delegating decision-making authority
- Monitoring approval progress
- Handling employee absence
- Accommodating various approval process versions
- Publishing versioned workflows
- Accounting for workdays and public holidays

Whether you're a seasoned workflow expert or just getting started, the Approvals Kit serves as a valuable resource to streamline your approval processes effectively.

## Feature Comparison

|                    |[Approvals Connector](/connectors/approvals/)|Approvals Kit|
|--------------------|-------------------|-------------|
|Core use case       |Simple approvals without need for advance approval features|No code workflow designer with advanced features|
|Core Product Feature|Yes                |No, requires install|
|Trigger via Power Automate|Yes          |Yes|
|Requires Azure Application Registration|No|Yes|
|Premium Connector(s)   |No                 |Yes, requires Dataverse and Custom connector|
|Requires Dataverse  |No                 |Yes|
|Requires Power App License|No           |Yes, to build and manage Approvals workflows|
|Multi stage approvals|Not by default, requires multiple Cloud Flows or other custom implementation|Yes|
|Delegated approvers  |Not by default, requires custom implementation|Yes|
|Design / Authoring   |Copilot and Power Automate Designer|No code Power App Process Designer|
|Versioning           |Cloud flow versions|Dataverse based workflow stages and data versions|
|Workdays / Holidays  |Not by default, requires custom implementation|Yes|
