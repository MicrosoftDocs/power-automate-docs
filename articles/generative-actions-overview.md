---
title: Overview of generative actions (preview)
description: Get an overview of generative actions, including benefits, how to author, monitor, and edit.
ms.date: 12/20/2024
ms.topic: conceptual
author: HeatherOrt
contributors:
  - HeatherOrt
  - v-aangie
ms.author: heortaol
ms.reviewer: angieandrews
ms.collection: 
    - bap-ai-copilot
---

# Overview of generative actions (preview)

[!INCLUDE[cc-preview-features-definition](includes/cc-preview-features-top-note.md)]

Generative actions are a new type of action that is authored, tested, and executed through an AI runtime. You specify only the *intent* of the action and the AI chooses the right set of actions in the right order based on your input, context, and intent.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Benefits of generative actions

Generative actions simplify automation by reducing the need for detailed specifications, adapt to changing scenarios using AI intelligence, and handle complex tasks involving multiple steps and integrations.

- Generative actions can simplify and accelerate the automation process by reducing the need for specifying the conditions and action sets to execute.
- Generative actions can adapt to changing scenarios and data sources by leveraging the AI runtime's intelligence and reasoning capabilities.
- Generative actions can handle complex and dynamic tasks that involve multiple steps, conditions, loops, branches, and integrations.

## Author generative actions

You can author generative actions in the cloud flows designer in Power Automate. When you give the system an intent, the AI generates suggested inputs, outputs, and actions to use in the action. You can choose to accept the AI suggestions, or reject them and add your own inputs and outputs.

In addition to inputs and outputs, the system also provides connectors and actions that it can use to achieve its intended automation goal. You can choose to accept, reject, or add your own.

 Once you create the action, you can preview how it behaves by providing sample inputs and verifying  what the action does. In the preview phase, the action pauses before taking any action. You can run this multiple times.

## Monitor a generative action

You can monitor your generative actions runs from the cloud flows run history. From the **My Flows** page, you can select any generative action under the **Generative actions** tab to get to its manage page. This page is where you can monitor the run history for the related generative action. To examine the process behind why a generative action called a specific action, you can dive into any run history instance.

## Edit or customize a generative action

To modify the instruction set or intent of a generative action at any time, select **Edit** in the flow design page.

