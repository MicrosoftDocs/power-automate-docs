---
title: FAQ for Copilot in cloud flows
description: This FAQ discusses copilot in cloud flows and the key considerations for making use of this technology responsibly.
ms.date: 09/10/2024
ms.custom: 
  - responsible-ai-faqs
ms.topic: conceptual
author: kisubedi
contributors:
  - radioblazer
  - kisubedi
  - v-aangie
ms.author: kisubedi
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# FAQ for Copilot in cloud flows

These frequently asked questions (FAQ) describe the AI impact of Power Automate's Copilot in cloud flows (preview) feature.

## What is Copilot in cloud flows (preview)?

The copilot in cloud flows experience in Power Automate is a new way to build automation (at this time cloud flows specifically) with the help of an AI assistant&mdash;the copilot. The copilot in Power Automate stays with you in your flow building journey and helps you build, set up, and run an automation on your behalf through a chat experience. It helps answer flow and product questions, too. It takes your input and provides either documentation, links, or answers in the copilot chat pane. As an alternative, it makes changes to the flow per your natural language description.

## What are the system’s capabilities?

The system is a copilot embedded in the cloud flows designer with copilot. It helps you create or edit your flow. The system can:

- Create a new flow from scratch.

- Edit an existing flow according to instructions.

- Answer questions about the current flow being edited.

- Create a description for the current flow.

- Answer general documentation questions about Power Automate.

- Filter out questions not related to Power Automate or the current flow.

The copilot also provides buttons to prompt you to save or test your flow occasionally.

## What is the system’s intended use?

The system's intended use is to help you build automation easily and quickly, to start getting value out of automation as soon as possible.

## How was copilot in cloud flows (preview) evaluated? What metrics are used to measure performance?

We have a robust set of metrics we're tracking to measure the performance of the model and resulting customer experience. We track copilot's SLA to make sure it's always available to you. We track the telemetry of thumb up and thumb down gestures present in the AI copilot for each AI output where you can submit feedback.

You can provide feedback for copilot when the results are biased or inappropriate. We track this feedback to ensure that copilot is compliant, appropriate, and bias-free.

## What are the limitations of copilot in cloud flows? How can users minimize the impact of the copilot limitations when using the system?

Copilot can render flows and edit flows in a limited manner at this time. It supports only a subset of connectors available with Power Platform. Copilot also isn't equipped to help with fixing flow errors currently. You're made aware of this limitation throughout the experience. We attempt to keep you from landing in a faulty state that causes data crashes or loss, as our support is limited. We block you from using the feature when there's a possibility it might break or corrupt your data.

If you want to turn off copilot in cloud flows within your organization, ask your Power Platform admin to turn off the feature. Admins contact Microsoft support to do this.

## What operational factors and settings allow for effective and responsible use of the system?

Copilot is available only in the new designer. When editing a flow, you can choose to use the new designer or the old designer.

If you're using the new designer, all changes done by copilot should be reviewed in the designer. You can undo your changes.

## Related information

- [Get started with Copilot in cloud flows (preview)](get-started-with-copilot.md)
- [Use Copilot to analyze desktop flow activity (preview)](./desktop-flows/use-copilot-to-analyze-desktopflow-activity.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

[!INCLUDE[footer-include](./includes/footer-banner.md)]
