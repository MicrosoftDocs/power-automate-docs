---
title: Repair Flow Automation Errors (preview)
description: Users can automatically or manually fix errors in UI elements that can't be located during the execution of a UI or browser automation task.
ms.date: 12/12/2024
ms.topic: how-to
author: nikosmoutzourakis
ms.author: nimoutzo
ms.reviewer: null
ms.collection: bap-ai-copilot
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:12/12/2024
---

# Repair flow automation errors (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This feature uses Copilot to find and repair the selectors of the required UI elements on your screen.
Users simply need to review and approve Copilot's suggestions. Alternatively, users can manually indicate the UI elements on their screen, and Power Automate for Desktop adjusts the selectors accordingly.

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

> [!NOTE]
> If your environment is in a supported region, you're signed in with a work or school account, and you still can't "Repair with Copilot" in the Power Automate for desktop experience, contact your Power Platform administrator. An admin can turn Copilot off or on in the Power Platform admin center.

## Repair a flow at runtime

### How to turn on the feature

- Install the latest Power Automate for desktop build.
- Enable the use of AI for self-healing issues. The "Repair at runtime" flag in PPAC must also be enabled.
- For repairing with Copilot, ensure the Copilot flag in Power Platform Admin Center (PPAC) is enabled.
- For newly created flows, enable the "Repair flow errors" option.
- For existing flows, navigate to the respective desktop flow properties in the Power Automate for desktop console. Enable the "Repair flow errors" property in the desktop flow's properties.
  - **Repair with Copilot**: This option allows for automated issue resolution with the assistance of Copilot.
  - **Repair**: This option enables manual issue resolution, requiring you to specify the UI element on the screen at the moment of failure during runtime.

:::image type="content" source="media/repair-with-copilot/repair_flow_properties.png" alt-text="Screenshot for enabling feature in flow properties.":::

### Attended experience step-by-step

The feature is triggered when a cloud flow initiates a desktop flow that's on the verge of failing. This potential failure is due to a UI or browser automation action encountering an error because the UI element intended for interaction can't be located using one or more preconfigured selectors. Next, a "Repair with Copilot" notification window appears on the screen. Copilot then attempts to find the necessary UI element by analyzing the UI elements present on the relevant screen or web page. Selecting Cancel stops the entire process and the action fails, which means that the desktop flow fails (or activates the error handling mechanism of the failed action). Select **Repair manually**, and you indicate the required UI element manually on the screen by capturing it.

:::image type="content" source="media/repair-with-copilot/repair_wait_for_copilot.png" alt-text="Copilot is trying to locate the UI element.":::

> [!NOTE]
> The timer is set to 15 minutes from the initial display of the notification window. You can reset the timer at any point within this period to restart the 15-minute countdown.

#### Repair with Copilot

When Copilot locates the UI element successfully, the options are:

- **Apply for every run**: The newly identified selector is added to the selectors list for the UI element, positioned as the last in order. The desktop flow is updated with this new selector, ensuring that in future runs, the suggested selector is included in the list for this UI element.
- **Apply Once**: The suggested selector is accepted for this run only. The new selector is added to the UI element's selector list and used for this execution, but isn't saved for future runs.
- **Repair Manually**: You reject the Copilot suggestion and must manually identify and capture the required UI element on the screen.
- **Cancel or Close**: You reject the suggestion, causing the desktop flow to fail or trigger the error handling mechanism for the failed action.

If you accept the suggestion, the notification window closes, and the action successfully interacts with the correct UI element.

Check the UI element suggested by Copilot by selecting the **Target** button on the screen.

:::image type="content" source="media/repair-with-copilot/repair_copilot_suggestion.png" alt-text="Screenshot showing Copilot located the UI element successfully.":::

When the AI service can't locate the UI element successfully, you're prompted to locate the UI element manually. You can cancel the repair, and the desktop flow fails (or activates the error handling mechanism of the failed action).

:::image type="content" source="media/repair-with-copilot/repair_copilot_cannot find.png" alt-text="Screenshot showing Copilot couldn't locate the UI element.":::

### Repair manually

You can also repair the issue manually. Similar to the previous method, a notification window appears at runtime, prompting you to capture the UI element using Power Automate for Desktop's highlighter. To initiate this process, select the "Repair" button in the notification window, which enables the highlighter. Next, hover over the necessary UI element on your screen and press "Ctrl" along with a left-click to capture it.

The manual repair experience is also triggered if Copilot can't locate the UI element or if you select the "Repair manually" option from the notification window's drop-down menu.

:::image type="content" source="media/repair-with-copilot/repair_manual.png" alt-text="Screenshot of user capturing the required UI element manually.":::

### Known limitations

- This feature is available only in attended and unattended executions through the portal (cloud flow).
- This feature is available only in desktop flows saved in Schema v2.
- This feature is available only in the US region.
- The feature doesn't handle UI elements in virtual desktops.
- The feature doesn't support PictureInPicture executions.
- The feature doesn't support child flow execution.
- The feature doesn't support UI element collections.
- The feature can't apply to selectors that contain one or more variables.
- Drag-and-drop actions aren't supported at this phase.
- The "Apply for every run" option uses the user identity logged into the Power Automate for desktop console. If no user is signed into the console, the option isn't available.

## Help us improve this feature

To send feedback, select the thumbs up or thumbs down icon under the AI-generated content. A feedback dialog appears, allowing you to submit feedback to Microsoft. Learn more about how this data is used and your rights in [Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control).

> [!NOTE]
> If you can't see the feedback dialog, check if your tenant admin [turned it off](#turn-off-user-feedback-functionality).

### Turn off user feedback functionality

As a tenant admin, you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Learn more about viewing and setting tenant settings at [Get-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings) and [Set-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com) and selecting **Health** > **Product feedback**.
