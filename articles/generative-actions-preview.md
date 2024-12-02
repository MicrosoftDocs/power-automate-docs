---
title: Creating and Managing Generative Actions in Power Automate
description: Learn how to create, monitor, and manage generative actions in Power Automate to simplify and accelerate automation processes.
author: v-aangie
contributors:
ms.topic: conceptual
ms.date: 11/25/2024
ms.author: v-aangie
ms.reviewer: angieandrews
---

---
title: Create generative actions in cloud flows (preview)
description: Learn how to create generative actions in cloud flows.
ms.date: 10/14/2024
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

# Create generative actions in cloud flows (preview)

[!INCLUDE[cc-preview-features-definition](includes/cc-preview-features-top-note.md)]





[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

# Introduction

Generative actions are a new type of automation that is authored, tested and executed through an AI runtime. Generative actions can simplify and accelerate the automation process by reducing the need for specifying the action sets and sequencing to execute. Generative actions can also adapt to changing scenarios and data sources by leveraging the AI runtime's intelligence and reasoning capabilities. Generative actions can handle complex and dynamic tasks that involve multiple steps, conditions, loops, branches, and integrations.

# Creating a generative action

To create a Generative action, you start in Cloud Flows designer:

- From the create page or the My flows page in Power Automate create a cloud flow through any selected trigger

  :::image type="content" source="media/generative-actions-preview/image1.png" alt-text="Screenshot of a computer showing the create page in Power Automate":::

- Once in the designer select to create an action and select “Add generative action (preview)”. Or select from the action search panel.

  :::image type="content" source="media/generative-actions-preview/image2.png" alt-text="Screenshot of a computer showing the action search panel in Power Automate":::

- Select “+ New generative action”

  :::image type="content" source="media/generative-actions-preview/image3.png" alt-text="Screenshot of a computer showing the option to create a new generative action":::

- You are presented with the option to describe the automation you want to create. You can enter the intent of your automation here in as many details as you like. Select “Generate” to have the AI suggest an action plan.

  :::image type="content" source="media/generative-actions-preview/image4.png" alt-text="Screenshot of a computer showing the option to describe the automation intent":::

- The AI will generate suggested inputs and outputs types to use in the flow. The AI will also generate suggested connectors and actions that it can use to achieve the automation goal.

  - Inputs are texts that the generative action will use to execute the plan. This text can be passed dynamically from previous cloud flow actions.
  - Inputs are limited to 2,500 characters.
  - Outputs are text that the generative action will create that can be used in succeeding actions in the flow.

  > [!TIP]
  > Review and use compose action on dynamic input to remove additional detail or HTML and reduce input character count

  :::image type="content" source="media/generative-actions-preview/image5.png" alt-text="Screenshot of a computer showing the AI-generated inputs and outputs":::

- You can review, accept, or reject these suggestions. If suggestions are not accepted they will be deleted when you preview or add your generative action to the flow. You can also add custom inputs, outputs, connectors and actions even if they are not suggested.

  - The generative action will not be able to execute on any actions that are not first added to the plan.

- You can then choose to preview your generative action in the “Preview” tab.

  - Provide sample inputs for your generative action, such as an order ID or a customer name.
  - The generative action will show you its “Thought Process” as it analyzes the inputs you’ve provided against the intent of the automation
  - The generative action will run and pause before taking any action while its in preview. You can see the logic and the data behind each action, and the expected outputs.
  - You can modify the inputs, outputs, or actions if needed, and run the preview again. Once you are satisfied with the preview, you can exit the preview mode.

- Once you are satisfied with your generative action you can click “Add” and have it added to your cloud flow.

# Adding references to a generative action

You can add up to 3 OneDrive documents as references which the Generative action can use as part of its execution.

- The word document must be labeled as non-confidential and reside in the owner’s OneDrive
- Each word document must be under 10MB

# Monitoring a generative action

You can monitor the run history and the performance of your generative action from the My flows page in Power Automate. You can also edit or customize your generative action at any time. To monitor and edit a generative action, you need to follow these steps:

- From the My flows page, select the “Generative actions” tab.
- You can see the list of your “Generative actions”, their status, and their last run time.
- To monitor the run history of a generative action, select the generative action name and then select Run history.
- You can see the details of each run, such as the start time, end time, duration, status, inputs, and outputs.
- You can also see the reasoning behind each action that the generative action called, and the data that was used.
- To edit or customize a generative action, select the generative action name and then select Edit.
- You can modify the instruction set or intent of the generative action, or the inputs, outputs, or actions that the generative action uses.
- Save your changes and preview your generative action again.

# Known limitations:

- Only text based inputs are supported
- Cancelling the cloud flow will not cancel the running generative action, it must be cancelled separately.
- Currently limited to the following connectors:

  - SharePoint
  - Office 365 Outlook
  - OneDrive for Business
  - Planner
  - Microsoft Teams
  - Notifications
  - Office 365 Users
  - Approvals
  - Excel online for Business

  > [!NOTE]
  > Please contact your PM representative if you wish to include more connectors in your Generative actions use case

- DLP policies for Cloud flows are supported exclusively at the Generative Action level. Differentiating connectors as Business or Non-Business between Cloud flow connections and Generative Action connections is not currently supported.