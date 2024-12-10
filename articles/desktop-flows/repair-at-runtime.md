---
title: Repair flow UI/Browser automation errors (preview)
description: Users can automatically or manually correct errors in UI elements that cannot be located during the execution of a UI or browser automation task.
ms.date: 12/09/2024
ms.topic: how-to
author: nimoutzo
ms.author: nimoutzo
ms.reviewer: 
ms.collection: bap-ai-copilot
---

# Repair flow automation errors (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

This feature applies the capabilities of Copilot to find and repair the selectors of the required UI elements on your screen. Users simply need to review and approve Copilot's suggestions. Alternatively, users can manually indicate the UI elements on their screen, and Power Automate for Desktop adjusts the selectors accordingly. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Copilot is a new technology that is still being developed. It is optimized for use with English language and has limited support with other languages. As such, parts of it may appear in English rather than your preferred language.

## Prerequisites

### Availability by region

Copilot in Power Automate for desktop offers different capabilities, which are available in environments located in the following countries/regions:
- United States

### Availability by account type

Currently, Copilot in Power Automate for desktop is only available for users with a work or school account.

> [!NOTE]
> If your environment is in a supported region, you are signed in with a work or school account, and you still can't "Repair with Copilot" in the Power Automate for desktop experience, contact your Power Platform administrator. An admin can turn Copilot off or on in the Power Platform admin center.

## Repair a flow at runtime

### How to enable it 
- Install the latest Power Automate for desktop build.  
- Enable the use of AI for self-healing issues, the "Repair at runtime" flag in PPAC must also be enabled. 
- For repairing with Copilot, ensure the Copilot flag in Power Platform Admin Center (PPAC) is enabled.+
- For newly created flows, enable the "Repair flow errors" option.
- For already existing flows, navigate to the respective desktop flow properties in the Power Automate for desktop console. The property "Repair flow errors" in the desktop flow’s properties should be enabled.
  - Repair with Copilot: This option allows for automated issue resolution with the assistance of Copilot. 
  - Repair: This option enables manual issue resolution, requiring the user to specify the UI element on the screen at the moment of failure during runtime.

:::image type="content" source="media/repair-with-copilot/repair_flow_properties.png" alt-text="Screenshot for enabling feature in flow properties.":::

 
### Attended experience step-by-step 

The feature is triggered when a cloud flow initiates a desktop flow that is on the verge of failing. This potential failure is due to a UI or browser automation action encountering an error because the UI element intended for interaction cannot be located using one or more preconfigured selectors. Next, a "Repair with Copilot" notification window appears on the screen. Copilot  then attempts to find the necessary UI element by analyzing the UI elements present on the relevant screen or web page. Clicking on Cancel shall stop the entire process and action  fails, which means that desktop flow should fail (or activate the error handling mechanism of the failed action). Click on "Repair manually", and you should indicate the required UI element manually in the screen by capturing it. 


:::image type="content" source="media/repair-with-copilot/repair_wait_for_copilot.png" alt-text="Copilot is trying to locate the UI element.":::

> [!NOTE]
> The timer, is set to 15 minutes from the initial display of the notification window, must be adhered to. The user has the option to reset the timer at any point within this period, which restarts the 15-minute countdown.

#### Repair with Copilot
When Copilot locates the UI element successfully, then the options are: 
- Apply for every run: The newly identified selector is added to the selectors list for the UI element, positioned as the last in order. The desktop flow is updated with this new selector, ensuring that in future runs, the suggested selector is included in the list for this UI element.
- Apply Once: The suggested selector is accepted for this run only. The new selector is added to the UI element's selector list and is used for this execution, but it is not saved for future runs.
- Repair Manually: The Copilot suggestion is rejected, and the user must manually identify and capture the required UI element on the screen.
- Cancel or Close: The suggestion is rejected, causing the desktop flow to fail or trigger the error handling mechanism for the failed action.  
If the suggestion is accepted, the notification window closes, and the action is performed successfully, interacting with the correct UI element.

You can check the UI element suggested by Copilot by pressing the ‘Target’ button on the screen.

:::image type="content" source="media/repair-with-copilot/repair_copilot_suggestion.png" alt-text="Copilot located the UI element successfully.":::

When the AI service cannot locate the UI element successfully, then you are prompted to locate the UI element manually. You may cancel the repair and then, the desktop flow should fail (or activate the error handling mechanism of the failed action). 

:::image type="content" source="media/repair-with-copilot/repair_copilot_cannot find.png" alt-text="Copilot could not locate the UI element.":::

### Repair manually
You also have the option to repair the issue manually. Similar to the previous method, a notification window appears at runtime, prompting you to capture the UI element using Power Automate for Desktop's highlighter. To initiate this process, simply click the ‘Repair’ button in the notification window, which enables the highlighter. Next, hover over the necessary UI element on your screen and press ‘Ctrl’ along with a left-click to capture it.  

The manual repair experience is also be triggered if Copilot is unable to locate the UI element or if you select the ‘Repair manually’ option from the notification window’s drop-down menu.  

:::image type="content" source="media/repair-with-copilot/repair_manual.png" alt-text="User is capturing the required UI element manually.":::



### Known limitations 
- This feature is available only in attended and unattended executions through the portal (cloud flow).
- This feature is available only in desktop flows saved in Schema v2.
- This feature is available only in the US region.
- UI elements in virtual desktops are not being handled.
- The feature is not supported in PictureInPicture executions.
- The feature is not supported in child flows execution.
- The feature is not supported in UI element collections.
- The feature cannot be applied to selectors containing one or more variables as part of them.
- Drag-and-drop action is not supported in this phase.
- The “Apply for every run” uses the user identity logged in the Power Automate for desktop console. If no user is signed into the console, the option is not available.

## Help us improve this feature

To send feedback, select the thumbs up or thumbs down icon under the AI-generated content. A feedback dialog appears, allowing you to submit feedback to Microsoft. Learn more about how this data is being used and your rights at [Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control).

> [!NOTE]
> If you can't see the feedback dialog, check if your tenant admin [turned it off](#turn-off-user-feedback-functionality).

### Turn off user feedback functionality

As a tenant admin, you can prevent users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Learn more about viewing and setting tenant settings at [Get-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/get-tenantsettings) and [Set-TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com) and selecting **Health** > **Product feedback**.
