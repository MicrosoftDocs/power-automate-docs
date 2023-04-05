---
title: Test a selector
description: Test a selector
author: nikosmoutzourakis

ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 04/04/2023
ms.author: nikosmoutzourakis
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

# Test a selector

Power Automate enables you to test a selector and ensure that your UI automation flows are running as expected. With the ability to test both desktop and web selectors, you can quickly and efficiently automate your application and webpage interactions.  

## Testing Selector 

The Selector builder window is used to edit UI elements. There, you may find the option for testing the selector. When you click on the "Test selector" button, Power Automate checks whether the selected selector from the selectors’ list can locate a UI element on the screen. 

![Screenshot of test selector button.](media/test-selectors/test-selector-button.png)

In order to test a selector, you must ensure that UI element is available in your machine. After clicking on the ‘Test selector’ button, the following message is displayed: 
 
![Screenshot of initial message for test selector.](media/test-selectors/test-selector-initial-message.png)

There are three possible outputs: 
* **Success:** A UI element was found successfully in the screen. 

![Screenshot of successful test selector.](media/test-selectors/test-selector-success.png)

* **Failed:** No UI element was found in the screen. Power Automate highlights the element (level) that was not found in the ‘Elements’ list, indicating to the user the element that should be fixed. 

![Screenshot of failed test selector.](media/test-selectors/test-selector-fail.png)

* **Multiple UI elements found:** The selector may locate multiple UI elements in the screen. If used in an action, Power Automate will interact with one of these elements randomly. Power Automate highlights at testing the UI element that will be interacted at the runtime if the specific selector is used in an action. 

![Screenshot of multiple UI elements test selector.](media/test-selectors/test-selector-multiple.png)

You may get more information for each output by clicking on the output icon next to the tested selector.  

![Screenshot of info from result button test selector.](media/test-selectors/test-selector-button-on-result.png)

You can test selectors for both desktop and web UI elements. Desktop selectors are captured from any Windows application and can be used in actions of the UI automation group while web selectors are captured from webpages and can be used only in browser automation actions.  

> [!NOTE]
> Every time you edit a tested selector, the output icon is removed, and selector should be tested again.  

### Testing All Selectors 

A UI element may have more than one selector for defining its location. The Test selector feature allows you to test all selectors easily by clicking on the arrow next to the "Test selector" button and selecting "Test all selectors." 

![Screenshot of test selector button.](media/test-selectors/test-selector-test-all.png)

> [!NOTE]
> When you opt for testing all selectors, the disabled selectors will not be tested from the list. In case you need to test a disabled selector, you should test it individually.  

### Desktop UI elements - Open screen selector 

Each desktop UI element belongs to a screen (parent UI element). In some cases, testing of the selector cannot be performed because the screen cannot be found. In this case, you should: 

- Ensure that the screen is available in your machine. 
- If yes, then click on the "Open screen selector" button and fix the screen selector. You may perform the test selector feature to the screen selector as well.  

![Screenshot of test selector button.](media/test-selectors/test-selector-button.png)

> [!NOTE]
> When you navigate to the screen selector through the selector builder window of child, then you will return to the child view after closing the screen's selector builder window.

### Web UI elements - Open Web browser tab

In case of a web UI element, in order to proceed with the test, the web page that contains the specific UI element must be available in your machine and the web browser tab should be selected in the "Web browser tab" drop down list. 
 
![Screenshot of test selector button.](media/test-selectors/test-selector-select-web-tab.png)

![Screenshot of test selector button.](media/test-selectors/test-selector-select-web-tab-dropdown.png)

![Screenshot of test selector button.](media/test-selectors/test-selector-select-web-tab-selected.png)

If no web browser tab is selected in the list and you click on the "Test selector" button, Power Automate will ask you to select the browser tab before the testing starts. 
 
![Screenshot of test selector button.](media/test-selectors/test-selector-select-web-tab-runtime.png)

### Variables 

You can test a selector even if one or more variables are contained in the selector. You must provide values to the selector's variables for the test to be performed. 

![Screenshot of test selector button.](media/test-selectors/test-selector-variables-1.png)
 
![Screenshot of test selector button.](media/test-selectors/test-selector-variables-2.png)

### Highlight 

When a selector is tested and the output is "Success" or "Multiple UI elements found", Power Automate will highlight the UI element that will be interacted at run time with the specific selector. 


### Text editor 

Test selector capabilities can be fully used in the Text editor view of the Selector builder window as well, in the same fashion as in the builder view. 

![Screenshot of test selector button.](media/test-selectors/test-selector-select-text-editor.png)
