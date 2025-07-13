---
title: "FAQ about Copilot in cloud flows"
description: FAQ about Copilot in cloud flows in Power Automate.
author: kewaiss
ms.topic: faq
ms.date: 07/14/2025
ms.subservice: end-user
ms.author: kewaiss
ms.custom: ""
ms.reviewer: angieandrews
contributors:
- kewaiss
- v-aangie
---

# Frequently asked questions about Copilot in cloud flows

This article answers frequently asked questions about Copilot in cloud flows.

## Why don’t I see the cloud flow designer with Copilot in my Power Automate experience?

- Check if the environment you’re using is in the copilot available region in the table in the [Availability by region](#availability-by-region) section of this article. Your Microsoft Power Platform admin can help review and verify the region.
- Ask your admin if they requested Microsoft Support to disable the Copilot, if the region is supposed to enable Copilot by default.
- Ask your admin if they enabled Copilot by toggling on **Allow data movement for generative AI features** from the Power Platform admin center. To learn more, go to [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

## How do I enable Copilot?

If you're not in the region listed in the table in the [Availability by region](#availability-by-region) section where Copilot is enabled by default, your admin can enable Copilot for an environment from the Power Platform admin center by consenting to data movement. Learn more in [Enable copilots and generative AI features](/power-platform/admin/geographical-availability-copilot).

## How do I disable Copilot in the cloud flows designer?

Refer to the table in the [Availability by region](#availability-by-region) section in this article. If you aren't in the region with GPUs (infrastructure to support Copilot), you can toggle off the cross-geo data sharing settings from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). However, If you're in the region with native GPUs with Copilot on by default, you can disable Copilot for your tenant by contacting Microsoft Support. You can disable and re-enable at tenant level easily using a PowerShell script.

## How is Copilot in cloud flows different from the text generation model in AI Builder?

Copilot in cloud flows is designed to help you create and edit Power Automate flows just by describing them in everyday language, providing helpful guidance along the way.

The text generation model in AI Builder lets you use the GPT model directly in your Power Automate flows and your apps built in Power Apps for various scenarios such as text summarization, draft responses, classify text, and more.  

To learn more, go to [Text generation model overview (preview)](/ai-builder/prebuilt-azure-openai).

## What are the limitations of the cloud flows designer with the copilot experience?

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

## There are some missing functionalities in the cloud flows designer with copilot capabilities. What do I do?

As we continue to innovate, we're introducing a new designer alongside our classic designer. While the classic designer remains valuable, the new designer is our future direction. While the classic designer isn't supported indefinitely, the new designer is gradually becoming the primary interface.

If you prefer to access features not yet available in the new designer, or encounter any limitations or known issues, you can temporarily revert to the classic designer. To do this, turn off the **New designer** toggle on the menu in the cloud flows designer.

:::image type="content" source="./media/faq-copilot-cloud-flows/designer-toggle.png" alt-text="Screenshot of the 'New designer' toggle.":::

## Why do I get this error "O.split(...).at is not a function" when signing in?

Power Automate designer doesn't support browsers that are more than two (2) years old. You could see the previously mentioned or similar errors in the designer if your browser version isn't current. It's generally a good idea to update your browser to latest version to avoid such issues.

## Why do I get this error "The provided flow name contains invalid characters" when importing a flow in a new tenant?

This is a temporary gap, which you can work around by adding a query parameter `v3=false` in your URL.

## Why do I not see dynamic content from triggers like 'When a response is submitted' or why is the flow automatically putting an unnecessary loop?

This might be because of a temporary issue where the **Split On** setting of the trigger is off. If you enable the setting, the issue should go away.

1. On the action configuration pane, select the **Settings** tab.
1. Under the **Split On** heading, move the toggle to **On**.

## What licenses do I need to access Copilot in Power Automate cloud flows?

You need a standalone Power Automate license, or a seeded Microsoft 365 license, or PowerApps/Dynamics license, to access and use Copilot. MSA users (@microsoft.com) without an org ID aren't able to use the experience.
