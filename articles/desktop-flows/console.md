---
title: Power Automate console
description: See the main functionality of the Power Automate console
author: mattp123

ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/21/2022
ms.author: pefelesk
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras 
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate console

The console is the central interface of Power Automate for desktop.

The main area of the console contains four tabs that display different kind of information: a home screen, your desktop flows, [shared desktop flows](manage.md#share-desktop-flows), and [built-in examples](create-flow.md#start-creating-desktop-flows-using-examples).

On the top of the window, you can see the current user, while on the command bar, you can see all the available actions, a dropdown list to switch environments, the **Settings** and **Help** buttons, and a search bar.

:::image type="content" source="media/console/pad-console.png" alt-text="Screenshot of the Power Automate for desktop console.":::

> [!NOTE]
> Some options in the console may be disabled due to insufficient permissions in the current environment. Contact your administrator to grant you access or switch to another environment. To find more information about security roles, go to [Configure user security](/power-platform/admin/database-security).

## Starting a desktop flow

To run a desktop flow as local attended, use the **Start** button next to the selected flow or on the command bar. The **Status** column allows you to review the current status of each flow.

:::image type="content" source="media/console/start-flow.png" alt-text="Screenshot of the status column in the console.":::

If a running flow contains [input variables](manage-variables.md#input-and-output-variables), a dialog box will prompt you to provide the appropriate values.

:::image type="content" source="media/console/start-flow-inputs.png" alt-text="Screenshot of the flow inputs dialog.":::

## Editing a desktop flow

Apart from [creating new desktop flows](create-flow.md), you can edit existing flows using the **Edit** button next to the selected flow or on the command bar.

:::image type="content" source="media/console/create-edit-flow.png" alt-text="Screenshot of the edit buttons in the console.":::

The development of new flows and the editing of existing flows occur in the flow designer. To find more information regarding the flow designer and how to develop desktop flows, refer to [Desktop flow designer](flow-designer.md).

>[!IMPORTANT]
> When more than one person changes a shared desktop flow, the last person who saves the flow overrides all previous actions.

## Console Settings

To configure Power Automate for desktop to your liking, select the **Settings** button.

:::image type="content" source="media/console/console-settings-panel.png" alt-text="Screenshot of the console settings pane":::

Under the **Application** category, select whether Power Automate should launch automatically and whether closing the console will also close the application. You may also set a hotkey combination to stop running flows instantly.

Using the **Monitoring/Notifications** dropdown menu, you can choose whether Power Automate will display integrated Windows notifications, a custom monitoring window, or no notifications at all. To find more information regarding Power Automate notifications, refer to [Runtime notifications](runtime-notifications.md).

By default, Power Automate always prompts you to confirm the triggering of a desktop flow via URL or desktop shortcut. The **Display confirmation dialog when invoking flows externally** option allows you to disable this functionality. You can find more information about external links in [Run desktop flows via URL or desktop shortcuts](run-desktop-flows-url-shortcuts.md).  

To decide whether Microsoft may collect diagnostic data to improve user experience, navigate to the **Data collection** settings tab.

>[!IMPORTANT]
>Only admins can change data collection settings.

## Desktop flow properties

To review the properties of a desktop flow, right-click on it and select **Properties**. In the **General** tab, you can edit the name and description of the flow, set up a keyboard shortcut to trigger the flow locally, and define the **On error** behavior of the flow run.

If the **Add screenshot to logs** option is enabled, a screenshot is captured upon flow run failure and is uploaded to the [flow run action details](monitor-run-details.md#actions-details).

> [!IMPORTANT]
>
> - Access to the flow run logs is a premium feature, which requires a [Power Automate subscription](https://powerautomate.microsoft.com/pricing/).
> - The **Add screenshot to logs** property applies only to flows stored in [Power Automate v2 schema](schema.md).

In the **Details** tab, you can see the owner, the creation and last modification dates, the flow ID and the flow’s storage schema version in Dataverse. For more information on the enhanced desktop flows schema, go to [Power Automate v2 schema](schema.md).

Additionally, there's the **Run URL** that you can use to run the flow through many different sources, such as browsers, the Windows Run application, and the Command Prompt. You can find more information regarding this functionality in [Run desktop flows via URL or desktop shortcuts](run-desktop-flows-url-shortcuts.md).

:::image type="content" source="media/console/desktop-flow-general-properties.png" alt-text="Screenshot of the general properties of a desktop flow.":::

:::image type="content" source="media/console/desktop-flow-details-properties.png" alt-text="Screenshot of the details of a desktop flow.":::

### Generate flow description using Copilot (Preview)

You can now generate a flow description for flows that you own or are a co-owner by pressing on the "Let Copilot create a description" button. Copilot will then analyze the flow and generate a description for it. This feature is also available from the flow properties in the portal. More info:
[Manage desktop flows](manage.md)

:::image type="content" source="media/console/console_generate_description_with_AI.png" alt-text="Screenshot of the general properties of a desktop flow showing the generate flow description with Copilot button .":::

## Prerequisites

### Availability by region

Currently, the generate flow description using Copilot functionality, is only available in environments located in the United States.

### Availability by account type

Currently, the generate flow description using Copilot functionality, is only available for users with a work or school account.

### Prevent your users from using Copilot to generate a flow description

To prevent users from using Copilot to generate flow descriptions, Power Platform administrators can turn off the **Copilot help assistance in Power Automate via Bing** setting in the Power Platform admin center.

### Help us improve this feature

You can send feedback by selecting the thumb up or thumb down icon underneath the AI-generated content. Once you do, a dialog box appears, which you can use to submit feedback to Microsoft.

:::image type="content" source="media/pad_generative_answers/feedback_dialog1.png" alt-text="Image that shows where you can send your feedback about copilot in Power Automate for desktop.":::

> [!NOTE]
> If you can't see the dialog box, your Power Platform admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

### Disabling the user feedback functionality

As a Power Platform admin you can prevent users from sending feedback to Microsoft by disabling the **disableSurveyFeedback** tenant setting. More information:

- [List tenant settings (preview)](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)
- [Set TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home?#/homepage), and then selecting **Health** > **Product feedback**.

### See also

- [FAQ for generating a flow description using Copilot](../faqs-copilot-generate-description-from-flow-properties.md)

## Update Power Automate for desktop

Power Automate frequently checks for updates and displays appropriate notifications.

Update notifications offer you the option to delay the update and proceed with it at a later time. If you don't wish to receive any update notifications, uncheck the **Show update notifications** option in the general settings.

To manually update, select **Check for updates** in the general settings.

## Switch organization

If you're a member of more than one tenant, you can switch between them by selecting their alias at the top right corner of the console and clicking on **Switch organization**.

:::image type="content" source="media/console/switch-tenant.png" alt-text="Screenshot of the switch tenants option.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
