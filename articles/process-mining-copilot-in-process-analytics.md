---
title: Copilot in Process Mining process analytics (preview)
description: Learn how to surface insights on your process and get recommended solutions with Copilot.
ms.date: 04/01/2025
ms.topic: article
author: janPidych
contributors:
  - janPidych
  - v-aangie
ms.custom: bap-template
ms.author: janpidych
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# Copilot in Process Mining process analytics (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Copilot in Process Mining process analytics provides process insights through quick and easy natural language expression. Copilot can surface insights on your process and recommend solutions in power automate process mining.

Copilot can perform the following actions:

- Surface top insights in your process.
- Offer recommendations on automation.
- Answer your questions about your process data.
- Answer your general questions about process mining.

[!INCLUDE[cc_preview_features_definition_copilot_process_mining](./includes/cc-preview-features-definition-copilot-process-mining.md)]

## Prerequisite

You need a Power Platform environment for Copilot in Process Mining.

> [!NOTE]
> - If you still don’t see the Copilot experience, contact your admin. An admin can turn the Copilot feature off or on in the Power Platform admin center.
> - In some geographic regions outside United States, Australia, and United Kingdom, an admin needs to turn on the cross geo calls to enable Copilot. More information: [Copilot availability by region](get-started-with-copilot.md#availability-by-region).

## Copilot in Process Mining analysis

Copilot in Process Mining process analytics helps you generate process insights through natural language. Copilot can easily summarize findings from your data quantitatively and qualitatively. Prompts help you get a quick start on your process mining journey.

Make sure you've done the following:

- Finished the process import and see the imported process on the Process Mining web page.
- If you plan to use Copilot on the Process Mining desktop application, download and install the Process Mining desktop application on your local machine.

    For instructions, go to [Download Power Automate Process Mining desktop app](minit/how-to-start-with-minit-desktop-application.md).

## Analyze your process

Follow these steps to analyze the process with Copilot. You can analyze your process in the [Power Automate Process Mining web page](process-mining-overview.md) or in the [Process Mining desktop app](minit/minit-desktop-application-overview.md).

### Analyze your process in the Power Automate Process Mining web page



1. In Power Automate in the left navigation pane, select **Process mining**.
2. In the **Environments** field in th titlebar, select your process mining environment with an imported process.
3. Open the imported process.

    :::image type="content" source="media/process-mining-copilot-in-process-analytics/copilot-web.png" alt-text="Screenshot of the opened process.":::

    There are two ways to open the process:

    - If you wait until the import operation finishes, the process opens automatically after the import, OR
    - After steps 1 and 2, you see the Process Mining environment home page. Processes display as tiles. Select a process tile, or select the **All processes** link to list all processes. To open a process, select its name.

### Analyze your process in the Process Mining desktop app

> [!IMPORTANT]
> This feature is generally available only in the United States region, and is in preview for all other regions.

1. Open the Process Mining desktop app:
   1. On the taskbar, select the  Windows **Start** icon.
   1. In the search bar, enter **process mining**.
   1. On the right panel, select **Power Automate Process Mining** app.
1. In the **My processes** tab, select your process mining environment with an imported process.
1. Select the process to analyze.

    :::image type="content" source="media/process-mining-copilot-in-process-analytics/desktop-app-processes.png" alt-text="Screenshot of the 'My processes' tab in the Process Mining desktop app.":::

1. In process map view, select **Copilot** on the command bar to the right. The Copilot pane opens.

   Copilot offers several prepared suggestions to easily get you started on engaging with your data.

1. Select a suggestion to have Copilot provide the response.

    If available, it also provides subsequent prepared suggestions.

    :::image type="content" source="media/process-mining-copilot-in-process-analytics/copilot.png" alt-text="Screenshot of the Copilot pane.":::

1. (Optional) You can continue in conversation with Copilot by selecting subsequent suggestions. Alternatively, you can ask your own questions at any time using the text field in bottom part of the Copilot pane.

    :::image type="content" source="media/process-mining-copilot-in-process-analytics/copilot-question.png" alt-text="Screenshot of questions in the Copilot pane.":::

Copilot in the Process Mining desktop app leverages knowledge of the open process statistics. It communicates the various statistical information.

## How to write a good prompt

For more general information about writing prompts with generative AI, go to [The art of the prompt: How to get the best out of generative AI](https://news.microsoft.com/source/features/ai/the-art-of-the-prompt-how-to-get-the-best-out-of-generative-ai/).

For general information about writing prompts in Power Automate, go to [How to write a good prompt](get-started-with-copilot.md#how-to-write-a-good-prompt).

Copilot in the Process Mining desktop app has access to process statistics for top items for activities, edges, and variants. You can ask questions related to your statistics and Copilot can answer with correct data. When asking about statistical properties, Copilot has access to information about frequency (activity, edge counts, and case counts), durations (total and average), and rework statistics.

The following list provides examples of good prompts within the scope of available process statistics.

- What is the most common variant?
- Which activity has the highest frequency?
- What activities have the highest rework and rework percentage?
- Compare activities with the highest rework (%) attribute.
- Make a summary description of the process, use the data provided to support your conclusions.

The following list provides examples of prompts focused on general knowledge about process mining.

- Give me introduction to process mining.
- Let's talk about data quality of event log dataset for process mining.
- What are the most common process mining event log related data quality issues?

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### How do I create an environment with Copilot?

1. Go to Create a Power Platform environment.
1. [Create a Power Platform environment](/power-platform/admin/create-environment#create-an-environment-without-a-database).

    If you need help with creating a preview environment, ask your Power Platform admin.

### Why don't I see Copilot?

Ask your admin if they turned off the Copilot feature in the Power Platform admin center for your environment.

### How do I disable Copilot?

Have your tenant admin ask the MS Support team to disable Copilot in your tenant.

## Limitations of Copilot in process analysis

- Copilot has limited information about processes. Only access to the most common activities and variants are available. If the process contains many activities or variants, Copilot can answer prompts only for the most frequent ones.
- Copilot doesn't have access to statistical information about custom attributes in the process like financial, resource, or vendor attributes.

## Limitations of Copilot in Power Automate

- You can't use Copilot in Process Mining ingestion on processes created with dataflows.
- You can't use Copilot in task mining processes.
- Copilot has a limited view of your ingested data in the ingestion experience. This limits the questions it might be able to answer for your data and process, such as the longest running activity or amount of rework in process.
- (Applies only to Copilot in process analytics) Copilot can't be used in a web report of Process Mining.
- You can't use Copilot if you're using a personal Microsoft account. For example, you can't use `someone@live.com`. Use a work or school account like `someone@contoso.com` instead.
- Copilot supports English language only for models.

## Related information

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Copilot in Power Automate Process Mining](faqs-copilot-in-process-mining.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

