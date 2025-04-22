---
title: FAQ for Copilot expression assistant
description: This FAQ provides information about the AI technology used in Power Automate, along with key considerations and details about how AI is used, how it was tested and evaluated, and any specific limitations.
ms.date: 12/12/2024
ms.custom:
  - responsible-ai-faqs
ms.topic: article
author: ksubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# FAQ for Copilot expression assistant

These frequently asked questions (FAQ) describe the AI impact of Copilot expression assistant feature in Power Automate.

## What is Copilot expression assistant?

This feature is designed to help makers build expressions (involving functions, static or dynamic data in the flow) using natural language. Makers need to provide a prompt describing the expression they want to build, reference dynamic data in the flow by their name, and copilot generates a working Power Automate expression on their behalf.

## What are capabilities of the Copilot expression assistant?

It can understand your intent of expression creation, understand what dynamic values you want to put in your expression, and return a Power Automate expression.

## What is the intended use of the Copilot expression assistant?

Write Power Automate expressions using natural language.

## How was Copilot expression assistant evaluated? What metrics are used to measure performance?

Copilot expression assistant underwent substantial testing before the feature was released. We have a diverse test set pair of prompts->desired expression, which is used for benchmarking the model’s quality.

## What are the limitations of Copilot expression assistant? How can users minimize the impact of the Copilot expression assistant limitations when using the system?

Expression assistant produces mostly accurate answers but isn't always factual. Because the underlying technology behind content rewrite uses AI that has been trained on a wide range of Internet sources, some text suggestions might include questionable or inappropriate content. It's your responsibility to edit generated suggestions so that your final copy is accurate and appropriate.  

It needs a descriptive name when you want to reference dynamic content in the expression. It might pick a different dynamic content when you have multiple similar sounding dynamic content in your flow.

## What operational factors and settings allow for effective and responsible use of the feature?

- Ensure that your prompt is clear and descriptive.
- Ensure that your prompt isn't too long.
- Always review and test before applying copilot generated expression to your flow and running in production.

## Related information

[Create, update, and fix expressions with Copilot expression assistant (preview)](expressions-copilot.md)

[!INCLUDE[footer-include](./includes/footer-banner.md)]