---
title: Get started with Copilot (preview)
description: Learn how to access and use Copilot in Power Automate.
ms.date: 05/23/2023
ms.custom: 
  - transparency-note
ms.topic: conceptual
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Get started with Copilot (preview)

[This article is prerelease documentation and is subject to change.]

Copilot in Power Automate allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. With Copilot, create a flow by describing what you need through multiple steps of conversation. Copilot is always available.

Copilot can perform the following actions:

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
>- To learn more, go to [Transparency notes for Power Automate](transparency-note.md).

## Prerequisites

In this preview, a Power Platform environment in a US preview region is required to use Copilot in Power Automate. If you don't have an environment in the preview region, go to [Frequently asked questions](#how-do-i-create-a-power-platform-environment-in-preview-region) in this article to create it.

## Create a flow using Copilot

Follow these steps to create a flow using Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Start describing your automation scenario.

    As you're typing, Copilot shows you a list of AI generated suggested flow descriptions.

    Alternatively, you can select **Create** > **Describe it to design it (preview)**.

    :::image type="content" source="./media/get-started-with-copilot/copilot-home-example.png" alt-text="Screenshot of the 'Home' screen, where you can start building your flow with Copilot.":::

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. Select a suggestion or use the scenario you created in step 1.
1. To accept the flow that Copilot created for you, select **Next**.

   If you want to see different suggestions, you can update your prompt in this step. Alternatively, if you want to see other options, select **This isn't what I'm looking for**.

1. Review your connected apps and services, and then select **Next**.

1. To finalize your flow, configure the required settings, and then select **Create flow**.

    The AI-powered Copilot in Power Automate designer opens with your flow.

    :::image type="content" source="./media/get-started-with-copilot/designer.png" alt-text="Screenshot of the Power Automate designer with your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete the flow setup, or make edits to your flow using Copilot.

1. When your flow is complete, select **Save this flow**.

1. Once your flow is saved, we recommend that you test it. Do this by selecting **Test** in the upper-right corner.

## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. With Copilot, you can try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again.

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

## Edit a flow using Copilot

You can use Copilot to edit your existing flows. You don’t need to re-create a flow from scratch to take advantage of Copilot in Power Automate.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left panel, select **My flows**.
1. Find your flow, and then select the vertical ellipses (**&vellip;**).
1. Select **Edit** > **Try AI-powered editing (preview)**.
  
    :::image type="content" source="./media/get-started-with-copilot/ai-edit.png" alt-text="Screenshot of how to edit an existing flow.":::

    Alternatively, access Copilot from flow **Details** page of your existing flow by selecting the flow name from **My flows** > **Edit** > **Try AI-powered editing (preview)**.

    Your flow opens in the AI-powered Copilot editing experience. You can now edit your flow using Copilot in Power Automate.

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### Why don’t I see Copilot in Power Automate in my Power Automate experience?

There are several possibilities.

- Check if the environment you’re using is in preview region or not. Your Power Platform admin can help review and verify.
- Check with your Power Platform admin if the [tenant setting or environment setting for Copilot is or isn't enabled](#how-do-i-disable-copilot-in-power-automate).

### How do I create a Power Platform environment in preview region?

Go to [Create a Power Platform environment](/power-platform/admin/create-environment#create-an-environment-without-a-database). When creating the environment, ensure that you choose the region as **Preview (United States)**. If you need help with creating a preview environment, contact your Power Platform administrator.

To learn more, go to [Power Platform regions](/power-platform/admin/regions-overview).

### What are the limitations of Copilot in Power Automate during preview?

- You can’t edit flows with the Copilot experience if your flow has any of the following flows capabilities:
    - A flow with AI Builder, SAP or desktop flow connector.
    - A non-Open API flow (older connection format).
    - A flow with comment.
    - A child flow.
    - A solution flow using connections instead of a connection reference.
- Copilot has limited parameterization support currently. It might not be able to implicitly fill in parameters for all your actions, but it should be available in select connectors.
- Copilot has limited support to create looping constructs (for example, Apply to each, do until).
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use [connection reference](/power-apps/maker/data-platform/create-connection-reference#manually-add-a-connection-reference-to-a-solution-using-solution-explorer) instead.
- You can’t use Copilot if you’re using a personal Microsoft account. For example, you can’t use someone@live.com. Use a work or school account like someone@contoso.com instead.
- Copilot supports English language only for models.

### How do I disable Copilot in Power Automate?

For preview, Copilot is turned on by default. To disable it, you need to have administrator access.

To disable Copilot for your *tenant*, follow these steps.

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the menu to the left, select **Settings** > **Tenant settings**.
1. Select **Copilot (preview)**.
1. Set the toggle to **Off** > **Save**.

To disable Copilot for your *environment*, follow these steps.

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. On the menu to the left, select **Environment**, and then select the environment.
1. On the command bar, select **Settings** > **Product** > **Features**.
1. Set the toggle next to **Copilot** to **Off**.

### See also

- [Transparency notes for Power Automate](transparency-note.md)
- [Transparency note for Copilot in Power Automate](transparency-note-copilot.md) 
- [Transparency note for Copilot data security and privacy in Microsoft Power Platform](/power-platform/transparency-note-copilot-data-security-privacy)
- 
- 