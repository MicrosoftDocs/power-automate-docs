---
title: Transparency note for Copilot in Power Automate
description: The transparency note discusses Copilot and the key considerations for making use of this technology responsibly.
ms.date: 05/23/2023
ms.custom: 
  - transparency-note
ms.topic: article
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Transparency note for Copilot in Power Automate

This transparency note describes the AI impact of Power Automate's Copilot feature.

## What is Copilot in Power Automate?

The AI powered editing experience in Power Automate is a new way to build automations (at this time cloud flows specifically) with the help of an AI assistant&mdash;the Copilot. The Copilot in Power Automate stays with you in your flow building journey and helps you build, set up, and run an automation on your behalf through a chat experience. It helps answer flow and product questions, too. It takes your input and provides either documentation, links, or answers in the Copilot chat pane. As an alternative, it makes changes to the flow per your natural language description.

## What are the system’s capabilities?

The system is a copilot embedded in the cloud flows designer. It helps you create or edit your flow. The system can:

- Create a new flow from scratch.

- Edit an existing flow according to instructions.

- Answer questions about the current flow being edited.

- Answer general documentation questions about Power Automate.

- Filter out questions not related to Power Automate or the current Flow.

The Copilot will also provide buttons to prompt you to save or test your flow occasionally.

## What is the system’s intended use?

The system's intended use is to help you build automations easily and quickly, to start getting value out of automations as soon as possible.

## How was Copilot in Power Automate evaluated? What metrics are used to measure performance?

We have a robust set of metrics we're tracking to measure the performance of the model and resulting customer experience. We track Copilot's SLA to make sure it's always available to you. We track the telemetry of thumbs up and thumbs down gestures present in the AI Copilot for each AI output that you can submit feedback for.

You can provide feedback for Copilot when the results are biased or inappropriate. We track this to ensure that Copilot is compliant, appropriate, and bias-free.

## What are the limitations of Copilot? How can users minimize the impact of the Copilot limitations when using the system?

Copilot can render flows and edit flows in a limited manner at this time. It supports only a subset of connectors available on the platform. It also isn't equipped to help with fixing flow errors currently. You're made aware of this limitation throughout the experience. We'll attempt to keep you from landing in a faulty state that causes data crashes or loss, as our support is limited. We'll block you from using the feature when there's a possibility it might break or corrupt your data.

If you want to turn off Copilot within your organization, ask your Power Platform admin to turn off the feature from Power Platform admin center (PPAC).

## What operational factors and settings allow for effective and responsible use of the system?

Copilot is available only in the new designer. When editing a flow, you can choose to use the new designer or the old designer.

As an Azure OpenAI powered feature, the tenant admin can choose to disable it by disabling all Azure OpenAI powered features in the tenant settings. If you open the new designer with Copilot, you can choose to hide it.

## See also

- [Get started with Copilot ](get-started-with-copilot.md)
- [Transparency note for Copilot data security and privacy in Microsoft Power Platform](/power-platform/transparency-note-copilot-data-security-privacy)

[!INCLUDE[footer-include](./includes/footer-banner.md)]