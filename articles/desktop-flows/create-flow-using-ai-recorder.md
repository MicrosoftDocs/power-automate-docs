---
title: Create desktop flows using the AI Recorder
description: Create desktop flows effortlessly with AI Recorder in Power Automate desktop by sharing your screen and narrating tasks to automate.
author: JoeFernandezMS

ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 09/02/2024
ms.author: jofernan
ms.reviewer: dmartens
contributors:
  - Flow
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:08/23/2024
---

# Create desktop flows using the AI Recorder

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

## Introduction

Building desktop flows is now easier than ever with the AI Recorder, also known as Record with Copilot, in Power Automate desktop. This feature enables you to create desktop automations by sharing your screen and describing the task you want to automate, as if you were explaining to another person. During the recording, you use your voice, mouse, and keyboard inputs to demonstrate the task. Once the recording is complete, an AI model processes it and converts it into a desktop flow.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

You can then review, edit, and save the flow before running it.

For a video on using the AI Recorder, you can watch the following 2 minutes and 30-second video:

[How to build automations with the AI Recorder - YouTube](https://www.youtube.com/watch?v=xt3uyoe3Le0)

## Prerequisites

### Availability by region

Currently, the AI Recorder is only available to US-based environments. Learn more on how you can create a US-based environment at [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).

### Availability by account type

Currently, AI Recorder is only available for users with a work or school account.

## Create a desktop flow using the AI Recorder

To create a desktop flow using AI Recorder:

1. **Open the AI Recorder:**

    When you open Power Automate Desktop, select the **Record with Copilot** option and then select **Start**. If this option isn’t available, review the [Prerequisites](#prerequisites).

    :::image type="content" source="media/create-flow-with-ai-recorder/record-with-copilot.png" alt-text="Screenshot of the option to create a desktop flow by selecting the Record with Copilot option.":::

1. **Welcome screen:**

    A welcome screen with tips on using the recorder appears. Select **Next** to proceed.

1. **Select recording settings:**

    If you have multiple monitors, choose the one you want to use for recording. Also, select your preferred microphone and speaker for narration. Once configured, select **Next**.

1. **Recording tips:**

    You hear some final tips before starting. When ready, select **Record**.

1. **Record the process:**

    Describe the process you want to automate as if you’re teaching someone. The more detail you provide, the better the results.

1. **Finish recording:**

    When you’re done, select **Done**. Power Automate analyzes the video, your narration, and mouse movements to create the automation. This process takes a few minutes.

1. **Review and customize:**

    Once the analysis is complete, the automation is displayed in the flow designer. Review it, make any necessary adjustments, and fill in any missing details. When satisfied, save and run your automation. For more customization options, explore the flow designer options.

## Frequently asked questions

### Are there any known limitations for the AI Recorder?

* The AI Recorder is currently available only in environments based in the US for users with work or school accounts. At this time, English is the only supported language. We're actively working to expand support to more regions and languages in the coming months.

* The AI Recorder requires you to speak and explain the automation process. If no narration is provided, no automation is generated.

* Interaction with clicks or keystrokes is essential during recording. Simply talking over a screen without any mouse or keyboard interaction doesn't return an automation suggestion.

### What are some best practices when using the AI Recorder?

Narrate the process clearly as you demonstrate it. Allow screens to fully load and explain each step in detail to get the best results.

### What are some scenarios I can try? Can I see a demo?

See the following video that showcases a demo for AI Recorder. > [!VIDEO https://www.youtube.com/embed/xt3uyoe3Le0?si=hWgo3tEKuzhFrSVq]

You can try various scenarios, such as transferring data from Excel to a web form, navigating websites, and extracting data.

### What languages are supported in AI Recorder?

Currently, AI Recorder supports English. Other languages will be supported in future updates.

### What is the difference between the AI Recorder and the Recorder?

The traditional Recorder captures interactions like mouse clicks and keystrokes, generating a desktop flow that replicates those actions. However, it doesn't capture logic such as conditions or loops.

The AI Recorder, on the other hand, allows you to explain the process verbally while showing it. The AI model then interprets your actions and narration to suggest an automation that includes conditions, loops, and necessary interactions.

### The flow suggested by AI Recorder has missing actions, UI selectors?

AI Recorder is currently in preview, and we’re continually improving its accuracy. As an AI-powered tool, AI Recorder is designed to improve over time. If you encounter issues, we’d appreciate your feedback to help improve AI Recorder for your specific use case. Reach out to us at <powerautomate-ai@microsoft.com> and we're happy to chat!

### How does the system manage recordings, and what measures are taken to ensure privacy and security?

When you use the recorder, your recording is securely uploaded to the cloud, where an AI model transforms it into a Power Automate desktop flow. The recording is kept only for a brief period necessary for processing and is deleted once processing is complete. The maximum delay for the recording to be deleted from the cloud service is 24 hours.

To protect your data, all recording data sent from and to Power Automate Desktop is encrypted both during transit and while at rest.

The recordings aren't used for training the AI model.

### What details does the recorder capture during a session?

When you start a recording, you can choose which screen to record and which microphone to use. A colored border appears around the screen being recorded. To avoid capturing sensitive information, ensure it isn't displayed during the recording. If you accidentally record something you don't want to include, you can restart the recording or close the recorder. In these cases, the recordings aren't sent to the cloud for processing.

The recorder captures a video of the selected screen, audio from the chosen microphone, and necessary UI metadata to build the desktop flow.

## Send us your input

Have thoughts on the AI Recorder? We’re all ears! Drop us a note at <powerautomate-ai@microsoft.com>. We’d love to chat with you.
