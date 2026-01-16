---
title: FAQ for Repair with Copilot at runtime in Power Automate desktop
description: This FAQ discusses Repair with Copilot at runtime in Power Automate desktop and key considerations for making use of this technology responsibly.
ms.date: 01/16/2026
ms.update-cycle: 180-days
ms.custom:
  - responsible-ai-faqs
ms.topic: faq
author: nikosmoutzourakis
ms.author: nimoutzo
ms.reviewer: dmartens
ms.collection:
  - bap-ai-copilot
---

# FAQ for Repair with Copilot at runtime in Power Automate for desktop

These frequently asked questions (FAQ) describe the AI impact of the Repair with Copilot at runtime functionality in Power Automate for desktop.

## What is Repair with Copilot at runtime feature?

In Power Automate for desktop,  a common issue is the failure to locate UI elements during UI and Web automation actions at runtime. To address this issue, this feature enables Power Automate for desktop to employ Copilot capabilities to automatically locate the required UI element in a failure. This way, the execution continues, and automation is completed successfully, achieving the required goal.

## What can Repair with Copilot at runtime feature do?

The specific feature provides the user the capability to repair UI and Browser automation related issues at runtime, automatically, with the use of Copilot. More specifically:

- Feature is applied when a desktop flow is executed through the Power Automate portal in attended or unattended mode as part of a cloud flow - use of action ‘Run a flow built with Power Automate for desktop’ - and a UI/Browser automation action is about to fail because the UI element to interact with can't be found.
- Power Automate for desktop provides as input to the Copilot one or more old selectors of the UI element (which is/are invalid) and the hierarchy tree of all UI elements that are contained in the respective window/pane/web tab.
- The Copilot locates the UI element in the provided hierarchy tree and has as output the UI element ID (unique identifier in the tree).
- Power Automate for desktop generates the new selector for the indicated UI element and repairs the old selector.
- Action is performed with the new, repaired, selector, and execution of the flow continues.
- User can either use the repaired selector only in the context of the specific execution or save the repaired selector for future execution as well.

## What is the system’s intended uses?

1. Execution of a UI/Browser automation action can be performed even if one or more selectors of the related UI element is invalid.
1. The selector of a UI element can be repaired automatically and saved by the user and increase the success rate of the future executions of the specific flow.

## How was Repair with Copilot at runtime feature evaluated? What metrics are used to measure performance?

This feature in Power Automate for desktop is evaluated against real-world scenarios in each phase of its design, development, and release. Using a combination of research and business impact studies, we evaluated various quantitative and qualitative metrics about copilot, including its accuracy, usefulness, and AI service trust. We have a robust set of metrics we're tracking to measure the model's performance and resulting customer experience. We follow the feature's SLA to make sure it's always available to you. We track the telemetry of thumbs-up and thumbs-down gestures present in the UI experience for each AI output that you can submit feedback for.

## What are the limitations of Suggesting fixes to user at runtime feature? How can users minimize the impact of Suggesting fixes to user at runtime feature’s limitations when using the system?

- This feature is currently in preview for environments located in the United States and only supports English.
- This feature is currently available only to Work or School accounts.
- This feature refers only to attended or unattended execution through Power Automate portal as part of a cloud flow (use of action ‘Run a flow built with Power Automate for desktop’).
- This feature can fix only cases where a UI element can't be found because the existing selector isn't valid, meaning that can't locate successfully the element in the screen at the moment of the UI/Browser automation action’s execution.
- The feature can tackle issues only for leaf level UI element – invalid screens’ selectors isn't handled.
- There's a specific time window that notification window waits for the user to interact with. After the window closes, the fix isn't applied, and the action fails.
- You can completely disable the feature in Power Automate for desktop, from the admin center or from the desktop flow’s properties window.

## What operational factors and settings allow for effective and responsible use of the feature in Power Automate for desktop?

- The system is only available in attended and unattended executions of a desktop flow through the Power Automate portal component, as part of a cloud flow (use of action ‘Run a flow built with Power Automate for desktop’).
- Feature can be turned off either for a specific desktop flow (through its properties) or for the whole environment in Power Platform Admin Center.
- Notification window indicates that the suggestion is generated with the use of AI.
- When Copilot suggests a UI element and its repaired selector, the user must approve it in order for the recommendation to be effective. User is eligible to reject it and either fix the issue manually (by indicating the respective UI element in the screen manually) or fail the execution.
- In case the user saves the generated, repaired selector for the specific UI element, at any point, they can edit it or delete it.
