---
title: Use generative actions in cloud flows (preview)
description: Learn how to use generative actions in Power Automate to simplify automation with AI-generated suggestions.
ms.date: 01/16/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: HeatherOrt
contributors:
  - HeatherOrt
  - v-aangie
ms.author: heortaol
ms.reviewer: angieandrews
ms.collection: 
    - bap-ai-copilot
---

# Use generative actions in cloud flows (preview)

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

## Create a generative action

To create a generative action, you start in cloud flows designer.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, create a cloud flow using one of the following options:
    1. Select **Create** > one of the following options under **Start from blank**:
  
        - Automated cloud flow
        - Instant cloud flow
        - Scheduled cloud flow
        - Describe it to design it
        - Desktop flow

          :::image type="content" source="media/create-generative-actions/start-from-blank.png" alt-text="Screenshot of the create page in Power Automate":::

        Or

    1. Select **My flows** > **New flow** > one of the following menu options under **Build your own from blank**:

        - Automated cloud flow
        - Instant cloud flow
        - Scheduled cloud flow
        - Describe it to design it
        - Desktop flow

1. Give your flow a name, select a trigger, or follow the directions to build a flow.
1. Go to the designer by selecting **Create** or **Create flow**, depending on the flow type you selected.
1. In the designer, select the plus sign (**+**) to create an action, and then select **Add generative action (preview)**.
1. In the **Parameters** tab, select **+ New generative action**.

    :::image type="content" source="media/create-generative-actions/new-generative-action.png" alt-text="Screenshot of the option to create a new generative action.":::

1. To describe the automation you want to create, enter the intent of your automation in as many details as you like. Then, get an AI suggested action plan by selecting **Generate**.

    :::image type="content" source="media/create-generative-actions/generate-action.png" alt-text="Screenshot of a generative action description and the 'Generate' button.":::

### AI generated suggestions

AI generates suggested input and output types to use in the flow. AI also generates suggested connectors and actions that it can use to achieve the automation goal.

Inputs are texts that the generative action uses to execute the plan. This text can be passed dynamically from previous cloud flow actions. Inputs are limited to 2,500 characters.

Outputs are text that the generative action creates that can be used in succeeding actions in the flow.

> [!TIP]
> To remove additional detail or HTML and reduce input character count, review and use the **Compose** action on dynamic input.

:::image type="content" source="media/create-generative-actions/inputs-outputs.png" alt-text="Screenshot of a computer showing the AI-generated inputs and outputs":::

### Finalize your generative action

Finalize your generative action and preview it before execution. This allows you to make sure that the generative action is working as expected, and make necessary changes before adding it to your cloud flow.

1. Review, accept, or reject these suggestions.

    - If you don't accept suggestions, they're deleted when you preview or add your generative action to the flow.
    - You can add custom inputs, outputs, connectors, and actions if they aren't suggested.
    - The generative action doesn't execute on actions that aren't first added to the plan.

1. To preview your generative action, select the **Preview** tab.
1. Provide sample inputs for your generative action, such as an order ID or a customer name.

    The generative action shows you its thought process as it analyzes the inputs you provided against the intent of the automation. The generative action runs and pauses before taking any action while it's in preview. The logic, the data behind each action, and the expected outputs display.

1. Modify the inputs, outputs, or actions if needed, and run the preview again. Once you're satisfied with the preview, exit the preview mode.
1. When you're satisfied with your generative action, select **Add** to add it to your cloud flow.

## Add references to a generative action

You can add up to three Microsoft OneDrive documents as references. The generative action can use them as part of its execution.

The Microsoft Word document must be labeled as non-confidential and reside in the owner's OneDrive. Each Word document must be fewer than 10 MB.

## Monitor a generative action

You can monitor the run history and the performance of your generative action from the **My flows** page in Power Automate. You can also edit or customize your generative action at any time in the cloud flow designer.

To monitor and edit a generative action, follow these steps:

1. From the **My flows** page, select the **Generative actions** tab.

    You can display the list of your generative actions, their status, and their last run time.

1. To monitor the run history of a generative action, select the generative action name > **Run history**.

    The details of each run, such as the start time, end time, duration, status, inputs, and outputs, display. The reasoning behind each action that the generative action called, and the data that was used also display.

1. To edit or customize a generative action, select the generative action name > **Edit**.

    You can modify the instruction set or intent of the generative action, or the inputs, outputs, or actions that the generative action uses.

1. Save your changes and preview your generative action again.

## Known limitations

The following limitations apply to generative actions in cloud flows:

- Only text based inputs are supported.
- Cancelling the cloud flow doesn't cancel the running generative action. It must be canceled separately.
- Currently limited to the following connectors:
  - SharePoint
  - Office 365 Outlook
  - OneDrive for work or school
  - Planner
  - Microsoft Teams
  - Notifications
  - Office 365 Users
  - Approvals
  - Excel online for Business

  > [!NOTE]
  > if you wish to include more connectors in your generative actions use case, contact your representative.

- Data loss prevention (DLP) policies for cloud flows are supported exclusively at the generative action level. Differentiating connectors as Business or Non-Business between cloud flow connections and generative action connections isn't currently supported.

## Related information

[FAQ for generative actions in cloud flows](faqs-generative-actions.md)
