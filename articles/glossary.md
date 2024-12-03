---
title: Power Automate Glossary | Microsoft Docs
description: Glossary of terms used in Power Automate
services: ''
suite: flow
documentationcenter: na
author: donums
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/20/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate Glossary

The following terms are commonly used in Power Automate.

## A

**Action:** An action is the task that's started when a trigger is invoked. Flows can have one or many actions, depending on what's needed to complete a particular flow. With actions, you can perform operations such as **Create**, **Update**, **Delete**, or **Assign**.

 [Add an action](multi-step-logic-flow.md)

**Action items**: The **Action items** screen shows the status of approvals and business process flows. Action items is located on the left navigation pane in Power Automate.

**Approvals (approval requests):** Approvals refer to the actions in approving a cloud flow. It might be a basic approve or reject action. It could be a custom approval flow where the sender can request any sign off, including multiple choice. To create an approval workflow, add an approval action. After you add this action, your flow can manage the approval of documents or processes

 [Introducing the Unified Action Center](https://make.powerautomate.com/blog/introducing-the-unified-action-center/)

**Automated flow:** Automated flows are triggered by a predetermined event. Automated flows run when an event triggers the flow to run. For example: when a row is created, deleted, or updated in Dataverse, the flow will run if that is the trigger you chose.

 [Create a cloud flow in Power Automate](get-started-logic-flow.md)

## B

**Business process flow**: A business process flow ensures that everyone in your company follows the same process.  You'll define a set of steps for people to follow. For example, you might want to create a business process flow so everyone handles customer service requests the same way.  You might require people get approval for an invoice before submitting an order.

 [Business process flows overview](business-process-flows-overview.md)

## C

**Conditions:** Conditions tell flow to perform actions based on predetermined logic set in the flow. If certain conditions are true, then one or more tasks will be completed. For example, users can create conditions that specify that you'll get an email when a tweet that contains a keyword is retweeted at least 10 times.

 [Add a condition to a cloud flow](add-condition.md)

**Connectors:** Connectors allow users to connect popular services (such as Twitter, Outlook, Gmail, and more) to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. They contain a set of pre-built triggers ("when a new email arrives"…) and actions ("upload email attachment to SharePoint and My App") to be used in apps and workflows.

 [Connectors documentation](/connectors/)

**Custom connectors:** Custom connecters allow users to connect a web service to Power Automate. Users teach Power Automate about the characteristics of the web service which include authentication, the triggers and actions that it supports, and the parameters and outputs for each of those actions. Custom connectors must be registered before they can be shared with your organization.

[Start to build with Power Automate](get-started-flow-dev.md)

## D

**Data loss prevention**: Data loss prevention provides you with the ability to create and enforce policies that define which connectors can access and share business data. This is a key feature to help ensure that your business data is protected.

 [Data loss prevention policies](prevent-data-loss.md)

## F

**Flow checker:** Flow checker is a diagnostic tool that points to specific occurrences within the flow where improvements may be required to run a cloud flow. For each identified issue, the flow checker appears in the designer's command bar. It will show a red dot when one or more errors are identified in your flow.

 [Find and fix errors with Flow Checker](error-checker.md)

**Flow types:** Automated, instant, scheduled, UI flows and business process flow.

 [Get started with Power Automate](getting-started.md)

**Flow designer:** The flow designer is the studio where makers create flows from blank or start from a template (that they can customize or add steps to).

## I

**Instant flow:** Instant flow allows users to trigger repetitive tasks from the mobile or desktop app manually. For example, by selecting a button on a mobile app, it will send a reminder email to your team before a meeting.

 [Run instant flows](./mobile/manage-cloud-flows.md)

**Item:** As a Power Automate trigger, an item represents a row in a Microsoft SharePoint list. What it actually is depends on the user's list. For example, it can be a row in Microsoft Excel, or a table in a Microsoft Word document.

## M

**Microsoft Dataverse:** A cloud-scale database used to store data for business applications such as Power Automate and Power Apps. It's an abstraction on top of underlying Azure cloud data management services to make it easier to build business applications.

 [What is Microsoft Dataverse?](/powerapps/maker/common-data-service/data-platform-intro)


**Microsoft Dataverse for Teams**: A common cloud data platform for Microsoft Teams. Microsoft Dataverse for Teams enables everyone to quickly build and deploy apps and intelligent chatbots in Teams with Microsoft Power Apps and Microsoft Copilot Studio.


**Multistep flows:** A multistep flow uses more than one action to accomplish a task.

## R

**Robotic Process Automation (RPA):** Automation using a software application that replicates the actions of a human being interacting with the user interface of a computer system.

## S

**Scheduled flows:** Scheduled flows run on a schedule defined by the maker. Scheduled flows can repeat on the following cadences: every second, minute, hour, day, week, and/or month. For example, users can schedule an automation such as daily data upload to SharePoint or a database.

 [Run flows on a schedule](run-scheduled-tasks.md)

**Steps:** There's a button at the bottom of each step (action) labeled **+New step** in the flow designer that lets the user add another action.

## T

**Templates:** Templates are prebuilt set of triggers and actions that are designed to help users easily create flows that meet their specific business needs. Templates can be customized. There are hundreds of flow templates that cater to many types of common automation scenarios.

 [Power Automate Templates](https://make.powerautomate.com/templates/)

**Trigger:** A trigger is an event that starts a cloud flow.  For example, if you create a cloud flow: “when an email with an attachment arrives, automatically upload the file to OneDrive” - the arrival of the email with an attachment is the trigger of such flow.

Flows can have one or more triggers.

## U

**UI Flows (RPA):** UI flows enable users to automate repetitive tasks in Windows and web applications. UI flows record and playback user interface actions (clicks, keyboard input, etc.) for applications that don't have easy-to-use or complete APIs available.

[Introduction to UI flows](desktop-flows/introduction.md)

## W

**Workflow:** A sequence of actions that takes a task from initiation to completion.

## Learn more

* Take a [guided learning tour](/training/paths/automate-process-using-flow) of Power Automate
* Learn the basics of Power Automate in the [getting started guide](getting-started.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
