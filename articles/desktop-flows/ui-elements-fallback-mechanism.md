---
title: Set fallback mechanism for UI elements
description: Explore Power Automate's new feature, an image fallback mechanism for UI elements, increasing the success rate of executing UI or browser actions.
author: NikosMoutzourakis
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 06/17/2024
ms.author: nimoutzo
ms.reviewer: dmartens
contributors:
  - NikosMoutzourakis
  - DanaMartens
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:06/17/2024
---

# Fallback mechanism for UI elements

Power Automate for desktop introduces an enhanced method to bolster the robustness of your UI/Browser automation flows. Now, you can designate an image as a fallback mechanism for a UI element, to ensure reliable execution when predefined selectors fail to identify the element at runtime. By incorporating an image fallback, you significantly increase the likelihood of successfully executing UI or browser actions that interact with the specific UI element. When you activate this fallback mechanism and the selectors are unable to locate the UI element on the screen, the system utilizes the designated image to find it.

## How to set up the image fallback mechanism for a UI element

To enable the image fallback mechanism, launch the **Selector Builder** window for the specific UI element. Select **Image as fallback**.

:::image type="content" source="media/ui-fallback/ImageFallback_1.png" alt-text="Screenshot of how to set up an image as fallback mechanism.":::

This step opens the UI element picker tool.

:::image type="content" source="media/ui-fallback/ImageFallback_2.png" alt-text="Screenshot of the UI element picker to capture the image.":::

To create an image selector for a specific UI element, left-click on the element while pressing **Ctrl**. This action captures an image of the UI element and generates a corresponding image selector. Only one image selector can be associated with each UI element. As a result, the **Image as fallback** button is disabled once an image selector is created. You can view the captured image by selecting the image selector from the list of selectors in the window.

:::image type="content" source="media/ui-fallback/ImageFallback_3.png" alt-text="Screenshot of generated image selector in the UI element selectors' list.":::

## Actions on the image selector of the UI element

You can perform various actions on the image selector just as you would with standard selectors. These actions include deleting, renaming, testing, and repairing the image selector. Deleting an image selector removes it if it's no longer needed, while renaming allows you to change its name for better identification. Testing the image selector checks whether the captured image can be found on your screen; remember to ensure that the image is in the foreground for accurate testing. Repairing the image selector enables you to replace the current image with a new one.

:::image type="content" source="media/ui-fallback/ImageFallback_4.png" alt-text="Screenshot of the available actions on the image selector":::

## Known issues and limitations

- Fallback mechanism for UI elements isn't supported with the following actions:
  - Data extraction
  - Web data extraction
- The following actions don't support a fallback mechanism for UI elements when the parameters `Check if window`, `Wait until window`, `Check if web page`, or `Wait for web page to` are configured with the conditions `Contains text` or `Doesn't contain text`:
  - If window contains
  - Wait for window content
  - If web page contains
  - Wait for web page content
- The image selector is removed if the following conditions are met:
  - An image is saved as fallback mechanism for a UI component.
  - The flow is later opened and saved in a version of Power Automate for desktop that is v2.44 or earlier.
  
  This deletion is permanent, and the image selector can't be restored, even if the flow is later accessed with a newer version. To work around this issue, don't save the desktop flow in the older version of Power Automate for desktop or recapture the image to set as fallback.
