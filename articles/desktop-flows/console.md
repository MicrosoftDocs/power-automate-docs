---
title: Power Automate console
description: See the main functionality of the Power Automate console.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 03/21/2025
ms.author: iomavrid
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: 
    - bap-ai-copilot
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

If a running flow contains [input variables](manage-variables.md#input-and-output-variables), a dialog box prompts you to provide the appropriate values.

:::image type="content" source="media/console/start-flow-inputs.png" alt-text="Screenshot of the flow inputs dialog.":::

## Editing a desktop flow

Apart from [creating new desktop flows](create-flow.md), you can edit existing flows using the **Edit** button next to the selected flow or on the command bar.

:::image type="content" source="media/console/create-edit-flow.png" alt-text="Screenshot of the edit buttons in the console.":::

The development of new flows and the editing of existing flows occur in the flow designer. To find more information regarding the flow designer and how to develop desktop flows, refer to [Desktop flow designer](flow-designer.md).

>[!IMPORTANT]
> When more than one person changes a shared desktop flow, the last person who saves the flow overrides all previous actions.

## Console Settings

To configure Power Automate for desktop to your liking, select the **Settings** button.

:::image type="content" source="media/console/console-settings-panel-with-appearence.png" alt-text="Screenshot of the console settings pane.":::

Under **Appearance**, choose if Power Automate should work in light or dark mode (preview).
:::image type="content" source="media/console/dark-mode-preview.png" alt-text="Screenshot of the dark mode experience in Power Automate for desktop.":::

Under **Flow run control**, use the **Monitoring/Notifications** dropdown to choose if Power Automate should display integrated Windows notifications, a custom flow monitoring window, or no notifications. Learn more about Power Automate notifications in [Runtime notifications](runtime-notifications.md).

You can also set a hotkey combination to pause or resume a running flow, and another hotkey to stop running flows instantly.

By default, Power Automate always prompts you to confirm the triggering of a desktop flow via URL or desktop shortcut. The **Display confirmation dialog when invoking flows externally** option allows you to disable this functionality. You can find more information about external links in [Run desktop flows via URL or desktop shortcuts](run-desktop-flows-url-shortcuts.md).  

To decide whether Microsoft should collect diagnostic data to improve user experience, navigate to the **Data collection** settings tab.

> [!IMPORTANT]
> Only admins can change data collection settings.

## Desktop flow properties

To review the properties of a desktop flow, right-click on it and select **Properties**, or select the same option from the corresponding shortcut. In the **General** tab, you can edit the name and description of the flow, set up a keyboard shortcut to trigger the flow locally, define the **On error** behavior of the flow run, and determine whether the desktop flow should **time out** after a set period of time.

If the **Add screenshot to logs** option is enabled, a screenshot is captured upon flow run failure and is uploaded to the [flow run action details](monitor-run-details.md#actions-details).

The **Flow timeout** property is disabled by default. If it becomes enabled, you can specify the maximum allowed time that the flow is allowed to run. If that maximum duration limit is reached during (console or cloud initiated) runtime, the desktop flow is forced to stop and time out. You can use the proposed timeout value, or provide your own using a combination of an integer value with the preferred time unit (seconds, minutes, or hours).

> [!IMPORTANT]
>
> - Access to the flow run logs is a premium feature, which requires a [Power Automate subscription](https://powerautomate.microsoft.com/pricing/).
> - The **Flow timeout** property is also a premium feature requiring the above license.
> - The **Add screenshot to logs** and **Flow timeout** properties apply only to flows stored in [Power Automate v2 schema](schema.md).

In the **Details** tab, you can see the owner, the creation and last modification dates, the flow ID and the flow’s storage schema version in Dataverse. For more information on the enhanced desktop flows schema, go to [Power Automate v2 schema](schema.md).

Additionally, there's the **Run URL** that you can use to run the flow through many different sources, such as browsers, the Windows Run application, and the Command Prompt. You can find more information regarding this functionality in [Run desktop flows via URL or desktop shortcuts](run-desktop-flows-url-shortcuts.md).

:::image type="content" source="media/console/desktop-flow-general-properties.png" alt-text="Screenshot of the general properties of a desktop flow.":::

:::image type="content" source="media/console/desktop-flow-details-properties.png" alt-text="Screenshot of the details of a desktop flow.":::

## Generate flow description using Copilot (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Generate a flow description for flows that you own or are a co-owner by the press of a button. Copilot then analyzes the flow and generates a description for it. This feature is also available from the flow details in make.powerautomate.com. More information: [Manage desktop flows](manage.md)

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - To understand the capabilities and limitations of this feature, go to [FAQ for generating a flow description using Copilot](../faqs-copilot-generate-description-from-flow-properties.md).

### Prerequisites

- Currently, the generate flow description using Copilot functionality is only available in environments located in the United States.
- Currently, the generate flow description using Copilot functionality is only available for users with a work or school account.

### Use Copilot to generate the description

To generate a flow description, navigate to the properties of the flow where you want to generate the description. Under the **Description** text area, select **Let Copilot create a description**. Copilot analyzes your flow and populates the description with a summary of your flow.

:::image type="content" source="media/console/console_generate_description_with_ai.png" alt-text="Screenshot of the general properties of a desktop flow showing the generated flow description with Copilot." lightbox="media/console/console_generate_description_with_ai.png":::

### Help us improve this feature

Send feedback by selecting the thumb up or thumb down icon underneath the AI-generated content. Once you do, a dialog box appears, which you can use to submit feedback to Microsoft.

:::image type="content" source="media/pad_generative_answers/feedback_dialog1.png" alt-text="Image that shows where you can send your feedback about copilot in Power Automate for desktop.":::

> [!NOTE]
> If you can't see the dialog box, your Power Platform admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

### Disabling the generate flow description using Copilot functionality

To disable the generate flow description using Copilot functionality, Power Platform admins can contact Microsoft support. More information: [Get Help + Support](/power-platform/admin/get-help-support)

### Disabling the user feedback functionality

As a [Power Platform admin](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator), prevent users from sending Copilot feedback to Microsoft by using the "Copilot feedback" [tenant setting](/power-platform/admin/tenant-settings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback from users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home?#/homepage), and then select **Health** > **Product feedback**.

## Related information

[FAQ for generating a flow description using Copilot](../faqs-copilot-generate-description-from-flow-properties.md)

## Update Power Automate for desktop

Power Automate frequently checks for updates and displays appropriate notifications.

Update notifications offer you the option to delay the update and proceed with it at a later time. If you don't wish to receive any update notifications, clear the **Show update notifications** option in the general settings.

To manually update Power Automate for desktop, select **Check for updates** in the general settings.

## Switch organization

If you're a member of more than one tenant, you can switch organizations by selecting the organization name at the top right corner of the console and then select **Switch organization**.

:::image type="content" source="media/console/switch-tenant.png" alt-text="Screenshot of the switch tenants option.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
