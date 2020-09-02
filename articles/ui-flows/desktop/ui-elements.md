---
title: UI elements and controls | Microsoft Docs
description: UI elements and controls
author: rokontol
ms.service: flow
ms.topic: article
ms.date: 09/01/2020
ms.author: rokontol
ms.reviewer: rokontol
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# UI elements and controls

Actions under the **UI automation** group are designed to directly interact with windows and applications. To achieve this result without resorting to image recognition or absolute coordinates, PAD utilizes **UI Controls** to identify windows and their elements.

## UI elements
When using a UI automation action, a UI element will have to be provided as input:

---------------IMAGE---------------

Add a UI element either directly from the action properties, or from the UI elements pane on the right hand side of the designer:

----------------IMAGE-----------------

To add an element to the flow, highlight it and press **Ctrl & click**:

When finished, press **Done**. Any UI elements captured will be added to the UI elements pane. Elements can be sorted alphabetically by selecting the **Sort** icon.

To rename or delete UI elements, right-click on an item and select the appropriate function.

To use a captured element in an action, simply select it from the drop-down list:

-----------------IMAGE----------------

## Selector Builder
Manage a UI element’s selectors by right selecting any UI element and selecting **Edit selector**. This brings up the Selector builder, where the selector can be edited with a visual editor. To manually enter the selector’s value, toggle **Visual editor** off, and the text value of the selector will become editable:

--------------IMAGE-------------