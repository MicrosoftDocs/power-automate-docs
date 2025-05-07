---
title: Business approvals templates approvals kit comparison
description: Learn the differences between the business approvals templates approvals kit and the Power Platform approvals connector.
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: concept-article
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Business approvals templates approvals kit comparison

This document outlines the differences between the business approvals templates approvals kit and the Power Platform approvals connector. The approvals kit is a low-code innovative enhancement that seamlessly integrates the approvals connector with a user-friendly, no-code configurable Power Platform solution components.

The approvals kit enhances the approvals connector significantly, offering a range of features to help manage complex approval processes efficiently. Use the Approvals kit to:

- Configure multi-stage approvals
- Delegate decision-making authority
- Monitor approval progress
- Handle employee absences
- Accommodate various approval process versions
- Publish versioned workflows
- Account for workdays and public holidays

Whether you're a seasoned workflow expert or just getting started, the approvals kit serves as a valuable resource to streamline your approval processes effectively.

## Feature comparison

This table provides a comparison between the approvals connector action and the approvals kit. It highlights the core use case, core product features, triggers, premium connectors, and other requirements for each option. Use this information to determine which option is best suited for your specific needs and requirements.

|Feature |Approvals Connector|Approvals Kit|
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

This table summarizes different approaches to construct approval processes using the Power Platform. The options range from using out-of-the-box copilot features and interactive designers to custom solutions creations with business process flows.

|Approach|Notes|
|--------|-----|
|Cloud Flow|Makers can use the out of the box Copilot features or the interactive designer to create triggers add actions and include the [approval actions](/power-automate/get-started-approvals) to build an approval decision making work flows|
|Business process flows|Provide a streamlined user experience that leads people through the processes their organization defines for interactions that need to be advanced to a conclusion. Modify business process flows in a custom solution to include approvals.<br /> More information: [Business process flows overview](/power-automate/business-process-flows-overview)|
|Approvals Kit - Business Process|Provides a ready made process with a no-code templates and patterns that business users can use to define to trigger and approval workflow with advanced features listed in the feature comparison. The kit combines premade Power Apps, Power Automate and Dataverse components to offer a no-code Process Designer to manage and monitor approvals.|
