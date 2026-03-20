---
title: Self-healing (preview)
description: AI‑powered self‑healing when UI or web actions fail at runtime, allowing flows to continue instead of stopping on errors 
ms.date: 03/19/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: yiannismavridis
ms.author: iomavrid
ms.reviewer: null
ms.collection: bap-ai-copilot
contributors:
ms.custom:
---

# Self-healing (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Self-healing (preview) in Power Automate for desktop is an AI-powered capability, which helps desktop flows recover from UI and browser automation failures caused by missing or changed UI elements. Instead of stopping the flow when an element can’t be found, Self-healing (preview) can attempt to identify the most likely correct element at runtime and continue the flow run.

> [!IMPORTANT]
> - This is a preview feature.

## Prerequisites

### Availability by region

Self-healing isn't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

### Availability by account type

Currently, Self-healing (preview) in Power Automate for desktop is available for organization premium accounts and is provided at no additional cost. Usage may be sunject to service limits or changes.

## Self-healing (preview) for UI and browser automation actions at runtime

UI and web automation flows can fail when:

* Desktop apps or web pages change underlying element identifiers.
* UI elements remain visually similar, but their selectors no longer match.

Traditional error handling relies on deterministic retries and can’t adapt to these changes. Self-healing (preview) introduces an AI-powered fallback that attempts to recover automatically from 'Element not found' errors, improving flow resilience and reducing flow error rates, before a manual intervention takes place later for the required flow adjustments.

When a supported UI or browser automation action fails with an 'Element not found' error at runtime, Power Automate for desktop evaluates error handling for individual actions in the following order:

**Retry policy → Self-healing (preview) → 'Set variable / Run subflow' rules → Continue flow run / Throw error**

If Self-healing (preview) is enabled and invoked upon an error during runtime, Power Automate for desktop captures contextual information, including a screenshot of the missing UI element, the title of its parent window and the full desktop image, so that it can identify the most likely intended element and recapture its selector.
If the repair succeeds, the flow continues. If it fails, normal error handling resumes.

> [!NOTE]
> - Two large language models are currently used in combination to power Self-healing (preview), GPT‑4.1 mini and Claude Sonnet 4.5.

> [!IMPORTANT]
> - Self-healing (preview) is a runtime-only capability. It applies to console and cloud (attended and unattended) runs and has no effect during designer runs.

### Supported actions and scenarios

Currently, Self-healing (preview):
* Is available only for specific UI and browser automation actions that interact with a single UI element (for example, clicking a button or selecting a checkbox).
* Applies only to *Element not found* errors.
* Doesn’t apply to window handling, screen handling, or actions that interact with multiple elements.

## How to turn on the feature

### Required admin configuration

Self-healing relies on generative AI models and requires all of the following settings to be enabled:

* In Microsoft 365 admin center, navigate to [Copilot > Settings](https://admin.cloud.microsoft/?#/copilot/settings/ViewAll), then select **AI providers operating as Microsoft subprocessors**. Enable **Anthropic** provider as a subprocessor for your organization. You can learn more about AI subprocessors in this [article](https://learn.microsoft.com/copilot/microsoft-365/connect-to-ai-subprocessor).
> [!NOTE]
> - Microsoft enables Anthropic models by default for most customers in commercial cloud (excluding EU/EFTA and UK).
> - Anthropic models aren't currently available for use in government clouds (GCC, GCC High, DoD) or sovereign clouds.

* In Power Platform admin center, navigate to [Copilot > Settings](https://admin.powerplatform.microsoft.com/copilot/settings), then under the Power Platform section expand **External models** and enable **Anthropic** as a subprocessor at environment or environment group level. You can learn more about external language models in this [article](https://learn.microsoft.com/power-platform/admin/allow-llm-generative-responses).

* In Power Platform admin center, navigate to [Manage > Environments](https://admin.powerplatform.microsoft.com/manage/environments). Select your environment so that its details are displayed, then in the **Generative AI features** card, select Edit. The Generative AI features pane is displayed; review the terms of use and select the **Move data across regions** checkbox. You can learn more about cross-region data movement in this [article](https://learn.microsoft.com/power-platform/admin/geographical-availability-copilot#turn-on-data-movement-bing-search-and-microsoft-365-services-for-copilots-and-generative-ai-features).
> [!NOTE]
> - The **Move data across regions** checkbox isn't displayed or needed for US cloud regions.

* In Power Platform admin center, navigate to [Manage > Environments](https://admin.powerplatform.microsoft.com/manage/environments). Select your environment so that its details are displayed, then select **Settings**, expand the **Product** section and select **Features**. Under Copilot, enable the **Copilot features** toggle.

### Required configuration in Power Automate for desktop
- You need version 2.66 or higher for Power Automate for desktop.
- For repairing with Copilot, ensure the Copilot setting in the Power Platform Admin Center is turned on.
- Turn on the use of AI for self-healing issues. The **Repair at runtime** setting for the desired run mode (`attended` and `unattended`) can be found under the **Desktop flow repair at runtime configuration** setting in the Power Platform admin center.

    :::image type="content" source="media/repair-with-copilot/repair-with-copilot-ppac-setting.png" alt-text="Screenshot of repair at runtime setting for the respective run mode." lightbox="media/repair-with-copilot/repair-with-copilot-ppac-setting.png":::

- For newly created flows, turn on the **Repair flow errors** option.
- For existing flows, navigate to the respective desktop flow properties in the Power Automate for desktop console. Turn on the **Repair flow errors** property in the desktop flow's properties.

  - **Repair with Copilot**: This option allows for automated issue resolution with the assistance of Copilot.
  - **Repair**: This option turns on manual issue resolution, requiring you to specify the UI element on the screen at the moment of failure during runtime.

:::image type="content" source="media/repair-with-copilot/repair_flow_properties.png" alt-text="Screenshot for turning on the feature in flow properties.":::



### Known limitations

- This feature is available only in attended and unattended executions through the portal (cloud flow).
- This feature is available only in desktop flows saved in Schema v2.
- This feature is available only in the US region.
- The feature doesn't handle UI elements in virtual desktops.
- The feature doesn't support PictureInPicture executions.
- The feature doesn't support child flow execution.
- The feature doesn't support UI element collections.
- The feature can't apply to selectors that contain one or more variables.
- The unattended version of this feature doesn't yet support persisting a new selector in the desktop flow script during runtime.
- Drag-and-drop actions aren't supported at this phase.
- The **Apply for every run** option uses the user identity logged into the Power Automate for desktop console. If no user is signed into the console, the option isn't available.
