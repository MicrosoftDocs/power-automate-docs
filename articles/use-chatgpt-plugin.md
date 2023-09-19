---
title: Use the Power Automate plugin for ChatGPT | Microsoft Docs
description: Learn how to create and run flows from the Power Automate plugin for ChatGPT
services: ''
suite: flow
documentationcenter: na
author: matow
contributors:
  - matow
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/18/2023
---

# Use the Power Automate plugin for ChatGPT

The **Power Automate plugin for ChatGPT** allows you to create, list, and run  cloud flows directly from ChatGPT conversations. You can use the plugin to create instant, automated, or scheduled flows that run outside of ChatGPT, or use it to run flows that have the Copilot connector's **Run a flow from Copilot** trigger.

## Prerequisites

* OpenAI account with ChatGPT Plus subscription
* Power Automate account with permission to create flows with standard connectors ([types of licenses](/power-platform/admin/power-automate-licensing/types)). Personal Microsoft accounts and accounts in national and US Government clouds are not currently supported by the Power Automate plugin for ChatGPT.

## Get the plugin

1. Log in to [ChatGPT](https://chat.openai.com)
1. If you haven't used Plugins before, navigate to **Settings** ->  **Beta features** and enable the **Plugins** toggle.
1. Start a new chat with ChatGPT and select **GPT-4** using the model selector at the top.
1. Hover over GPT-4 and select **Plugins**.
1. At the top of the chat, click **No plugins enabled** then **Plugin store**.
1. In the Plugin store window that opens, search **Power Automate**.
1. Click **Install** on the Power Automate plugin:
![A screenshot of the ChatGPT Plugin store and the Power Automate plugin](image-1.png)
1. Log in with your Power Automate account.
1. Click **Allow** to authorize OpenAI to connect to your Microsoft account.

## Use the plugin to create flows from a prompt

When you use a prompt that mentions creating a flow or automation, ChatGPT will use the Power Automate plugin to respond with a link to preview and create a cloud flow. The flow won't run until you have reviewed and saved it. Try some of these example prompts for creating automated and scheduled flows:

* Set up an automation that emails me every morning with my open tasks in Planner
* Help me create an automation where I get notified when my manager sends me a high profile email
* Create a flow that sends me an email when an item is added to a folder in SharePoint

![A screenshot of a conversation with ChatGPT where the Power Automate plugin is being used to create a flow that sends a notification when the user's manager sends them a high priority email.](image-2.png)

## Create flows to run from ChatGPT conversations

Use the Copilot connector's **Run a flow from Copilot** trigger in a cloud flow to create a flow that you can run from a ChatGPT conversation.

1. Navigate to the [Power Automate maker portal](https://make.powerautomate.com)
1. Click **Create** in the sidebar on the left, then click **Instant cloud flow**.
1. Select the **Run a flow from Copilot** trigger and click **Create**. If you've added another trigger to your flow, you can delete it and search for **Run a flow from Copilot** to replace it.
1. Add actions to your flow such as the Outlook connector's [Send an email (V2)](/connectors/office365/#send-an-email-(v2)).
1. If you have data you want to return back to ChatGPT, search for the Copilot connector's **Respond to Copilot** action, add it to your flow, and configure the output fields you want to return.
1. Save the flow and test or run it at least once. The flow is now available from ChatGPT. ChatGPT will use the title and description of the flow to determine which flow you are referring to from a prompt.

The following screenshot shows an example flow that sends an email using the Outlook connector and returns a confirmation message back the ChatGPT conversation.

![Example flow using the "Run a flow from Copilot" trigger, the Outlook connector's "Send an email (V2)" action, and the "Respond to Copilot" action.](image-3.png)

## Use the plugin to list and run flows

You can run flows that use the **Run a flow from Copilot** trigger from ChatGPT with prompts relevant to the title and description of your flows, such as **send an email**, **post to Teams**, or **add to Planner** depending on your flows. ChatGPT will reply with a link to run the flow where you'll be able to enter and review any inputs to the flow before submitting the flow run.

To retrieve a list of all flows available to ChatGPT, use prompts such as **List my flows**, **Show my flows**, or **What are all my flows**. ChatGPT will return a table of flows and their details.

## Frequently asked questions

* What is the Copilot connector? 
  * The Copilot connector is a new built-in connector that includes the **Run a flow from Copilot** trigger and **Respond to Copilot** action. It enables ChatGPT and Microsoft Copilots to discover and run cloud flows separately from your other flows.
* Can I run long-running flows from ChatGPT?
  * When using **Run a flow from Copilot** trigger to run flows from ChatGPT, the flow must complete or use the **Respond to Copilot** action within two minutes. If you have a flow that takes longer, you can put the **Respond to Copilot** action towards the beginning of the flow to respond to the chat within two minutes before continuing to execute the remaining actions.
* How can I manage what connectors and actions are available to flows run from ChatGPT?
  * [Power Platform data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention) provide control over which connectors and actions can be used by cloud flows, including flows with the **Run a flow from Copilot** trigger. Admins can manage these policies from the [Power Platform Admin Center](https://admin.powerplatform.com).