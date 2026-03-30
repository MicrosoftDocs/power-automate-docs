---
title: Browser automation actions reference
description: See all the available browser automation actions.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 03/30/2026
ms.author: nimoutzo
ms.reviewer: ellenwehrle
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Browser automation actions

Browser automation actions enable you to interact with web applications and components through UI elements. Web UI elements, also called web elements, uniquely describe the web components that the action handles.

To perform web automation, first create a new browser instance by using one of the **Launch Browser** actions. These actions support Microsoft Edge, Google Chrome, Mozilla Firefox, and Internet Explorer. For web automation to function correctly, you must have either the appropriate browser extension or a compatible WebDriver installed, depending on the interaction method you select. You can also specify whether the browser should launch on your local desktop or within a virtual desktop environment.

> [!IMPORTANT]
> - To launch a browser on a virtual desktop, first capture at least one UI element within that desktop. This element needs to be available in the UI element repository of your flow.

## WebDriver-based browser automation

Power Automate for desktop now supports web automation by using *WebDriver* as a method of interacting with a web browser. This new capability provides an alternative to the existing browser extension method for automating web applications. Each **Launch Browser** action includes a new drop-down menu labeled **Browser interaction method**, where you can choose between:

- Browser extension (default)
- WebDriver

When you select WebDriver, make sure that you set up the corresponding WebDriver executable and that it matches the version of the browser you're automating. Place WebDrivers in the following directory on the machine running the automation: `%LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers`.

> [!NOTE]
> For step-by-step instructions on how to download and configure WebDrivers for supported browsers, see [Setting up WebDriver for browser automation](../install-browser-extensions.md).

### WebDriver limitations

WebDriver support introduces new capabilities but also comes with specific limitations:

- **Attach to browser limitations**: WebDriver-based automation can only attach to browser instances that the flow launches. It doesn't support manually opened browsers. When you use the **Attach to browser** action, the **Title** and **URL** fields don't auto-populate for WebDriver-launched instances.
- **Parallel execution issues**: Running web automation in parallel across parent and child flows by using different browsers might cause problems. Because physical browser interactions require the window to be active and in the foreground, multiple concurrent browser automations might result in erratic behavior or failures.
- **Wait for page delays**: If the web server you're automating is slow to respond, WebDriver-based automation might not respect the configured timeout in the **Wait for web page to load** action. The action could hang until the server responds.
- **Child flow restrictions**: You can't attach directly from a child flow to browser instances that the parent flow launches by using the WebDriver interaction method without passing the instance as input.
- **Organizational sign-in policies**: WebDriver-based automation doesn't function if the browser is configured to force user sign-in as a policy requirement.
- **Internet Explorer**: You can't use WebDriver as the browser interaction method for web automation in Internet Explorer.

## Adding UI elements

To add a new UI element, select **Add UI element** through the deployed browser automation action or the UI elements pane of the flow designer.

:::image type="content" source="media/webautomation/create-ui-element.png" alt-text="Screenshot of the options to create a new UI element.":::

All web-related UI elements are specified by one or more CSS selectors - web selectors - that pinpoint the hierarchical structure of the component on the page. Selectors use the **>** notation to indicate that each element is contained within the element on its left.

Although web selectors are created automatically when adding UI elements, some particular scenarios need manually created selectors. When you need a custom web selector, you can create your own by either editing an existing selector or building one from scratch.

:::image type="content" source="media/webautomation/create-selector.png" alt-text="Screenshot of the options to edit and create selectors.":::

To develop more dynamic web flows, replace the **Equals to** operators with other operators or regular expressions. Additionally, if the value of a web selector's attribute depends on the results of previous actions, use variables instead of hard-coded values.

:::image type="content" source="media\webautomation\selector-operators.png" alt-text="Screenshot of the available operators in the selector builder.":::

>[!NOTE]
> For more information about developing web flows and creating custom web selectors for web elements, see [Automate web flows](../automation-web.md) and [Build a custom selector](../build-custom-selectors.md).

## <a name="extractdata"></a> Extract data from web page

Extract data from specific parts of a web page as single values, lists, rows, or tables.

For more information about how to use this action, see [Web data extraction](../automation-web.md#extract-data-from-webpages).

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on the web page to extract data from.|
|Extraction parameters|No|[Datatable](../variable-data-types.md#datatable)||The parameters to use when extracting data. Depending on the extraction mode, this parameter accepts different data.|
|Max web pages to process|No|[Numeric value](../variable-data-types.md#numeric-value)||This is the maximum number of web pages to process.|
|Send physical click for next page|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the page prior to clicking. A physical click is required for cases where emulated clicks to the page don't perform the intentional action on the element. As this option requires the browser window to be focused, it automatically brings it to the foreground.|
|Page CSS selector|No|[Text value](../variable-data-types.md#text-value)||This is the page CSS selector.|
|Extraction mode|N/A|<ul><li>Undefined</li><li>Single value</li><li>Handpicked values</li><li>List</li><li>Table</li><li>Entire HTML table</li></ul>|Single value|Specify what to extract from the web page.|
|Use paging|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to use paging.|
|Get all web pages|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to get all web pages.|
|Process data upon extraction|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to process extracted data to present them exactly as displayed in the webpage. Processing of extracted data includes displaying of the information nested in iframes and filtering through hidden or visible elements. For larger datasets, having this option enabled isn't recommended as it will increase the extraction time.|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the extraction to complete before the action fails.|
|Store data mode|N/A|<ul><li>Variable</li><li>Excel spreadsheet</li></ul>|Variable|Specify whether to store the extracted data in a variable or an Excel spreadsheet.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`ExcelInstance`|[Excel instance](../variable-data-types.md#instances)|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|`DataFromWebPage`|[Datatable](../variable-data-types.md#datatable)|The extracted data as a single value, list, data row, or data table. |

### <a name="extractdata_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to extract data.|Indicates a problem extracting data.|
|Failed to launch Excel instance.|Indicates a problem launching an Excel instance.|
|Failed to write values to Excel.|Indicates a problem writing the values to an Excel.|

## <a name="getdetailsofwebpage"></a> Get details of web page

Get a property of a web page, such as its title or its source text.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|Get|N/A|<ul><li>Web page description</li><li>Web page meta keywords</li><li>Web page title</li><li>Web page text</li><li>Web page source</li><li>Web browser's current URL address</li></ul>|Web page description|Select the information to retrieve from the web page.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`WebPageProperty`|[Text value](../variable-data-types.md#text-value)|The details retrieved from the web page.|

### <a name="getdetailsofwebpage_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to get details of web page.|Indicates a problem getting the details of the specified web page.|

## <a name="getdetailsofelement"></a> Get details of element on web page

Get the value of an element's attribute on a web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on the web page to get details from.|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)|Own Text|Enter or select the attribute whose value to retrieve.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`AttributeValue`|[Text value](../variable-data-types.md#text-value)|It's the value of the web element's attribute.|

### <a name="getdetailsofelement_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to retrieve attribute of UI element on web page.|Indicates a problem retrieving attribute of web page element.|

## <a name="takescreenshotbase"></a> Take screenshot of web page

Takes a screenshot of the web page (or an element of the web page) currently displayed in the browser and saves the image to a file or the clipboard.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
| Capture | N/A | <ul><li>Entire web page</li><li>Specific element</li></ul> | Entire web page | Specify whether to capture the entire web page or only a specific element of it. |
| UI element | No | [UI element](../ui-elements.md) | | Select the UI element on the web page to capture. |
| Save mode | N/A | <ul><li>Clipboard</li><li>File</li></ul> | Clipboard | Specify whether to save the image into a file or store it into the clipboard. |
| Image file | No | [File](../variable-data-types.md#files-and-folders) | | Set the full path for the file to save the image capture. |
| File format | N/A | <ul><li>BMP</li><li>EMF</li><li>EXIF</li><li>GIF</li><li>JPG</li><li>PNG</li><li>TIFF</li><li>WMF</li></ul> | BMP | Select the format of the image file. |

### Variables produced

This action doesn't produce any variables.

### <a name="takescreenshotbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
| Failed to save file. | Indicates a problem saving the specified file. |
| Failed to save in the clipboard. | Indicates a problem while saving to the clipboard. |
| Failed to take screenshot. | Indicates a problem taking a screenshot. |

## <a name="focusbase"></a> Focus text field on web page

Set the focus on an input element of a web page and scroll it into view.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on the web page to focus.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="focusbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to set input focus on web page text field. |Indicates a problem setting input focus on the specified web page text field.|

## <a name="populatetextfieldbase"></a> Populate text field on web page

Fill a text field in a web page with the specified text.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the text field to populate.|
|Text|No|<ul><li>Direct encrypted input</li><li>[Text value](../variable-data-types.md#text-value)</li></ul>||Enter the text to fill in the text field.|
|If field isn't empty|Yes|<ul><li>Replace text</li><li>Append text</li></ul>|Replace text|Specify whether to replace existing content, or to append.|
|Populate text using physical keystrokes|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Emulate using physical keystrokes when populating text to UI text field elements. Physical keystrokes are required for cases that emulated text population doesn't perform the intentional action on the element. As this option requires the browser window to be focused, it automatically brings it in the foreground.|
|Emulate typing|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to fill the text field at once by setting the value of the text box, or emulate a user typing by sending characters one by one. The latter method is slower, but required in some complex web pages.|
|Unfocus text box after filling it|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Choose whether to unfocus the text box right after this action fills it with the specified text. If scraping autocompletion lists, set this parameter to **False**.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after populating the text field.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after populating the text field.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="populatetextfieldbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found.|
|Failed to write on text field.|Indicates a problem writing to the specified text field.|

## <a name="setcheckboxstatebase"></a> Set check box state on web page

Check or uncheck a check box in a web form.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the check box to set the *state of*.|
|Check box state|N/A|<ul><li>Checked</li><li>Unchecked</li></ul>|Checked|Select the check box *state*.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after setting the check box state.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after setting the check box state.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="setcheckboxstatebase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to set the state of the checkbox.|Indicates a problem in setting the state of the specified check box.|

## <a name="selectradiobuttonbase"></a> Select radio button on web page

Select a radio button on the web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||The radio button to select.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after selecting the radio button.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after selecting the radio button.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|The dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="selectradiobuttonbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found | Indicates that a web page element with the specified CSS selector wasn't found |
|Failed to select radio button|Indicates a problem in selecting the specified radio button|

## <a name="setdropdownlistvaluebase"></a> Set drop-down list value on web page

Set or clear the selected options for a drop-down list in a web form.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the drop-down list to set its value.|
|Operation|N/A|<ul><li>Clear all options</li><li>Select options by name</li><li>Select options by index</li></ul>|Clear all options|Select whether to select a value or clear the selected value of the drop-down list.|
|Option names|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||Enter an option or a list of options to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified is used.|
|Use regular expressions|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the option names values to interpret as a regular expression.|
|Option indices|No|[List](../variable-data-types.md#list) of [Numeric values](../variable-data-types.md#numeric-value)||Enter an index or a list of indices to be selected in the drop-down list. Multiple options make sense only when working with multi-selection lists. If the list is single-selection, then only the first option of the list specified is used.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after setting the drop-down list value.|
|Timeout for webpage load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after setting the drop-down list value.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="setdropdownlistvaluebase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to set the selected option.|Indicates a problem setting the selected drop-down list option.|

## <a name="pressbuttonbase"></a> Press button on web page

Press a web page button.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the button to press.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after pressing the button.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after pressing the button.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="pressbuttonbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to click on web page button.|Indicates a problem clicking the specified web page button.|

## <a name="ifwebpagecontainsaction"></a> If web page contains

Mark the beginning of a conditional block of actions, depending on whether a specific piece of text or element exists in a web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|Check if web page|N/A|<ul><li>Contains element</li><li>Doesn't contain element</li><li>Contains text</li><li>Doesn't contain text</li></ul>|Contains element|Check whether a specific text or web page element exists in a web page.|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to check for.|
|Text|No|[Text value](../variable-data-types.md#text-value)||Enter the text on web page to check for.|

### Variables produced

This action doesn't produce any variables.

### <a name="ifwebpagecontainsaction_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to communicate with the browser.|Indicates that an error with the browser occurred.|

## <a name="waitforwebpagecontentaction"></a> Wait for web page content

Suspend the flow until a specific piece of text or web page element appears or disappears from a web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|Wait for web page to|N/A|<ul><li>Contain element</li><li>Not contain element</li><li>Contain text</li><li>Not contain text</li></ul>|Contain element|Specify whether to wait for a specific text or web page element to appear or disappear in a web page.|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to check for.|
|Text|No|[Text value](../variable-data-types.md#text-value)||Enter the text on web page to check for.|

### Variables produced

This action doesn't produce any variables.

### <a name="waitforwebpagecontentaction_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Wait for web page content failed.|Indicates that the wait operation failed.|

## <a name="launchinternetexplorerbase"></a> Launch new Internet Explorer

Launch a new instance or attach to a running instance of Internet Explorer for automating websites and web applications.

### Deprecation notice: Automation browser
The Automation browser option is planned for deprecation and will be removed in a future release of Power Automate for desktop.

Existing desktop flows that use Automation browser continue to work during the deprecation period. However, don't use this option for new automations. Migrate existing flows to supported alternatives as soon as possible. Over time, Automation browser is removed from the product, and flows that aren't updated stop working once the option is no longer available.

To ensure long-term compatibility, use one of the following alternatives:
- Microsoft Edge in Internet Explorer (IE) mode, by selecting **Launch new Microsoft Edge**. This option automates legacy web applications that require Internet Explorer compatibility.
- Internet Explorer, by selecting **Launch new Internet Explorer**, where still applicable and supported in your environment.

#### Deprecation timeline (planned)
The deprecation of Automation browser is expected to occur over the next 12–18 months, following a phased approach:

- **Now**: Automation browser is marked for deprecation. New use is discouraged, and documentation and in‑product messaging guide users toward supported alternatives.
- **During the deprecation period**: Migrate existing desktop flows to Microsoft Edge (IE mode) or Internet Explorer.
- **Future release (12–18 months)**: Automation browser is removed from Power Automate for desktop. At that point, it isn't available for use in desktop flows.

> [!NOTE]
> The exact timing of removal might change based on customer feedback and platform considerations.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
|Launch mode|N/A|<ul><li>Launch automation browser</li><li>Launch new Internet Explorer</li><li>Attach to running Internet Explorer</li></ul>|Launch automation browser|Specify whether to launch the automation browser, a new instance of Internet Explorer, or attach to an existing one.|
|Attach to Internet Explorer tab|N/A|<ul><li>By title</li><li>By URL</li><li>Use foreground window</li></ul>|By title|Specify whether to attach to an Internet Explorer tab by its title, URL, or attach to the active tab of Internet Explorer running as the foreground window.|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the website to visit when the web browser launches.|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Internet Explorer tab to attach to.|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Internet Explorer tab to attach to.|
|Window state|N/A|<ul><li>Normal</li><li>Maximized</li><li>Minimized</li></ul>|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state.|
|Target desktop|N/A|<ul><li>Local computer</li><li>Any virtual desktop that is either currently connected or has at least one UI element captured</li></ul>|Local computer|Set the connection string of the target desktop that the browser launches.|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it.|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|
|Custom user agent string|Yes|[Text value](../variable-data-types.md#text-value)||Specify the custom user agent string for the runtime web helper. If this field remains empty, the runtime web helper uses by default the user agent string of Internet Explorer installed on the machine.|

> [!NOTE]
> The **Clear cache** and **Clear cookies** options only work as intended if **running in protected mode** is disabled in the **Internet options** menu.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`InternetExplorer`|[Web browser instance](../variable-data-types.md#instances)|The Internet Explorer instance to use with browser automation actions.|

### <a name="launchinternetexplorerbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to launch Internet Explorer.|Indicates a problem launching Internet Explorer.|
|Invalid URL|Indicates that the provided URL is invalid.|

## <a name="launchfirefoxbase"></a> Launch new Firefox

Launch a new instance or attach to a running instance of Firefox for automating websites and web applications.


> [!NOTE]
> When you set the **Launch mode** parameter to **Attach to running instance** and specify a URL to attach to, Power Automate for desktop first tries to find an exact URL match for half the configured timeout. If it can't find an exact match, it switches to a partial match for the remaining time. For example, with a 30-second timeout and target URL `www.microsoft.com`, Power Automate for desktop tries for 15 seconds to find an exact match (`www.microsoft.com`). If it can't find an exact match, it tries for 15 seconds to find a partial match (for example, `www.microsoft.com/en/microsoft-365?market=af`). The higher the timeout, the longer it searches before falling back to partial matching.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
|Launch mode|N/A| <ul><li>Launch new Instance </li><li> Attach to running instance</li></ul>|Launch new Instance|Specify whether to launch a new instance of Firefox or attach to an existing one.|
|Attach to Firefox tab|N/A|<ul><li>By title</li><li>By URL</li><li>Use foreground window</li></ul>|By title|Specify whether to attach to a Firefox tab by its title, URL, or attach to the active tab of Firefox running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the website to visit when the web browser launches.|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Firefox tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Firefox tab to attach to|
|Window state|N/A|<ul><li>Normal</li><li>Maximized</li><li>Minimized</li></ul>|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state.|
|Target desktop|N/A|<ul><li>Local computer</li><li>Any virtual desktop that is either currently connected or has at least one UI element captured</li></ul>|Local computer|Set the connection string of the target desktop that the browser launches.|
|Browser interaction method|N/A|<ul><li>Browser extension</li><li>WebDriver</li></ul>|Browser extension|Set how Power Automate for desktop communicates with the browser during web automation|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it.|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be launched before the action fails|
|User data folder|N/A|<ul><li>Picture-in-Picture default</li><li>Browser default</li><li>Custom</li></ul>|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser uses when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Firefox instance to use with browser automation actions|

### <a name="launchfirefoxbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to launch Firefox.|Indicates a problem launching Firefox.|
|Invalid URL|Indicates that the provided URL is invalid.|

## <a name="launchchromebase"></a> Launch new Chrome

Launch a new instance or attach to a running instance of Chrome for automating websites and web applications.


> [!NOTE]
> When you set the **Launch mode** parameter to **Attach to running instance** and specify a URL to attach to, Power Automate for desktop first tries to find an exact URL match for half the configured timeout. If it can't find an exact match, it switches to a partial match for the remaining time. For example, with a 30-second timeout and target URL `www.microsoft.com`, Power Automate for desktop tries for 15 seconds to find an exact match (`www.microsoft.com`). If it can't find an exact match, it tries for 15 seconds to find a partial match (for example, `www.microsoft.com/en/microsoft-365?market=af`). The higher the timeout, the longer it searches before falling back to partial matching.


### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
|Launch mode|N/A|<ul><li>Launch new Instance</li><li>Attach to running instance</li></ul>|Launch new Instance|Specify whether to launch a new instance of Chrome or attach to an existing one|
|Attach to Chrome tab|N/A|<ul><li>By title</li><li>By URL</li><li>Use foreground window</li></ul>|By title|Specify whether to attach to a Chrome tab by its title, URL, or attach to the active tab of Chrome running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the website to visit when the web browser launches.|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Chrome tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Chrome tab to attach to|
|Window state|N/A|<ul><li>Normal</li><li>Maximized</li><li>Minimized</li></ul>|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state.|
|Target desktop|N/A|<ul><li>Local computer</li><li>Any virtual desktop that is either currently connected or has at least one UI element captured</li></ul>|Local computer|Set the connection string of the target desktop that the browser launches.|
|Browser interaction method|N/A|<ul><li>Browser extension</li><li>WebDriver</li></ul>|Browser extension|Set how Power Automate for desktop communicates with the browser during web automation|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it.|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be opened before the action fails|
|User data folder|N/A|<ul><li>Picture-in-Picture default</li><li>Browser default</li><li>Custom</li></ul>|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser uses when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Chrome instance to use with browser automation actions|

### <a name="launchchromebase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to launch Chrome|Indicates a problem launching Chrome|
|Invalid URL|Indicates that the provided URL is invalid|

## Launch new Microsoft Edge

Launch a new instance or attach to a running instance of Microsoft Edge for automating websites and web applications.

> [!NOTE]
> When you set the **Launch mode** parameter to **Attach to running instance** and specify a URL to attach to, Power Automate for desktop first tries to find an exact URL match for half the configured timeout. If it can't find an exact match, it switches to a partial match for the remaining time. For example, with a 30-second timeout and target URL `www.microsoft.com`, Power Automate for desktop tries for 15 seconds to find an exact match (`www.microsoft.com`). If it can't find an exact match, it tries for 15 seconds to find a partial match (for example, `www.microsoft.com/en/microsoft-365?market=af`). The higher the timeout, the longer it searches before falling back to partial matching.


### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
|Launch mode|N/A|<ul><li>Launch new Instance</li><li>Attach to running instance</li></ul>|Launch new Instance|Specify whether to launch a new instance of Microsoft Edge or attach to an existing one|
|Attach to Microsoft Edge tab|N/A|<ul><li>By title</li><li>By URL</li><li>Use foreground window</li></ul>|By title|Specify whether to attach to a Microsoft Edge tab by its title, URL, or attach to the active tab of Microsoft Edge running as the foreground window|
|Initial URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL of the website to visit when the web browser launches.|
|Tab title|No|[Text value](../variable-data-types.md#text-value)||Enter the title (or part of it) of the Microsoft Edge tab to attach to|
|Tab URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL (or part of it) of the Microsoft Edge tab to attach to|
|Window state|N/A|<ul><li>Normal</li><li>Maximized</li><li>Minimized</li></ul>|Normal|Specify whether to launch the browser window in normal, minimized, or maximized state.|
|Target desktop|N/A|<ul><li>Local computer</li><li>Any virtual desktop that is either currently connected or has at least one UI element captured</li></ul>|Local computer|Set the connection string of the target desktop that the browser launches.|
|Browser interaction method|N/A|<ul><li>Browser extension</li><li>WebDriver</li></ul>|Browser extension|Set how Power Automate for desktop communicates with the browser during web automation|
|Clear cache|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear the entire cache of the web browser right after launching it.|
|Clear cookies|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to clear all stored cookies in the web browser right after launching it.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds that you want to wait for the browser to be launched before the action fails|
|User data folder|N/A|<ul><li>Picture-in-Picture default</li><li>Browser default</li><li>Custom</li></ul>|Picture-in-Picture default|Specify the user data folder the browser uses when the flow runs in Picture-in-Picture. If Browser default is selected, the browser can't be opened on both the desktop and in Picture-in-Picture at the same time. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|
|User data folder path|No|[Folder](../variable-data-types.md#files-and-folders)||Specify the path of the user data folder the browser uses when the flow runs in Picture-in-Picture. [Learn more](../run-desktop-flows-pip.md#browser-automation-limitations-in-pictureinpicture-child-session)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Browser|[Web browser instance](../variable-data-types.md#instances)|The Microsoft Edge instance to use with browser automation actions|

### <a name="launchedgebase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to launch Microsoft Edge.|Indicates a problem launching Microsoft Edge.|
|Invalid URL|Indicates that the provided URL is invalid.|

## <a name="createnewtabbase"></a> Create new tab

Create a new tab and go to the given URL (supported in Microsoft Edge, Chrome, and Firefox).

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with |
|URL to go to|No|[Text value](../variable-data-types.md#text-value)||Enter the URL, or a variable containing the URL, to go to|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely before proceeding.|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`NewBrowser`|[Web browser instance](../variable-data-types.md#instances)|The new web browser instance to use with browser automation actions.|

### <a name="createnewtabbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Invalid URL|Indicates that the provided URL is invalid.|
|Failed to create a new tab.|Indicates a problem creating a new tab.|

## <a name="gotowebpagebase"></a> Go to web page

Navigate the web browser to a new page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with |
|Navigate|N/A|<ul><li>To URL</li><li>Back</li><li>Forward</li><li>Reload web page</li></ul>|To URL|Specify where to navigate to|
|URL|No|[Text value](../variable-data-types.md#text-value)||Enter the URL to navigate to|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the web page to load completely before proceeding|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="gotowebpagebase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to navigate to web page.|Indicates a problem navigating to the specified web page.|
|Invalid URL|Indicates that the provided URL is invalid.|

## <a name="clickbase"></a> Click link on web page

Click on a link or any other element of a web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to click.|
|Click type|N/A|<ul><li>Left click</li><li>Right click</li><li>Double click</li><li>Left button down</li><li>Left button up</li><li>Right button down</li><li>Right button up</li><li>Middle click</li></ul>|Left click|The kind of click to perform|
|Send physical click|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the element prior to clicking. A physical click is required for cases where emulated clicks don't perform the intentional action on the element. As this option requires the browser window to be focused, it automatically brings it to the foreground.|
|Wait for page to load|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to wait for the new web page to load completely after clicking the link|
|Timeout for webpage to load|No|[Numeric value](../variable-data-types.md#numeric-value)|60|Set the time in seconds for page to load before the action throws an error.|
|If a pop-up dialog appears|N/A|<ul><li>Close it</li><li>Press a button</li><li>Do nothing</li></ul>|Do nothing|Specify what to do if a pop-up dialog appears after clicking the link.|
|Dialog button to press|Yes|[Text value](../variable-data-types.md#text-value)|OK|Enter the dialog button to press if a pop-up dialog appears.|

### Variables produced

This action doesn't produce any variables.

### <a name="clickbase_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to click UI element.|Indicates a problem clicking the specified element.|

## <a name="clickdownloadlink"></a> Click download link on web page

Select a link in a web page that results in downloading a file.

> [!IMPORTANT]
> The **Click download link on web page** action only works in Internet Explorer, which reached the end of its lifecycle. Use [HTTP actions](web.md#downloadfromweb) instead.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to click.|
|Destination folder|No|[Folder](../variable-data-types.md#files-and-folders)||Enter or choose the full path of the folder, or a variable containing the folder, to save the downloaded file to.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`DownloadedFile`|[File](../variable-data-types.md#files-and-folders)|The file on the disk where the download is saved. This value is a filepath that consists of the download folder as specified earlier plus the name of the file as provided by the web server.|

### <a name="clickdownloadlink_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to download file.|Indicates a problem downloading the specified file.|
| Element with specified CSS selector not found. | Indicates that a web page element with the specified CSS selector wasn't found. |
|Failed to click UI element.|Indicates a problem clicking the specified element.|
| Failed to save file. | Indicates a problem saving the specified file. |

## <a name="executejavascript"></a> Run JavaScript function on web page

Run a JavaScript function on the web page and get the returned result.

> [!NOTE]
> The migration to the Manifest V3 browser extensions affects this action. To find more information about Manifest V3 and how it affects the **Run JavaScript function on web page** action, see [Migration to Manifest V3](../manifest.md).

##### Input parameters
| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|JavaScript function|Yes|[Text value](../variable-data-types.md#text-value)|function `ExecuteScript`() { /*your code here, return something (optionally); */ }|Enter the :::no-loc text="JavaScript"::: function to run on the web page.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`Result`|[Text value](../variable-data-types.md#text-value)|The result of the :::no-loc text="JavaScript"::: function that ran.|

### <a name="executejavascript_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to run :::no-loc text="JavaScript":::.|Indicates a problem running :::no-loc text="JavaScript":::.|

## <a name="hoveroverelement"></a> Hover mouse over element on web page

Hover the mouse over an element of a web page.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
| Web browser instance | No | [Web browser instance](../variable-data-types.md#instances) | | Enter or choose the variable that contains the web browser instance to work with. |
|UI element|No|[UI element](../ui-elements.md)||Select the UI element on web page to hover.|
|Move mouse to hover|No|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to physically move the mouse cursor over the element in order to hover the UI element. A physical hover is required for cases where emulated hover doesn't perform the intentional action on the element. As this option requires the browser window to be focused, it automatically brings it to the foreground.|

### Variables produced

This action doesn't produce any variables.

### <a name="hoveroverelement_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to hover over element.|Indicates a problem hovering over the specified element.|

## <a name="closewebbrowser"></a> Close web browser

Closes a web browser window.

### Input parameters

| Argument | Optional | Accepts | Default value | Description |
|-----|-----|-----|-----|-----|
|Web browser instance|No|[Web browser instance](../variable-data-types.md#instances)||Enter or choose the variable that contains the web browser instance to close.|

### Variables produced

This action doesn't produce any variables.

### <a name="closewebbrowser_onerror"></a> Exceptions

| Exception | Description |
|-----|-----|
|Failed to close the web browser.|Indicates a problem closing the web browser.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
