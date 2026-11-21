---
title: AI-assisted UI automation repair (preview)
description: AI‑powered repair of selectors when UI or web actions fail during debugging, allowing flows to continue instead of stopping on errors 
ms.date: 07/06/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: yiannismavridis
ms.author: iomavrid
ms.reviewer: JoshuaPartlow
ms.collection: bap-ai-copilot
contributors:
ms.custom:
---

# AI-assisted UI automation repair (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

AI-assisted UI automation repair (preview) in Power Automate for desktop is an AI-powered capability that helps makers repair UI and browser automation actions when selector-related failures occur during debugging. Instead of manually inspecting and updating broken selectors, the feature analyzes the failing selector together with a newly captured selector of the same UI element and proposes a more resilient selector that makers can review, test, and apply.

> [!IMPORTANT]
> This is a preview feature.

## Prerequisites

AI-assisted UI automation repair is currently only available for certain account types in specific regions.

### Availability by region

AI-assisted UI automation repair in Power Automate for desktop isn't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

### Availability by account type

AI-assisted UI automation repair in Power Automate for desktop is currently available for organization premium accounts at no extra cost. Usage might be subject to service limits or changes.

## AI-assisted UI automation repair during debugging

Flows with UI and web automation actions often require maintenance when:

* Desktop applications or web pages change their UI structure.
* Existing selectors no longer uniquely identify the intended element.
* UI or browser automation actions start failing with *Element not found* errors.

Traditionally, makers must manually identify the affected action, recapture the element, compare selectors, and update the automation. AI-assisted UI automation repair introduces an AI-powered workflow that guides makers through this process and proposes an updated selector that they can immediately validate and apply.

When a supported UI or browser automation action encounters an eligible selector-related failure during debugging:

1. Power Automate for desktop identifies the failed action.
1. The maker recaptures the intended UI element.
1. The system analyzes the failing selector and the newly captured selector.
1. AI generates a suggested selector designed to be more resilient.
1. The maker can review, test, modify, accept, or skip the suggestion before continuing.

If the maker accepts the suggested selector, it's added to the selectors list of the affected element, so that the action is updated accordingly and the flow can continue to run. If the suggestion isn't appropriate, the maker can recapture the element again, manually edit the selector, or ignore the recommendation, relying on potential error handling rules that might be in place.

> [!NOTE]
> AI-assisted UI automation repair is intended to assist the maker. The maker remains responsible for reviewing and validating any selector changes before saving them.

> [!NOTE]
> The GPT‑5 Chat model powers AI-assisted UI automation repair, except for the Singapore region where GPT-4.1 is used instead.

> [!IMPORTANT]
> Unlike [self-healing](self-healing.md) that applies at runtime, AI-assisted UI automation repair is a debugging capability, available only through the flow designer. It doesn't automatically repair selectors during unattended or attended runtime execution.

### Supported actions and scenarios

Currently, AI-assisted UI automation repair:

* Supports eligible UI and browser automation actions that use UI element selectors.
* Helps address selector-related failures, including common *Element not found* errors. It generates suggestions based on the available selector information.
* Requires user review and approval before it applies selector changes.
* Doesn't automatically modify flows without user interaction.
* Doesn't affect other actions, nor can it fix errors that are irrelevant to selectors. Such errors also interrupt the AI-assisted run.

## How to turn on and use the feature

### Required admin configuration

AI-assisted UI automation repair relies on generative AI models and requires the same Copilot prerequisite as other AI-powered capabilities in Power Automate:

* In Power Platform admin center, go to [Copilot > Settings](https://admin.powerplatform.microsoft.com/copilot/settings). Under the Power Automate section, select **Copilot in Power Automate**, and then enable the **On** check box in the displayed pane.

### Using the feature in Power Automate for desktop

* You need version 2.70 or higher for Power Automate for desktop.
* Open a desktop flow that contains UI or browser automation actions.
* In the flow designer, select the option **Run with AI-assisted UI Automation Repair** to start debugging the flow with the AI system's assistance.

  :::image type="content" source="media/ai-assisted-ui-automation-repair/run-with-ai-assisted-ui-automation-repair-option.png" alt-text="Screenshot of option 'Rund with AI-assisted UI Automation Repair.":::
  
  > [!NOTE]
  > If the flow doesn't use UI or browser automation actions, trying to run with AI-assisted UI automation repair displays the proper message.

* The new dialog interface that appears walks you through the AI system's steps when the flow run goes through actions that reference UI elements, validating their selector.

  :::image type="content" source="media/ai-assisted-ui-automation-repair/ai-assisted-ui-automation-repair-interface.png" alt-text="Screenshot of dialog interface of AI-assisted UI Automation Repair.":::

* When an eligible selector-related failure occurs, the system prompts you to capture the target element and its current selector.

  :::image type="content" source="media/ai-assisted-ui-automation-repair/ai-assisted-ui-automation-repair-erroneous-selector.png" alt-text="Screenshot of erroneous selector during the scan of AI-assisted UI Automation Repair.":::

* Capture the intended UI element.
* Review, edit, and test the proposed selector.

  :::image type="content" source="media/ai-assisted-ui-automation-repair/ai-assisted-ui-automation-repair-proposed-selector.png" alt-text="Screenshot of proposed selector during the scan of AI-assisted UI Automation Repair.":::

* Accept the selector, recapture the UI element to repeat the process, or skip the suggestion.

  > [!NOTE]
  > If you skip the suggestion and no error handling is in place, the run throws an error and the AI-assisted debugging run stops.

* When you accept a valid repair suggestion, the updated selector is added to the element's selectors list in the flow and the flow run continues with the following actions. If the designer run completes successfully, a summary with the AI system's activity on valid, repaired, and skipped selectors is displayed.

:::image type="content" source="media/ai-assisted-ui-automation-repair/ai-assisted-ui-automation-repair-summary.png" alt-text="Screenshot of the activity summary of AI-assisted UI Automation Repair.":::

* Any selector changes you apply during an AI-assisted run (either incomplete or completed successfully) temporarily store in the flow. The changes are permanently saved when you save the flow, as is the case with any other edits in the flow.
