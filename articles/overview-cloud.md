---
title: Overview of cloud flows
description: Get an overview of cloud flows.
suite: flow
author: kisubedi
contributors:
  - kewaiss
  - HeatherOrt
  - jamiemwork
  - v-aangie
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 07/18/2025
ms.author: kewaiss
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of cloud flows

Cloud flows are automated workflows that connect your apps and services to help you automate tasks and processes. They can be triggered by events, such as the arrival of an email, or a specific time of day, and can perform actions across multiple services.

## Options to create cloud flows

Power Automate provides two options to create cloud flows: using Copilot or from scratch.

You can use Copilot to create cloud flows by describing what you want to automate in natural language (also referred to as a prompt). Copilot then suggests actions and helps you build the flow based on your prompt. Copilot is turned on by default, but your admin can disable it.

Learn more in [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md).

You can also create cloud flows from scratch (without Copilot) using the **Create** button in Power Automate. This option allows you to start from a blank flow or use a template and configure it in the *designer*. Power Automate provides two designers for you to choose from: the new designer and the classic designer. The *new designer* is the default experience, but you can switch to the *classic designer*. Create your flow from scratch if you prefer a more hands-on approach to building your flows, or don't have access to Copilot.

Learn more in [Create your first cloud flow without Copilot](create-cloud-flow-without-copilot.md).

Copilot is available only in the new designer. To help you decide which option to use to create your cloud flow, use the following table.

| Option  | Available in new designer? | Available in classic designer?
|---------|:---------:|:---------:|
| Use Copilot     |    Yes     |   No      |
| Without Copilot |   Yes      |   Yes      |

Get answers to frequently asked questions about Copilot in cloud flows in [Copilot in cloud flows FAQ](faq-copilot-cloud-flows.yml).

Get answers to frequently asked questions about Power Automate in general in [Power Automate FAQ](frequently-asked-questions.yml).

## Types of cloud flows

If you're creating a cloud flow without Copilot, you can choose from three cloud flow types depending on what you want to automate:

- **Automated cloud flow**: Create an automation that is triggered by an event such as the arrival of an email from a specific person, or a mention of your company in social media.
- **Instant cloud flow**: Start an automation with the selection of a button.
- **Scheduled cloud flow**: Start a scheduled automation such as daily data upload to SharePoint or a database.

If you're using Copilot, your prompt determines the cloud flow type you should use&mdash;you don't need to figure this out for yourself.

The following table describes the three types of cloud flows, when to use them, examples, and benefits.

| Type   | When to use   | Examples    | Benefits    |
|-------------|---------------|-------------|------------------|
| [Automated cloud flows](get-started-logic-flow.md)    | Trigger an event. | Arrival of an email or a mention of your company in social media.          |  [Connectors](/connectors/) for cloud or on-premises services connect your accounts and enable them to talk to each other. |
| [Instant cloud flows]((./mobile/mobile-create-flow.md))      | Start a repetitive task. | Send a reminder to the team or an approval in Teams or SharePoint.    |  Flows run instantly with the selection of a button or control.    |
| [Scheduled cloud flows](run-scheduled-tasks.md)       | Schedule an automation task. | Daily data upload to SharePoint or a database.     | Predictable tasks can be automated only once; you don't need to create a cloud flow for every run.  |

## Create and use cloud flows from your phone

If you [install the Power Automate mobile app on your phone](mobile/overview-mobile.md#install-the-power-automate-mobile-app), you can create and use cloud flows from your phone. The mobile app is available for both iOS and Android devices.

Learn more in [Power Automate mobile app overview](mobile/overview-mobile.md).

## Next step

- [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md)
- [Create your first cloud flow without Copilot](create-cloud-flow-without-copilot.md)

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Create and Manage Automated Processes by using Power Automate (learning path)](/training/paths/create-manage-automated-processes-by-using-power-automate/)
- [Training: Automate a business process using Power Automate (learning path)](/training/paths/automate-process-power-automate/)
- [Overview of how to integrate Power Automate flows with Dataverse](dataverse/overview.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
