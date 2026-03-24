---
title: Self-healing (preview)
description: AI‑powered self‑healing when UI or web actions fail at runtime, allowing flows to continue instead of stopping on errors 
ms.date: 03/20/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: yiannismavridis
ms.author: iomavrid
ms.reviewer: null
ms.collection: bap-ai-copilot
contributors:
ms.custom:
---

# Self-healing (Preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Self-healing (Preview) in Power Automate for desktop is an AI-powered capability that helps desktop flows recover from UI and browser automation failures caused by missing or changed UI elements. Instead of stopping the flow when an element can't be found, Self-healing (preview) can attempt to identify the most likely correct element at runtime and continue the flow run.

> [!IMPORTANT]
> This is a preview feature.

## Prerequisites

### Availability by region

Self-healing isn't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

### Availability by account type

Currently, Self-healing in Power Automate for desktop is available for organization premium accounts and is provided at no additional cost. Usage may be sunject to service limits or changes.

## Self-healing for UI and browser automation actions at runtime

UI and web automation flows can fail when:

* Desktop apps or web pages change underlying element identifiers.
* UI elements remain visually similar, but their selectors no longer match.

Traditional error handling relies on deterministic retries and can't adapt to these changes. Self-healing introduces an AI-powered fallback that attempts to recover automatically from 'Element not found' errors, improving flow resilience and reducing flow error rates, before a manual intervention takes place later for the required flow adjustments.

When a supported UI or browser automation action fails with an 'Element not found' error at runtime, Power Automate for desktop evaluates error handling for individual actions in the following order:

**Retry policy → Self-healing (preview) → 'Set variable / Run subflow' rules → Continue flow run / Throw error**

If Self-healing is enabled and invoked upon an error during runtime, Power Automate for desktop captures contextual information, including a screenshot of the missing UI element, the title of its parent window, and the full desktop image, so that it can identify the most likely intended element and recapture its selector.
If the repair succeeds, the flow continues. If it fails, normal error handling resumes.

> [!NOTE]
> Two large language models are currently used in combination to power Self-healing, GPT‑4.1 mini and Claude Sonnet 4.5.

> [!IMPORTANT]
> Self-healing is a runtime-only capability. It applies to console and cloud (attended and unattended) runs and has no effect during designer runs.

### Supported actions and scenarios

Currently, Self-healing:

* Is available only for specific UI and browser automation actions that interact with a single UI element (for example, clicking a button or selecting a checkbox).
* Applies only to *Element not found* errors.
* Doesn't apply to window handling, screen handling, or actions that interact with multiple elements.

## How to turn on the feature

### Required admin configuration

Self-healing relies on generative AI models and requires all of the following settings to be enabled:

* In Microsoft 365 admin center, go to [Copilot > Settings](https://admin.cloud.microsoft/?#/copilot/settings/ViewAll), and then select **AI providers operating as Microsoft subprocessors**. Enable the **Anthropic** provider as a subprocessor for your organization. To learn more about AI subprocessors, see the article [Anthropic as a subprocessor for Microsoft Online Services](/copilot/microsoft-365/connect-to-ai-subprocessor).

  > [!NOTE]
  > * Microsoft enables Anthropic models by default for most customers in commercial cloud (excluding EU/EFTA and UK).
  > * Anthropic models aren't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

* In Power Platform admin center, go to [Copilot > Settings](https://admin.powerplatform.microsoft.com/copilot/settings), and then under the Power Platform section, expand **External models** and enable **Anthropic** as a subprocessor at environment or environment group level. To learn more about external language models, see the article [Allow external language models for generative responses](/power-platform/admin/allow-llm-generative-responses).

* In Power Platform admin center, go to [Manage > Environments](https://admin.powerplatform.microsoft.com/manage/environments). Select your environment so that you can see its details. In the **Generative AI features** card, select **Edit**. The **Generative AI features** pane is displayed. Review the terms of use and select the **Move data across regions** checkbox. To learn more about cross-region data movement, see tne article [Move data across regions for Copilots, AI agents, and generative AI features](/power-platform/admin/geographical-availability-copilot#turn-on-data-movement-bing-search-and-microsoft-365-services-for-copilots-and-generative-ai-features).

  > [!NOTE]
  > The **Move data across regions** checkbox isn't displayed or needed for US cloud regions.

* In Power Platform admin center, go to [Manage > Environments](https://admin.powerplatform.microsoft.com/manage/environments). Select your environment so that you can see its details. Select **Settings**, expand the **Product** section, and select **Features**. Under Copilot, enable the **Copilot features** toggle.

### Required configuration in Power Automate for desktop

* You need version 2.66 or higher for Power Automate for desktop.
* Self-healing is enabled per action:
    * Select a supported UI or browser automation action in the flow designer. If Self-healing is available for that action, the respective visual indicator appears when you hover over the action in the workspace.

    :::image type="content" source="media/self-healing/self-healing-availability-indicator.png" alt-text="Screenshot of self-healing availability indicator.":::

  * Open the **Error handling** settings.
  * Turn on **Self-healing (Preview)**.

    :::image type="content" source="media/self-healing/self-healing-toggle-enabled.png" alt-text="Screenshot of self-healing toggle in error handling":::
  
* When enabled, the action can automatically retry by using AI when the element isn't found at runtime.

  :::image type="content" source="media/self-healing/self-healing-enabled-indicator.png" alt-text="Screenshot of enabled self-healing icon":::

> [!NOTE]
> Because Self-healing uses generative AI, it might occasionally identify an unintended UI element.

## Known limitations

* The Power Automate portal doesn't currently surface additional self-healing details in the action logs of the flow runs where self-healing was invoked. As a workaround, you can use this [registry setting](/power-automate/desktop-flows/governance#configure-power-automate-for-desktop-to-prevent-cleanup-of-flow-run-action-details) when needed, to easily retrieve action logs, including the Self-healing activity, through local log files on the machine that hosted the flow run. In the action logs, a new property called *repairWithAIInfo* displays if a repair attempt was made, whether it was successful or failed, and the AI-generated selector that was used at runtime.
