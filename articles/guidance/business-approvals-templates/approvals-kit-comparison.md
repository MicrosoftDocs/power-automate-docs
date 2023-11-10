---
title: Business Approvals Templates Approvals kit comparison
description: Learn the differences between the Business Approvals Templates Approvals kit and the Power Platform Approvals connector.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Business Approvals Templates Approvals kit comparison

When navigating the landscape of approval workflows, it's important to understand the differences between the Power Platform Approvals connector and the Approvals kit. The Approvals kit is a low-code innovative enhancement that seamlessly integrates the Approvals connector with a user-friendly, no-code configurable Power Platform solution components.

The Approvals kit enhances the Approvals connector significantly, offering a range of features that can help you manage complex approval processes efficiently. Use the Approvals kit to:

- Configure multi-stage approvals
- Delegate decision-making authority
- Monitor approval progress
- Handle employee absences
- Accommodate various approval process versions
- Publish versioned workflows
- Account for workdays and public holidays

Whether you're a seasoned workflow expert or just getting started, the Approvals kit serves as a valuable resource to streamline your approval processes effectively.

## Feature comparison

This table provides a comparison between the Approvals Connector action and the Approvals kit. It highlights the core use case, core product features, triggers, premium connectors, and other requirements for each option. This information helps users determine which option is best suited for their specific needs and requirements.

|Feature |[Approvals Connector](/connectors/approvals/)|Approvals Kit|
|--------------------|-------------------|-------------|
|Core use case       |Simple approvals without need for advance approval features|No-code workflow designer with extra features|
|Core Product Feature|Yes                |No (requires install)|
|Trigger via Power Automate|Yes          |Yes|
|Requires Azure Application Registration|No|Yes|
|Premium Connector(s)   |No                 |Yes (requires Dataverse and custom connector)|
|Requires Dataverse  |No                 |Yes|
|Requires Power App License|No           |Yes, to build and manage approvals workflows|
|Multi stage approvals|Not by default. Requires multiple cloud flows or other custom implementation|Yes|
|Delegated approvers  |Not by default. Requires custom implementation|Yes|
|Design / Authoring   |Copilot and Power Automate Designer|No-code Power App Process Designer|
|Versioning           |Cloud flow versions|Dataverse-based workflow stages and data versions|
|Workdays / Holidays  |Not by default, requires custom implementation|Yes|

## Flow comparison

This table summarizes different approaches to construct approval processes using the Power Platform. The options range from using out-of-the-box copilot features and interactive designers to creating custom solutions with Business Process flows. Compared to the Approvals kit - Business Process, which provides no-code templates and patterns for business users to define and trigger approval workflows with advanced features.

|Approach|Notes|
|--------|-----|
|Cloud Flow|Makers can use the out of the box Copilot features or the interactive designer to create triggers add actions and include the [Approval actions](/power-automate/get-started-approvals) to build an approval decision making work flows|
|[Business process flows](/power-automate/business-process-flows-overview)|Provide a streamlined user experience that leads people through the processes their organization defines for interactions that need to be advanced to a conclusion of some kind. Business process flows can be included in a custom solution to include approvals. An example is demonstrated in [Business process flows overview](/power-automate/business-process-flows-overview)|
|Approvals Kit - Business Process|Provides a ready made process with a no-code templates and patterns that business users can use to define to trigger and approval workflow with advanced features listed in the feature comparison. The kit combines premade Power Apps, Power Automate and Dataverse components to offer a no-code Process Designer to manage and monitor approvals|
