---
title: Get started with Copilot (preview)
description: Learn how to access and use Copilot in Power Automate.
ms.date: 05/15/2023
ms.custom: 
  - transparency-note
ms.topic: conceptual
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Get started with Copilot (preview)

[This article is pre-release documentation and is subject to change.]

Copilot in Power Automate is a revolutionary paradigm shift in creating automations. With this change, makers are empowered to create complex automations with simple natural language. The existing **Describe it to design it** feature allows you to create a flow from natural language. Copilot in Power Automate takes this experience a step further. Copilot does more than help you to create flows with natural language in a more intelligent way. It stays with you on your entire automation journey. Think of copilot as your smart flow assistant.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]
>- For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).
>- This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
>- To learn more, go to [Transparency notes for Power Automate](transparency-note.md).

## Overview of Copilot

Like a smart assistant, copilot stays with you right from the start of the flow building process and throughout your flow editing, or your flow fit and finish journey. It can help answer your support questions on the flow, about Power Automate, and more. Even more impressive is that it can make changes to your flow on your behalf based on the prompt you provide. It can even create an entire flow for you, and guide you to finish setting up the flow completely.

Copilot can perform the following actions:

- Understand your intent, and set up connections on your behalf.

- Apply the necessary parameters in the flow. Only a limited number of connectors are currently supported.

- Respond to your requests to make changes to your flow, update actions, replace actions, and more.

- Edit existing flows.

## Prerequisites

You’ll need to use a Power Platform environment in a preview region to use Copilot for Power Automate. To learn how to create a preview environment if you don’t have one, go to [Frequently asked questions](#frequently-asked-questions) in this article.

## Use Copilot to create a flow

You can use Copilot to create a flow in two ways. One way is to start describing your automation scenario on the **Home** page, as soon as you sign in to Power Automate. Alternatively, you can open the **Describe it to design it** feature and start describing your automation scenario.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Start describing your automation scenario.

    :::image type="content" source="./media/get-started-with-copilot/copilot-home.png" alt-text="Screenshot of the 'Home' screen, where you can start building your flow with Copilot.":::

    Or

    Select **Create** > **Describe it to design it (preview)**.

1. In the **Let’s make a flow. What should it do?** field, describe your automation scenario. As you start typing, you’re presented suggestions to craft your scenario.

1. Select a suggestion or type your own scenario.

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

    :::image type="content" source="./media/get-started-with-copilot/copilot-describe.png" alt-text="Screenshot of the 'Let's make a flow. What should it do?' screen, where you can select a suggestion or type your own scenario.":::

   >[!TIP]
   >Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. With Copilot, you can try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again. With practice, you’ll get better at guiding the model to the results you want.

1. To confirm the layout of the flow Copilot created for you, select **Enter**.

    You can also update your prompt to update the flow layout in this step. To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. When you’re satisfied with the flow and the connectors the flow is connected to, select **Next**.

1. Review your connected apps and services, and then select **Next**.

    The AI-powered Copilot in Power Automate designer opens with your flow.

    :::image type="content" source="./media/get-started-with-copilot/designer.png" alt-text="Screenshot of the Power Automate designer with your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete flow setup, or make edits to your flow using Copilot.

## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. With Copilot, you can try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again. With practice, you’ll get better at guiding the model to the results you want.

- For better and more accurate results, provide prompts in *When X happens, do Y* format.

- Be as specific as possible. Instead of a vague prompt like, *I want to process an email*, try this: *When an email arrives, I want to post the subject of the email to ‘Contoso’ Teams General channel*.

- If possible, mention the connector in your prompt. For example, include Outlook, Teams, Forms, or other.

- If all fails, try tweaking your prompt.

To learn more, go to [The art of the prompt: How to get the best out of generative AI](https://news.microsoft.com/source/features/ai/the-art-of-the-prompt-how-to-get-the-best-out-of-generative-ai/).  

### Examples of asking Copilot to create a flow

This section describes some example scenarios of how you can ask Copilot to create a flow from within a canvas.

| Scenario  | From within a canvas, do the following   |
|-----------|------------------------------------------------|
| When an email arrives from contoso@gmail.com, Post in Teams.  | </li><li>Ask copilot to edit the flow: **I want to send the email subject to Teams channel.**<br/></li><li>Ask copilot what your flow does: **What does my flow do?**  |
| When an item is created in SharePoint, send me a mobile notification.  |  </li><li>Edit the flow with prompt: **I want to send the item title to notification.**<br/></li><li>Edit the flow with prompt: **I don’t want to receive mobile notification. Send me an email instead.**  |

## Use Copilot to  edit a flow

You can use copilot to edit your existing flows. You don’t need to re-create a flow from scratch to take advantage of Copilot in Power Automate.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left panel, select **My flows**.

1. Find your flow, and then select the vertical ellipses (**&vellip;**).

1. Select **Edit** > **Try AI-powered editing (preview)**.
  
    :::image type="content" source="./media/get-started-with-copilot/ai-edit.png" alt-text="Screenshot of how to edit an existing flow.":::

    As an alternative, you can access copilot from flow **Details** page of your existing flow. To do this, select the flow name from **My flows** > **Edit** > **Try AI-powered editing (preview)**.

    Your flow will open in the AI-powered Copilot editing experience. You can now edit your flow using Copilot in Power Automate.

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### Why don’t I see Copilot for Power Automate in my Power Automate experience?

There are several possibilities.

- Check if the environment you’re using is in preview region or not. Your Power Platform admin can help review and verify.

- Check with your Power Platform admin if the tenant setting for Copilot is enabled or not.

### How do I create a Power Platform environment in preview region?

Go to [Create a Power Platform environment](/power-platform/admin/create-environment#create-an-environment-without-a-database). When creating the environment, ensure that you choose the region as **Preview (United States)**. If you need help creating a preview environment, contact your Power Platform administrator.

To learn more, go to [Power Platform regions](/power-platform/admin/regions-overview).

### What are the limitations of Copilot for Power Automate during preview?

- You can’t edit flows with the Copilot experience if your flow has any of the following flows capabilities:
    - A flow with AI Builder, SAP or Desktop flow connector.
    - A non-Open API flow (older connection format).
    - A flow with comment.
    - A child flow.
    - A solution flow using connections instead of a connection reference.

- Copilot has limited parameterization support currently. It might not be able to implicitly fill parameters in all your actions, but it should be available in select connectors.

- Copilot has limited support to create looping constructs (for example, Apply to each, do until, and more). in the flow currently.

- A solution flow using connections instead of connection reference won’t be supported in the Copilot experience. We recommend that you use connection reference instead of connections for your solution flows to use Copilot in your solution flow. This is also a better application lifecycle management (ALM) practice.

- You can’t use Copilot if you’re using a personal Microsoft account. For example, you can’t use someone@live.com. Use a work or school account like someone@contoso.com instead.

