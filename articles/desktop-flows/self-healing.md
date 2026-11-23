---
title: Self-healing (preview)
description: AI‑powered self‑healing when UI or web actions fail at runtime, allowing flows to continue instead of stopping on errors 
ms.date: 11/23/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: yiannismavridis
ms.author: iomavrid
ms.reviewer: smurkute
ms.collection: bap-ai-copilot
contributors:
- shwetamurkute
ms.custom:
---

# Self-healing (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Self-healing (preview) in Power Automate for desktop is an AI-powered capability that helps desktop flows recover from UI and browser automation failures caused by missing or changed UI elements. Instead of stopping the flow when an element can't be found, self-healing (preview) can attempt to identify the most likely correct element at runtime and continue the flow run.

> [!IMPORTANT]
> This feature is in preview.

## Prerequisites

Self-healing is currently available only for certain account types in specific regions.

### Availability by region

Self-healing in Power Automate for desktop isn't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

### Availability by account type

Self-healing in Power Automate for desktop is currently available for organization premium accounts at no extra cost. Usage might be subject to service limits or changes.

## Self-healing for UI and browser automation actions at runtime

UI and web automation flows can fail when:

- Desktop apps or web pages change underlying element identifiers.
- UI elements remain visually similar, but their selectors no longer match.

Traditional error handling relies on deterministic retries and can't adapt to these changes. Self-healing introduces an AI-powered fallback that attempts to recover automatically from *Element not found* errors, improving flow resilience and reducing flow error rates, before a manual intervention takes place later for the required flow adjustments.

When a supported UI or browser automation action fails with an *Element not found* error at runtime, Power Automate for desktop evaluates error handling for individual actions in the following order:

**Retry policy → Self-healing (preview) → 'Set variable / Run subflow' rules → Continue flow run / Throw error**

If self-healing is enabled and invoked upon an error during runtime, Power Automate for desktop captures contextual information, including a screenshot of the missing UI element, the title of its parent window, and an image of that window, so that it can identify the most likely intended element and recapture its selector.
If the repair succeeds, the flow continues. If it fails, normal error handling resumes.

> [!NOTE]
> Self-healing is powered by the GPT‑6 Luna model.

> [!IMPORTANT]
> Self-healing is a runtime-only capability. It applies to console and cloud (attended and unattended) runs and has no effect during designer runs.

### Supported actions and scenarios

Currently, Self-healing:

- Is available only for specific UI and browser automation actions that interact with a single UI element (for example, clicking a button or selecting a checkbox).
- Applies only to *Element not found* and *Window not found* errors. *Element not found* errors are captured in both primary and secondary screens, while *Window not found* errors are only captured when the window is found in the main screen.
- Doesn't apply to window or screen handling actions, or actions that interact with multiple elements like 'Drag and drop UI element in window'.

## How to turn on the feature

### Required admin configuration

Self-healing relies on generative AI and requires the following settings to be enabled:

- In Power Platform admin center, go to [**Manage** > **Environments**](https://admin.powerplatform.microsoft.com/manage/environments). Select your environment so that you can see its details. In the **Generative AI features** card, select **Edit**. The **Generative AI features** pane is displayed. Review the terms of use and select the **Move data across regions** checkbox. To learn more about cross-region data movement, see the article [Move data across regions for Copilots, AI agents, and generative AI features](/power-platform/admin/geographical-availability-copilot#turn-on-data-movement-bing-search-and-microsoft-365-services-for-copilots-and-generative-ai-features).

  > [!NOTE]
  > The **Move data across regions** checkbox isn't displayed or needed for US cloud regions.

- In Power Platform admin center, go to [Copilot > Settings](https://admin.powerplatform.microsoft.com/copilot/settings). Under the Power Automate section, select **Copilot in Power Automate**, then enable the **On** check box in the displayed pane.

### Required configuration in Power Automate for desktop

- You need version 2.66 or higher for Power Automate for desktop.
- Enable self-healing per action:
    * Select a supported UI or browser automation action in the flow designer. If self-healing is available for that action, the visual indicator appears when you hover over the action in the workspace.

    :::image type="content" source="media/self-healing/self-healing-availability-indicator.png" alt-text="Screenshot of self-healing availability indicator.":::

  - Open the **Error handling** settings.
  - Turn on **Self-healing (Preview)**.

    :::image type="content" source="media/self-healing/self-healing-toggle-enabled.png" alt-text="Screenshot of self-healing toggle in error handling":::
  
- When enabled, the action can automatically retry by using AI when the element isn't found at runtime.

  :::image type="content" source="media/self-healing/self-healing-enabled-indicator.png" alt-text="Screenshot of enabled self-healing icon":::

> [!NOTE]
> Because self-healing uses generative AI, it might occasionally identify an unintended UI element.

## Self-healing logs

The Power Automate portal surfaces self-healing details in the action-level logs of the flow runs where self-healing was invoked, mentioning the selector that was used per case in each successful self-healing attempt. In the desktop flow run page, you can also find a summary of the self-healing activity that corresponds to that specific run, including details from up to three successful self-healing attempts.

