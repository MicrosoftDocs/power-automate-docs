---
title: Use the Power Automate flows as plugins in Microsoft Copilot (Preview)
description: Learn how to Power Automate flow based plugins from Microsoft Copilot
suite: flow
author: hamenon-ms
contributors:
  - hamenon-ms
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/01/2024
ms.collection: 
  - bap-ai-copilot
---

# Use the Power Automate flows as plugins in Microsoft Copilot (preview)

You can run Power Automate flows as plugins from within Microsoft Copilot. This feature is currently in preview and is limited to two specific Copilot enabled templates currently. We're working on expanding support to enable users to bring any flow they create with the Run from Copilot trigger in Microsoft Copilot.

## Prerequisites

To use flows as plugins within Microsoft 365 Copilot you need the following two prerequisites:

- [Licenses for Copilot for Microsoft 365](/microsoft-365-copilot/extensibility/overview-business-applications#get-copilot-for-microsoft-365-licenses-and-enable-plugins)


## Deploy the App

1. Sign in to the Microsoft 365 admin center with your admin account.
1. Expand **Settings** on the side navigation pane and select **Integrated apps**.
1. Under the **Available apps** tab, search for the Power Automate and select Deploy App
1. Select Next to open the Users tab, choose to deploy for all users, a specific set of users, or yourself.
1. Select Next and complete the remaining steps to deploy the app. It may take up to 12 hours for the deployed app's plugin to show in Copilot for Microsoft 365.

## Enable Flow plugins templates

In the current preview there are two templates that use the Run from Copilot trigger that can be used as plugins from Power Automate. They are:

1. [Get my tasks from Microsoft Todo and Planner](https://make.powerautomate.com/environments/~default/galleries/public/templates/a044e5f4f7214971b8c631f1014cef92) - This flow lists all your pending tasks from Microsoft Todo and Planner and surfaces them in Microsoft Copilot
1. [List my pending approvals](https://make.powerautomate.com/environments/~default/galleries/public/templates/d851f07c146246f3ad2c0d5bedd01539) - This flow lists all your pending approvals in an environment and surfaces them in Microsoft Copilot

Cick on the above templates to sign in and create flows based on these templates. Once created, they show up as plugins within Microsoft 365 Copilot. Note, in preview it can take up to 4 hours for the flow plugin to show up in Microsoft Copilot.

## Running flows from Microsoft Copilot

You can use the Flow based plugins shipped by Microsoft in your Copilot for Microsoft 365 app in Microsoft Teams.

1. Login to Microsoft Teams app.

1. Open the Copilot app. If the Copilot app isn't in your sidebar, search in the Teams app store. A plugins icon is present in the text prompt.:

    :::image type="content" source="media/copilot-plugin-flyout.png" alt-text="A screenshot of the ChatGPT Plugin store and the Power Automate plugin" border="true":::

1. Select the Power Automate option and enable the flow you want to use
    
    :::image type="content" source="media/copilot-plugin-flyout-automate.png" alt-text="A screenshot of the ChatGPT Plugin store and the Power Automate plugin" border="true":::

1. Start a natural languate prompt like "Get my pending approvals" or "Show me my pending tasks from Microsoft Planner and Todo"  to get the results.

## Environment support

Currently the flows that are created and run need to be in the tenants default environment. We're working on a setup experience for the plugin that will allow users to choose nondefault environments to associate the plugin with.
