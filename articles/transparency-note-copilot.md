---
title: Transparency note for copilot
description: The transparency note discusses copilot and the key considerations for making use of this technology responsibly.
ms.date: 05/15/2023
ms.custom: 
  - transparency-note
ms.topic: article
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Transparency note for Copilot

This transparency note describes the AI impact of Power Automate's Copilot feature.

## What is Copilot?

AI powered editing experience in Power Automate is a new way to build automations (at this time, cloud flows specifically) with the help of an AI assistant&mdash;the Gopilot. The Copilot in Power Automate stays with you in your flow building journey and helps you build, set up, and run an automation on your behalf through a chat experience. In addition, it helps answer flow and product questions. It takes user input and provides either documentation, link, or answers in the Copilot chat pane, or makes changes to the flow per user’s natural language description.

## What are the system’s capabilities?

The system is a copilot embedded in the Cloud Flows designer, that helps a user create or edit their flow. The system can:

- Create a new flow from scratch.

- Edit an existing flow according to instructions.

- Answer questions about the current flow being edited.

- Answer general documentation questions about Power Automate.

- Filter out questions not related to Power Automate or the current Flow.

The Copilot will also provide proactively buttons to prompt the user to save or test his flow occasionally.

## What is the system’s intended use?

[Explain intended use(s), as identified in your Impact Assessment.]

## How was Copilot evaluated? What metrics are used to measure performance?

We have a robust set of metrics we're tracking to measure the performance of the model and resulting customer experience. We are tracking the Copilot's SLA to make sure it's always available to our customers. We're tracking the telemetry of thumbs up/thumbs down gestures present in the AI Copilot for each AI output that customers can submit feedback for. Also, customers can provide feedback for the Copilot in the case that the results are biased or not appropriate which we are tracking as well to ensure that Copilot is compliant, appropriate, and bias-free.

## What are the limitations of Copilot? How can users minimize the impact of the Copilot limitations when using the system?

Copilot can render flows and edit flows only in a limited manner at this time. It only supports a subset of connectors available on the platform, which we are looking to expand in the future. It also isn't equipped to help with fixing flow errors currently. Users are made aware of this limitation throughout the experience. We've made a proactive effort to not land users in a faulty state and cause data crash/loss just because our support is limited. We block users from using the feature when we sense there is a possibility it might break/corrupt user data.

If organizations want to turn off the availability of the Copilor within their organization, they can have their Power Platform admin turn of the feature from PPAC.

s## What operational factors and settings allow for effective and responsible use of the system?

[Describe the operational factors and ranges within which the system is expected to perform reliably and safely. List the choices that end users can make (e.g., customization, settings, etc.), with a description of how those choices may impact system behavior in the real world.]

## See also

- Get started with Copilot (link)

[!INCLUDE[footer-include](./includes/footer-banner.md)]