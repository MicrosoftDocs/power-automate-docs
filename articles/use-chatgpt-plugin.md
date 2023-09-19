---
title: Use the Power Automate plugin for ChatGPT | Microsoft Docs
description: Learn how to create and run flows from the Power Automate plugin for ChatGPT
services: ''
suite: flow
documentationcenter: na
author: matow
contributors:
  - matow
  - hamenon-ms
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

The **Power Automate plugin for ChatGPT** allows you to create, list, and run  cloud flows directly from ChatGPT conversations. You can use the plugin to create instant, automated, or scheduled flows that run outside of ChatGPT, or use it to run flows that have the Skills connector's **Run a flow from Copilot** trigger.

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
1. Save the flow and test or run it at least once. The flow is now available from ChatGPT. ChatGPT will use the title and description of the flow to determine which flow you are referring to from a prompt.

The following screenshot shows an example flow that sends an email using the Outlook connector.

![Example flow using the "Run a flow from Copilot" trigger, the Outlook connector's "Send an email (V2)" action, and the "Respond to Copilot" action.](image-3.png)

## Use the plugin to list and run flows

You can run flows that use the **Run a flow from Copilot** trigger from ChatGPT with prompts relevant to the title and description of your flows, such as **send an email**, **post to Teams**, or **add to Planner** depending on your flows. ChatGPT will reply with a link to run the flow where you'll be able to enter and review any inputs to the flow before submitting the flow run.

To retrieve a list of all flows available to ChatGPT, use prompts such as **List my flows**, **Show my flows**, or **What are all my flows**. ChatGPT will return a table of flows that use the **Run from copilot** trigger and their details.

## Control and Privacy

As this is being invoked from within and LLM based AI interface there are some control and privacy implications we want to call out
1. ChatGPT does NOT actually create the flow that the user wants. We only check to see if a flow is possible based on the prompt passed to us. This creation experience happens on the Power Automate portal after human review. Users need to review the flow and go through the creation steps to complete the process.
1. Only user created flows with the new Run from copilot trigger are discoverable from ChatGPT. In the current model flows shared with you cannot be invoked directly.
1. Chat GPT cannot directly invoke the flow run, control is again in the hands of the user. Users can review the flow parameters and details in the flow portal before running the flow.
1. No user specified connections or connector specific data is shared with ChatGPT as part of the functioning of this plugin.

## Admin Control

Admins can setup DLP policies to block the new Copilot connector to prevent users in their tenant from making flows that are discoverable from ChatGPT.
Note that the creation experience is always available if the user has maker permissions and defaults to the regular natural language to flow experience that is available to all users today in the Power Automate portal. 

## Environment support

Currently the flows that are created and run need to be in the tenants default environment. We are working on a setup experience for the plugin which will allow users to choose non-default environments to associate the plugin with.


## Frequently asked questions

* What is the Skills connector? 
  * The Skills connector is a new built-in connector that includes the **Run a flow from Copilot** trigger and **Respond to Copilot** action. It enables ChatGPT and Microsoft Copilots to discover and run cloud flows separately from your other flows.
* Can I run long-running flows from ChatGPT?
  * When using **Run a flow from Copilot** trigger to run flows from ChatGPT in conjunction with the **Respond to Copilot** action the flow execution must complete within two minutes. If you have a flow that takes longer, you can put the **Respond to Copilot** action towards the beginning of the flow to respond to the chat within two minutes before continuing to execute the remaining actions. Flows that run asynchronously, i.e. without a response back to copilot do not have a time limitation.
* How can I manage what connectors and actions are available to flows run from ChatGPT?
  * [Power Platform data loss prevention (DLP) policies](/power-platform/admin/wp-data-loss-prevention) provide control over which connectors and actions can be used by cloud flows, including flows with the **Run a flow from Copilot** trigger. Admins can manage these policies from the [Power Platform Admin Center](https://admin.powerplatform.com).
* Are all my tenants flow details shared with ChatGPT?
  * No, only flows that use the **Run from copilot** visible to ChatGPT. Even with those flows only the name and description of the flow are accessible in order for ChatGPT to determine when to invoke the flow.