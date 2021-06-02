---
title: Build a custom selector | Microsoft Docs
description: Build a custom selector
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/02/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Build a custom selector

Power Automate Desktop enables you to interact with web and desktop applications through UI elements. You can consider UI elements as application components, such as buttons and text fields.

To specify a UI element, you have to create selectors that pinpoint the specific component you want to interact with.

> [!NOTE]
> Power Automate Desktop supports the creation of multiple selectors for a UI element. If a selector fails to access the element, the following selector is used.

Although Power Automate Desktop enables you to create selectors automatically, some particular scenarios need manually created selectors. A common scenario is the automation of applications that display dynamic content.

When a custom selector is needed, you can modify an existing selector or build one from scratch.

To edit an existing selector, select the appropriate UI element and choose the selector you want to edit. 

![The option to edit an existing selector.](media/build-custom-selectors/edit-selector.png)

To create a new selector, select the appropriate UI element and then the **New** button.

![The button to create a new selector.](media/build-custom-selectors/create-new-selector.png)

Selectors use the **>** notation to indicate the hierarchical structure of the selected elements. Each element in the selector is contained within the element on its left and displayed in the following form: **element[Attribute1=”Attribute1Name”][Attribute2=”Attribute2Name”]...[Attributen=”AttributenName”]**

For example, the following selector pinpoints the **File** menu option in an untitled Notepad window. 

> [!NOTE]
> The menu option and the Notepad window are different UI elements, but they have a parent-child relationship. 

![A selector that pinpoints the **File** menu option in an Notepad window.](media/build-custom-selectors/file-option-notepad-selector.png)

Now, assume that you want to edit the selector to work with a Notepad window named **Notes**. To achieve this functionality, change the **name** attribute of the selector to **Notes - Notepad**. The new selector should be: **window[Name="Notes- Notepad"][Process="notepad"]**

![The updated Notepad selector.](media/build-custom-selectors/notepad-selector.png)

## Use operators in a custom selector

## Use variables in a custom selector