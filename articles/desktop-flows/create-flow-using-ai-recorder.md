---
title: Create desktop flows using the AI Recorder (preview)
description: Create desktop flows effortlessly with AI Recorder in Power Automate desktop by sharing your screen and narrating tasks to automate.
author: JoeFernandezMS

ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 09/03/2024
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

# Create desktop flows using the AI Recorder (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

## Introduction

Building desktop flows is now easier than ever with the AI Recorder, also known as Record with Copilot, in Power Automate desktop. This feature lets you build desktop automations by sharing your screen and describing the task you want to automate, as if you were explaining it to someone else. The AI Recorder captures your voice, mouse, and keyboard inputs during the recording. Then, it processes them and converts them into a desktop flow. You can review, edit, and save the flow before running it.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

Watch this short video to learn how to use the AI Recorder:

[How to build automations with the AI Recorder - YouTube](https://www.youtube.com/watch?v=xt3uyoe3Le0)

## Prerequisites

Before you use the AI Recorder, make sure you meet these requirements:

### Availability by region

Currently, The AI Recorder is available only in environments in the United States. Learn how to create an environment in the United States at [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).

### Availability by account type

Currently, AI Recorder is available only for users with a work or school account.

### Minimum Power Automate Desktop

You need Power Automate desktop version 2.48 or higher. Learn how to download the latest version at [Install Power Automate](https://aka.ms/DownloadPAD48).

## Create a desktop flow using the AI Recorder

To create a desktop flow using the AI Recorder:

1. **Open the AI Recorder:**

    In Power Automate for desktop, select **Record with Copilot**, and then select **Start**. If this option isn’t available, check the [Prerequisites](#prerequisites).

    :::image type="content" source="media/create-flow-with-ai-recorder/record-with-copilot.png" alt-text="Screenshot of the option to create a desktop flow by selecting the Record with Copilot option.":::

1. **Review the welcome screen:**

    A welcome screen shows some tips on using the recorder. Select **Next** to continue.

1. **Choose your recording settings:**

    If you have more than one monitor, select the one you want to record. Also, select the microphone and speaker you want to use for narration. Select **Next** to continue.

1. **Listen to the recording tips.**

    You hear some final tips before you start. When you're ready, select **Record**.

1. **Record the process:**

    Describe the process you want to automate as if you’re teaching someone how to do it. The more detail you give, the better the results.

1. **Finish recording:**

    When you finish, select **Done**. Power Automate analyzes the video, your narration, and mouse movements to create the automation. This process takes a few minutes.

1. **Review and customize:**

    After the analysis is done, the automation appears in the flow designer. Check it, make any changes you need, and fill in any missing details. When you're happy with it, save and run your automation. For more customization options, explore the flow designer options.

## Frequently asked questions

### What are some limitations of the AI Recorder?

* The AI Recorder is available only in environments based in the United States for users with work or school accounts. It supports only English at this time. We're working hard to expand support to more regions and languages soon.

* The AI Recorder needs you to speak and explain the automation process. If you don't provide narration, it doesn't generate an automation.

* You need to interact with clicks or keystrokes during recording. Just talking over a screen without any mouse or keyboard interaction doesn't produce an automation suggestion.

### How can I get the best results from the AI Recorder?

Speak clearly and show each step in detail as you demonstrate the process. Wait for screens to load completely and avoid interruptions or distractions during recording.

### Where can I watch a demo of the AI Recorder?

This video shows a demo of the AI Recorder:

> [!VIDEO 853935fc-c43c-4bf2-9a9d-12b83f3abcfd]

### What are some scenarios I can try with the AI Recorder?

You can try different scenarios, such as moving data from Excel to a web form, navigating websites, and extracting data.

### What languages are supported?

The AI Recorder supports English right now. We'll add more languages in future updates.

### How is the AI Recorder different from the Recorder?

The Recorder captures interactions like mouse clicks and keystrokes, and creates a desktop flow that repeats those actions. However, it doesn't capture logic such as conditions or loops.

The AI Recorder lets you explain the process verbally while showing it. The AI model then interprets your actions and narration and suggests an automation that includes conditions, loops, and necessary interactions.

### Why does the flow suggested by the AI Recorder have missing actions or UI selectors?

The AI Recorder is in preview, and we're constantly improving its accuracy. As an AI-powered tool, the AI Recorder is designed to get better over time. If you run into issues, we'd love your feedback to help us improve the AI Recorder for your specific use case. Contact us at <powerautomate-ai@microsoft.com> and we're happy to chat with you.

### How does the system manage recordings, and what measures are taken to ensure privacy and security?

When you use the recorder, your recording is securely uploaded to the cloud, where an AI model transforms it into a Power Automate desktop flow. The recording is kept only for a brief period necessary for processing and is deleted once processing is complete. The maximum delay for the recording to be deleted from the cloud service is 24 hours.

To protect your data, all recording data sent from and to Power Automate desktop is encrypted both during transit and at rest.

The recordings aren't used for training the AI model.

### What details does the recorder capture during a session?

When you start a recording, you can choose which screen to record and which microphone to use. A colored border shows around the screen being recorded. To avoid capturing sensitive information, make sure it isn't shown during the recording. If you accidentally record something you don't want to include, you can restart the recording or close the recorder. In these cases, the recordings aren't sent to the cloud for processing.

The recorder captures a video of the selected screen, audio from the chosen microphone, and necessary UI metadata to build the desktop flow.

## Share your feedback

Do you have any thoughts on the AI Recorder? We'd love to hear from you! Send us a note at <powerautomate-ai@microsoft.com>. We’d love to chat with you.
