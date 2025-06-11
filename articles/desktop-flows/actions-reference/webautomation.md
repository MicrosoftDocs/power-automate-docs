---
title: Browser automation actions reference
description: See all the available browser automation actions.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/04/2024
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
# Browser automation actions

Browser automation actions enable users to interact with web applications and components through UI elements. Web UI elements, also called Web elements, describe uniquely the web components that the action is going to handle.

To perform web automation, you first need to create a new browser instance. You can achieve this using the Launch Browser actions, which support Microsoft Edge, Google Chrome, Mozilla Firefox, and Internet Explorer. With the Launch Browser actions, you can also specify whether the web page should be launched on your local desktop or in a virtual desktop environment.

> [!NOTE]
> To launch a browser on a virtual desktop, first capture at least one UI element within that desktop. This element needs to be available in the UI element repository of your flow.

To add a new UI element, select **Add UI element** through the deployed browser automation action or the UI elements pane of the flow designer.

:::image type="content" source="media/webautomation/create-ui-element.png" alt-text="Screenshot of the options to create a new UI element.":::

All web-related UI elements are specified by one or more CSS selectors - web selectors - that pinpoint the hierarchical structure of the component on the page. Selectors use the **>** notation to indicate that each element is contained within the element on its left.

Although web selectors are created automatically when adding UI elements, some particular scenarios need manually created selectors. When a custom web selector is needed, you can create your own by either editing an existing selector or building one from scratch.

:::image type="content" source="media/webautomation/create-selector.png" alt-text="Screenshot of the options to edit and create selectors.":::

To develop more dynamic web flows, replace the **Equals to** operators with other operators or regular expressions. Additionally, if the value of a web selector's attribute depends on the results of previous actions, use variables instead of hard-coded values.

:::image type="content" source="media\webautomation\selector-operators.png" alt-text="Screenshot of the available operators in the selector builder.":::

>[!NOTE]
> To find more information about developing web flows and creating custom web selectors for Web elemements, go to [Automate web flows](../automation-web.md) and [Build a custom selector](../build-custom-selectors.md).

## <a name="extractdata"></a> Extract data from web page

Extract data from specific parts of a web page in the form of single values, lists, rows, or tables.

For more information on how to use this action, go to [Web data extraction](../automation-web.md#extract-data-from-webpages).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to extract data from|
|Extraction parameters|No|[Datatable](../variable-data-types.md#datatable)||The parameters to use when extracting data. Depending on the extraction mode, this parameter accepts different data.|
|Max web pages to process|No|[Numeric value](../variable-data-types.md#numeric-value)||The maximum number of web pages to process|
|Send physical click for next page|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the page prior to clicking. A physical click is required for cases where emulated clicks to the page don't perform the intentional action on the element. As this option requires the browser window to be focused, it will automatically bring it to the foreground.|
|Page CSS selector|No|[Text value](../variable-data-types.md#text-value)||The page CSS selector|
|Extraction mode|N/A|Undefined, Single value, Handpicked values, List, Table, Entire HTML table|Single value|Specify what to extract from the web page|
|Use paging|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to use paging|
|Get all web pages|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to get all web pages|
|Process data upon extraction|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to process extracted data to present them exactly as displayed in the webpage. Processing of extracted data includes displaying of the information nested in iframes and filtering through hidden or visible elements. For larger datasets, having this option enabled isn't recommended as it will increase the extraction time.|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the extraction to be completed before the action fails|
|Store data mode|N/A|Variable, Excel spreadsheet|Variable|Specify whether to store the extracted data in a variable or an Excel spreadsheet|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|[Excel instance](../variable-data-types.md#instances)|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|DataFromWebPage|[Datatable](../variable-data-types.md#datatable)|The extracted data in the form of a single value, list, data row, or data table. |

### <a name="extractdata_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to extract data|Indicates a problem extracting data|
|Failed to launch Excel instance|Indicates a problem launching an Excel instance|
|Failed to write values to Excel|Indicates a problem writing the values to an Excel|

## <a name="getdetailsofwebpage"></a> Get details of web page

Get a property of a web page, such as its title or its source text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|Get|N/A|Web page description, Web page meta keywords, Web page title, Web page text, Web page source, Web browser's current URL address|Web page description|Select the information to retrieve from the web page|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|WebPageProperty|[Text value](../variable-data-types.md#text-value)|The details retrieved from the web page|

### <a name="getdetailsofwebpage_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get details of web page|Indicates a problem getting the details of the specified web page|

## <a name="getdetailsofelement"></a> Get details of element on web page

Get the value of an element's attribute on a web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to get details from|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)|Own Text|Enter or select the attribute whose value to retrieve|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|AttributeValue|[Text value](../variable-data-types.md#text-value)|The value of the web element's attribute|

### <a name="getdetailsofelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to retrieve attribute of UI element on web page|Indicates a problem retrieving attribute of web page element|

## <a name="takescreenshotbase"></a> Take screenshot of web page

Take a screenshot of the web page (or an element of the web page) currently displayed in the browser and save the image into a file or to the clipboard.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|Capture|N/A|Entire web page, Specific element|Entire web page|Specify whether to capture the entire web page or only a specific element of it|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to capture|
|Save mode|N/A|Clipboard, File|Clipboard|Specify whether to save the image into a file or store it into the clipboard|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||Set the full path for the file to save the image capture|
|File format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|Select the format of the image file|

### Variables produced

This action doesn't produce any variables.

### <a name="takescreenshotbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to save file|Indicates a problem saving the specified file|
|Failed to save in the clipboard|Indicates a problem while saving to the clipboard|
|Failed to take screenshot|Indicates a problem taking a screenshot|

## <a name="focusbase"></a> Focus text field on web page

Set the focus on an input element of a web page and scroll it into view.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to focus|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="focusbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to set input focus on web page text field|Indicates a problem setting input focus on the specified web page text field|

## <a name="populatetextfieldbase"></a> Populate text field on web page

Fill a text field in a web page with the specified text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the text field to populate|
|Text|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||Enter the text to fill in the text field|
|If field isn't empty|Yes|Replace text, Append text|Replace text|Specify whether to replace existing content, or to append.|
|Populate text using physical keystrokes|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Emulate using physical keystrokes when populating text to UI text field elements. Physical keystrokes are required for cases that emulated text population doesn't perform the intentional action on the element. As this option requires the browser window to be focused, it will automatically bring it in the foreground.|
|Emulate typing|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to fill the text field at once by setting the value of the text box, or emulate a user typing by sending characters one by one. The latter method is slower, but required in some complex web pages.|
|Unfocus text box after filling it|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Choose whether to unfocus the text box right after this action fills it with the specified text. If scraping autocompletion lists, this parameter should be set to **False**.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after populating the text field|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after populating the text field|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="populatetextfieldbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to write on text field|Indicates a problem writing to the specified text field|

## <a name="setcheckboxstatebase"></a> Set check box state on web page

Check or uncheck a check box in a web form.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the check box to set the state of|
|Check box state|N/A|Checked, Unchecked|Checked|Select the check box state|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after setting the check box state|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after setting the check box state|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="setcheckboxstatebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to set the state of the checkbox|Indicates a problem in setting the state of the specified check box|

## <a name="selectradiobuttonbase"></a> Select radio button on web page

Select a radio button on the web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||The radio button to select|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after selecting the radio button|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after selecting the radio button|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|The dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="selectradiobuttonbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to select radio button|Indicates a problem in selecting the specified radio button|

## <a name="setdropdownlistvaluebase"></a> Set drop-down list value on web page

Set or clear the selected options for a drop-down list in a web form.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the drop-down list to set its value|
|Operation|N/A|Clear all options, Select options by name, Select options by index|Clear all options|Select whether to select a value or clear the selected value of the drop-down list|
|Option names|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||Enter an option or a list of options to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified will be used.|
|Use regular expressions|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the option names values to interpret as a regular expression|
|Option indices|No|[List](../variable-data-types.md#list) of [Numeric values](../variable-data-types.md#numeric-value)||Enter an index or a list of indices to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified will be used.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after setting the drop-down list value|
|Timeout for webpage load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after setting the drop-down list value|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="setdropdownlistvaluebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to set the selected option|Indicates a problem setting the selected drop-down list option|

## <a name="pressbuttonbase"></a> Press button on web page

Press a web page button.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the button to press|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after pressing the button|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after pressing the button|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="pressbuttonbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to click on web page button|Indicates a problem clicking the specified web page button|

## <a name="ifwebpagecontainsaction"></a> If web page contains

Mark the beginning of a conditional block of actions, depending on whether a specific piece of text or element exists in a web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|Check if web page|N/A|Contains element, Doesn't contain element, Contains text, Doesn't contain text|Contains element|Check whether a specific text or web page element exists in a web page|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to check for|
|Text|No|[Text value](../variable-data-types.md#text-value)||Enter the text on web page to check for|

### Variables produced

This action doesn't produce any variables.

### <a name="ifwebpagecontainsaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to communicate with the browser|Indicates that an error with the browser occurred|

## <a name="waitforwebpagecontentaction"></a> Wait for web page content

Suspend the flow until a specific piece of text or web page element appears or disappears from a web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|Wait for web page to|N/A|Contain element, Not contain element, Contain text, Not contain text|Contain element|Specify whether to wait for a specific text or web page element to appear or disappear in a web page|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to check for|
|Text|No|[Text value](../variable-data-types.md#text-value)||Enter the text on web page to check for|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforwebpagecontentaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Wait for web page content failed|Indicates that the wait operation failed|

## <a name="launchinternetexplorerbase"></a> Launch new Internet Explorer

Launch a new instance or attach to a running instance of Internet Explorer for automating websites and web applications.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch automation browser, Launch new Internet Explorer, Attach to running Internet Explorer|Launch automation browser|Specify whether to launch the automation browser or a new instance of Internet Explorer or attach to an existing one|
|Attach to Internet Explorer tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to an Internet Explorer tab by its title, URL, or attach to the active tab of Internet Explorer running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Internet Explorer tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Internet Explorer tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state|
|Target desktop|N/A|Local computer, Any virtual desktop that is either currently connected or has at least one UI element captured|Local computer|Set the connection string of the target desktop that the browser launches|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|
|Custom user agent string|Yes|[Text value](../variable-data-types.md#text-value)||Specify the custom user agent string for the runtime web helper. If this field remains empty, the runtime web helper uses by default the user agent string of Internet Explorer installed on the machine.|

> [!NOTE]
> The **Clear cache** and **Clear cookies** options only work as intended if **running in protected mode** is disabled in the **Internet options** menu.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|InternetExplorer|[Web browser instance](../variable-data-types.md#instances)|The Internet Explorer instance to use with browser automation actions|

### <a name="launchinternetexplorerbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Internet Explorer|Indicates a problem launching Internet Explorer|
|Invalid URL|Indicates that the provided URL was invalid|

## <a name="launchfirefoxbase"></a> Launch new Firefox

Launch a new instance or attach to a running instance of Firefox for automating websites and web applications.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Firefox or attach to an existing one|
|Attach to Firefox tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to a Firefox tab by its title, URL, or attach to the active tab of Firefox running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Firefox tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Firefox tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state|
|Target desktop|N/A|Local computer, Any virtual desktop that is either currently connected or has at least one UI element captured|Local computer|Set the connection string of the target desktop that the browser launches|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be launched before the action fails|
|User data folder|N/A|Picture-in-Picture default, Browser default, Custom|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser uses when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Firefox instance to use with browser automation actions|

### <a name="launchfirefoxbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Firefox|Indicates a problem launching Firefox|
|Invalid URL|Indicates that the provided URL was invalid|

## <a name="launchchromebase"></a> Launch new Chrome

Launch a new instance or attach to a running instance of Chrome for automating websites and web applications.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Chrome or attach to an existing one|
|Attach to Chrome tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to a Chrome tab by its title, URL, or attach to the active tab of Chrome running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Chrome tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Chrome tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state|
|Target desktop|N/A|Local computer, Any virtual desktop that is either currently connected or has at least one UI element captured|Local computer|Set the connection string of the target desktop that the browser launches|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be opened before the action fails|
|User data folder|N/A|Picture-in-Picture default, Browser default, Custom|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser will use when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Chrome instance to use with browser automation actions|

### <a name="launchchromebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Chrome|Indicates a problem launching Chrome|
|Invalid URL|Indicates that the provided URL was invalid|

## Launch new Microsoft Edge

Launch a new instance or attach to a running instance of Microsoft Edge for automating websites and web applications.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Microsoft Edge or attach to an existing one|
|Attach to Microsoft Edge tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to a Microsoft Edge tab by its title, URL, or attach to the active tab of Microsoft Edge running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Microsoft Edge tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Microsoft Edge tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state|
|Target desktop|N/A|Local computer, Any virtual desktop that is either currently connected or has at least one UI element captured|Local computer|Set the connection string of the target desktop that the browser launches|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be launched before the action fails|
|User data folder|N/A|Picture-in-Picture default, Browser default, Custom|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser uses when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#limitations-of-browser-automation-in-picture-in-picture)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Microsoft Edge instance to use with browser automation actions|

### <a name="launchedgebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to launch Microsoft Edge|Indicates a problem launching Microsoft Edge|
|Invalid URL|Indicates that the provided URL was invalid|

## <a name="createnewtabbase"></a> Create new tab

Create a new tab and navigate to the given URL (supported in Microsoft Edge, Chrome, and Firefox).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|URL to navigate to|No|[Text value](../variable-data-types.md#text-value)||Enter the URL, or a variable containing the URL, to navigate to|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|NewBrowser|[Web browser instance](../variable-data-types.md#instances)|The new web browser instance to use with browser automation actions|

### <a name="createnewtabbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid URL|Indicates that the provided URL was invalid|
|Failed to create a new tab|Indicates a problem creating a new tab|

## <a name="gotowebpagebase"></a> Go to web page

Navigate the web browser to a new page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|Navigate|N/A|To URL, Back, Forward, Reload web page|To URL|Specify where to navigate to|
|URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL to navigate to|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="gotowebpagebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to navigate to web page|Indicates a problem navigating to the specified web page|
|Invalid URL|Indicates that the provided URL was invalid|

## <a name="clickbase"></a> Click link on web page

Click on a link or any other element of a web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to click|
|Click type|N/A|Left click, Right click, Double click, Left button down, Left button up, Right button down, Right button up, Middle click|Left click|The kind of click to perform|
|Send physical click|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the element prior to clicking. A physical click is required for cases where emulated clicks don't perform the intentional action on the element. As this option requires the browser window to be focused, it will automatically bring it to the foreground.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after clicking the link|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after clicking the link|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears|

### Variables produced

This action doesn't produce any variables.

### <a name="clickbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to click UI element|Indicates a problem clicking the specified element|

## <a name="clickdownloadlink"></a> Click download link on web page

Select a link in a web page that results in downloading a file.

> [!IMPORTANT]
> The **Click download link on web page** action only works in Internet Explorer, which has reached the end of its lifecycle. We recommend using [HTTP actions](web.md#downloadfromweb) instead.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to click|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to save the downloaded file to|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|DownloadedFile|[File](../variable-data-types.md#files-and-folders)|The file on the disk where the download is saved. This value is a filepath that consists of the download folder as specified above plus the name of the file as provided by the web server.|

### <a name="clickdownloadlink_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to download file|Indicates a problem downloading the specified file|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector wasn't found|
|Failed to click UI element|Indicates a problem clicking the specified element|
|Failed to save file|Indicates a problem saving the specified file|

## <a name="executejavascript"></a> Run JavaScript function on web page

Run a JavaScript function on the web page and get the returned result.

> [!NOTE]
> The migration to the Manifest V3 browser extensions affects this action. To find more information about Manifest V3 and how it affect the **Run JavaScript function on web page** action, go to [Migration to Manifest V3](../manifest.md).

##### Input parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|JavaScript function|Yes|[Text value](../variable-data-types.md#text-value)|function ExecuteScript() { /*your code here, return something (optionally); */ }|Enter the JavaScript function to run on the web page|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Result|[Text value](../variable-data-types.md#text-value)|The result of the JavaScript function that ran|

### <a name="executejavascript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run JavaScript|Indicates a problem running JavaScript|

## <a name="hoveroverelement"></a> Hover mouse over element on web page

Hover the mouse over an element of a web page.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to hover|
|Move mouse to hover|No|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the element in order to hover the UI element. A physical hover is required for cases where emulated hover doesn't perform the intentional action on the element. As this option requires the browser window to be focused, it automatically brings it to the foreground.|

### Variables produced

This action doesn't produce any variables.

### <a name="hoveroverelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to hover over element|Indicates a problem hovering over the specified element|

## <a name="closewebbrowser"></a> Close web browser

Close a web browser window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to close|

### Variables produced

This action doesn't produce any variables.

### <a name="closewebbrowser_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to close the web browser|Indicates a problem closing the web browser|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
