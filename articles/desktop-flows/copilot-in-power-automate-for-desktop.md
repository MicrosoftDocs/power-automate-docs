---
title: Get started with Copilot in Power Automate for desktop
description: Learn how to access and use Copilot in desktop flows.
ms.date: 11/01/2023
ms.topic: Copilot
author: cochamos
ms.author: cochamos
ms.reviewer: pending
---

# Copilot in Power Automate for desktop


[This article is prerelease documentation and is subject to change.]


Copilot’s generative answers capability in Power Automate for desktop provides answers to product-related questions. Just type your question or select one from the predefined prompts, and the Copilot will find the answer for you. You can access this feature from both the console and the designer.


> [!IMPORTANT]
> - This feature is in preview. 
> - Copilot is a new technology that is still in development. It is optimized for use with the English language and has limited support with other languages.
> - Copilot’s generative answers capability is powered by the Azure OpenAI Service and Bing Search.
> - To understand the capabilities and limitations of this feature, see [Responsible AI FAQ for Copilot in Power Automate for desktop](faqs-copilot.md)

## Availability by region

Currently, Copilot in Power Automate for desktop is only available in environments located in the US.

## Availability by account type

Currently, Copilot in Power Automate for desktop is only available for users with a work or school account.

**Note:** If your environment is in the region listed above, you are signed in with a work or school account, and you still cannot see the Copilot in Power Automate for desktop experience, contact your tenant administrator. They might have turned off the Copilot functionality.

## How to use Copilot to get answers to product-related questions 

You can access the generative answers capability from the console by clicking the Copilot button, located in the top right corner of the console window, as shown in the image below: 

:::image type="content" source=".media/pad_generative_answers/copilot_console1.png" alt-text="Screenshot that shows the generative answwers in Power Automate for desktop console.":::

In addition, you can also access the generative answers capability from the designer’s vertical menu on the right, as shown in the image below: 

:::image type="content" source=".media/pad_generative_answers/copilot_designer1.png" alt-text="Screenshot that shows the generative answwers in Power Automate for desktop designer.":::

In the Copilot window, you can ask any product-related questions or use one of our pre-made prompts to get you started. 
:::image type="content" source=".media/pad_generative_answers/copilot_designer_2.gif" alt-text="Animated gif that shows the Copilot answering a user's question from the designer.":::

The answer generated will contain a link to the documentation page that you can refer to if you need additional information. Make sure that you always review AI-generated content.


## Prevent your users from using the Copilot's generative answers capability

To prevent your users from using the Copilot’s generative answers capability, you can toggle off the “Copilot help assistance in Power Automate via Bing” setting in the power platform admin center. 
**Note:** You need to be a tenant administrator to access the settings

## Help us improve this feature

You can send feedback by pressing the thumbs-up or thumbs-down icons underneath the AI-generated content. Once you do, a feedback dialog will appear, which you can use to submit feedback to Microsoft.
:::image type="content" source=".media/pad_generative_answers/feedback_dialog1.png" alt-text="Animated gif that shows the Copilot answering a user's question from the designer.":::

**Note:** If you cannot see the dialog, your tenant admin might have turned it off.

## Disabling the user feedback functionality
As a tenant admin you can prevent your users from sending feedback to Microsoft by disabling the “disableSurveyFeedback” Tenant setting. You can find more information about viewing and setting tenant settings here: 
- [List tenant settings (preview)](https://learn.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)
- [Set TenantSettings](https://learn.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)

## Data subject rights requests on user feedback
Organization administrators can view, export, and delete the feedback from their users by signing in to the [M365 admin center](https:\\admin.microsoft.com) and navigating to the “Health > Product feedback” menu. 

### See also

- [FAQ for Generative Answers in Power Automate for desktop](/faqs-copilot-generative-answers-power-automate-desktop.md)
- [Responsible AI FAQs for Power Automate](/responsible-ai-overview.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)
