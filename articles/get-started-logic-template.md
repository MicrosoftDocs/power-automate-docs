---
title: Get started from a template | Microsoft Docs
description: Learn how to create a cloud flow from any of many prebuilt templates.
services: ''
suite: flow
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kisubedi
  - v-aangie
ms.author: jamiller
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: article
ms.date: 05/12/2022
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: get-started
---

# Create a cloud flow from a template in Power Automate

A good way to get started is to use a template that is suited to your organization's scenario. You can choose from a collection of templates to find the one that best matches your scenario. Search [all templates](https://make.powerautomate.com/templates/) or browse by category to find your scenario, and then follow the steps in the template to create a cloud flow from the template.

The following video gives insights into using templates to create your flows.

>[!VIDEO https://learn-video.azurefd.net/vod/player?id=b8ff0396-8bfb-44a7-821a-a9bc2e136bb0]

You can tweak templates by adding, editing, or removing triggers and actions to create your own flows. You can [copy paste actions](/business-applications-release-notes/april19/microsoft-flow/copy-paste-actions) in the same flow or across flows to speed up the your tweaks.

Create a cloud flow from one of many built-in templates that can, for example, send you a Slack message when your manager sends you an email in Microsoft 365.

>[!TIP]
>[Create a cloud flow from scratch](get-started-logic-flow.md) if you already have a process in mind and can't find a template for it.

Here, we follow an example that uses a template to create a flow that sends you a Slack message when your manager sends you an email in Microsoft 365.

## Prerequisites

To complete this example, you need accounts with access to the following:

- [Power Automate](https://make.powerautomate.com)
- Slack
- Microsoft 365

## Choose a template

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left-side navigation pane, select **Templates**.

1. Use the search bar to search for **slack manager** to find the **Send a message on Slack when my manager emails me** template, and then select it.

1. If you aren't signed into Office or Slack, select **Sign in**, and then follow the prompts.

1. After you confirm your connections, select **Continue**.

    Your flow appears, showing each action with an orange title bar.

## Customize your flow

1. Select the title bar for an event to expand it, and then customize it (for example, by specifying a filter on the email that interests you).

1. Actions that require input from you are automatically be expanded.
  
    For example, the **Post message** action is expanded because you need to enter a channel, such as your *\@username*. You can also customize the message content. By default, the message contains just the subject, but you can include other information.

1. Near the top of the screen, specify a name for your flow, and then select **Create flow**.

1. If you're satisfied with your flow, select **Save**.

Now, when your manager sends you an email, you receive a Slack message that contains the information that you specified.

## Related information

- [Watch your flow in action](see-a-flow-run.md)
- [Publish your own template](publish-a-template.md)
- [Use a template with Microsoft Dataverse](common-data-model-intro.md)
- [Get started with team flows and invite others to collaborate with you to design flows](create-team-flows.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
