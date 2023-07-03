---
title: Inspect a UI element (Preview)
description: Inspect a UI element
author: nikosmoutzourakis
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 07/03/2023
ms.author: nimoutzo
ms.reviewer: ndoelman, matp, angieandrews
contributors:
- NikosMoutzourakis
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Inspect a UI element (Preview)

With the 'Inspect UI element' tool, you may explore the hierarchy tree of all UI elements that are available in your screen at the moment, check their attributes and their respective values and capture one or more UI elements for adding them into your desktop flow UI element repository.

## How launch 'Inspect UI elements' tool

You may launch the 'Inspect UI elements' tool by navigating to the designer component of Power Automate for desktop. There, you should go to the UI element repository and click on the 'Add UI element' drop down and select the respective option.

:::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

## Description of 'Inspect UI elements' tool##

Launching the ‘Inspect UI elements’ tool, you will see a hierarchy tree with all available UI elements in your machine. 

> [!NOTE]
> Please note you will be able to see the desktop UI elements of a virtual desktop in case a connection is opened between your machine and the Citrix virtual desktop or the virtual machine through RDP and Power Automate agent for virtual desktops is installed and running in the virtual desktop/machine. More information: [Automate on virtual desktops](virtual-desktops.md)

All UI elements are separated between web UI elements and desktop UI elements. You may observe their respective icons on the start of each element in the tool. Moreover, the web UI elements are split into each browser for easier navigation, displaying each tab that is opened in your browser as a parent UI element. Note that the tabs are not actual UI elements.

:::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

While you are expanding the tree by clicking on the expand icon next to a UI element, all UI elements in the next level (children UI elements) are loaded and then displayed. Selecting a UI element in the hierarchy tree, its attributes and the respective values are displayed on the right pane of the tool. The attributes and their values can be used to create a custom selector in the UI element builder of the designer for the specific UI element. Note that initially, you must capture the UI element and then edit it - manually set the selecctor of the UI element. 

You may capture the selected UI element and store it in the UI element repository of the desktop flow by clicking on the ‘Add UI element’ button on the top of the tool. This UI element can then be used in a UI automation or Browser automation action respectively, depending on its type (desktop or web UI element). 

The hierarchy tree is refreshed every time you expand a UI element. Also, you may refresh the whole tree by clicking on the ‘Refresh’ button on the top of the tool. 

Finally, while the ‘Inspect UI elements’ tool is opened, the Power Automate for desktop highlighter is visible. You may navigate directly to a specific UI element while the tool is opened by hovering with your mouse over the desired UI element and clicking a right click. This will open the context menu and then you select the ‘Inspect UI element’ option. It will navigate you to the specific UI element in the hierarchy tree of the tool and select it, displaying its attributes and the respective values. 

### See also

[Build a custom selector](build-custom-selectors.md)
