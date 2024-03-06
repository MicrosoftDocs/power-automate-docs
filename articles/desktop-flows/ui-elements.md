---
title: Automate using UI elements
description: Learn how to capture UI elements in your desktop flows.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/20/2023
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Automate using UI elements

Desktop flows utilize UI elements to interact with applications and webpages without resorting to image recognition and absolute coordinates. UI elements are used as input in most UI automation and browser automation actions and identify specific elements on windows and webpages.

## UI elements

When deploying a UI automation or browser automation action, you might be required to provide a UI element as input. To add a new UI element, you can do it directly from the action properties or through the UI elements pane of the flow designer.

Each one of these action groups accepts a different type of UI elements. UI automation actions accept desktop UI elements, while browser automation actions accept web UI elements.

:::image type="content" source="media/ui-elements/ui-element-input.png" alt-text="Screenshot of the available UI elements in the Press button in window action.":::

To add a new UI element to your flow, add a new UI element through an action or the UI elements pane, highlight the respective element, and press **Ctrl + Left click**. When the selection is finished, select **Done**.

:::image type="content" source="media/ui-elements/capturing-ui-elements.png" alt-text="Screenshot of a highlighted element.":::

Any captured UI elements will be added to the UI elements pane. To access the UI elements pane, select the UI elements tab on the right-hand side of the flow designer.

:::image type="content" source="media/ui-elements/ui-elements-tab.png" alt-text="Screenshot of the UI elements tab.":::

Elements can be sorted alphabetically through the **Sort** option of the  UI elements tab. To remove all the UI elements that aren't used in any action, select the dots icon next to the **Sort** option and then **Remove unused UI elements**.

To rename or delete a UI element, right-click on the respective item and select the appropriate function.

To find where a specific UI element is being used in the flow, right-click on it and select **Find usages**. The results will display all the actions that use this UI element. Double-click on a result to highlight the action on the workspace.

:::image type="content" source="media/ui-elements/ui-elements-pane.png" alt-text="Screenshot of the UI elements pane.":::

## UI elements types

Desktop flows support two types of UI elements based on their source: desktop UI elements and web UI elements.

Desktop UI elements can be captured from any Windows application, including the nonwebpage part of browsers, such as the address bar.

You can use these UI elements as input in UI automation actions to indicate the component you want to interact with. The UI element picker of UI automation actions displays and allows you to capture only desktop UI elements.

> [!IMPORTANT]
> Users can capture elements from webpages through the UI element picker of UI automation actions. However, their selectors will represent desktop elements, not web elements.

Web UI elements can be captured from webpages and used only in browser automation actions.

Browser automation actions accept exclusively UI elements captured from webpages. Therefore, existing UI elements captured from desktop applications aren't displayed in the UI elements picker of these actions.

To find more information regarding desktop and web automation, refer to [Automate desktop flows](desktop-automation.md) and [Automate web flows](automation-web.md).

### UI elements for webpages

To capture a UI element from a webpage, you need to install the appropriate browser extension. You can find more information about the supported browsers and the required extension in [Use browsers and manage extensions](using-browsers.md).

### Distinguish desktop from web UI elements

The UI elements pane displays distinctive visual indications to help users quickly recognize desktop and web UI elements.

:::image type="content" source="media/ui-elements/ui-element-type-visual-indication.png" alt-text="Screenshot of the UI element type visual indications in the UI element pane.":::

The same icons are also displayed during capturing, so you can confirm the type of an element before even saving it.

:::image type="content" source="media/ui-elements/ui-element-type-visual-indication-capturing.png" alt-text="Screenshot of a UI element type visual indication during capturing.":::

Another method to check the type of a UI element is to review its selectors. Desktop UI elements usually have the desktop as their parent element, while web UI elements have a webpage as their root element.

:::image type="content" source="media/ui-elements/ui-element-desktop-selector.png" alt-text="Screenshot of a selector of a desktop UI element.":::

### UI elements in browser windows

The application part of a browser (1) should be automated using desktop UI elements. For example, you can use UI automation actions to interact with the address bar or the tabs.

On the other hand, the loaded webpages inside the browser (2) should be automated using web UI elements and browser automation actions.

During recording, the recorder will automatically distinguish the browser application area from the webpages and generate the appropriate UI elements and actions.

:::image type="content" source="media/ui-elements/browser-window.png" alt-text="Screenshot of a Microsoft Edge window with highlighted the browser application and webpage areas.":::

Interactions with drag and drop web UI elements might not function as expected due to their inherent limitations. As a workaround, capture desktop UI elements in a web page by opening the UI element picker through an action of the UI automation group by selecting **Add UI element** within the `UI element` parameter. The captured UI element is of desktop type and can be used in the `Drag and drop UI element in window` action. Keep in mind that desktop UI elements can be used only in actions of the UI automation action group of Power Automate for desktop. It's important to note that desktop UI elements in web pages aren't as reliable as their web counterparts and are subject to browser application details, such as the browser's version.

## UI elements properties

All UI elements consist of one or more selectors that pinpoint the UI or web component that Power Automate interacts with.

>[!NOTE]
> Users can create multiple selectors for a UI element. Whenever a selector fails, Power Automate uses the following selector in the defined order.

To manage the selectors of a UI element, right-click on it and select **Edit**. This option brings up the selector builder, where you can edit the selectors with a visual or a text editor.

Each selector consists of multiple elements representing the hierarchical structure of the UI element in the application or webpage. The attributes describe each element uniquely and distinguish it from other elements.

:::image type="content" source="media/ui-elements/visual-selector-editor.png" alt-text="Screenshot of the visual selector builder.":::

All selectors are displayed with a default friendly name that makes them easily accessible. To rename a selector, right-click on its name and select **Rename**.

When you edit a UI element with multiple selectors, you're able to disable a selector by right-clicking on it and selecting **Disable**. This functionality can be helpful during testing.

:::image type="content" source="media/ui-elements/rename-disable-selector.png" alt-text="Screenshot of the rename and disable options for a selector.":::

After editing the selectors, press **Save** to apply the implemented changes. Saving applies the changes in all the selectors in a single step.

You can find more information regarding selectors and how to build them manually in [Build a custom selector](build-custom-selectors.md).

## UI elements with text-based selectors

Apart from the default way to generate selectors of UI elements, Power Automate supports the creation of selectors based on an element's text value.

This feature is helpful for automation scenarios that handle elements in desktop applications or webpages that always come with specific texts. Selectors based on these texts are more reliable and resilient to possible future changes in the application or webpage structure.

Generating text-based selectors is available only when capturing UI elements using the UI element picker (UI elements pane or browser/UI automation actions). It's not available during [recording](recording-flow.md).

To capture a UI element with a text-based selector, open the UI element picker, right-click on the desired element, and select **Capture based on text**.

:::image type="content" source="media/ui-elements/capture-based-text-option.png" alt-text="Screenshot of the Capture based on text option.":::

Then, a new window with two fields will appear on your screen:

- The **Text value** field holds the element's text as a proposed value. You can change this value to a hardcoded value or a variable.
- You can set the **Operator** field to various operators to adjust the functionality of the selector.

Selecting **Capture** will add the UI element with the proper text-based selector in the UI elements repository.

:::image type="content" source="media/ui-elements/create-text-based-selector-dialog.png" alt-text="Screenshot of the Create a text-based selector dialog.":::

Text-based selectors use the **Name** attribute of the captured element for desktop automation and the **Text** attribute for browser automation. They're available only for UI elements that contain a text value themselves.

In other words, they're available for UI elements with a **Name** or **Text** attribute that includes a value. They aren't available for elements that don't hold such a text value, even if they have child element(s) with text in their structure.

>[!NOTE]
> For the SAP application, text-based selectors use the **Text** attribute instead of the **Name** attribute that they generally use on desktop automation. SAP automation works more efficiently with default selectors based on the **ID** attribute.

## Known issues and limitations

- If you select **Add UI element**, hover the mouse over a whole window, and choose to capture a UI element based on text, a default selector will get generated. This selector includes the **Process** attribute apart from **Name**.

- The combination of a variable and an operator other than **Equal to** generates a selector displayed in the custom text editor instead of the visual builder. This functionality avoids an existing limitation that makes the above combination nonfunctional in the visual builder.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
