---
title: AI Builder actions reference (preview)
description: Learn about the available AI Builder action.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 03/09/2023
ms.author: gtrantzas
ms.reviewer: cochamos
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# AI Builder actions

[!INCLUDE[cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
>
> - This is a preview feature. To learn more, go to our [preview terms](https://go.microsoft.com/fwlink/?linkid=2189520).
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]
> - This capability is in process of rolling out, and may not be available in your region yet.
> - This capability may be subject to usage limits or capacity throttling.
> - This capability is in gated preview. Apply for consideration to take part in the trial. To apply, go to [Limited preview request](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR2LogRPRiTJDo1Rd8KnmcFRUMzlLTDZVQlJKSzNIWkVCMzE0VDFYVzk2QS4u).

The AI Builder group contains the **Create text with GPT on Azure OpenAI Service** action that creates text using the GPT language model.

After deploying the action, select **Create instructions** to open the instructions wizard. The wizard allows you to create instructions using existing templates or start from blank.

Learn more about the Azure OpenAI Service in [Azure OpenAI Service model overview (preview)](/ai-builder/prebuilt-azure-openai).

:::image type="content" source="media/aibuilder/create-text-with-gpt-on-azure-openai-service.png" alt-text="Screenshot of the Create instructions button in the Create text with GPT on Azure OpenAI Service action.":::

The GPT model is currently in preview and may make mistakes or have biases and other undesirable content. Therefore, to ensure that the AI-generated content is accurate, appropriate, and free from bias, always have humans review it.

Desktop flows recommend you add a **Display message** action with **Yes - No** buttons to require a human review of the generated content. A warning appears when this action doesn't exist. Learn more about the **Display message** action in [Message boxes actions](display.md).

:::image type="content" source="media/aibuilder/display-message.png" alt-text="Screenshot of the Display message action that prompts users to review the generated content.":::

## <a name="callgpt"></a> Create text with GPT on Azure OpenAI Service

Get a response from Azure OpenAI Service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Instructions|No|[Text value](../variable-data-types.md#text-value)||Provide instructions for the GPT model to perform a task|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|PredictV2Response|[Connector object](../variable-data-types.md#connector-object)||
|TextResponse|[Text](../variable-data-types.md#text-value)||

### <a name="callgpt_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Endpoint failure|Indicates an endpoint failure|
