---
title: UI elements and controls | Microsoft Docs
description: UI elements and controls
author: mariosleon

ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Automate using UI elements

Power Automate for desktop utilizes UI elements to interact with applications and web pages without resorting to image recognition and absolute coordinates. UI elements are used as input in most UI automation and browser automation actions and identify specific elements on windows and web pages.

## UI elements

When deploying a UI automation or browser automation action, you may be required to provide a UI element as input. To add a new UI element, you can do it directly from the action properties or through the UI elements pane of the flow designer.

Each one of these action groups accepts a different category of UI elements. UI automation actions accept UI elements captured from desktop applications, while browser automation actions accept UI  elements captured from web pages.

> [!NOTE]
> UI automation actions can use only UI elements for desktop applications, while the browser automation actions can use only UI elements for webpages. Therefore, incompatible UI elements aren't available for selection. 

![Screenshot of the available UI elements in the Press button in window action.](media/ui-elements/ui-element-input.png)

To add a new UI element to your flow, select to add a new UI element through an action or the UI elements pane, highlight the respective element, and press **Left Ctrl + Left click**. When the selection is finished, select **Done**. 

![Screenshot of a highlighted element.](./media/ui-elements/capturing-ui-elements.png)

Any captured UI elements will be added to the UI elements pane. To access the UI elements pane, select the UI elements tab on the right-hand side of the flow designer.

![Screenshot of the UI elements tab.](./media/ui-elements/ui-elements-tab.png)

Elements can be sorted alphabetically through the **Sort** option of the  UI elements tab. To remove all the UI elements that aren't used in any action, select the dots icon next to the **Sort** option and then **Remove unused UI elements**.

To rename or delete a UI element, right-click on the respective item and select the appropriate function.

To find where a specific UI element is being used in the flow, right-click on it and select **Find usages**. The results will display all the actions that use this UI element. Double-click on a result to highlight the action on the workspace.

![Screenshot of the UI elements pane.](./media/ui-elements/ui-elements-pane.png)

## UI elements types

UI automation and browser automation actions accept two different kinds of UI elements. UI automation actions accept only UI elements captured from desktop applications, while browser automation actions accept only UI elements captured from web pages.

To distinguish a UI element for a desktop application from a UI element for a web page, check its parent selector element. UI elements for desktop applications usually have the desktop as their parent element, while the UI elements for web pages have a webpage as their parent element.

![Screenshot of a selector of a UI element for destop applications.](./media/ui-elements/ui-element-desktop-selector.png)

### UI elements for web pages

To capture a UI element from a webpage, you need to install the appropriate browser extension. You can find more information about the supported browsers and the required extension in [Use browsers and manage extensions](using-browsers.md).

When the browser extension isn't able to communicate with Power Automate, the browser window is identified as a desktop application. As a result, Power Automate tries to grab UI elements for a desktop application and not a web page.

## UI elements properties

To manage a UI element’s selectors, right-click on the element and select **Edit selector**. This option brings up the Selector builder, where the selector can be edited with a visual editor.

![Screenshot of the visual selector builder.](./media/ui-elements/visual-selector-editor.png)

To manually enter the selector’s value, toggle off Visual editor, and the text value of the selector will become editable. You can find more information about selectors in [Build a custom selector](build-custom-selectors.md).

![Screenshot of the manual selector builder.](./media/ui-elements/manual-selector-editor.png)

[!INCLUDE[footer-include](../includes/footer-banner.md)]

