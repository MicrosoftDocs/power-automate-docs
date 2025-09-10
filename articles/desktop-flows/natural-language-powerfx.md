---
title: Natural language to Power Fx (preview)
description: Learn about using Power Fx for creating expressions in desktop flows.
author: nikosmoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/08/2025
ms.author: nimoutzo
ms.reviewer: dmartens
contributors: 
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---


# Natural language to Power Fx (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This feature uses Copilot to generate [Power Fx](power-fx.md) expressions from your natural language prompts. You can review, modify, and insert Copilot's suggestions directly into your desktop flow.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Copilot is a new technology that's still being developed. It's optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.

## Prerequisites

### Availability by region

Copilot in Power Automate for desktop offers different capabilities, which are available in environments located in the following countries/regions:

- United States

### Availability by account type

Copilot in Power Automate for desktop is only available for users with a work or school account.

## Create Power Fx expressions using Copilot

The natural language to Power Fx feature in Power Automate for desktop lets users generate Power Fx expressions by using plain language prompts. This enhancement simplifies the process of creating expressions, especially for users who aren't familiar with Power Fx syntax.

> [!NOTE]
> This feature is available only in desktop flows where Power Fx is enabled.

To use the natural language to Power Fx feature, select the Copilot button next to any input parameter that supports Power Fx expressions. This action opens the natural language to Power Fx pop-up window. 

:::image type="content" source="media\natural-language-powerfx\open-draft-formula-button.png" alt-text="Screenshot of the Set variable dialog highlighting the button for opening the Draft formula window.":::

In the window, type a prompt in natural language that describes the desired logic or transformation. When you finish entering the prompt, select **Generate** to create a Power Fx expression. While Copilot is generating the expression, you can cancel the operation by selecting **Stop generating**. 

When Copilot returns a suggestion, you can insert it directly into the parameter’s value (1). If the suggestion isn't satisfactory, you can ask Copilot to regenerate it (2). 

:::image type="content" source="media\natural-language-powerfx\insert-reset-buttons.png" alt-text="Screenshot of the Draft formula dialog with the Insert and reset buttons highlighted.":::

If Copilot can't generate a suggestion, you can either retry with the same prompt or enter a new one to refine the request.

## Help us improve this feature

To send feedback, select the thumbs up or thumbs down icon under the AI-generated content. A feedback dialog appears, allowing you to submit feedback to Microsoft. Learn more about how this data is used and your rights in [Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control).

> [!NOTE]
> If you can't see the feedback dialog, check if your tenant admin [turned it off](#turn-off-user-feedback-functionality).

### Turn off user feedback functionality

As a Power Platform admin, you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Learn more about viewing and setting tenant settings at [Get-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings) and [Set-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings).

### Data subject rights requests on user feedback

Admins can view, export, and delete feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com) and selecting **Health** > **Product feedback**.
