---
title: Automate using UI elements
description: Learn how to capture UI elements in your desktop flows.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 05/14/2026
ms.author: nimoutzo
ms.reviewer: ellenwehrle
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---
# Automate using UI elements

Desktop flows use UI elements to interact with applications and webpages, so they don't need to use image recognition or absolute coordinates. Most UI automation and browser automation actions use UI elements as input to identify specific elements on windows and webpages.

## UI elements

When you deploy a UI automation or browser automation action, you might need to provide a UI element as input. To add a new UI element, you can add it directly from the action properties or through the UI elements pane of the flow designer.

Each one of these action groups accepts a different type of UI elements. UI automation actions accept desktop UI elements, while browser automation actions accept web UI elements.

:::image type="content" source="media/ui-elements/ui-element-input.png" alt-text="Screenshot of the available UI elements in the Press button in window action.":::

To add a new UI element to your flow, add a new UI element through an action or the UI elements pane, highlight the respective element, and press **Ctrl + Left click**. When the selection is finished, select **Done**.

:::image type="content" source="media/ui-elements/capturing-ui-elements.png" alt-text="Screenshot of a highlighted element.":::

> [!NOTE]
> The UI element picker supports capturing UI Automation (UIA), Raw view of UI Automation v3 (UIA3 Raw), and Microsoft Active Accessibility (MSAA) selectors when working with desktop UI elements. By default, the picker operates in UIA mode. You can change the capturing mode by using the menu located in the top-right corner of the UI element picker. Select MSAA to target legacy applications that don't expose UIA selectors, or UIA3 Raw when you need to expose and capture all intermediate layers in the Raw automation tree. When you enable MSAA or UIA3 Raw mode, a banner appears in the UI element picker to indicate that you're capturing MSAA or UIA3 Raw selectors respectively. For more information about the difference between UIA, UIA3 Raw, and MSAA selectors, see [UI elements types](#ui-elements-types).

Any captured UI elements are added to the UI elements pane. To access the UI elements pane, select the UI elements tab on the right-hand side of the flow designer.

:::image type="content" source="media/ui-elements/ui-elements-tab.png" alt-text="Screenshot of the UI elements tab.":::

You can sort elements alphabetically through the **Sort** option of the  UI elements tab. To remove all the UI elements that aren't used in any action, select the dots icon next to the **Sort** option and then **Remove unused UI elements**.

To rename or delete a UI element, right-click on the respective item and select the appropriate function.

To find where a specific UI element is used in the flow, right-click on it and select **Find usages**. The results display all the actions that use this UI element. Double-click on a result to highlight the action on the workspace.

:::image type="content" source="media/ui-elements/ui-elements-pane.png" alt-text="Screenshot of the UI elements pane.":::

## UI element types

Desktop flows support two types of UI elements based on their source: desktop UI elements and web UI elements.

You can capture desktop UI elements from any Windows application, including non-webpage components of browsers, such as the address bar. Within desktop UI elements, three types of selectors are supported:

- **UI Automation (UIA) selectors**

    UIA is the modern accessibility framework introduced by Microsoft to replace MSAA. It's the recommended technology for automating most Windows applications, especially those built with newer UI frameworks such as WPF, WinForms, and Universal Windows Platform (UWP). UIA offers more robust and detailed element information, improved hierarchy structures, and greater reliability in automation scenarios.

    Use UIA selectors whenever possible for better performance, maintainability, and support across modern desktop applications.

- **Microsoft Active Accessibility (MSAA) selectors**

    MSAA is an older accessibility technology that predates UIA. It's primarily used for legacy applications that don't expose UIA elements, such as older Windows applications built with technologies like VB6 or classic Win32. While MSAA provides less detail and structure than UIA, it's essential for enabling automation in environments where UIA isn't available.

    Use MSAA selectors when targeting legacy or custom-built applications that don't expose their UI components through UIA.

- **UIA3 Raw selectors**

    UIA3 Raw is an advanced UI Automation–based capturing mode that uses the UIA3 framework to access the raw, unfiltered UI element tree. Unlike standard UIA selectors, which rely on a refined control view of the application, UIA3 Raw exposes all elements in the UI hierarchy, including intermediate, non-interactive, and framework-level components.

    This mode is particularly useful for automating applications with complex or non-standard UI structures, such as custom-rendered controls, Electron-based apps, or cases where elements aren't accessible through standard UIA selectors. UIA3 Raw can reveal additional hierarchy layers and properties that aren't otherwise available, enabling more precise targeting in challenging scenarios.
  
    Use UIA3 Raw selectors when UIA selectors can't reliably capture or identify elements, or when deeper access to the application's UI structure is required.

The UI element picker in UI automation actions lets you capture only desktop UI elements. A capturing mode menu in the top-right corner of the picker lets you select between UIA, UIA3 Raw, and MSAA modes. By default, the picker uses UIA, but you can switch to UIA3 Raw for advanced scenarios or MSAA when automating legacy applications. A visible message in the picker indicates when a nondefault mode is active.

The UI elements pane displays captured elements, with an indicator showing whether the elements were captured by using UIA, UIA3 Raw, or MSAA. This indicator helps you identify the selector type used for each element in your flow.

> [!IMPORTANT]
> You can capture elements from webpages through the UI element picker of UI automation actions. However, their selectors represent desktop elements, not web elements.

You can capture web UI elements from webpages and use them only in browser automation actions.

Browser automation actions accept exclusively UI elements captured from webpages. Therefore, the UI elements picker of these actions doesn't display existing UI elements captured from desktop applications.

For more information about desktop and web automation, see [Automate desktop flows](desktop-automation.md) and [Automate web flows](automation-web.md).

### UI elements for webpages

To capture a UI element from a webpage, you need to install the appropriate browser extension. For more information about supported browsers and the required extension, see [Use browsers and manage extensions](using-browsers.md).

### Distinguish desktop from web UI elements

The UI elements pane shows distinctive visual indications to help you quickly recognize the difference between desktop and web UI elements.

:::image type="content" source="media/ui-elements/ui-element-type-visual-indication1.png" alt-text="Screenshot of the UI element type visual indications in the UI element pane.":::

When you capture a desktop element, the desktop icon appears. When you capture a web element, the web icon appears. This way, you confirm the element type before saving it.

:::image type="content" source="media/ui-elements/ui-element-type-visual-indication-capturing.png" alt-text="Screenshot of a UI element type visual indication during capturing.":::

Another method to check the type of a UI element is to review its selectors. Desktop UI elements usually have the desktop as their parent element, while web UI elements have a webpage as their root element.

:::image type="content" source="media/ui-elements/ui-element-desktop-selector.png" alt-text="Screenshot of a selector of a desktop UI element.":::

### UI elements in browser windows

Automate the application part of a browser (1) by using desktop UI elements. For example, use UI automation actions to interact with the address bar or the tabs.

On the other hand, automate the loaded webpages inside the browser (2) by using web UI elements and browser automation actions.

During recording, the recorder automatically distinguishes the browser application area from the webpages and generates the appropriate UI elements and actions.

:::image type="content" source="media/ui-elements/browser-window.png" alt-text="Screenshot of a Microsoft Edge window with highlighted the browser application and webpage areas.":::

Interactions with drag and drop web UI elements might not function as expected due to their inherent limitations. As a workaround, capture desktop UI elements in a web page by opening the UI element picker through an action of the UI automation group by selecting **Add UI element** within the `UI element` parameter. The captured UI element is of desktop type and can be used in the `Drag and drop UI element in window` action. Keep in mind that you can use desktop UI elements only in actions of the UI automation action group of Power Automate for desktop. It's important to note that desktop UI elements in web pages aren't as reliable as their web counterparts and are subject to browser application details, such as the browser's version.

## UI elements properties

All UI elements consist of one or more selectors that pinpoint the UI or web component that Power Automate interacts with.

>[!NOTE]
> Users can create multiple selectors for a UI element. Whenever a selector fails, Power Automate uses the following selector in the defined order.

To manage the selectors of a UI element, right-click on it and select **Edit**. This option brings up the selector builder, where you can edit the selectors with a visual or a text editor.

Each selector consists of multiple elements representing the hierarchical structure of the UI element in the application or webpage. The attributes describe each element uniquely and distinguish it from other elements.

:::image type="content" source="media/ui-elements/visual-selector-editor.png" alt-text="Screenshot of the visual selector builder.":::

All selectors are displayed with a default friendly name that makes them easily accessible. To rename a selector, right-click on its name and select **Rename**.

When you edit a UI element with multiple selectors, you can disable a selector by right-clicking on it and selecting **Disable**. This functionality can be helpful during testing.

:::image type="content" source="media/ui-elements/rename-disable-selector.png" alt-text="Screenshot of the rename and disable options for a selector.":::

After editing the selectors, select **Save** to apply the changes. Saving applies the changes in all the selectors in a single step.

For more information about selectors and how to build them manually, see [Build a custom selector](build-custom-selectors.md).

## UI elements with text-based selectors

In addition to the default method for generating selectors for UI elements, Power Automate supports creating selectors based on an element's text value.

This feature is helpful for automation scenarios that handle elements in desktop applications or webpages that always come with specific texts. Selectors based on these texts are more reliable and resilient to possible future changes in the application or webpage structure.

You can generate text-based selectors only when capturing UI elements by using the UI element picker (UI elements pane or browser/UI automation actions). You can't generate them during [recording](recording-flow.md).

To capture a UI element with a text-based selector, open the UI element picker, right-click the desired element, and select **Capture based on text**.

:::image type="content" source="media/ui-elements/capture-based-text-option.png" alt-text="Screenshot of the Capture based on text option.":::

Then, a new window with two fields appears on your screen:

- The **Text value** field holds the element's text as a proposed value. You can change this value to a hardcoded value or a variable.
- You can set the **Operator** field to various operators to adjust the functionality of the selector.

Selecting **Capture** adds the UI element with the proper text-based selector in the UI elements repository.

:::image type="content" source="media/ui-elements/create-text-based-selector-dialog.png" alt-text="Screenshot of the Create a text-based selector dialog.":::

Text-based selectors use the **Name** attribute of the captured element for desktop automation and the **Text** attribute for browser automation. They're available only for UI elements that contain a text value themselves.

In other words, they're available for UI elements with a **Name** or **Text** attribute that includes a value. They're not available for elements that don't hold such a text value, even if they have child elements with text in their structure.

>[!NOTE]
> For the SAP application, text-based selectors use the **Text** attribute instead of the **Name** attribute that they generally use on desktop automation. SAP automation works more efficiently with default selectors based on the **ID** attribute.

## Known issues and limitations

- If you select **Add UI element**, hover over a window, and choose to capture a UI element by text, the process generates a default selector. This selector includes the **Process** attribute along with **Name**.

- When you use a variable with an operator other than **Equal to**, the custom text editor displays the selector instead of the visual builder. This functionality avoids a limitation that makes the above combination nonfunctional in the visual builder.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
