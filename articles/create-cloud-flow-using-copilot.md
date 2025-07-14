---
title: Create your first cloud flow using Copilot
description: Learn how to access and use Copilot to create a cloud flow.
ms.date: 07/14/2025
ms.update-cycle: 180-days
ms.custom: 
  - bap-template
  - copilot-learning-hub
ms.topic: get-started
author: kisubedi
contributors:
  - radioblazer
  - DBEKI
  - jamiework
  - kisubedi
  - janPidych
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot 
---

# Create your first cloud flow using Copilot

Copilot in cloud flows allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation.

The cloud flows Copilot can perform the following actions:

- Understand your intent, and create a flow based on the scenario prompt you provide.
- Auto-set up connections on your behalf to get you to a working automation as soon as possible.
- Apply the necessary parameters in the flow based on your prompt.
- Respond to your requests to make changes to your flow, such as update actions and replace actions.
- Answer questions about your flow and product. For example, you can ask Copilot questions about your flow like, *What does my flow do?* to get a summary of what the flow does. You can also ask Copilot product questions like, *How do I access child flows?* and *How do I access licenses?*.
- Suggest a description for the flow when editing the flow's details.

> [!IMPORTANT]
> - Copilot is new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.
> - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
> - More information: [Responsible AI FAQs for Power Automate](responsible-ai-overview.md), [Responsible AI FAQ for Copilot in cloud flows](faqs-copilot.md), [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Create a cloud flow using Copilot

Follow these steps to create a flow with Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, select **Home** and begin to describe your scenario.

    *Conversation first* (preview) provides a new way to interact with Copilot in Power Automate. You can go to this experience from the home page by selecting **Chat with Copilot about my idea**, or any of the predefined items above the input field.<!--Kishor, does this belong here?-->

1. Alternatively, you can continue to interact with Copilot by typing what you want your flow to do. You can also select one of the AI generated suggested flow descriptions based on your manual prompt entry.

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. When you're ready to proceed, select **Generate**.

   If you manually enter a prompt and it's vague, Copilot assists you in building it to completion. You can use this stage of the flow building process to ask questions, or further describe what you would like to achieve with your automation.

     :::image type="content" source="./media/create-cloud-flow-using-copilot/vague.png" alt-text="Screenshot of the vague prompt experience, where you can continue building your flow with Copilot.":::

1. Copilot begins to depict the structure of the flow, which it generates based on your prompts. Select **Next** to proceed and verify any connections that are part of the flow are configured correctly.

1. To finalize your flow, configure the required settings.
1. Select **Create flow**.

    The cloud flows designer with Copilot opens with your flow.

    :::image type="content" source="./media/create-cloud-flow-using-copilot/designer-with-copilot.png" alt-text="Screenshot of the cloud flows designer with Copilot that shows your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete the flow setup, ask questions, or make edits to your flow using **Edit with Copilot**.

1. When your flow is complete, select **Save this flow**.

1. Once your flow is saved, we recommend that you test it. Learn how to test your flow in [Test your cloud flow](get-started-with-cloud-flows.md#test-your-cloud-flow).

## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. Copilot lets you try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again.

- For better and more accurate results, provide prompts in *When X happens, do Y* format.
- Be as specific as possible. Instead of a generic prompt like, *I want to process an email*, try this prompt instead: *When an email arrives, I want to post the subject of the email to 'Contoso' Teams General channel*.
- If possible, mention the connector in your prompt. For example, include Outlook, Teams, Forms, or other.
- Try tweaking your prompt to further fine tune.

For more general information about writing prompts with generative AI, go to [The art of the prompt: How to get the best out of generative AI](https://news.microsoft.com/source/features/ai/the-art-of-the-prompt-how-to-get-the-best-out-of-generative-ai/).  

### Examples of interactions with Copilot

This section describes some example scenarios of how you can interact with Copilot.

| From the Home page or Describe it to design it  | Inside canvas   |
|-----------|------------------------------------------------|
| When an email arrives from contoso@gmail.com, post in Teams.  | </li><li>Ask Copilot to edit the flow: **I want to send the email subject to Teams channel.**<br/></li><li>Ask Copilot what your flow does: **What does my flow do?**  |
| When an item is created in SharePoint, send me a mobile notification.  |  </li><li>Edit the flow with this prompt: **I want to send the item title to notification.**<br/></li><li>Edit the flow with this prompt: **I don’t want to receive mobile notification. Send me an email instead.**  |

> [!TIP]
> For more examples you can try out, go to the prompt library in the [Sample Solutions Gallery](https://aka.ms/prompts/powerautomate-copilot).

## Edit a flow using copilot capabilities

In addition to using Copilot to create a flow, you can also use it to configure existing flows. Copilot is available only in the new designer. Learn more in [Overview of cloud flows](overview-cloud.md).

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. Find your flow, select the vertical ellipses (**&vellip;**), and then select **Edit**.
  

    Alternatively, access the cloud flows designer with copilot capabilities from the flow **Details** page of your existing flow by selecting the flow name from **My flows** > **Edit**.

    Your flow opens with the **Copilot** pane on the side. You can now edit your flow by using the cloud flows designer with copilot capabilities. Try typing the following prompts:

   1. Delete action *X*
   1. I want to send an email at the end of the flow with subject equal to the SharePoint file name.
   1. Instead of email, I want to post message on Teams channel.
   1. Check if each of the SharePoint items being returned has a title that equals 'USB', and if so, send an email.

## Troubleshoot in Copilot

The troubleshoot in Copilot feature can assist you in identifying and resolving errors that might occur during testing of cloud flows or when reviewing flow run history. You can use this Copilot feature when the new designer experience is enabled.

Learn more about troubleshooting and watch a video in [Troubleshoot in Copilot](fix-flow-failures.md#troubleshoot-in-copilot).

## Next step

> [!div class="nextstepaction"]
> [Explore the cloud flows designer](flows-designer.md)

## Related information

- [Region availability for Power Automate cloud flows with Copilot](regions-overview.md#region-availability-for-power-automate-cloud-flows-with-copilot)
- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Copilot in cloud flows](faqs-copilot.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
- [Language availability for Power Platform](https://dynamics.microsoft.com/availability-reports/languagereport/)
- [Geographical availability for Power Platform](https://dynamics.microsoft.com/availability-reports/georeport/)
- [Training: Use Copilot in Power Automate (module)](/training/modules/use-copilot-power-automate/)

