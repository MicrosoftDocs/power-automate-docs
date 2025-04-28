---
title: Build a custom selector
description: Build a custom selector
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 06/02/2021
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Build a custom selector

Although Power Automate enables users to create selectors automatically, some particular scenarios need manually created selectors. A common scenario is the automation of applications that display dynamic content.

When a custom selector is needed, you can modify an existing selector or build one from scratch.

To edit an existing selector, select the appropriate UI element and choose the selector you want to edit. 

![Screenshot of a selector's dialog.](media/build-custom-selectors/edit-selector.png)

You can create multiple selectors for a UI element. Whenever a selector fails, Power Automate uses the next selector in the defined order. To add more selectors for a UI element, capture a new selector using the **Selector with recapture** button or create a copy of an existing selector. To create a copy, right-click on the existing selector and select **Create a copy**.

![Screenshot of the buttons to capture a new selector and create a copy of an existing selector.](media/build-custom-selectors/create-new-selector.png)

In selectors, use the **>** notation to indicate the hierarchical structure of the selected elements. Each element in the selector is contained within the element on its left and displayed in the following form: 

**element[Attribute1=”Attribute1Name”][Attribute2=”Attribute2Name”]...[Attributen=”AttributenName”]**

The attributes of an element describe it uniquely and distinguish it from other elements in the same application. Enabling or disabling attributes can change the target application component of the selector. 

> [!NOTE]
> Web and desktop selectors have the same structure and functionality. The main differences between them are the available attributes. Web selectors use HTML attributes, while desktop selectors use different kinds of attributes based on the application design.

To specify an application component precisely, Power Automate utilizes multiple levels of selectors.

Selectors use a tree structure that describes the exact location of a component in the application or webpage. Each level is the child of the upper-level and the parent of the lower-level selector. The selector in the lower level describes the component you want to handle. 

This functionality enables Power Automate to distinguish a component from components with similar attributes in the same application. Disabling or enabling levels of selectors allows you to change the location in which Power Automate will search for the component.

For example, the following selector pinpoints the **File** menu option in a Notepad window. The first two levels of the selector describe the pane and menu bar of the window, while the third level describes the **File** option.

> [!NOTE]
> The Notepad window and the pane are different UI elements, but they have a parent-child relationship. 

![Screenshot of a selector that pinpoints the File menu option in an Notepad window.](media/build-custom-selectors/file-option-notepad-selector.png)

Assume that you want to edit the selector to work with a Notepad window named **Notes.txt**. To achieve this functionality, change the **Name** attribute of the selector to **Notes.txt - Notepad**. The new selector should be: **:desktop > window[Name="Notes.txt - Notepad"][Process="Notepad"]**.

![Screenshot of the updated Notepad selector.](media/build-custom-selectors/notepad-selector.png)

## Use operators in a custom selector

In the previous example, the selector located a Notepad window with a specific title. To make the selector more dynamic, replace the **Equal to** operator with other operators or regular expressions.

![Screenshot of all the available selector operators.](media/build-custom-selectors/selector-operators.png)

The **Equal to** operator makes the selector search for a specific hard-coded value. Although this functionality is effective in static applications, hard-coded values can be a barrier in dynamic applications.

Use the **Contains** operator to locate elements that don't have fixed values but always contain a specific keyword. For example, apply the **Contains** operator in the Notepad selector to make it work with all Notepad windows.

![Screenshot of the Contains operator in the Notepad selector.](media/build-custom-selectors/contains-operator-notepad-selector.png)

Apart from the **Equal to** and **Contains** operators, Power Automate provides four more operators: 

- **Not equal to**: Checks if an attribute contains any value except a specific one.
- **Starts with**: Checks if an attribute contains a value that starts with a particular character, keyword, or phrase.
- **Ends with**: Checks if an attribute contains a value that ends with a particular character, keyword, or phrase
- **Regular expression match**: Checks if an attribute contains a value that matches a custom regular expression. Power Automate's regular expression engine is .NET. You can find more information regarding regular expressions in [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

## Use variables in a custom selector

Apart from various operators, Power Automate enables you to create dynamic selectors using variables. If the value of a selector's attribute depends on calculations and results of previous actions, replace the hard-coded value with a variable.

To use a variable in a selector, populate its name manually enclosed by percentage signs (**%**) or use the variables button. Variables can be used in both the visual and text editor. You can find more information about the percentage notation in [Use variables and the % notation](variable-manipulation.md).

If you use a variable in the **Name** attribute of the Notepad example, the selector should be **:desktop > window[Name="%WindowName%"][Process="Notepad"]**.

![Screenshot of a variable in the Notepad selector .](media/build-custom-selectors/variable-notepad-selector.png)
