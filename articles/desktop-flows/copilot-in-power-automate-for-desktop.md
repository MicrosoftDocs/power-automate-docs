---
title: Get started with copilot in Power Automate for desktop
description: Learn how to access and use copilot in Power Automate for desktop flows.
ms.date: 11/13/2023
ms.topic: how-to
author: cochamos
ms.author: cochamos
ms.reviewer: angieandrews
---
# Copilot in Power Automate for desktop (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The copilot generative answers capability in Power Automate for desktop provides answers to product-related questions. Type your question or select one from the predefined prompts, and the copilot finds the answer for you. You can access this feature from both the console and the designer.

> [!IMPORTANT]
>
> - This feature is in preview.
> - Copilot is a new technology that is still in development. It's optimized for use with the English language and has limited support with other languages.
> - Copilot’s generative answers capability is powered by the Azure OpenAI Service and Bing Search.
> - To understand the capabilities and limitations of this feature, go to [FAQ for copilot generative answers in Power Automate for desktop](../faqs-copilot-generative-answers-power-automate-desktop.md)

## Prerequisites

### Availability by region

Currently, copilot in Power Automate for desktop is only available in environments located in the United States.

### Availability by account type

Currently, copilot in Power Automate for desktop is only available for users with a work or school account.

> [!NOTE]
> If your environment is in a supported region, you are signed in with a work or school account, and you still can't see the copilot in Power Automate for desktop experience, contact your Power Platform administrator. They might have turned off the copilot functionality.

## How to use copilot to get answers to product-related questions

Access the generative answers capability from the console by selecting **Copilot** located on the top right corner of the console window.

:::image type="content" source="media/pad_generative_answers/copilot_console1.png" alt-text="Screenshot that shows where to select the copilot in Power Automate for desktop button.":::

Alternatively, you can also access the generative answers capability from the designer’s vertical menu on the right.

:::image type="content" source="media/pad_generative_answers/copilot_designer1.png" alt-text="Screenshot that shows the alternative location to use copilot in Power Automate for desktop designer.":::

In the **Copilot** pane, ask any product-related questions or use one of the proposed prompts to get you started.

:::image type="content" source="media/pad_generative_answers/copilot_designer_2.gif" alt-text="Animated gif that shows the copilot answering a user's question from the designer.":::

The answer generated contains a link to the documentation page to refer you to additional information. Make sure that you always review AI-generated content.

## Prevent your users from using the copilot's generative answers capability

To prevent users from using the copilot’s generative answers capability, Power Platform administrators turn off the **Copilot help assistance in Power Automate via Bing** setting in the Power Platform admin center.

## Help us improve this feature

You can send feedback by selecting the thumb up or thumb down icon underneath the AI-generated content. Once you do, a dialog box appears, which you can use to submit feedback to Microsoft.

:::image type="content" source="media/pad_generative_answers/feedback_dialog1.png" alt-text="Image that shows where you can send your feedback about copilot in Power Automate for desktop.":::

> [!NOTE]
> If you can't see the dialog box, your Power Platform admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

## Disabling the user feedback functionality

As a Power Platform admin you can prevent users from sending feedback to Microsoft by disabling the **disableSurveyFeedback** tenant setting. More information:

- [List tenant settings (preview)](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)
- [Set TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)

## Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home?#/homepage), and then selecting **Health** > **Product feedback**.

## See also

- [FAQ for Generative Answers in Power Automate for desktop](../faqs-copilot-generative-answers-power-automate-desktop.md)
- [Responsible AI FAQs for Power Automate](../responsible-ai-overview.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
