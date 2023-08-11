---
title: Get started with Edit with Copilot (preview)
description: Learn how to access and use Edit with Copilot (preview).
ms.date: 05/23/2023
ms.custom: 
  - transparency-note
ms.topic: conceptual
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Get started with Edit with Copilot (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

Edit with Copilot allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation. Edit with Copilot is always available.

Edit with Copilot can perform the following actions:

- Understand your intent, and create a flow based on the scenario prompt you provide.
- Set up connections on your behalf.
- Apply the necessary parameters in the flow based on your prompt.
- Respond to your requests to make changes to your flow, such as update actions and replace actions.
- Answer questions about your flow and product. For example, you can ask Copilot questions about your flow like, *What does my flow do?* You can also ask Copilot product questions like, *How do I access child flows?* and *How do I access licenses?*

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]
>- For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).
>- This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
>- More information: [Transparency notes for Power Automate](transparency-note.md), [Transparency note for Copilot data security and privacy in Power Platform](/power-platform/transparency-note-copilot-data-security-privacy)

## Prerequisites

You need a Power Platform environment in the United States or Preview (United States) region for Edit with Copilot (preview).

> [!NOTE]
> If your environment is in the United States or Preview (United States) region and you still don’t see the Edit with Copilot experience, contact your admin. Ask if they've requested Microsoft Support to disable Edit with Copilot (preview).

## Create a flow using Edit with Copilot

Follow these steps to create a flow using Edit with Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Start describing your automation scenario.

    As you're typing, Edit with Copilot shows you a list of AI generated suggested flow descriptions.

    Alternatively, you can select **Create** > **Describe it to design it (preview)**.

    :::image type="content" source="./media/get-started-with-copilot/copilot-home-example.png" alt-text="Screenshot of the 'Home' screen, where you can start building your flow with Copilot.":::

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. Select a suggestion or use the scenario you created in step 1.
1. To accept the flow that Copilot created for you, select **Next**.

   If you want to see different suggestions, you can update your prompt in this step. Alternatively, if you want to see other options, select **This isn't what I'm looking for**.

1. Review your connected apps and services, and then select **Next**.

1. To finalize your flow, configure the required settings, and then select **Create flow**.

    The Edit with Copilot (preview) designer opens with your flow.

    :::image type="content" source="./media/get-started-with-copilot/designer.png" alt-text="Screenshot of the Power Automate designer with your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete the flow setup, or make edits to your flow using Edit with Copilot.

1. When your flow is complete, select **Save this flow**.

1. Once your flow is saved, we recommend that you test it. Do this by selecting **Test** in the upper-right corner.

## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. Edit with Copilot lets you to try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again.

- For better and more accurate results, provide prompts in *When X happens, do Y* format.
- Be as specific as possible. Instead of a generic prompt like, *I want to process an email*, try this prompt instead: *When an email arrives, I want to post the subject of the email to ‘Contoso’ Teams General channel*.
- If possible, mention the connector in your prompt. For example, include Outlook, Teams, Forms, or other.
- Try tweaking your prompt to further fine tune.

For more general information about writing prompts with generative AI, go to [The art of the prompt: How to get the best out of generative AI](https://news.microsoft.com/source/features/ai/the-art-of-the-prompt-how-to-get-the-best-out-of-generative-ai/).  

### Examples of interactions with Copilot

This section describes some example scenarios of how you can interact with Copilot.

| From the Home page or Describe it to design it  | Inside canvas   |
|-----------|------------------------------------------------|
| When an email arrives from contoso@gmail.com, post in Teams.  | </li><li>Ask Copilot to edit the flow: **I want to send the email subject to Teams channel.**<br/></li><li>Ask Copilot what your flow does: **What does my flow do?**  |
| When an item is created in SharePoint, send me a mobile notification.  |  </li><li>Edit the flow with this prompt: **I want to send the item title to notification.**<br/></li><li>Edit the flow with this prompt: **I don’t want to receive mobile notification. Send me an email instead.**  |

## Edit a flow using Edit with Copilot (preview)

You can use Edit with Copilot (preview) to change your existing flows. You don’t need to re-create a flow from scratch to take advantage of Edit with Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left panel, select **My flows**.
1. Find your flow, and then select the vertical ellipses (**&vellip;**).
1. Select **Edit** . **Edit with Copilot (preview)**.
  
    :::image type="content" source="./media/get-started-with-copilot/copilot-edit.png" alt-text="Screenshot of how to edit an existing flow.":::

    Alternatively, access Edit with Copilot (preview) from the flow **Details** page of your existing flow by selecting the flow name from **My flows** > **Edit** > **Edit with Copilot (preview)**.

    Your flow opens. You can now edit your flow using Edit with Copilot (preview).

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### Why don’t I see Edit with Copilot (preview) in my Power Automate experience?

- Check if the environment you’re using is in the United States or Preview (United States) region. Your Power Platform admin can help review and verify.
- Ask your admin if they've requested Microsoft Support to disable Edit with Copilot (preview).

### How do I create a Power Platform environment in preview region?

Go to [Create a Power Platform environment](/power-platform/admin/create-environment#create-an-environment-without-a-database). When creating the environment, ensure that you choose the region as **Preview (United States)**. If you need help with creating a preview environment, contact your Power Platform administrator.

To learn more, go to [Power Platform regions](/power-platform/admin/regions-overview).

### How do I disable Edit with Copilot (preview)?

You can disable Edit with Copilot (preview) by contacting Microsoft Support.

### How is copilot-powered editing (preview) different from the text generation model in AI Builder?

Copilot-powered editing (preview) is designed to help you create and edit Power Automate flows just by describing them in everyday language, providing helpful guidance along the way.

The text generation model in AI Builder lets you use the GPT model directly in your Power Automate flows and Power Apps apps for various scenarios such as text summarization, draft responses, classify text, and more.  

To learn more, go to [Text generation model overview (preview)](/ai-builder/prebuilt-azure-openai).

### What are the limitations of Edit with Copilot during preview?

- You can’t edit flows with the Edit with Copilot experience if your flow has any of the following flows capabilities:
    - A flow with an AI Builder or SAP connector, desktop flow, or a child flow component.
    - A non-Open API flow (older connection format).
    - A flow with a comment.
    - A solution flow using connections instead of a connection reference.
    - A flow contains an unsupported hybrid trigger. Hybrid triggers don't require connections, and are triggered manually from outside of Power Automate. Examples of hybrid triggers are *for a selected item* and *for a selected row*.
    - A flow contains a Power Apps V1 trigger.
    - A flow contains a Power Pages component.
    - A flow contains a response component.
- Copilot has limited parameterization support currently. It might not be able to implicitly fill in parameters for all your actions, but it should be available in select connectors.
- Copilot has limited support to create looping constructs (for example, *Apply to each* and *do until*).
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use [connection reference](/power-apps/maker/data-platform/create-connection-reference#manually-add-a-connection-reference-to-a-solution-using-solution-explorer) instead.
- You can’t use Edit with Copilot (preview) if you’re using a personal Microsoft account. For example, you can’t use someone@live.com. Use a work or school account like someone@contoso.com instead.
- Edit with Copilot (preview) supports English language only for models.

### See also

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Edit with Copilot](faqs-copilot.md) 
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
