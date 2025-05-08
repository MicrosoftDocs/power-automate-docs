---
title: Get started with Copilot in cloud flows
description: Learn how to access and use Copilot in cloud flows.
ms.date: 04/28/2025
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
ms.author: lali
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot 
---

# Get started with Copilot in cloud flows

Copilot in cloud flows allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation.

The cloud flows copilot can perform the following actions:

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

## Availability by region

You need a Power Platform environment in the following regions to use Copilot in Power Automate cloud flows.

| Region | Copilot availability |
| ------------- | ------------- |
| Preview region | Copilot is enabled by default at the beginning of October 2023, unless [an admin turns it off](#how-do-i-disable-copilot-in-the-cloud-flows-designer). |
| Regions with copilot GPUs (United States, Australia, United Kingdom, India)  | Copilot is enabled by default, unless [an admin turns it off](#how-do-i-disable-copilot-in-the-cloud-flows-designer). |
| Europe and all other regions, including France and Canada | Copilot is enabled in the Europe region (using Sweden and Switzerland GPUs) by default, unless admins manually opt out of cross-geo data sharing settings from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). More information: [Turn on copilots and generative AI features](/power-platform/admin/geographical-availability-copilot#turn-on-copilots-and-generative-ai-features-1)
| Personal Microsoft service account (MSA) users | There's no access for MSA users to Copilot features. You need to use an organization ID and in a non-Sovereign cloud region. |
|Sovereign clouds for US government (GCC)  | Copilot is enabled by default unless [an admin turns it off](#how-do-i-disable-copilot-in-the-cloud-flows-designer).  |

> [!NOTE]
> If your environment is in the region previously listed and you still don’t see the Copilot in cloud flows experience, contact your admin. An admin can turn the Copilot feature off or on in the Power Platform admin center. In some geographic regions outside the United States, Australia, United Kingdom, an admin needs to turn the cross geo calls on to enable Copilot.
>
> More information: [Availability by region](#availability-by-region)

## Create a flow using the cloud flows designer with Copilot

Follow these steps to create a flow using the cloud flows designer with Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, select **Home** and begin to describe your scenario.

    *Conversation first* (preview) provides a new way to interact with Copilot in Power Automate. You can go to this experience from the home page by selecting **Chat with Copilot about my idea**, or any of the predefined items above the input field.

1. Alternatively, you can continue to interact with Copilot by typing what you want your flow to do. You can also select one of the AI generated suggested flow descriptions based on your manual prompt entry.

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. When you're ready to proceed, select **Generate**.

   If you manually enter a prompt and it's vague, Copilot assists you in building it to completion. You can use this stage of the flow building process to ask questions, or further describe what you would like to achieve with your automation.

     :::image type="content" source="./media/get-started-with-copilot/vague.png" alt-text="Screenshot of the vague prompt experience, where you can continue building your flow with Copilot.":::

1. Copilot begins to depict the structure of the flow, which it generates based on your prompts. Select **Next** to proceed and verify any connections that are part of the flow are configured correctly.

1. To finalize your flow, configure the required settings.
1. Select **Create flow**.

    The cloud flows designer with Copilot opens with your flow.

    :::image type="content" source="./media/get-started-with-copilot/designer-with-copilot.png" alt-text="Screenshot of the cloud flows designer with Copilot that shows your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete the flow setup, ask questions, or make edits to your flow using **Edit with Copilot**.

1. When your flow is complete, select **Save this flow**.

1. Once your flow is saved, we recommend that you test it. Do this by selecting **Test** in the upper-right corner.

## Troubleshoot in Copilot

The new troubleshoot in Copilot feature can assist you in identifying and resolving errors that might occur during testing of cloud flows or when reviewing flow run history. You can use this Copilot feature when the new designer experience is enabled.

To learn more, go to [Troubleshoot in Copilot](fix-flow-failures.md#troubleshoot-in-copilot).

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

## Edit a flow using the designer with copilot capabilities

In addition to using Copilot to create a starting flow, you can also change or complete your existing flows.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. Find your flow, select the vertical ellipses (**&vellip;**), and then select **Edit**.
  

    Alternatively, access the cloud flows designer with copilot capabilities from the flow **Details** page of your existing flow by selecting the flow name from **My flows** > **Edit**.

    Your flow opens with the **Copilot** pane on the side. You can now edit your flow by using the cloud flows designer with copilot capabilities. Try typing the following prompts:

   1. Delete action *X*
   1. I want to send an email at the end of the flow with subject equal to the SharePoint file name.
   1. Instead of email, I want to post message on Teams channel.
   1. Check if each of the SharePoint items being returned has a title that equals 'USB', and if so, send an email.

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### Why don’t I see the cloud flow designer with Copilot in my Power Automate experience?

- Check if the environment you’re using is in the copilot available region in the table in the [Availability by region](#availability-by-region) section of this article. Your Microsoft Power Platform admin can help review and verify the region.
- Ask your admin if they requested Microsoft Support to disable the Copilot, if the region is supposed to enable Copilot by default.
- Ask your admin if they enabled Copilot by toggling on **Allow data movement for generative AI features** from the Power Platform admin center. To learn more, go to [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

### How do I enable Copilot?

If you're not in the region listed in the table in the [Availability by region](#availability-by-region) section where Copilot is enabled by default, your admin can enable Copilot for an environment from the Power Platform admin center by consenting to data movement. To learn more, go to [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

### How do I disable Copilot in the cloud flows designer?

Refer to the table in the [Availability by region](#availability-by-region) section in this article. If you aren't in the region with GPUs (infrastructure to support Copilot), you can toggle off the cross-geo data sharing settings from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). However, If you're in the region with native GPUs with Copilot on by default, you can disable Copilot for your tenant by contacting Microsoft Support. You can disable and re-enable at tenant level easily using a PowerShell script.

### How is Copilot in cloud flows different from the text generation model in AI Builder?

Copilot in cloud flows is designed to help you create and edit Power Automate flows just by describing them in everyday language, providing helpful guidance along the way.

The text generation model in AI Builder lets you use the GPT model directly in your Power Automate flows and your apps built in Power Apps for various scenarios such as text summarization, draft responses, classify text, and more.  

To learn more, go to [Text generation model overview (preview)](/ai-builder/prebuilt-azure-openai).

### What are the limitations of the cloud flows designer with the copilot experience?

You can’t edit flows in the cloud flows designer with the Copilot experience if your flow has any of the following flows capabilities:

- A non-Open API flow (older connection format).

    > [!TIP]
    > If there's Peek code on an action and if you see the _APIConnection_ value instead of _OpenAPIConnection_ in Kind field, it's a non-Open API flow. 

- A flow with a comment.
- A flow contains an unsupported hybrid trigger. Hybrid triggers don't require connections, and are triggered manually from outside of Power Automate. The hybrid triggers, which aren't supported are:
   - When a flow is run from business process flow (Dataverse).
   - For a selected message (v2 Teams). We plan to enable worldwide by July end.
   - Teams On Compose Message (Teams). We plan to enable worldwide by July end.
   - Microsoft 365 Compliance Connector.
- A flow contains a Power Apps V1 trigger.
- A flow contains Perform a Changeset Request (Dataverse).
- A flow contains a Power Pages component.
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use [connection reference](/power-apps/maker/data-platform/create-connection-reference#manually-add-a-connection-reference-to-a-solution-using-solution-explorer) instead.
  - Email auto-complete suggestions in Send Email/Post message in Teams actions.
  - HTML editor in Send Email action.
  - Copy/Paste supporting Scope, Condition, Do until constructs.
  - Ability to make manual trigger fields optional.

You can’t use the cloud flows designer with Copilot if you’re using a personal Microsoft account. For example, you can’t use someone@live.com. Use a work or school account like someone@contoso.com instead.

The cloud flows Copilot supports English language only for models.

### There are some missing functionalities in the cloud flows designer with copilot capabilities. What do I do?

As we continue to innovate, we're introducing a new designer alongside our classic designer. While the classic designer remains valuable, the new designer is our future direction. While the classic designer isn't supported indefinitely, the new designer is gradually becoming the primary interface.

If you prefer to access features not yet available in the new designer, or encounter any limitations or known issues, you can temporarily revert to the classic designer. To do this, turn off the **New designer** toggle on the menu in the cloud flows designer.

:::image type="content" source="./media/get-started-with-copilot/designer-toggle.svg" alt-text="Screenshot of the 'New designer' toggle.":::

### Why do I get this error "O.split(...).at is not a function" when signing in?

Power Automate designer doesn't support browsers that are more than two (2) years old. You could see the previously mentioned or similar errors in the designer if your browser version isn't current. It's generally a good idea to update your browser to latest version to avoid such issues.

### Why do I get this error "The provided flow name contains invalid characters" when importing a flow in a new tenant?

This is a temporary gap, which you can work around by adding a query parameter `v3=false` in your URL.

### Why do I not see dynamic content from triggers like 'When a response is submitted' or why is the flow automatically putting an unnecessary loop?

This might be because of a temporary issue where the **Split On** setting of the trigger is off. If you enable the setting, the issue should go away.

1. On the action configuration pane, select the **Settings** tab.
1. Under the **Split On** heading, move the toggle to **On**.

### What licenses do I need to access Copilot in Power Automate cloud flows?

You need a standalone Power Automate license, or a seeded Microsoft 365 license, or PowerApps/Dynamics license, to access and use Copilot. MSA users (@microsoft.com) without an org ID aren't able to use the experience.

## Related information

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Copilot in cloud flows](faqs-copilot.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
- [Language availability for Power Platform](https://dynamics.microsoft.com/availability-reports/languagereport/)
- [Geographical availability for Power Platform](https://dynamics.microsoft.com/availability-reports/georeport/)
- [Training: Use Copilot in Power Automate (module)](/training/modules/use-copilot-power-automate/)
