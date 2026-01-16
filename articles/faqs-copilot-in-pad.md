---
title: FAQ for Copilot in Power Automate desktop
description: This FAQ discusses Copilot in Power Automate desktop and the key considerations for making use of this technology responsibly.
ms.date: 01/16/2026
ms.update-cycle: 180-days
ms.custom: 
  - responsible-ai-faqs
ms.topic: faq
author: cochamos
ms.author: cochamos
ms.reviewer: dmartens
ms.collection: 
    - bap-ai-copilot
---

# FAQ for Copilot in Power Automate for desktop

These frequently asked questions (FAQ) describe the AI impact of the Copilot functionality in Power Automate for desktop.

## What is Copilot in Power Automate for desktop?

Power Automate for desktop offers a new way of building desktop flows by the help of an AI assistant. Copilot in Power Automate for desktop accompanies you throughout your flow-building journey, assisting you in creating flows from scratch or enhancing your existing automation with new steps through an interactive chat experience. Simply, describe the flow that you want to create, and Copilot generates all the necessary actions on your behalf. It can also help you by answering desktop flow and product-related questions.

## What can Copilot in Power Automate for desktop do?

Copilot in Power Automate for desktop can be used in multiple scenarios. The system’s intended uses include:

- Creating flows using natural language instructions: From the Power Automate for desktop’s console or designer, you can create a new flow by describing your automation in the Copilot’s chat area.
- Add steps to an existing desktop flow: From the Power Automate for desktop’s designer, you can add one or more actions to your flow by describing them in the Copilot’s chat area.
- Answer documentation questions about Power Automate for desktop: From the Power Automate for desktop’s console or designer, you can ask product related questions in the Copilot's chat area.

## What are the system’s intended uses?

- Copilot can help you create new flows or add actions to an existing flow with ease without having to manually add the actions.
- Copilot's generative answers capability searches for answers to your product related questions in Power Automate for desktop's public documentation using Azure OpenAI and Bing search.

## How was Copilot evaluated? What metrics are used to measure performance?

Copilot in Power Automate for desktop has been evaluated against real-world scenarios in each phase of its design, development, and release. Using a combination of research and business impact studies, we evaluated various quantitative and qualitative metrics about copilot, including its accuracy, usefulness, and agent trust.
We have a robust set of metrics we're tracking to measure the model's performance and resulting customer experience. We follow the feature's SLA to make sure it's always available to you. We track the telemetry of thumbs-up and thumbs-down gestures present in the UI experience for each AI output that you can submit feedback for.

## What are the limitations of Copilot? How can users minimize the impact of Copilot’s limitations when using the system?

- The generative answers capability is available to environments deployed in the following regions: Asia Pacific, Australia, Canada, France, Germany, India, Japan, Korea, Norway, Singapore, South Africa, Switzerland, United Arab Emirates, United Kingdom and United States.
- The flow creation with natural language using Copilot and the generate actions description capabilties are only available to US-based environments.
- The flow creation with natural language capability only supports the following action groups:
  - Clipboard
  - CMD session
  - Compression
  - Conditionals
  - Database
  - Date Time
  - Email
  - Excel
  - File
  - Flow Control
  - Folder
  - HTTP
  - Loops
  - Message Boxes
  - Mouse and Keyboard
  - Outlook
  - PDF
  - Scripting
  - System
  - Text
  - Variables
  - Word
  - XML

- The generative answers capability can only answer to product-related features. It can't answer general questions or anything unrelated to the product.
- There's a limit of 500 characters to describe a flow that you want to create or ask a question that you have about the product.
- You can disable Copilot in Power Automate for desktop by contacting support or closing the Copilot chat panel and not interacting with it.
- Copilot is available only to users with a work or school account.

## What operational factors and settings allow for effective and responsible use of Copilot in Power Automate for desktop?

- The system is only available in Power Automate for desktop console and designer components.
- When creating a new flow or adding steps to an existing flow, you can review the actions that were generated in the Copilot panel in the designer. Additionally, all the AI generated actions in the designer, are included within two comments: “Start of AI generated actions” and “End of AI generated actions”.
- The system marks specific generated actions for user’s review in the designer’s Copilot side panel. Specifically, actions from the Scripting, Database, File and Folder actions groups might be marked for you to review.
