---
title: UI automation actions reference
description: See all the available UI automation actions.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/14/2024
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

# UI automation actions

> [!IMPORTANT]
> To prevent unauthorized access, Power Automate needs to run with the same or higher privileges as the applications it automates. To use the UI automation actions (except for the **Use desktop** action) to interact with applications that run with elevated privileges, run Power Automate as administrator. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

Power Automate provides various UI automation actions to enable users to interact with Windows and desktop applications. Some UI automation actions require you to set UI elements in their properties to indicate the element you want to handle. 

To add a new UI element, select **Add UI element** through the deployed UI automation action or the UI elements pane of the flow designer.

:::image type="content" source="media/uiautomation/create-ui-element.png" alt-text="Screenshot of the options to create a new UI element.":::

All UI elements consist of selectors that pinpoint the hierarchical structure of the components. Selectors use the **>** notation to indicate that each element is contained within the element on its left.

When you create a UI element of an application window, its selector always has a root element named  **:desktop**.

If you create a UI element that pinpoints a component inside an application window, two UI elements will be created automatically. The parent UI element pinpoints the application window, while the child shows the hierarchical structure of the specific component inside the window.

:::image type="content" source="media/uiautomation/parent-child-ui-element.png" alt-text="Screenshot of two UI elements with parent - child relationship.":::

Although selectors are created automatically when adding UI elements, some particular scenarios need manually created selectors. When a custom selector is needed, you can edit an existing selector or build one from scratch.

:::image type="content" source="media/uiautomation/create-selector.png" alt-text="Screenshot of the options to edit and create selectors.":::

To develop more dynamic flows, replace the **Equals to** operators with other operators or regular expressions. Additionally, if the value of a selector's attribute depends on the results of previous actions, use variables instead of hard-coded values.

:::image type="content" source="media/uiautomation/selector-operators.png" alt-text="Screenshot of the available operators in the selector builder.":::

For many actions of UI automation there are two modes for executing actions: physical and simulated. In physical mode, the tool takes control of the machine's mouse and keyboard to perform the action physically. In simulated mode, the action is performed programmatically without taking control of the mouse and keyboard and without requiring the UI element's screen to be brought to the foreground. It's important to note that the simulated option might not be applicable to every UI element. To perform an action by simulation, either enable the **Simulate action** parameter in some actions or disable the **Bring to front** parameter in other actions.

:::image type="content" source="media/uiautomation/simulateactions.png" alt-text="Screenshot of the parameters related to simulate a UI automation action or execute it physically.":::

## Known limitations for performing an action by simulation

### **Click UI Element in Window and Press Button in Window actions**

When you use the 'Click UI element in window' and 'Press button in window' actions, the following limitations apply for simulate mode:

- **WPF Technology:**
  - Doesn't work for Textbox, Toggle button, Richtextbox, Listitem, Griditem/TableItem, Combobox types of UI elements.

- **Winforms Technology:**
  - Doesn't work for Textbox, Richtextbox, Listitem, Griditem/TableItem, Combobox types of UI elements.
  - When simulating a click to interact with a dialog, the dialog must be closed with a physical click.

- **XAML Technology:**
  - Doesn't work for Textbox, Toggle button, Richtextbox, Listitem types of UI elements.

- **Excel Technology:**
  - Doesn't work for Toggle button, MenuItem types of UI elements.

- **File Explorer Technology:**
  - Doesn't work for Textbox, Richtextbox, Treeitem, MenuItem types of UI elements.

- **Windows Settings Technology:**
  - Doesn't work for Toggle button, Richtextbox, Group types of UI elements.

- **Java AWT Technology:**
  - Doesn't work for Textbox, Richtextbox, Combobox types of UI elements.

- **Java SWT Technology:**
  - Doesn't work for Textbox, Richtextbox, MenuItem types of UI elements.

- **SAP Technology:**
  - Doesn't work for Combobox types of UI elements.

- **Windows 11:**
  - Limitations with 'Start menu' and 'Task bar' UI elements.

### **Populate Text Field in Window Action**

When using the 'Populate text field in window' action, the following limitations apply for simulate mode:

- **WPF Technology:**
  - Doesn't work for Richtextbox type of UI elements.

- **XAML Technology:**
  - Doesn't work for Richtextbox type of UI elements.

- **Notepad/MFC Technology:**
  - Doesn't work for Pane type of UI elements.

- **SAP Technology:**
  - Doesn't work for Combobox type of UI elements.

Consider these limitations when configuring your UI automation actions and proceed with interacting with the UI elements using the physical approach.

>[!NOTE]
> To find more information about developing UI automation flows and creating custom selectors, go to [Automate desktop flows](../desktop-automation.md) and [Build a custom selector](../build-custom-selectors.md), respectively.

## <a name="getwindowdetails"></a> Get details of window

Gets a property of a window such as its title or its source text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Window|No|[UI element](../ui-elements.md)||The window to get details from|
|Window property|N/A|Get window title, Get window text, Get window location and size, Get process name|Get window title|Choose which property of the window to extract|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element will be brought to the front during execution. If this option is disabled, the action is executed in the background. Note that not all UI elements are compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|WindowProperty|[General value](../variable-data-types.md#general-value)|The retrieved information of the window|

### <a name="getwindowdetails_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve property of window|Indicates a problem retrieving the window property|

## <a name="getelementdetails"></a> Get details of a UI element in window

Gets the value of a UI element's attribute in a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The UI element to get details from|
|Attribute name|Yes|[Text value](../variable-data-types.md#text-value)|Own Text|The attribute whose value will be retrieved|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element will be brought to the front during execution. If this option is disabled, the action is executed in the background. Note that not all UI elements are compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|AttributeValue|[Text value](../variable-data-types.md#text-value)|The value of the UI element's text|

### <a name="getelementdetails_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve attribute of UI element|Indicates a problem retrieving the UI element's attribute|

## <a name="getselectedcheckboxesinwindow"></a> Get selected checkboxes in window

Retrieves the names of the selected checkboxes in a checkbox group or the state of a specific checkbox.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The checkbox or checkbox group|
|Operation|N/A|Get names of selected checkboxes in group, Get state of checkbox|Get names of selected checkboxes in group|Specify whether to retrieve the state of multiple selected checkboxes or just one|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element should be brought to the front during execution. If this option is disabled, the action will be executed in the background. Note that not all UI elements might be compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|IsChecked|[Boolean value](../variable-data-types.md#boolean-value)|The state of the selected checkbox|
|SelectedCheckboxes|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)|The names of selected checkboxes inside the specified checkbox group|

### <a name="getselectedcheckboxesinwindow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve checkbox state(s)|Indicates a problem retrieving the specified checkbox state(s)|

## <a name="getselectedradiobuttoninwindow"></a> Get selected radio button in window

Retrieves the names of the selected radio button in a radio button group or the state of a specific radio button.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The radio button or radio button group|
|Operation|N/A|Get selected radio button name in group, Get state of radio button|Get selected radio button name in group|Specify whether to retrieve the name of the radio button that's selected inside a group of radio buttons or just the state of a single radio button|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element will be brought to the front during execution. If this option is disabled, the action is executed in the background. Note that not all UI elements are compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|IsSelected|[Boolean value](../variable-data-types.md#boolean-value)|The state of the selected radio button|
|SelectedRadiobutton|[Text value](../variable-data-types.md#text-value)|The selected radio button inside the specified radio group|

### <a name="getselectedradiobuttoninwindow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve radio button state|Indicates a problem retrieving the specified radio button state|

## <a name="extractdatafromwindow"></a> Extract data from window

Extracts data from specific parts of a window in the form of single values, lists, or tables.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Window|No|[UI element](../ui-elements.md)||The window to extract data from|
|Store extracted data in|N/A|an Excel spreadsheet, A variable|an Excel spreadsheet|Specify where to store the extracted data|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element will be brought to the front during execution. If this option is disabled, the action is executed in the background. Note that not all UI elements are compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|[Excel instance](../variable-data-types.md#instances)|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|DataFromWindow|[General value](../variable-data-types.md#general-value)|The extracted data in the form of a datatable|

### <a name="extractdatafromwindow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Extraction failed|Indicates a problem extracting data from the specified window|

## <a name="extractdatafromtable"></a> Extract data from table

Extracts data from a table in the form of a datatable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Table|No|[UI element](../ui-elements.md)||The table or grid to extract data from|
|Store extracted data in|N/A|an Excel spreadsheet, A variable|an Excel spreadsheet|Specify where to store the extracted data|
|Bring to front|N/A|Boolean value|True|Specify whether the window containing the UI element is brought to the front during execution. If this option is disabled, the action is executed in the background. Not all UI elements are compatible with having the option disabled. Additionally, if execution of the action requires scrolling, disabling this option might not extract all elements.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|[Excel instance](../variable-data-types.md#instances)|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|DataFromTable|[General value](../variable-data-types.md#general-value)|The extracted data in the form of a datatable|

### <a name="extractdatafromtable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Extraction failed|Indicates a problem extracting data from the specified table|

## <a name="takescreenshot"></a> Take screenshot of UI element

Takes a screenshot of a UI element in window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The UI element in the window to capture as screenshot|
|Save mode|N/A|Clipboard, File|Clipboard|Specify whether to save the image into a file or store it into the clipboard|
|Image file path|No|[File](../variable-data-types.md#files-and-folders)||Set the full path for the file to be saved|
|File format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|The file format of the image file|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ImageFile|[File](../variable-data-types.md#files-and-folders)|The file path of the generated screenshot image file|

### <a name="takescreenshot_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve UI element|Indicates a problem retrieving the UI element|
|Failed to save image|Indicates a problem saving the taken screenshot|
|Failed to take screenshot of UI element|Indicates a problem taking a screenshot of the UI element|

## <a name="focustextfield"></a> Focus text field in window

Sets the focus on a text box of a window and scrolls it into view.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text field|No|[UI element](../ui-elements.md)||The text box to focus|

### Variables produced

This action doesn't produce any variables.

### <a name="focustextfield_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to set input focus in window text box|Indicates a problem setting the focus on the specified web page text field|

## <a name="populatetextfield"></a> Populate text field in window

Fills a text box in a window with the specified text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text box|No|[UI element](../ui-elements.md)||The text box to populate|
|Text to fill in|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The text to fill in the text field|
|Simulate action|N/A|Boolean value|False|Simulate the keystrokes programmatically when populating text to UI text field elements. This option doesn't require the UI element's screen to be focused, it will not automatically bring it to the foreground. Note this option can be applied only to left-click action and it might not be applicable to every UI element.
|If field isn't empty|Yes|Replace text, Append text|Replace text|Specify whether to replace existing content, or to append.|
|Click before populating|Yes|Left-click, Double-click, No|Left-click|Specify whether a left mouse click is performed before populating the text field or not.|

### Variables produced

This action doesn't produce any variables.

### <a name="populatetextfield_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to write in textbox|Indicates a problem populating the specified text field|

## <a name="pressbutton"></a> Press button in window

Presses a window button.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The button to press|

### Variables produced

This action doesn't produce any variables.

### <a name="pressbutton_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to press button|Indicates a problem pressing the specified button|

## <a name="selectradiobutton"></a> Select radio button in window

Selects a radio button on a window.

##### Input parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Radio button|No|[UI element](../ui-elements.md)||The radio button to select|

### Variables produced

This action doesn't produce any variables.

### <a name="selectradiobutton_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to select radio button UI element|Indicates a problem selecting the specified radio button UI element|

## <a name="setcheckboxstate"></a> Set checkbox state in window

Checks or unchecks a checkbox in a window form.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Checkbox|No|[UI element](../ui-elements.md)||The checkbox to set the state of|
|Set checkbox state to|N/A|Checked, Unchecked|Checked|Specify whether the checkbox will become checked or unchecked|

### Variables produced

This action doesn't produce any variables.

### <a name="setcheckboxstate_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to set checkbox state|Indicates a problem setting the specified checkbox state|

## <a name="setdropdownlistvalueinwindow"></a> Set drop-down list value in window

Sets or clears the selected options for a drop-down list in a window form.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Drop-down list|No|[UI element](../ui-elements.md)||The drop-down list whose value to set|
|Operation|N/A|Clear selected options, Select options by name, Select options by index|Clear selected options|Specify whether you want to select a value by name or by ordinal position (1 2 3 ...) or clear the selected value of the drop-down list|
|Option names|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||Enter an option or a list of options to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified will be used.|
|Use regular expressions|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the option names values to interpret as a regular expression|
|Options indices|No|[List](../variable-data-types.md#list) of [Numeric values](../variable-data-types.md#numeric-value)||Enter an index or a list of indices to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified will be used.|

### Variables produced

This action doesn't produce any variables.

### <a name="setdropdownlistvalueinwindow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to select the specified options in the drop-down list|Indicates a problem selecting the specified options in the drop-down list|

## <a name="getwindowbase"></a> Get window

Gets a running window, for automating desktop applications.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get window|N/A|Specific window, Foreground window|Specific window|Specify whether to look using a selector or the foreground window|
|UI element|No|[UI element](../ui-elements.md)||The selector of the window to get|
|Bring window to front|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to bring the window to the foreground automatically upon acquiring it|
|Fail if window isn't found|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait indefinitely for the window to appear or to fail if the window doesn't show up within a set time period|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)||The timeout to wait in seconds|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|WindowTitle|[Text value](../variable-data-types.md#text-value)|The title of the foreground window|
|AutomationWindow|[Window instance](../variable-data-types.md#instances)|The specific window instance for use with later UI Automation actions|

### <a name="getwindowbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get window|Indicates a problem getting the window|

## <a name="focuswindowbase"></a> Focus window

Activates and brings to the foreground a specific window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to focus|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to use.|

### Variables produced

This action doesn't produce any variables.

### <a name="focuswindowbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't focus window|Indicates a problem focusing the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="setwindowstatebase"></a> Set window state

Restores, maximizes or minimizes a specific window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to set the state of|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to use.|
|Window state|N/A|Restored, Maximized, Minimized|Restored|Choose in which state to display the window|

### Variables produced

This action doesn't produce any variables.

### <a name="setwindowstatebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't set window state|Indicates a problem setting the window state of the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="setwindowvisibilitybase"></a> Set window visibility

Shows a hidden window or hides a visible window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to set the visibility of|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to use.|
|Visibility|N/A|Visible, Hidden|Hidden|Choose in which state to set the window visibility to|

### Variables produced

This action doesn't produce any variables.

### <a name="setwindowvisibilitybase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't set window visibility|Indicates a problem setting the visibility of the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="movewindowbase"></a> Move window

Sets the position of a specific window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the Window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to move|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If you have two windows with the same title, Window Class might help differentiate between them. In this case, enter the class of the window to use.|
|Position X|No|[Numeric value](../variable-data-types.md#numeric-value)||The X position of the window|
|Position Y|No|[Numeric value](../variable-data-types.md#numeric-value)||The Y position of the window|

### Variables produced

This action doesn't produce any variables.

### <a name="movewindowbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't move window|Indicates a problem moving the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="resizewindowbase"></a> Resize window

Sets the size of a specific window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to resize|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to use|
|Width|No|[Numeric value](../variable-data-types.md#numeric-value)||The new width, in pixels|
|Height|No|[Numeric value](../variable-data-types.md#numeric-value)||The new height, in pixels|

### Variables produced

This action doesn't produce any variables.

### <a name="resizewindowbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't resize window|Indicates a problem resizing the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="closewindowbase"></a> Close window

Closes a specific window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window mode|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element or a combination of window title/class|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to close|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to use.|

### Variables produced

This action doesn't produce any variables.

### <a name="closewindowbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Window wasn't found|Indicates that the specified window wasn't found|
|Can't close window|Indicates a problem closing the specified window|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

## <a name="ifwindowcontainsaction"></a> If window contains

Marks the beginning of a conditional block of actions depending on whether a specific piece of text or UI element exists in a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Check if window|N/A|Contains UI element, Doesn't contain UI element, Contains text, Doesn't contain text|Contains UI element|Check whether a specific text or UI element exists in a window|
|Check UI element state|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Check whether a specific UI element is enabled or disabled|
|Text|No|[Text value](../variable-data-types.md#text-value)||The text to check for|
|UI element|No|[UI element](../ui-elements.md)||The UI element to check for|
|Window|No|[UI element](../ui-elements.md)||The window to check if the text exists on|
|State|N/A|Enabled, Disabled|Enabled|The UI element state to check for|

### Variables produced

This action doesn't produce any variables.

### <a name="ifwindowcontainsaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="waitforwindowcontentaction"></a> Wait for window content

Suspends the execution of the automation until a specific piece of text or UI element appears or disappears from a Window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait until window|N/A|Contains UI element, Doesn't contain UI element, Contains text, Doesn't contain text|Contains UI element|Whether to wait for a specific text or UI element to appear in a window|
|Check UI element state|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Check whether a specific UI element is enabled or disabled|
|Text|No|[Text value](../variable-data-types.md#text-value)||The text to check for|
|UI element|No|[UI element](../ui-elements.md)||The UI element to check for|
|Window|No|[UI element](../ui-elements.md)||The window to check if the text exists on|
|State|N/A|Enabled, Disabled|Enabled|The UI element state to check for|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforwindowcontentaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Wait for window content failed|Indicates that the wait operation failed|

## <a name="ifimageaction"></a> If image

This action marks the beginning of a conditional block of actions depending on whether a selected image is found on the screen or not.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If image|N/A|exists, doesn't exist|exists|Whether to check for the existence or absence of the selected image|
|Image|No|[List](../variable-data-types.md#list) of [Images](../images.md)||The image/s that the action will check if it/they exist|
|Search for image on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified image in the foremost window only or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Whether to scan the entire screen (or window) to find the supplied text or only a narrowed down subregion of it|
|Find all images in the list|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Check whether all images on the list exist or don't exist|
|X1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start X coordinate of the subregion to scan for the supplied text|
|X2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start Y coordinate of the subregion to scan for the supplied text|
|Y2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end Y coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specify how much the image(s) searched for can differ from the originally chosen image|
|Image matching algorithm|N/A|Basic, Advanced|Basic|Which image algorithm to use when searching for image|

### Variables produced

This action doesn't produce any variables.

### <a name="ifimageaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't check image in noninteractive mode|Indicates that an image can't be identified in non-interactive mode|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|

## <a name="usedesktop"></a> Use desktop

Performs desktop and taskbar related operations.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The UI element to perform a click on|
|Click type|N/A|Left-click, Right-click, Double-click|Left-click|The kind of click to perform|
|Launch new application when left-clicking on the taskbar|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|When this parameter is set to 'true', it ensures that a new window of an application will be created when left-clicking on its icon in the 'quick launch' bar, also known as the taskbar of Windows 7 or above. Uncheck this option to bring an already running instance of the application to the foreground.|

### Variables produced

This action doesn't produce any variables.

### <a name="usedesktop_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Taskbar operation failed|Indicates that the taskbar operation failed|

## <a name="selecttab"></a> Select tab in window

Selects a tab from a group of tabs.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Tab|No|[UI element](../ui-elements.md)||The tab to select|

### Variables produced

This action doesn't produce any variables.

### <a name="selecttab_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Selecting tab failed|Indicates a problem selecting the specified tab|

## <a name="waitforimageaction"></a> Wait for image

This action waits until a specific image appears on the screen or on the foreground window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for image to|N/A|Appear, Disappear|Appear|Check whether to wait for the image(s) to appear or disappear|
|Image to wait for|No|[List](../variable-data-types.md#list) of [Images](../images.md)||The image/s that the action will check if it/they exist|
|Search for image on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified image in the foremost window only or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Whether to scan the entire screen (or window) to find the supplied text or only a narrowed down subregion of it|
|Wait for all images|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Whether to wait for all the images on the list to appear(disappear), or just one of them|
|X1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start X coordinate of the subregion to scan for the supplied text|
|X2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start Y coordinate of the subregion to scan for the supplied text|
|Y2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end Y coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specify how much the image(s) searched for can differ from the originally chosen image|
|Image matching algorithm|N/A|Basic, Advanced|Basic|Which image algorithm to use when searching for image|
|Fail with timeout error|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether you want the action to wait indefinitely or fail after a set time period|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|X|[Numeric value](../variable-data-types.md#numeric-value)|The X coordinate of the point where the text was found on the screen. If the text has been search in the foreground window, this value is relative to the top left corner of the window.|
|Y|[Numeric value](../variable-data-types.md#numeric-value)|The Y coordinate of the point where the text was found on the screen. If the text has been search in the foreground window, this value is relative to the top left corner of the window.|

### <a name="waitforimageaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Wait for image failed|Indicates that the wait operation failed|
|Can't check image in noninteractive mode|Indicates that an image can't be identified in non-interactive mode|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|

## <a name="hoveronelement"></a> Hover mouse over UI element in window

Hover the mouse over any UI element on window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element in window to hover|

### Variables produced

This action doesn't produce any variables.

### <a name="hoveronelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to hover over element|Indicates that the hover over the element failed|

## <a name="click"></a> Click UI element in window

Clicks on any UI element of a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The UI element to click on|
|Click type|N/A|Left-click, Right-click, Double-click, Middle-click, Left button down, Left button up, Right button down, Right button up|Left-click|The kind of click to perform|
|Simulate action|N/A|Boolean value|False|Specify whether to simulate the move of the mouse cursor over the element prior to clicking. This option does not require the UI element's screen to be focused, it will not automatically bring it to the foreground. Note this option can be applied only to left-click action and it might not be applicable to every UI element.|
|Mouse position relative to UI element|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the UI element the mouse will be moved to prior to clicking|
|Offset X|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse from the position by this many pixels to the right|
|Offset Y|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse from the position by this many pixels down|

### Variables produced

This action doesn't produce any variables.

### <a name="click_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Click failed|Indicates that the click failed|

## <a name="selectmenuoption"></a> Select menu option in window

Selects an option in a menu of a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The menu option to select|

### Variables produced

This action doesn't produce any variables.

### <a name="selectmenuoption_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to select option|Indicates a problem selecting the specified menu option|

## <a name="draganddropelement"></a> Drag and drop UI element in window

Drags and drops a UI element of a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element to drag|No|[UI element](../ui-elements.md)||The UI element to drag|
|UI element to drop over|No|[UI element](../ui-elements.md)||The UI element to drop over|
|Click type|N/A|Left-click, Right-click|Left-click|Specify which mouse button to use for clicking and holding down, while dragging the UI element over to its destination|
|Mouse down offset X|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse-down click, that will be used to grab the UI element drag, by this many pixels to the right|
|Mouse down offset Y|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse-down click, that will be used to grab the UI element to drag, by this many pixels downwards|
|Mouse down position relative to drag-target UI element|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the UI element to drop the mouse onto prior to clicking|
|Mouse up offset X|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse-up click, that will be used to grab the UI element to drag, by this many pixels to the right|
|Mouse up offset Y|Yes|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse-up click, that will be used to grab the UI element to drag, by this many pixels downwards|
|Mouse up position relative to drop-target UI element|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the UI element to drag the mouse onto after clicking|

### Variables produced

This action doesn't produce any variables.

### <a name="draganddropelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|UI element to drag wasn't found|Indicates that the UI element to drag wasn't found|
|Drop target UI element wasn't found|Indicates that the drop target UI element wasn't found|
|Drag and drop failed|Indicates a problem during drag and drop of the specified UI element|

## <a name="expandcollapsetreenode"></a> Expand/collapse tree node in window

Expands or collapses a node of a tree view residing in a window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|UI element|No|[UI element](../ui-elements.md)||The tree node to expand/collapse|
|Folders path|Yes|[Text value](../variable-data-types.md#text-value)||A forward slash separated path made out of folder names leading to the tree node to expand or collapse|
|Use regular expressions|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether each folder name in the path to interpret as a regular expression|
|Operation|N/A|Expand, Collapse|Expand|Specify whether to expand or collapse the tree node|

> [!NOTE]
> Power Automate's regular expression engine is .NET. To find more information about regular expressions, go to [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

### Variables produced

This action doesn't produce any variables.

### <a name="expandcollapsetreenode_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to set tree node to the specified state|Indicates a problem setting the tree node to the specified state|

## <a name="ifwindowaction"></a> If window

This action marks the beginning of a conditional block of actions depending on whether a window is open or not or whether a window is the focused (foreground) window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get window|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the Window using a UI element or a combination of window title/class|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to check|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to be used.|
|Check if window|N/A|Is open, Isn't open, Is focused, Isn't focused|Is open|The state of the window to be checked|

### Variables produced

This action doesn't produce any variables.

### <a name="ifwindowaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="waitforwindowaction"></a> Wait for window

Suspends the execution or the process until a specific window opens, closes, get or loses the focus.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element  or a combination of window title/class|
|Window title|Yes|[Text value](../variable-data-types.md#text-value)||The window title. Wildcards can be used, like '?' or '*'.|
|Window|No|[UI element](../ui-elements.md)||The window UI element|
|Window instance|No|[Numeric value](../variable-data-types.md#numeric-value)||The instance or handle of the window to check|
|Window class|Yes|[Text value](../variable-data-types.md#text-value)||If there are two windows with the same title, window class might help differentiate between them. In this case, enter the class of the window to be used|
|Wait for window to|N/A|Open, Close, Become focused, Lose focus|Open|Whether to wait for a specific window to open, close, become focused (i.e become the foreground window), or lose focus (i.e stop being the foreground window).|
|Focus window after it opens|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Bring the window to the front after it opens, so later actions are directed at this window|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforwindowaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't focus window|Indicates a problem focusing the specified window|
|Wait for window failed|Indicates that the wait operation failed|
|Can't perform window-related action in noninteractive mode|Indicates a problem performing window-related action in non-interactive mode|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
