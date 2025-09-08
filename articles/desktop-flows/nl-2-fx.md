---
title: Natural language in Power Fx (preview)
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


# Natural Language to Power Fx  (preview)
[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This feature uses Copilot to suggest the appropriate Power Fx expression. Users simply need to review and approve Copilot's suggestions by inserting them in the flow.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Copilot is a new technology that's still being developed. It's optimized for use with English language and has limited support with other languages. As such, parts of it might appear in English rather than your preferred language.

## Prerequisites

### Availability by region

Copilot in Power Automate for desktop offers different capabilities, which are available in environments located in the following countries/regions:

- United States

### Availability by account type

Currently, Copilot in Power Automate for desktop is only available for users with a work or school account.

## Natural Language to Power Fx (NL2Fx)
The Natural Language to Power Fx feature in Power Automate for Desktop empowers users to generate Power Fx expressions using plain language prompts. This enhancement simplifies the process of creating expressions, especially for users who may not be familiar with Power Fx syntax.

> [!NOTE]
> This feature is available only in desktop flows where Power Fx is enabled.

To use the NL2Fx feature, the user begins by clicking the Copilot button next to any input parameter that supports Power Fx expressions. This action opens the NL2Fx pop-up window. 

:::image type="content" source="media/power-fx/nl2fx_open_textbox.png" alt-text="Open the NL2Fx pop up window":::

In the window, the user types a prompt in natural language describing the desired logic or transformation. Once the prompt is entered, the user clicks the Generate button to initiate the creation of a Power Fx expression. 
While Copilot is generating the expression, the user has the option to cancel the operation by clicking the Stop generating button. 

When Copilot returns a suggestion, the user can choose to insert it directly into the parameter’s value (1). If the suggestion is not satisfactory, the user can ask Copilot to regenerate it (2). 
:::image type="content" source="media/power-fx/nl2fx_handle_output.png" alt-text="Handle Copilot's suggestion":::

In cases where Copilot cannot generate a suggestion, the user may either retry with the same prompt or enter a new one to refine the request.

## Help us improve this feature

To send feedback, select the thumbs up or thumbs down icon under the AI-generated content. A feedback dialog appears, allowing you to submit feedback to Microsoft. Learn more about how this data is used and your rights in [Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control).

> [!NOTE]
> If you can't see the feedback dialog, check if your tenant admin [turned it off](#turn-off-user-feedback-functionality).

### Turn off user feedback functionality

As a tenant admin, you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Learn more about viewing and setting tenant settings at [Get-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings) and [Set-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com) and selecting **Health** > **Product feedback**.
