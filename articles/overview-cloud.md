---
title: Overview of cloud flows
description: Get an overview of cloud flows.
suite: flow
author: kisubedi
contributors:
  - HeatherOrt
  - jamiemwork
  - v-aangie
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 04/02/2025
ms.author: heortaol
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of cloud flows

You can choose from three cloud flow options depending on what you want to automate. An *automated cloud flow* creates an automation that is triggered by an event such as the  arrival of an email from a specific person, or a mention of your company in social media. An *instant cloud flow* starts an automation with the selection of a button. A *scheduled cloud flow* starts a scheduled automation such as daily data upload to SharePoint or a database.

## Types of cloud flows

The following table describes the three types of cloud flows, when to use them, examples, and benefits.

| Type   | When to use   | Examples    | Benefits    |
|-------------|---------------|-------------|------------------|
| [Automated cloud flows](get-started-logic-flow.md)    | Trigger an event. | Arrival of an email or a mention of your company in social media.          |  [Connectors](/connectors/) for cloud or on-premises services connect your accounts and enable them to talk to each other. |
| [Instant cloud flows](./mobile/mobile-create-flow.md)       | Start a repetitive task. | Send a reminder to the team or an approval in Teams or SharePoint.    |  Flows run instantly with the selection of a button or control.    |
| [Scheduled cloud flows](run-scheduled-tasks.md)       | Schedule an automation task. | Daily data upload to SharePoint or a database.     | Predictable tasks can be automated only once; you don't need to create a cloud flow for every run.  |

## Solution-aware and non-solution aware cloud flows

Solution-aware cloud flows are flows that are created in the context of a solution. Solutions are containers for your customizations, and they can include apps, flows, and other components. When you create a flow in a solution, it becomes part of that solution and can be managed and shared as a single unit.

Learn more in [Overview of solution-aware flows](overview-solution-flows.md).

Non-solution-aware cloud flows are flows that are created outside of a solution. These flows aren't associated with any specific solution and can be managed independently. They can still be shared and used with other components, but they don't have the same level of integration as solution-aware flows.

## Use Copilot to create cloud flows

You can use Copilot to create cloud flows. Copilot is an AI-powered assistant that helps you build flows by suggesting actions and providing guidance throughout the flow creation process. It can help you automate tasks, connect to various services, and streamline your workflows.

Copilot in cloud flows allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation.

Learn more in [Get started with Copilot in cloud flows](get-started-with-copilot.md).

## Create and use cloud flows from your phone

If you [install the Power Automate mobile app on your phone](mobile/overview-mobile.md#install-the-power-automate-mobile-app), you can create and use cloud flows from your phone. The mobile app is available for both iOS and Android devices.

Learn more in [Power Automate mobile app overview](mobile/overview-mobile.md).

## Find your cloud flows easily

You might have a need to find a cloud flow within a large number of flows. Finding your flows is easy&mdash;just use the search box on the **Cloud flows**, **Desktop flows**, or **Shared with me** tab to display only flows that match the search terms you enter.

:::image type="content" source="media/overview-cloud/filter-search-box.svg" alt-text="Screenshot of the 'Search' field on the 'Flows' page.":::

> [!NOTE]
> The search filter finds only cloud flows that were loaded into the page. If you don't find your flow, try selecting **Load more** at the bottom of the page.

## More options to find your cloud flow

If you can't find your cloud flow, try one of the options in the following table.

|Scenario  |Solution  |
|---------|---------|
|The cloud flow might be in a different environment.      | To change environments, go to /Environment information and settings](getting-started.md#3--environment-information-and-settings).      |
|The cloud flow was shared.   | Check the **Shared with me** tab in **My Flows** menu option. (For an example, refer to the screenshot in [Find your cloud flows easily](#find-your-cloud-flows-easily) in this article.)       |
| You were possibly removed as an owner of the cloud flow.    |  Contact the flow owner to be re-added. Learn how to find out if you’re an owner of the cloud flow in [Remove an owner](create-team-flows.md#remove-an-owner).       |
| The flow was possibly deleted.     | Learn how to restore the flow in [Restore deleted flows](how-tos-restore-deleted-flow.md).        |

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Create and Manage Automated Processes by using Power Automate (learning path)](/training/paths/create-manage-automated-processes-by-using-power-automate/)
- [Training: Automate a business process using Power Automate (learning path)](/training/paths/automate-process-power-automate/)
- [Overview of how to integrate Power Automate flows with Dataverse](dataverse/overview.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
