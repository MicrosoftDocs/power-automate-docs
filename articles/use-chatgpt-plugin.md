---
title: Use the Power Automate plugin for ChatGPT
description: Learn how to create and run flows from the Power Automate plugin for ChatGPT
suite: flow
author: kewaiss
contributors:
  - matow
  - hamenon-ms
  - v-aangie
ms.author: ralinga
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/01/2025
ms.collection: 
  - bap-ai-copilot
---

# Use the Power Automate plugin for ChatGPT

The **Power Automate plugin for ChatGPT** allows you to create, list, and run  cloud flows directly from ChatGPT conversations. You can use the plugin to create instant, automated, or scheduled flows that run outside of ChatGPT, or use it to run flows that have the  **Run from Copilot** trigger from the **Skills Plugins** connector.

## Prerequisites

* OpenAI account with [ChatGPT Plus](https://openai.com/blog/chatgpt-plus) subscription.
* Power Automate account with permission to create flows with standard connectors ([types of licenses](/power-platform/admin/power-automate-licensing/types)). Personal Microsoft accounts and accounts in national and US Government clouds aren't currently supported by the Power Automate plugin for ChatGPT.

## Get the plugin

1. Log in to [ChatGPT](https://chat.openai.com).

1. If you haven't used Plugins before, go to **Settings** ->  **Beta features** and enable the **Plugins** toggle.

1. Start a new chat with ChatGPT and select **GPT-4** using the model selector at the top.

1. Hover over GPT-4 and select **Plugins**.

1. At the top of the chat, select **No plugins enabled** then **Plugin store**.

1. In the Plugin store window that opens, search **Power Automate**.

1. Select **Install** on the Power Automate plugin:

    :::image type="content" source="media/use-chatgpt-plugin/plugin-store.png" alt-text="A screenshot of the ChatGPT Plugin store and the Power Automate plugin" border="true":::

1. Log in with your Power Automate account.

1. Select **Allow** to authorize OpenAI to connect to your Microsoft account.

## Use the plugin to create flows from a prompt

When you use a prompt that mentions creating a flow or automation, ChatGPT uses the Power Automate plugin to respond with a link to preview and create a cloud flow. The flow won't run until you have reviewed and saved it. Try some of the following example prompts for creating automated and scheduled flows:

* Set up an automation that emails me every morning with my open tasks in Planner
* Help me create an automation where I get notified when my manager sends me a high profile email
* Create a flow that sends me an email when an item is added to a folder in SharePoint

:::image type="content" source="media/use-chatgpt-plugin/create-flow.png" alt-text="A screenshot of a conversation with ChatGPT where the Power Automate plugin is being used to create a flow that sends a notification when the user's manager sends them a high priority email." border="true":::

## Create flows to run from ChatGPT conversations

 The **Run from copilot**  trigger provides a way for you to create the equivalent of plugins for ChatGPT that can use any of the 1000+ connectors in the Power Automate ecosystem. To create a flow that can be used from a ChatGPT conversation use the following steps: 

1. Go to [Power Automate](https://make.powerautomate.com).

1. Select **Create** from the left-pane, and then, select **Instant cloud flow**.

1. Select the **Run from Copilot** trigger and select **Create**. If you've added another trigger to your flow, you can delete it and search for **Run from Copilot** to replace it.

1. Add actions to your flow such as the Outlook connector's [Send an email (V2)](/connectors/office365/#send-an-email-(v2)).

1. Save the flow and test or run it at least once. The flow is now available from ChatGPT. ChatGPT uses the title and description of the flow to determine which flow you're referring to from a prompt. Ensure flows run as only tested flows show up on ChatGPT.

The following screenshot shows an example flow that sends an email using the Outlook connector:

:::image type="content" source="media/use-chatgpt-plugin/skill-flow.png" alt-text="Example flow using the Run from Copilot trigger, the Outlook connector's Send an email V2 action, and the Respond to Copilot action." border="true":::

## Use the plugin to list and run flows

You can run flows that use the **Run from Copilot** trigger from ChatGPT with prompts relevant to the title and description of your flows, such as **send an email**, **post to Teams**, or **add to Planner** depending on your flows. ChatGPT replies with a link to run the flow where you can enter and review any inputs to the flow before submitting the flow run.

To retrieve a list of all flows available to ChatGPT, use prompts such as **List my flows**, **Show my flows**, or **What are all my flows**. ChatGPT returns a table of flows that use the **Run from copilot** trigger and their details.

## Control and privacy

The following considerations apply when invoking cloud flows from ChatGPT and other Copilot experiences based on Large Language Models (LLMs):

1. ChatGPT doesn't immediately create the flow that the user wants. Instead, it returns a link to a possible flow based on the provided prompt. The flow creation happens on the Power Automate portal after human review. Users need to review the flow and go through the creation steps to complete the process, including confirming the actions and connections in the flow.
1. Only flows created by the user with the **Run from Copilot** trigger are discoverable from ChatGPT. Shared flows aren't yet discoverable from ChatGPT.
1. ChatGPT can't directly invoke the flow run, as control is in the hands of the user to review the run details and input parameters before submitting.
1. No user connections or data on which connectors are used are shared with ChatGPT as part of the functioning of this plugin outside of the authorization between the user's Microsoft and OpenAI accounts at plugin setup.

## Environment support

Currently the flows that are created and run need to be in the tenants default environment. We're working on a setup experience for the plugin that will allow users to choose nondefault environments to associate the plugin with.


## Frequently asked questions

### What is the Skills Plugins connector?

The Skills Plugins connector is a new built-in connector that includes the **Run from Copilot** trigger and **Respond to Copilot** action. It enables ChatGPT and Microsoft Copilots to discover and run cloud flows separately from your other flows.

### How can I manage what connectors and actions are available to flows run from ChatGPT?

[Power Platform data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention) provide control over which connectors and actions can be used by cloud flows, including flows with the **Run from Copilot** trigger. Admins can manage these policies from the [Power Platform Admin Center](https://admin.powerplatform.com).

### Are all the flows in my tenant and Power Platform environments shared with ChatGPT?

No, only flows that use the **Run from Copilot** trigger are visible to ChatGPT. Even with those flows only the name and description of the flow are accessible in order for ChatGPT to determine when to invoke the flow.
