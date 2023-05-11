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

Copilot in Power Automate is a revolutionary paradigm shift in creating automations. With this change, makers are empowered to create complex automations with simple natural language. The existing **Describe it to design it** (renamed to Build your flow with copilot) feature allows you to create a flow from natural language. Copilot in Power Automate takes this experience a step further. Copilot does more than help you to create flows with natural language in a more intelligent way. It stays with you on your entire automation journey. Think of copilot as your smart flow assistant.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]
>- For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).
>- This feature is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
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

## Use Copilot when creating a flow

You can use copilot to create a flow in two ways. One way is to start describing your automation scenario on the **Home** page, as soon as you sign in to Power Automate. Alternatively, you can open the **Describe it to design it** feature and start describing your automation scenario.

1. Sign in to [Power Automate](make.powerautomate.com).

1. Start describing your automation scenario.

    :::image type="content" source="./media/get-started-with-copilot/copilot-home.png" alt-text="Screenshot of the Home screen, where you can start building your flow with Copilot.":::

    Or

    Select **Create** > **Describe it to design it (preview)**.

 1. In the **Let’s make a flow. What should it do?** field, describe your automation scenario. As you start typing, you’re presented suggestions to craft your scenario.

3.	Select a suggestion or type your own scenario.

    :::image type="content" source="./media/get-started-with-copilot/copilot-describe.png" alt-text="Screenshot of the Home screen, where you can start building your flow with Copilot.":::
 
## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. With Copilot, you can try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again. With practice, you’ll get better at guiding the model to the results you want.

- For better and more accurate results, provide prompts in *When X happens, do Y* format.

- Be as specific as possible. Instead of a vague prompt like, *I want to process an email*, try this: *When an email arrives, I want to post the subject of the email to ‘Contoso’ Teams General channel*.

- If possible, mention the connector in your prompt. For example, include Outlook, Teams, Forms, or other.

- If all fails, try tweaking your prompt.  

To learn more, go to The art of the prompt: How to get the best out of generative AI - Source (microsoft.com).  



## Frequently asked questions

