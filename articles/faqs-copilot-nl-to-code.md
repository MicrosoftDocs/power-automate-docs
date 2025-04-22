---
title: FAQ for Power Automate for desktop natural language to code in scripting actions
description: This FAQ discusses Power Automate for desktop natural language to code in scripting actions and the key considerations for making use of this technology responsibly.
ms.date: 04/01/2025
ms.custom: 
  - responsible-ai-faqs
ms.topic: conceptual
author: Cochamos
ms.author: cochamos
ms.reviewer: angieandrews
ms.collection: 
    - bap-ai-copilot
---

# FAQ for Power Automate for desktop natural language to code in scripting actions

## What is natural language to code in scripting actions?

Natural language to code is a new AI capability that we added in Power Automate for desktop. It lets you quickly generate code used in the scripting actions by describing it. This feature is available in the "Run PowerShell," "Run VBScript," "Run DOS command," "Run Python," and "Run JavaScript" actions. You can describe with natural language what you want to achieve, and copilot's AI capabilities generate the script for you. This feature makes it easy for users unfamiliar with scripting languages to automate their tasks.

## What can the natural language to code in scripting actions do?

Copilot's natural language to code in scripting actions can generate the code to be executed in the various scripting actions in Power Automate for desktop. To do so, the only thing that the user needs to do is to provide a description, and the AI responds with the generated code.

## What is/are natural language to code in scripting actions' intended use(s)?

The intended use is to allow users to create scripts quickly and with ease, by just providing a description of the script instead of developing it from scratch.

## How was natural language to code in scripting actions evaluated? What metrics are used to measure performance?

- There's a robust set of metrics we're tracking to measure the model's performance and resulting customer experience. We track the feature's SLA to make sure it's always available to you. We track the telemetry of thumbs-up and thumbs-down gestures present in the UI experience for each AI output that you can submit feedback for.
- You can provide feedback on this functionality when the results are biased or inappropriate. We track this feedback to ensure that copilot is compliant, appropriate, and bias-free.
- We tested the AI model through various internal processes and reviews to make sure that we provided the best possible quality and adhere to the highest of standards when it comes to security and reliability.

## What are the limitations of natural language to code in scripting actions? How can users minimize the impact of natural language to code in scripting action's limitations when using the system?

- The natural language to code in scripting actions capability can only generate scripts. It can't answer general questions or anything unrelated to the specific scripting language where the user launched the functionality. Currently, all the scripting actions are supported, but they run a .NET action.
- The natural language to code in scripting actions capability is available to environments deployed in the following regions: Asia Pacific, Australia, Canada, France, Germany, India, Japan, Korea, Norway, Singapore, South Africa, Switzerland, United Arab Emirates, United Kingdom, and United States.
- This capability is available only to users using a work or school account.

## What operational factors and settings allow for effective and responsible use of natural language to code in scripting actions?

- Natural language to code in scripting actions is only available and can only be accessed from these scripting actions in Power Automate for desktop's designer: Run PowerShell, Run VBScript, Run DOS command, Run Python, and Run JavaScript actions.
- Always review results from copilot.

## Get the best out of copilot

When you're interacting with copilot, it's essential to keep in mind that the structure of the questions can significantly affect the response that copilot gives. To interact with copilot effectively, is crucial to ask clear and specific questions and provide context to help the AI better understand your intent.

## Related information

- [Natural Language to code in scripting actions](./desktop-flows/actions-reference/scripting.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
