---
title: Use Power Automate flows as plugins in Copilot for Microsoft 365 (preview)
description: Learn how to Power Automate flow based plugins from Microsoft Copilot.
suite: flow
author: hamenon-ms
contributors:
  - hamenon-ms
  - radioblazer
  - v-aangie
ms.author: kewaiss
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 09/04/2024
ms.collection: 
  - bap-ai-copilot
---

# Use Power Automate flows as plugins in Copilot for Microsoft 365 (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

You can run Power Automate flows as plugins from Copilot for Microsoft 365.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

To use flows as plugins in Copilot for Microsoft 365, you need a license and the ability to enable plugins. To learn more, go to [Licenses for Copilot for Microsoft 365](/microsoft-365-copilot/extensibility/overview-business-applications#get-copilot-for-microsoft-365-licenses-and-enable-plugins).

## Deploy the app

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home?#/homepage) with your admin account.
1. On the navigation pane, expand **Settings**, and then select **Integrated apps**.
1. On the **Available apps** tab, search for **Power Automate**, and then select **Deploy App**.
1. To open the **Users** tab, select **Next**.
1. Choose to deploy for all users, a specific set of users, or yourself.
1. To complete the remaining steps to deploy the app, select **Next**.

    It might take up to 12 hours for the deployed app's plugin to show in Copilot for Microsoft 365.

## Enable flow plugins

Create flows using the **Run a flow from Copilot** trigger from the Copilot Skills connector in the default environment. Once created, these flows appear in the plugins menu in Copilot for Microsoft 365. Currently, users can only see flow plugins that they created.

## Run flows from Copilot for Microsoft 365

You can use the flow based plugins shipped by Microsoft in your Copilot for Microsoft 365 app in Microsoft Teams.

1. Sign in to [Microsoft Teams](https://teams.microsoft.com).
1. Open the **M365 Chat** app.

    If the Copilot app isn't on your menu, search for it in the Teams app store. A plugins icon (four squares) shows on the text prompt.

    :::image type="content" source="media/flow-plugins-m365/copilot-plugin-flyout.png" alt-text="Screenshot of the Copilot for Microsoft 365 Chat app.":::

1. Select the **Plugins** icon > **Power Automate**.
1. Enable the flow you want to use.

    :::image type="content" source="media/flow-plugins-m365/copilot-plugin-flyout-automate.png" alt-text="Screenshot of the Power Automate plugin.":::

1. Enter a natural language prompt like **Get my pending approvals**, or **Show me my pending tasks from Microsoft Planner and To Do**, to get the results.

## Environment support

Currently, the flows that are created and run need to be in the tenant's default environment. A setup experience for the plugin that allows users to choose nondefault environments to associate the plugin with isn't available yet.

## Copilot Skills trigger support for Power Automate CMK protected flows 

Currently, the flows utilizing the copilot invoking user's connection as opposed to embedded connections are not supported for invokling cloud flows protected by CMK. Learn More about known limitations for Power Automate CMK here https://learn.microsoft.com/en-us/power-automate/customer-managed-keys#known-limitations

## Related information

[Build plugins using Microsoft business applications](/microsoft-365-copilot/extensibility/overview-business-applications)
