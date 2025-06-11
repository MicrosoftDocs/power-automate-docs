---
title: Repair Flow Automation Errors (preview)
description: Users can automatically or manually fix errors in UI elements that aren't located during the execution of a UI or browser automation task.
ms.date: 04/01/2025
ms.topic: how-to
author: nikosmoutzourakis
ms.author: nimoutzo
ms.reviewer: null
ms.collection: bap-ai-copilot
contributors:
- rpapostolis
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:12/12/2024
---

# Repair flow automation errors (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This feature uses Copilot to find and repair the selectors of the required UI elements on the screen.
Users simply need to review and approve Copilot's suggestions. Alternatively, users can manually indicate the UI elements on the screen, and Power Automate for Desktop adjusts the selectors accordingly.

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
> If the environment is in a supported region, you're signed in with a work or school account, and you still can't use "Repair with Copilot" in the Power Automate for desktop experience, contact the Power Platform administrator. An admin can turn Copilot off or on in the Power Platform admin center.

## Repair a flow at runtime

### How to turn on the feature

- You need Power Automate desktop version 2.51 (11.2412.xxx.y) or higher. Learn how to download the latest version at [Install Power Automate](https://aka.ms/DownloadPAD48).
- For repairing with Copilot, ensure the Copilot setting in the Power Platform Admin Center is turned on.
- Turn on the use of AI for self-healing issues. The **Repair at runtime** setting for the desired run mode (`attended` and `unattended`) can be found under the **Desktop flow repair at runtime configuration** setting in the Power Platform admin center.

    :::image type="content" source="media/repair-with-copilot/repair-with-copilot-ppac-setting.png" alt-text="Screenshot of repair at runtime setting for the respective run mode." lightbox="media/repair-with-copilot/repair-with-copilot-ppac-setting.png":::

- For newly created flows, turn on the **Repair flow errors** option.
- For existing flows, navigate to the respective desktop flow properties in the Power Automate for desktop console. Turn on the **Repair flow errors** property in the desktop flow's properties.

  - **Repair with Copilot**: This option allows for automated issue resolution with the assistance of Copilot.
  - **Repair**: This option turns on manual issue resolution, requiring you to specify the UI element on the screen at the moment of failure during runtime.

:::image type="content" source="media/repair-with-copilot/repair_flow_properties.png" alt-text="Screenshot for turning on the feature in flow properties.":::

### Attended experience step-by-step

The feature triggers when a cloud flow initiates a desktop flow that's on the verge of failing. This potential failure occurs because a UI or browser automation action encounters an error when the UI element intended for interaction isn't located using one or more preconfigured selectors. Next, a "Repair with Copilot" notification window appears on the screen. Copilot then attempts to find the necessary UI element by analyzing the UI elements present on the relevant screen or web page. Selecting Cancel stops the entire process and the action fails, which means that the desktop flow fails (or activates the error handling mechanism of the failed action). Select **Repair manually**, and you indicate the required UI element manually on the screen by capturing it.

:::image type="content" source="media/repair-with-copilot/repair_wait_for_copilot.png" alt-text="Copilot is trying to locate the UI element.":::

> [!NOTE]
> The timer is set to 15 minutes from the initial display of the notification window. Reset the timer at any point within this period to restart the 15-minute countdown.

#### Repair with Copilot

When Copilot locates the UI element successfully, the options are:

- **Apply for every run**: The newly identified selector is added to the selectors list for the UI element, positioned as the last in order. The desktop flow is updated with this new selector, ensuring that in future runs, the suggested selector is included in the list for this UI element.
- **Apply Once**: The suggested selector is accepted for this run only. The new selector is added to the UI element's selector list and used for this execution, but isn't saved for future runs.
- **Repair Manually**: You reject the Copilot suggestion and must manually identify and capture the required UI element on the screen.
- **Cancel or Close**: You reject the suggestion, causing the desktop flow to fail or trigger the error handling mechanism for the failed action.

If you accept the suggestion, the notification window closes, and the action interacts successfully with the correct UI element.

Check the UI element suggested by Copilot by selecting the **Target** button on the screen.

:::image type="content" source="media/repair-with-copilot/repair_copilot_suggestion.png" alt-text="Screenshot showing Copilot located the UI element successfully.":::

When the AI service can't locate the UI element successfully, you're prompted to locate the UI element manually. You can cancel the repair, and the desktop flow fails (or activates the error handling mechanism of the failed action).

:::image type="content" source="media/repair-with-copilot/repair_copilot_cannot find.png" alt-text="Screenshot showing Copilot couldn't locate the UI element.":::

### Repair manually

You can also repair the issue manually. Similar to the previous method, a notification window appears at runtime, prompting you to capture the UI element using Power Automate for Desktop's highlighter. To initiate this process, select the **Repair** button in the notification window, which turns on the highlighter. Next, hover over the necessary UI element on the screen and press "Ctrl" along with a left-click to capture it.

The manual repair experience is also triggered if Copilot can't locate the UI element or if you select the **Repair manually** option from the notification window's drop-down menu.

:::image type="content" source="media/repair-with-copilot/repair_manual.png" alt-text="Screenshot of user capturing the required UI element manually.":::

### Unattended experience step-by-step

> [!NOTE]
> Repair with Copilot feature for unattended runs is only supported in [managed envrionments](/power-platform/admin/managed-environment-enable).

If you enabled repair at runtime for **unattended** runs in the Power Platform admin center, you receive repair requests directly under [Recommendations](/power-automate/automation-center-recommendations) within the [Automation Center](/power-automate/automation-center-overview) experience. The repair request will automatically time out after 10 minutes if no action is taken.

:::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco.png" alt-text="Screenshot of repair at runtime recommendation in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco.png":::

Once you select the **Repair with Copilot** button, a side panel opens with the repair request details. This panel contains a list of desktop flow runs for which alternative UI selectors were identified to recover failing unattended runs.

:::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco-details.png" alt-text="Screenshot of repair at runtime recommendation details panel in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco-details.png":::

As soon as you select a row in the recommendation list view, you can choose one of the following actions:

- **Repair with Copilot**: Opens a panel showing the problematic control along with the original and new selector identified by Copilot.
- **Ignore and continue**: Ignores the repair request, likely causing the run to fail since the selector wasn't changed.
- **Flow details**: Navigates to the flow details page for which the request was created.
- **Run details**: Navigates to the desktop flow run details page for which the request was created.
- **Refresh**: Refreshes the list of repair recommendations.

#### Repair with Copilot action

On the panel that opens once you select **Repair with Copilot**, you see 2 main areas and an action list at the bottom. The upper part of the panel shows the problematic element together with script, location, and selector details.

:::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco-details-original.png" alt-text="Screenshot of repair at runtime recommendation details panel with actions bar in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco-details-original.png":::

In the lower part of the panel, you see a **Suggested fix** area displaying a visual representation of the element identified by Copilot along with the new selector. A red bounding box labeled "Copilot found this element" highlights the exact position on the screen or control.

:::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco-details-suggested.png" alt-text="Screenshot of repair at runtime recommendation details panel showing Copilot suggestion in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco-details-suggested.png":::

On the bottom of the panel, you see a button menu labeled **Apply once** from which you can choose:

- **Apply once**: Temporarily applies the selected fix for the current run.
- **Ignore and continue**: Ignores the repair request, likely causing the run to fail since the selector wasn't changed.

    :::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco-details-actions.png" alt-text="Screenshot of repair at runtime recommendation details panel with actions in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco-details-actions.png":::

If you choose **Apply once**, a confirmation message indicates whether the selector was applied successfully. When you return to the previous screen, you notice that the system replaced the Repair with Copilot button with View outcome, which shows an audit trail of the action taken.

:::image type="content" source="media/repair-with-copilot/repair-with-copilot-AC-reco-details-audit.png" alt-text="Screenshot of repair at runtime recommendation details panel with an audit trail in the Automation center." lightbox="media/repair-with-copilot/repair-with-copilot-AC-reco-details-audit.png":::

### Known limitations

- This feature is available only in attended and unattended executions through the portal (cloud flow).
- This feature is available only in desktop flows saved in Schema v2.
- This feature is available only in the US region.
- The feature doesn't handle UI elements in virtual desktops.
- The feature doesn't support PictureInPicture executions.
- The feature doesn't support child flow execution.
- The feature doesn't support UI element collections.
- The feature can't apply to selectors that contain one or more variables.
- The unattended version of this feature doesn't yet support persisting a new selector in the desktop flow script during runtime.
- Drag-and-drop actions aren't supported at this phase.
- The **Apply for every run** option uses the user identity logged into the Power Automate for desktop console. If no user is signed into the console, the option isn't available.

## Help us improve this feature

To send feedback, select the thumbs up or thumbs down icon under the AI-generated content. A feedback dialog appears, allowing you to submit feedback to Microsoft. Learn more about how this data is used and your rights in [Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control).

> [!NOTE]
> If you can't see the feedback dialog, check if your tenant admin [turned it off](#turn-off-user-feedback-functionality).

### Turn off user feedback functionality

As a tenant admin, you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Learn more about viewing and setting tenant settings at [Get-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings) and [Set-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com) and selecting **Health** > **Product feedback**.
