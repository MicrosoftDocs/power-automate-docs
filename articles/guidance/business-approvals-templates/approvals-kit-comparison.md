---
title: Approvals Kit Comparison | Microsoft Docs
description: Approvals Kit Comparison.
documentationcenter: na
author: Grant-Archibald-MS
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

This table provides a comparison between the Approvals Connector action and the Approvals Kit. It highlights the core use case, core product features, triggers, premium connectors, and other requirements for each option. This information can help users determine which option is best suited for their specific needs and requirements.

|                    |[Approvals Connector](/connectors/approvals/)|Approvals Kit|
|--------------------|-------------------|-------------|
|Core use case       |Simple approvals without need for advance approval features|No code workflow designer with extra features|
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

## Flow Comparison

The table summarizes different approaches to construct approval processes using the Power Platform. The options range from using out-of-the-box copilot features and interactive designers to creating custom solutions with Business Process Flows or using the Approvals Kit - Business Process, which provides no-code templates and patterns for business users to define and trigger approval workflows with advanced features.

|Approach|Notes|
|--------|-----|
|Cloud Flow|Makers can use the out of the box copilot features or interactive designer to create triggers add actions and include the [Approval actions](/power-automate/get-started-approvals) to build an approval decision making work flows|
|[Business Process Flows](/power-automate/business-process-flows-overview)|Provide a streamlined user experience that leads people through the processes their organization has defined for interactions that need to be advanced to a conclusion of some kind. This can be included in a custom solution to include approvals. An example of this is demonstrated in the [Using Business Process Flows in a Canvas App](https://powerapps.microsoft.com/blog/using-business-process-flows-in-a-canvas-app/)|
|Approvals Kit - Business Process|Provides a ready made process with a no code templates and patterns that business users can use to define to trigger and approval workflow with advanced features listed in the feature comparison. This approach combines pre-made Power Apps, Power Automate and Dataverse components to offer a node code Process Designer to manage and monitor approvals|
