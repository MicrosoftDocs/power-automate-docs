---
title: UI automation | Microsoft Docs
description: UI automation Actions Reference
author: mariosleon
ms.service: power-automate
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
# UI automation



Interact with desktop/windows applications

You can find more information on how to use the UI automation actions [here](../desktop-automation.md)

|<!-- --> |
|-----|
|[Get details of window](#getwindowdetails)|
|[Get details of a UI element in window](#getelementdetails)|
|[Get selected checkboxes in window](#getselectedcheckboxesinwindow)|
|[Get selected radio button in window](#getselectedradiobuttoninwindow)|
|[Extract data from window](#extractdatafromwindow)|
|[Focus text field in window](#focustextfield)|
|[Populate text field in window](#populatetextfield)|
|[Press button in window](#pressbutton)|
|[Select radio button in window](#selectradiobutton)|
|[Set checkbox state in window](#setcheckboxstate)|
|[Set drop-down list value in window](#setdropdownlistvalueinwindow)|
|[Get window](#getwindowbase)|
|[Focus window](#focuswindowbase)|
|[Set window state](#setwindowstatebase)|
|[Set window visibility](#setwindowvisibilitybase)|
|[Move window](#movewindowbase)|
|[Resize window](#resizewindowbase)|
|[Close window](#closewindowbase)|
|[Use desktop](#usedesktop)|
|[Select tab in window](#selecttab)|
|[Click UI element in window](#click)|
|[Select menu option in window](#selectmenuoption)|
|[Drag and drop UI element in window](#draganddropelement)|
|[Expand/collapse tree node in window](#expandcollapsetreenode)|

## Getting started with UI automation

Power Automate Desktop enables users to interact with Windows and desktop applications through the UI automation group of action. 

These actions require UI elements, that describe the components you want to handle. You can create UI elements directly through the actions that require them or through the **UI elements** tab of the flow designer.

![The options to create a new UI element.](\media\uiautomation\create-ui-element.png)

All UI elements are specified by one or more UI selectors that pinpoint the hierarchical structure of the component in the application window.

Although selectors are created automatically when creating UI elements, some scenarios may need manually created selectors. When a custom selector is needed, you can modify an existing selector or build one from scratch. 

![The options to edit and create selectors.](\media\uiautomation\create-selector.png)

Selectors use the **>** notation to indicate the hierarchical structure of the selected elements. Each element in the selector is contained within the element on its left.

To develop more dynamic flows, you can replace the **Equals to** operators with other operators or regular expressions. Additionally, if the value of a selector's attribute depends on results of previous actions, you can use variables instead of hard-coded values.

![The available operators in the selector builder.](\media\uiautomation\selector-operators.png)

>[!NOTE]
> You can find more information about developing UI automation flows and creating custom selectors in [Automate desktop flows](../desktop-automation.md) and [Build a custom selector](../build-custom-selectors.md), respectively.

## UI automation actions

## Data extraction
Extract data from desktop applications, from a single value up to tables or custom multiple pieces of data
### <a name="getwindowdetails"></a> Get details of window
Gets a property of a window such as its title or its source text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Window|No|UIControl||The window to get details from|
|Window property|N/A|Get window title, Get window text, Get window location and size, Get process name|Get window title|Choose which property of the window to extract|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|WindowProperty|General value|The retrieved information of the window|


##### <a name="getwindowdetails_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve property of window|Indicates a problem retrieving the window property|

### <a name="getelementdetails"></a> Get details of a UI element in window
Gets the value of a UI element's attribute in a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The UI element to get details from|
|Attribute name|Yes|Text value|Own Text|The attribute whose value will be retrieved|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|AttributeValue|Text value|The value of the UI element's text|


##### <a name="getelementdetails_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve attribute of UI element|Indicates a problem retrieving the UI element's attribute|

### <a name="getselectedcheckboxesinwindow"></a> Get selected checkboxes in window
Retrieves the names of the selected checkboxes in a checkbox group or the state of a specific checkbox

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The checkbox or checkbox group|
|Operation|N/A|Get names of selected checkboxes in group, Get state of checkbox|Get names of selected checkboxes in group|Specify whether to retrieve the state of multiple selected checkboxes or just one|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|IsChecked|Boolean value|The state of the selected checkbox|
|SelectedCheckboxes|List of Text values|The names of selected checkboxes inside the specified checkbox group|


##### <a name="getselectedcheckboxesinwindow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve checkbox state(s)|Indicates a problem retrieving the specified checkbox state(s)|

### <a name="getselectedradiobuttoninwindow"></a> Get selected radio button in window
Retrieves the names of the selected radio button in a radio button group or the state of a specific radio button

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The radio button or radio button group|
|Operation|N/A|Get selected radio button name in group, Get state of radio button|Get selected radio button name in group|Specify whether to retrieve the name of the radio button that's selected inside a group of radio buttons or just the state of a single radio button|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|IsSelected|Boolean value|The state of the selected radio button|
|SelectedRadiobutton|Text value|The selected radio button inside the specified radio group|


##### <a name="getselectedradiobuttoninwindow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve radio button state|Indicates a problem retrieving the specified radio button state|

### <a name="extractdatafromwindow"></a> Extract data from window
Extracts data from specific parts of a window in the form of single values, lists, or tables

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Window|No|UIControl||The window to extract data from|
|Store extracted data in|N/A|an Excel spreadsheet, A variable|an Excel spreadsheet|Specify where to store the extracted data|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|Excel instance|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|DataFromWindow|General value|The extracted data in the form of a datatable|


##### <a name="extractdatafromwindow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Extraction failed|Indicates a problem extracting data from the specified window|

## Form filling
Fill-in forms on desktop applications
### <a name="focustextfield"></a> Focus text field in window
Sets the focus on a text box of a window and scrolls it into view

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text field|No|UIControl||The text box to focus|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="focustextfield_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to set input focus in window text box|Indicates a problem setting the focus on the specified web page text field|

### <a name="populatetextfield"></a> Populate text field in window
Fills a text box in a window with the specified text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text box|No|UIControl||The text box to populate|
|Text to fill-in|No|Encrypted value||The text to fill in the text field|
|If field isn't empty|Yes|Replace text, Append text|Replace text|Specify whether to replace existing content, or to append.|
|Click before populating|Yes|Left click, Double click, No|Left click|Specify whether a left mouse click is performed before populating the text field or not.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="populatetextfield_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to write in textbox|Indicates a problem populating the specified text field|

### <a name="pressbutton"></a> Press button in window
Presses a window button

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The button to press|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="pressbutton_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to press button|Indicates a problem pressing the specified button|

### <a name="selectradiobutton"></a> Select radio button in window
Selects a radio button on a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Radio button|No|UIControl||The radio button to select|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="selectradiobutton_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to select radio button UI element|Indicates a problem selecting the specified radio button UI element|

### <a name="setcheckboxstate"></a> Set checkbox state in window
Checks or unchecks a checkbox in a window form

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Checkbox|No|UIControl||The checkbox to set the state of|
|Set checkbox state to|N/A|Checked, Unchecked|Checked|Specify whether the checkbox will become checked or unckeched|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setcheckboxstate_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to set checkbox state|Indicates a problem setting the specified checkbox state|

### <a name="setdropdownlistvalueinwindow"></a> Set drop-down list value in window
Sets or clears the selected option(s) for a drop-down list in a window form

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Drop-down list|No|UIControl||The drop-down list whose value to set|
|Operation|N/A|Clear selected options, Select option(s) by name, Select option(s) by index|Clear selected options|Specify whether you want to select a value by name or by ordinal position (1 2 3 ...) or clear the selected value of the drop-down list|
|Options indices|No|Text value||A space-separated list of 1-based indices (e.g. 1 3 4)|
|Options names|No|Text value||One or more options (one per line if more than one) to select in the drop down list. Multiple options make sense only when working with multi-select lists. If the list is single-selection, then only the first option specified will be used.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setdropdownlistvalueinwindow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to select the specified options in the drop down list|Indicates a problem selecting the specified options in the drop down list|

## Windows
Windows manipulation regarding size, state visibility, focus
### <a name="getwindowbase"></a> Get window
Gets a running window, for automating desktop applications

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get window|N/A|Specific window, Foreground window|Specific window|Specify whether to look using a selector or the foreground window|
|UI element|No|UIControl||The selector of the window to get|
|Bring window to front|N/A|Boolean value|False|Specify whether to bring the window to the foreground automatically upon acquiring it|
|Fail if window isn't found|N/A|Boolean value|True|Specify whether to wait indefinitely for the window to appear or to fail if the window doesn't show up within a set time period|
|Timeout|No|Numeric value||The timeout to wait in seconds|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|WindowTitle|Text value|The title of the foreground window|
|AutomationWindow|Window instance|The specific window instance for use with later UI Automation actions|


##### <a name="getwindowbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to get window|Indicates a problem getting the window|

### <a name="focuswindowbase"></a> Focus window
Activates and brings to the foreground a specific window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to focus|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to use.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="focuswindowbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't focus window|Indicates a problem focusing the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="setwindowstatebase"></a> Set window state
Restores, maximizes or minimizes a specific window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to set the state of|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to use.|
|Window state|N/A|Restored, Maximized, Minimized|Restored|Choose in which state to display the window|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setwindowstatebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't set window state|Indicates a problem setting the window state of the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="setwindowvisibilitybase"></a> Set window visibility
Shows a hidden window or hides a visible window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to set the visibility of|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to use.|
|Visibility|N/A|Visible, Hidden|Hidden|Choose in which state to set the window visibility to|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setwindowvisibilitybase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't set window visibility|Indicates a problem setting the visibility of the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="movewindowbase"></a> Move window
Sets the position of a specific window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the Window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to move|
|Window class|Yes|Text value||If you have two windows with the same title, Window Class may help differentiate between them. In this case, enter the class of the window to use.|
|Position X|No|Numeric value||The X position of the window|
|Position Y|No|Numeric value||The Y position of the window|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="movewindowbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't move window|Indicates a problem moving the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="resizewindowbase"></a> Resize window
Sets the size of a specific window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to resize|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to use|
|Width|No|Numeric value||The new width, in pixels|
|Height|No|Numeric value||The new height, in pixels|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="resizewindowbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't resize window|Indicates a problem resizing the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="closewindowbase"></a> Close window
Closes a specific window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|UIControl||The window UI element|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|Numeric value||The instance or handle of the window to close|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to use.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="closewindowbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't close window|Indicates a problem closing the specified window|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="usedesktop"></a> Use desktop
Performs desktop and taskbar related operations

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The UI element to perform a click on|
|Click type|N/A|Left click, Right click, Double click|Left click|The kind of click to perform|
|Launch new application when left-clicking on the taskbar|N/A|Boolean value|True|When this parameter is set to 'true', it ensures that a new window of an application will be created when left-clicking on its icon in the 'quick launch' bar, aka the taskbar of Windows 7 or above. Uncheck this option to bring an already running instance of the application to the foreground.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="usedesktop_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Taskbar operation failed|Indicates that the taskbar operation failed|

### <a name="selecttab"></a> Select tab in window
Selects a tab from a group of tabs

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Tab|No|UIControl||The tab to select|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="selecttab_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Selecting tab failed|Indicates a problem selecting the specified tab|

### <a name="click"></a> Click UI element in window
Clicks on any UI element of a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The UI element to click on|
|Click type|N/A|Left click, Right click, Double click, Middle click, Left button down, Left button up, Right button down, Right button up|Left click|The kind of click to perform|
|Mouse position relative to UI element|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the UI element the mouse will be moved to prior to clicking|
|Offset X|Yes|Numeric value|0|Offset the mouse from the position by this many pixels to the right|
|Offset Y|Yes|Numeric value|0|Offset the mouse from the position by this many pixels down|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="click_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Click failed|Indicates that the click failed|

### <a name="selectmenuoption"></a> Select menu option in window
Selects an option in a menu of a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The menu option to select|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="selectmenuoption_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to select option|Indicates a problem selecting the specified menu option|

### <a name="draganddropelement"></a> Drag and drop UI element in window
Drags and drops a UI element of a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element to drag|No|UIControl||The UI element to drag|
|UI element to drop over|No|UIControl||The UI element to drop over|
|Click type|N/A|Left click, Right click|Left click|Specify which mouse button to use for clicking and holding down, while dragging the UI element over to its destination|
|Mouse down offset X|Yes|Numeric value|0|Offset the mouse-down click, that will be used to grab the UI element drag, by this many pixels to the right|
|Mouse down offset Y|Yes|Numeric value|0|Offset the mouse-down click, that will be used to grab the UI element to drag, by this many pixels downwards|
|Mouse down position relative to UI element to drag|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the drop-target UI element the mouse will be moved to prior to clicking|
|Mouse up offset X|Yes|Numeric value|0|Offset the mouse-up click, that will be used to grab the UI element to drag, by this many pixels to the right|
|Mouse up offset Y|Yes|Numeric value|0|Offset the mouse-up click, that will be used to grab the UI element to drag, by this many pixels downwards|
|Mouse up position relative to UI element to drag|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the drop-target UI element the mouse will be moved to after clicking|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="draganddropelement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|UI element to drag wasn't found|Indicates that the UI element to drag wasn't found|
|Drop target UI element wasn't found|Indicates that the drop target UI element wasn't found|
|Drag and drop failed|Indicates a problem during drag and drop of the speficied UI element|

### <a name="expandcollapsetreenode"></a> Expand/collapse tree node in window
Expands or collapses a node of a tree view residing in a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|UIControl||The tree node to expand/collapse|
|Folders path|Yes|Text value||A forward slash separated path made out of folder names leading to the tree node to expand or collapse|
|Use regular expressions|N/A|Boolean value|False|Specify whether each folder name in the path to interpret as a regular expression|
|Operation|N/A|Expand, Collapse|Expand|Specify whether to expand or collapse the tree node|

> [!NOTE]
> Power Automate Desktop's regular expression engine is .NET. You can find more information in [Regular Expression Language - Quick Reference](https://docs.microsoft.com/dotnet/standard/base-types/regular-expression-language-quick-reference).


##### Variables Produced
- This action doesn't produce any variables

##### <a name="expandcollapsetreenode_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to set tree node to the specified state|Indicates a problem setting the tree node to the specified state|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]