---
title: Set fallback mechanism for UI elements
description: Learn how to set fallback mechanisms for locating your UI elements
author: nimoutzo
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 06/17/2024
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---
# Fallback mechanism for UI elements
Power Automate for desktop introduces an enhanced method to bolster the robustness of your UI/Browser automation flows. Now, you can designate an image as a fallback mechanism for a UI element, to ensure reliable execution when predefined selectors fail to identify the element at runtime. By incorporating an image fallback, you significantly increase the likelihood of successfully executing UI or browser actions that interact with the specific UI element. When you activate this fallback mechanism and the selectors are unable to locate the UI element on the screen, the system utilizes the designated image to find it.

## How to set up the image fallback mechanism for a UI element
To enable the image fallback mechanism, launch the Selector Builder window for the specific UI element. Press the 'Image as fallback' button on your screen.

:::image type="content" source="media/UI fallback/ImageFallback_1.png" alt-text="Screenshot of how to set up an image as fallback mechanism.":::



This opens the UI element picker tool.

:::image type="content" source="media/UI fallback/ImageFallback_2.png" alt-text="Screenshot of the UI element picker to capture the image.":::




To create an image selector for a specific UI element, press **Ctrl** and **Left-click** on the element. This action captures an image of the UI element and generate a corresponding image selector. Only one image selector can be associated with each UI element. As a result, the 'Image as fallback' button is disabled once an image selector is created. You can view the captured image by selecting the image selector from the list of selectors in the window.

:::image type="content" source="media/UI fallback/ImageFallback_3.png" alt-text="Screenshot of generated image selector in the UI element selectors' list.":::


## Actions on the image selector of the UI element
You can perform various actions on the image selector just as you would with standard selectors. These actions include deleting, renaming, testing, and repairing the image selector. Deleting an image selector removes it if it is no longer needed, while renaming allows you to change its name for better identification. Testing the image selector checks whether the captured image can be found on your screen; remember to ensure that the image is in the foreground for accurate testing. Repairing the image selector enables you to replace the current image with a new one.

:::image type="content" source="media/UI fallback/ImageFallback_4.png" alt-text="Screenshot of the available actions on the image selector":::


## Known issues and limitations

- **Issue:** Fallback mechanism for UI elements in actions of 'Data extraction' and 'Web data extraction' is not supported.

 **Workaround:** None
- **Issue:** Fallback mechanism for UI elements in actions 'If window contains', 'Wait for window content', 'If web page contains', 'Wait for web page content' when the parameter 'Check if window'/'Wait until window'/'Check if web page'/'Wait for web page to' is set to 'Contains text' or 'Doesn't contain text', is not supported.

 **Workaround:** None
- **Issue:** When an image is saved for a UI element as fallback mechanism, and the user opens and saves the respective flow in an older Power Automate for desktop version - v2.44 or earlier- then the image selector is erased and cannot be retrieved even if the desktop flow is opened again with a newer version.

 **Workaround:** Don't save the desktop flow in the older version of Power Automate for desktop or recapture the image to set as fallback.
