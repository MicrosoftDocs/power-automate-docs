---
title: Get started with Copilot in cloud flows
description: Learn how to access and use Copilot in cloud flows.
ms.date: 10/02/2023
ms.custom: bap-template
  - transparency-note
ms.topic: conceptual
author: kisubedi
contributors:
  - kisubedi
  - janPidych
  - v-aangie
ms.author: kisubedi
ms.reviewer: angieandrews
---

# Get started with Copilot in cloud flows

Copilot in cloud flows allows you to create automation that helps streamline your workflow through quick and easy natural language expressions. You can create a flow by describing what you need through multiple steps of conversation. 

The cloud flows copilot can perform the following actions:

- Understand your intent, and create a flow based on the scenario prompt you provide.
- Auto-set up connections on your behalf to get you to a working automation as soon as possible.
- Apply the necessary parameters in the flow based on your prompt.
- Respond to your requests to make changes to your flow, such as update actions and replace actions.
- Answer questions about your flow and product. For example, you can ask Copilot questions about your flow like, *What does my flow do?* You can also ask Copilot product questions like, *How do I access child flows?* and *How do I access licenses?*

> [!IMPORTANT]
> - Copilot is new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it may appear in English rather than your preferred language.
> - This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview).
> - More information: [Responsible AI FAQs for Power Automate](responsible-ai-overview.md), [Responsible AI FAQ for Copilot in cloud flows](faqs-copilot.md), [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Availability by region

You need a Power Platform environment in the following regions to use Copilot in Power Automate cloud flows.

| Region | Copilot availability |
| ------------- | ------------- |
| Preview region | Copilot is enabled by default at the beginning of October 2023, unless it's [turned off by an admin](#how-do-i-disable-copilot-in-the-cloud-flows-designer). |
| Regions with copilot GPUs (United States, Australia, United Kingdom)  | Copilot is enabled by default, unless it's [turned off by an admin](#how-do-i-disable-copilot-in-the-cloud-flows-designer). |
| Europe region excluding France | Starting November, Copilot is enabled in the Europe region (using Sweden and Switzerland GPUs) by default, unless admins manually opt out of the cross-geo data sharing settings from the Power Platform admin center, or turned off by admin. More information: [Enable copilots and generative AI features outside United States and Switzerland](/power-platform/admin/geographical-availability-copilot) and [How do I disable Copilot in the cloud flows designer](#how-do-i-disable-copilot-in-the-cloud-flows-designer). |
| All other regions, including France and Canada, with the exception of Sovereign clouds | Copilot can be enabled by admins from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) by opting to allow cross-geo data sharing setting between the middle of October to the middle of November 2023, based on a rollout schedule for a different area. More information: [Enable copilots and generative AI features outside United States and Switzerland](/power-platform/admin/geographical-availability-copilot) | 
| Sovereign clouds and personal Microsoft account (MSA) users | There's no access for MSA users or Sovereign cloud users to copilot features. You need to use an organization ID and in a non-Sovereign cloud region. |

> [!NOTE]
> If your environment is in the region previously listed and you still don’t see the Copilot in cloud flows experience, contact your admin. An admin can turn the Copilot feature off or on in the Power Platform admin center. In some geographic regions outside the United States, Australia, United Kingdom, an admin needs to turn the cross geo calls on to enable Copilot.
>
> More information: [Availability by region](#availability-by-region)

## Create a flow using the cloud flows designer with Copilot

Follow these steps to create a flow using the cloud flows designer with Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Start to describe your automation scenario.

    As you type, the cloud flows designer with Copilot shows you a list of AI generated suggested flow descriptions.

    Alternatively, you can select **Create** > **Describe it to design it**.

    :::image type="content" source="./media/get-started-with-copilot/copilot-home-example.png" alt-text="Screenshot of the Home page, where you can start building your flow with Copilot.":::

    To learn how to write a good prompt, go to [How to write a good prompt](#how-to-write-a-good-prompt) in this article.

1. Select a suggestion, or use the scenario you created in step 2.
1. To accept the flow that Copilot created for you, select **Next**.

   If you want to see different suggestions, you can update your prompt in this step. Alternatively, if you want to see other options, select **This isn't what I'm looking for**.

1. Review your connected apps and services, and then select **Next**.

1. To finalize your flow, configure the required settings, and then select **Create flow**.

    The cloud flows designer with Copilot opens with your flow.

    :::image type="content" source="./media/get-started-with-copilot/designer.png" alt-text="Screenshot of the cloud flows designer with Copilot that shows your flow.":::

1. On the panel to the right, follow the Copilot suggestions to complete the flow setup, or make edits to your flow using Edit with Copilot.

1. When your flow is complete, select **Save this flow**.

1. Once your flow is saved, we recommend that you test it. Do this by selecting **Test** in the upper-right corner.

## How to write a good prompt

Writing good prompts includes more than just being specific with your request, or saying how you want your results to be displayed. Copilot lets you try out different variations of prompts to help you evaluate what works best. If the initial results aren’t what you’re looking for, try tweaking your prompt and running it again.

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

> [!TIP]
> For more examples you can try out, go to the [Power Platform Prompt Library](https://pnp.github.io/powerplatform-prompts/?filters=power%20automate%20copilot).

## Edit a flow using the designer with copilot capabilities

In addition to using Copilot to create a starting flow, you can also change or complete your existing flows.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. Find your flow, select the vertical ellipses (**&vellip;**), and then select **Edit**.
  
    :::image type="content" source="./media/get-started-with-copilot/copilot-edit.png" alt-text="Screenshot that shows how to edit an existing flow.":::

    Alternatively, access the cloud flows designer with copilot capabilities from the flow **Details** page of your existing flow by selecting the flow name from **My flows** > **Edit**.

    Your flow opens with the **Copilot** pane on the side. You can now edit your flow by using the cloud flows designer with copilot capabilities. Try typing the following prompts:

   1. Delete action *X*
   1. I want to send an email at the end of the flow with subject equal to the SharePoint file name.
   1. Instead of email, I want to post message on Teams channel.
   1. Check if each of the Sharepoint items being returned has a title that equals 'USB', and if so, send an email.

## Frequently asked questions

Use this section to find answers to frequently asked questions.

### Why don’t I see the cloud flow designer with Copilot in my Power Automate experience?

- Check if the environment you’re using is in the copilot available region in the table in the [Availability by region](#availability-by-region) section of this article. Your Microsoft Power Platform admin can help review and verify the region.
- Ask your admin if they've requested Microsoft Support to disable the Copilot, if the region is supposed to enable Copilot by default.
- Ask your admin if they've enabled Copilot by toggling on **Allow data movement for generative AI features** from the Power Platform admin center. To learn more, go to [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

### How do I enable Copilot?

If you're not in the region (listed in the previous [Availability table](#availability-by-region)) where Copilot is enabled by default, your admin can enable Copilot for an environment from the Power Platform admin center by consenting to data movement. To learn more, go to [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

### How do I disable Copilot in the cloud flows designer?

Please refer to the [table in Availability by region](#availability-by-region) - If you aren't in the region with GPUs (infrastructure to support Copilot), you can simply toggle off the cross-geo data sharing settings from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). However, If you're in the region with native GPUs with Copilot on by default, you can disable Copilot for your tenant by contacting Microsoft Support. You can disable and re-enable at tenant level easily using a PowerShell script.

### How is Copilot in cloud flows different from the text generation model in AI Builder?

Copilot in cloud flows is designed to help you create and edit Power Automate flows just by describing them in everyday language, providing helpful guidance along the way.

The text generation model in AI Builder lets you use the GPT model directly in your Power Automate flows and Power Apps apps for various scenarios such as text summarization, draft responses, classify text, and more.  

To learn more, go to [Text generation model overview (preview)](/ai-builder/prebuilt-azure-openai).

### What are the limitations of the cloud flows designer with the copilot experience?

You can’t edit flows in the cloud flows designer with the copilot experience if your flow has any of the following flows capabilities:

- A non-Open API flow (older connection format).

    > [!TIP]
    > If there's Peek code on an action and if you see the `methods` parameter, it's a non-Open API flow.

- A flow with a comment.
- A flow contains an unsupported hybrid trigger. Hybrid triggers don't require connections, and are triggered manually from outside of Power Automate. The hybrid triggers, which won't be supported are: When a record is selected (Dataverse), When a flow step is run from business process flows (Dataverse), For a selected message (v2 Teams), Teams On Compose Message (teams), Teams card trigger, and Microsoft 365 Compliance Connector.
- A flow contains a Power Apps V1 trigger.
- A flow contains Perform a Changeset Request (Dataverse)
- A flow contains a Power Pages component.
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use [connection reference](/power-apps/maker/data-platform/create-connection-reference#manually-add-a-connection-reference-to-a-solution-using-solution-explorer) instead.

You can’t use the cloud flows designer with Copilot if you’re using a personal Microsoft account. For example, you can’t use someone@live.com. Use a work or school account like someone@contoso.com instead.

The cloud flows Copilot supports English language only for models.

### There are some missing functionalities in the cloud flows designer with copilot capabilities. What do I do?

If you want to work with missing functionalities in the designer, go to [Limitation](flows-designer.md#limitation) for details.

### What licenses do I need to access Copilot in Power Automate cloud flows?

You need a standalone Power Automate license, or a seeded M365 license, or PowerApps/Dynamics license, to access and use Copilot. MSA users (@microsoft.com) without an org id won't be able to use the experience.


### See also

- [Responsible AI FAQs for Power Automate](responsible-ai-overview.md)
- [FAQ for Copilot in cloud flows](faqs-copilot.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
