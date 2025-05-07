---
title: Repair a selector
description: Repair a selector
author: nikosmoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 05/05/2023
ms.author: nimoutzo
ms.reviewer: ndoelman, matp, angieandrews
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Repair a selector

Repair selector is a powerful feature that enables you to easily and intuitively correct invalid selectors. By automatically generating a repaired selector for the UI element that automation needs to interact with, Power Automate for desktop makes it simple to maintain automation flows. The repair selector feature is available for both desktop and web UI elements. To take advantage of it, open the UI element selector builder window and opt for the related option in the screen. This feature can also be used to fix a screen selector that is the parent element of a desktop UI element.

## How to repair a selector

You should select the selector to be repaired and select the **Repair** option on the screen.  The **Repair** option can be selected while the user is at the selector builder view or the text editor view.

:::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

When you opt for repairing a specific selector, the UI element picker is launched, displaying a screenshot of the UI element to be captured.  

:::image type="content" source="media/Repair selector/Repair_Capture_2.png" alt-text="Repair selector Capture.":::

Note that the UI element picker highlights only the UI elements of the same type as the type of the respective selector to be repaired. Therefore, if you repair a desktop UI element, only the desktop UI elements can be highlighted and captured and for the web selector case, only the web UI elements can be highlighted and captured.

Capture the UI element by hovering over the UI element until the frame appears around it, then press Ctrl+Left click.  

After capturing the UI element successfully, Power Automate for desktop generates a selector that takes into account both the old selector that is being repaired and the selector of the just captured UI element.

The repaired selector is presented to you for your review with the changes in the selector highlighted. Select **OK** to accept the suggested repair.

:::image type="content" source="media/Repair selector/Repair_Suggestion_3.png" alt-text="Repair selector suggestion."::: 

The previous select is replaced by the repaired selector. Select **Save** to complete the repair.

:::image type="content" source="media/Repair selector/Repair_ReplaceRepaired_4.png" alt-text="Repair selector Replace the repaired.":::

If you select **Cancel**, the selector isn't repaired and the old selector remains intact.

There are cases when Power Automate for desktop won't be able to generate a repaired selector successfully. When this happens, you should make sure that the correct UI element is captured. If the UI element still can't be repaired, you must repair the selector manually. 

> [!NOTE]
> The selectors that contain one or more variables can't be repaired. Either replace the variables with static values or repair the selector manually. More information: [Build a custom selector](build-custom-selectors.md)

## Related information

[Build a custom selector](build-custom-selectors.md)
