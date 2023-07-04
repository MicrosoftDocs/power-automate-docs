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

The 'Inspect UI element' tool is a powerful feature in Power Automate for desktop that allows you to explore the hierarchy tree of all UI elements on your screen, check their attributes and values, and capture them for use in your desktop flow through the UI and Browser automation actions. 

## How launch 'Inspect UI elements' tool

To launch the 'Inspect UI element' tool, navigate to the designer component of Power Automate for desktop and go to the UI element repository. Click on the 'Add UI element' drop down and select the 'Inspect UI elements' option.

:::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

## Description of 'Inspect UI elements' tool##

When you launch the 'Inspect UI elements' tool, you'll see a hierarchy tree with all available UI elements on your machine. This includes both web and desktop UI elements, which are separated by their respective icons. Moreover, the web UI elements are split into each browser for easier navigation, displaying each tab that is opened in your browser as a parent UI element. Note that the tabs are not actual UI elements. You can expand the tree by clicking on the expand icon next to a UI element, which will load and display all of its children UI elements. 

> [!NOTE]
> Please note you will be able to see the desktop UI elements of a virtual desktop in case a connection is opened between your machine and the Citrix virtual desktop or the virtual machine through RDP and Power Automate agent for virtual desktops is installed and running in the virtual desktop/machine. More information: [Automate on virtual desktops](virtual-desktops.md)

:::image type="content" source="media/Repair selector/Repair_RepairButton_1.png" alt-text="Repair selector button.":::

Selecting a UI element in the hierarchy tree will display its attributes and values on the right pane of the tool. These attributes and values can be used to create a custom selector in the UI element builder of the designer for the specific UI element. In order to edit the selector of a UI element you have to capture it and open it in the UI element selector builder window. 

Moreover, you can capture the selected UI element and store it in the UI element repository of the desktop flow by clicking on the ‘Add UI element’ button on the top of the tool. This UI element can then be used in a UI automation or Browser automation action respectively, depending on its type (desktop or web UI element). 

The hierarchy tree is refreshed every time you expand a UI element, and you can refresh the whole tree by clicking on the ‘Refresh’ button on the top of the tool. 

In addition, while the ‘Inspect UI elements’ tool is opened, the Power Automate for desktop highlighter is visible. You can navigate directly to a specific UI element by hovering with your mouse over the desired UI element and clicking a right click. This will open the context menu and then you select the ‘Inspect UI element’ option. It will navigate you to the specific UI element in the hierarchy tree of the tool and select it, displaying its attributes and the respective values.


### See also

[Automate using UI elements](ui-elements.md)

[Automate desktop applications](desktop-automation.md)

[Automate webpages](automation-web.md)

[Build a custom selector](build-custom-selectors.md)

[Automate on virtual desktops](virtual-desktops.md)

