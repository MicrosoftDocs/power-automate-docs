---
title: Copilot in process mining (preview)
description: Learn how to use Copilot in process mining.
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 08/08/2023
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Copilot in process mining (preview)

[This article is pre-release documentation and is subject to change.]

Copilot in Process Mining enables users to streamline data ingestion and provides process insights through quick and easy natural language expression. Copilot is available on web and for desktop application. Copilot on web is part for process import and helps user with process identification and attribute mapping. This copilot is named “Copilot in data ingestion”. In Desktop application the copilot focuses on generating process insights about actual process.

Both copilots also response to user requests about generic process mining for easy onboarding new users.

**Important**

-	This is a preview feature.
-	Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
-	For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).
-	This capability is powered by [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview).
-	More information: [Transparency notes for Power Automate](https://learn.microsoft.com/en-us/power-automate/transparency-note), [Transparency note for Copilot data security and privacy in Power Platform](https://learn.microsoft.com/en-us/power-platform/transparency-note-copilot-data-security-privacy)


## Prequisites
You need a Power Platform environment in the United States or Preview (United States) region for Copilot in Process Mining. 

 **Note**
If your environment is in the United States or Preview (United States) region and you still don’t see the copilot experience, contact your admin. Ask if they've requested Microsoft Support to disable Copilot in Power Automate.

## Copilot in data ingestion

Heather TODOs

## Copilot in process mining analysis

Copilot in Desktop application helps users to generate process insights. Copilot offers ability to summarize findings quantitatively and qualitatively. User can choose prepared suggestions for easy start.

<picture>

User can continue in conversation with Copilot by selecting subsequent suggestions or turn to ask own questions at any time.

<picture 2>

Copilot in desktop leverages knowledge of opened view(process) statistics and can communicate the various statistical information. Without Copilot user need to find out this information on various Statistics or Variants screens in the application.

Copilot feature is started by clicking on Copilot icon in right side of top status bar and is available across all Desktop application screens for opened view. Copilot feature is not available in Process Hub, because no process/view is selected.

## How to write a good prompt
For more general information about writing prompts with generative AI, go to The art of the prompt: [How to get the best out of generative AI](https://news.microsoft.com/source/features/ai/the-art-of-the-prompt-how-to-get-the-best-out-of-generative-ai/)

For general information about writing prompts in Power Automate, go to: [How to write a good prompt in Power Automate](https://learn.microsoft.com/en-us/power-automate/get-started-with-copilot#how-to-write-a-good-prompt)

Copilot in Desktop have access to process statistics for top items for activities, edges and variants. User can questions related to mentioned statistics and Copilot can answer with correct data. When asking about statistical properties Copilot has access to information about frequency (activity, edge counts, case counts), durations (total, average) and rework statistics.

Examples of good prompts with scope of available process statistics:
-	What is the most common variant?
-	Which activity has the highest frequency?
-	What activities have the highest rework and rework percentage?
-	Compare activities with the highest rework (%) attribute.
-	Make a summary description of the process, use the data provided to support your conclusions.

Good examples for prompts focused on general knowledge about process mining:
-	Give me introduction to process mining.
-	Let's talk about data quality of event log dataset for process mining.
-	What are the most common process mining event log related data quality issues?

## Frequently asked questions
Use this section to find answers to frequently asked questions.



See also:

-	[Responsible AI FAQs for Power Automate](https://learn.microsoft.com/en-us/power-automate/responsible-ai-overview)
-	[FAQ for Copilot in Power Automate](https://learn.microsoft.com/en-us/power-automate/faqs-copilot)
-	[FAQ for Copilot data security and privacy in Microsoft Power Platform](https://learn.microsoft.com/en-us/power-platform/faqs-copilot-data-security-privacy)


## Add heading here

[!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]
