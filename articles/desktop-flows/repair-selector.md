---
title: Repair a selector
description: Repair a selector
author: nikosmoutzourakis
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 05/05/2023
ms.author: nimoutzo
ms.reviewer: ndoelman, matp
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

Repair selector is a feature that the user can correct an invalid selector in an easy and user-friendly manner. Power Automate for desktop automatically generates a repaired selector for the UI element that automation needs to interact with. Repair selector feature supports both desktop and web UI elements. The user should open the UI element Selector builder window.  Repair feature can be applied also for fixing a screen selector which is the parent element of a desktop UI element. 

 ## How to repair a selector 

The user should select the selector to be repaired and click on the 'Repair' option on the screen.  

   :::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

When the user opts for repairing a specific selector, the UI element picker is launched, displaying a screenshot of the UI element to be captured.  

   :::image type="content" source="media/Repair selector/Repair_Capture_2.png" alt-text="Repair selector Capture.":::

Please note that the UI element picker highlights only the UI elements of the same type as the type of the respective selector to be repaired. Therefore, if user repairs a desktop UI element, only the desktop UI elements can be highlighted and captured and for web selector case, only the web UI elements can be highlighted and captured respectively. 

User should capture the UI element by hovering the UI element to capture until the frame appears around it, then press Ctrl+Left click.  

After capturing successfully, the UI element, Power Automate for desktop generates a selector that will take into account both the old selector that is being repaired and the selector of the just captured UI element 

The repaired selector is suggested to the user to be reviewed while the changes in the selector are highlighted: 

   :::image type="content" source="media/Repair selector/Repair_Suggestion_3.png" alt-text="Repair selector suggestion."::: 

The user may accept by clicking on the OK option and replace the selector to be repaired with the newly generated selector: 

   :::image type="content" source="media/Repair selector/Repair_ReplaceRepaired_4.png" alt-text="Repair selector Replace the repaired.":::
 
If the user clicks on the Cancel button, then the selector is not repaired and the old selector remains intact. 

There will be cases that Power Automate for desktop will not be able to generate a repaired selector successfully.  

   :::image type="content" source="media/Repair selector/Repair_CannotRepair_5.png" alt-text="Repair selector cannot repair.":::

In this case, the user should ensure that the correct UI element is captured. If yes, then the user must repair the selector manually. 

> [!NOTE]
> The selectors that contain one or more variables cannot be repaired. The user should either replace the variable(s) with static values or repair the selector manually. 
