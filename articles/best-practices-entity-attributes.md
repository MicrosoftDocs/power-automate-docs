---
title: "Best practices for using business process flow entity attributes | MicrosoftDocs"
description: "Learn the best practices for using business process flow entity attributes."
ms.custom: 
ms.date: 04/23/2019
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Business Process Flows
helpviewer_keywords: 
  - flow
  - process flow
  - business process flow
  - process
  - workflow
author: msftman
ms.author: deonhe
manager: kvivek
---

# Best practices in using business process flow attributes



Legacy process-related attributes in entities is deprecated. Here are some best practices for using the *Active Stage* (activestageid) attribute on the business process flow entity. 

## Reporting on the active stage of a business process flow

Let’s say that you’d like to get a view of your sales pipeline by reporting on the active stage that the **Lead to Opportunity Sales Process** is on.

Previously, to report on business processes by stage, one might define a view on each related entity of the business process flow and then report on the *Active Stage* (activestageid) field.

With the deprecation of the *Active Stage*  (activestageid) field on related entities, there are two ways to report on business process flows.

### Option 1: Views and charts on business process flow entity **(Recommended)**

In versions 9.0 and higher, each business process flow creates its own Common Data Service entity, usually with the same name as the business process flow. To report on the business process flow, select the entity for the business process flow you want to report on, and then create views and charts, just as you did before.

In our example, follow these steps to go to the **Lead to Opportunity Sales Process** entity:
1. Go to [https://make.powerapps.com](https://make.powerapps.com).
1. Select the **Data**.
1. Select the **Entities**.
1. Set the filter to **All**.
1. Search for, and then select the **Lead to Opportunity Sales Process** entity.

   ![lead to opportunity sales process entity](media/best-practices-entity-attributes/lead-opportunity-process.png)

Here, you can define views and charts just as you do on any other entity.

![translation process entity details](media/best-practices-entity-attributes/lead-to-opportunity-sales-process-details.png)

An advantage of this approach is that you can use a single view or chart to report on business process flows that span multiple entities.

Further, as the business process flow entity is no different from any other custom entity in Common Data Service, you can add custom fields to the entity to track any additional information you need.

### Option 2: copy active stage to a related entity

Alternatively, to continue reporting off the related entity, create a cloud flow to copy the *Active Stage* (activestageid) field from the business process flow entity into a custom field on the related Dataverse entities.

Here are a few things to keep in mind when you use this approach:

1.  It's possible to have more than one business process flow running on a single entity. With this approach, it's best to have one custom field that stores the active stage for each business process flow that runs on the entity. This approach ensures the integrity of the reporting.

1.  As reporting is driven from the related entity, it's not possible to create a single view that reports on business process flows that span multiple entities.

## Using the active stage to run logic

Here are some cases in which you might want to run logic that's based on the active stage:

### Using the active stage to run client-side logic

As you use the business process, there are many things that you might want to do automatically. For instance:

-   Change the active business process flow based on newly available information on the form or business process flow.

-   Move the active stage to the next or previous stage, based on values the users entered for steps or form fields.

-   Hide or show form tabs and fields based on the selected stage.

-   Show informative messages and run calculations based on the active business process flows, the active or selected stage, or events such as moving the active stage.

> [!TIP]
> For scenarios like these, use the supported set of [client APIs](https://docs.microsoft.com/dynamics365/customer-engagement/developer/clientapi/reference/formcontext-data-process) for business process flows.
>

### Using the active stage to run server-side logic

There might be cases where automation based on the business process flow needs to be done server side. For instance:

-   Send an email to a user if the **Qualify** the stage of the **Opportunity Sales Process** is active for longer than 15 days.

-   Automatically create a set of activities relevant to the active stage of the **Opportunity Sales Process** each time it changes.

-   Automatically finish the **Opportunity Sales Process** when the phone call activity for closing  completes.

> [!TIP]
> Use classic Common Data Service workflows or flows you define on the entity for the business process flow.
> 

To build a classic Common Data Service workflow that creates activities for internal solution reviews and to follow up with the customer in the **Propose** stage of the **Opportunity Sales Process**:

1. Create it on the **Opportunity Sales Process** entity and set it to run each time the **Active Stage** field of the entity changes. 
1. Define a condition to check if the **Active Stage** field equals **Propose**. 
1. Create an appointment and phone call record for the internal review of the solution and the customer call to review the solution respectively.

   ![close stage followup](media/best-practices-entity-attributes/close-stage-followup.png)


[!INCLUDE[footer-include](includes/footer-banner.md)]