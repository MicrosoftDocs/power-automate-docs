---
title: Web automation | Microsoft Docs
description: Web automation Actions Reference
author: mariosleon
ms.service: flow
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

# Web automation



Start and manage web applications on browsers

You can find more information on how to use the web automation actions [here](../automation-web.md)

|<!-- --> |
|-----|
|[Extract data from web page](#extractdata)|
|[Get details of web page](#getdetailsofwebpage)|
|[Get details of element on web page](#getdetailsofelement)|
|[Take screenshot of web page](#takescreenshotbase)|
|[Focus text field on web page](#focusbase)|
|[Populate text Field on web page](#populatetextfieldbase)|
|[Set check box state on web page](#setcheckboxstatebase)|
|[Select radio button on web page](#selectradiobuttonbase)|
|[Set drop-down list value on web page](#setdropdownlistvaluebase)|
|[Press button on web page](#pressbuttonbase)|
|[Launch new Internet Explorer](#launchinternetexplorerbase)|
|[Launch new Firefox](#launchfirefoxbase)|
|[Launch new Chrome](#launchchromebase)|
|[Launch new Edge](#launchedgebase)|
|[Create new tab](#createnewtabbase)|
|[Go to web page](#gotowebpagebase)|
|[Click link on web page](#clickbase)|
|[Click download link on web page](#clickdownloadlink)|
|[Run JavaScript function on web page](#executejavascript)|
|[Hover mouse over element on web page](#hoveroverelement)|
|[Close web browser](#closewebbrowser)|

## Web data extraction
Extract data from web applications, from a single value up to tables or custom multiple pieces of data
### <a name="extractdata"></a> Extract data from web page
Extract data from specific parts of a web page in the form of single values, lists, rows or tables

You can find more information on how to use this action [here](../automation-web.md#web-data-extraction)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to extract data from|
|Extraction parameters|No|Datatable||The parameters to use when extracting data. Depending on the extraction mode, this accepts different data.|
|Max web pages to process|No|Numeric value||The maximum number of web pages to process|
|Pager CSS selector|No|Text value||The pager CSS selector|
|Extraction mode|N/A|Undefined, Single value, Handpicked values, List, Table, Entire HTML table|Single value|Specify what to extract from the web page|
|Use paging|N/A|Boolean value|False|Specify whether to use paging|
|Get all web pages|N/A|Boolean value|False|Specify whether to get all web pages|
|Store data mode|N/A|Variable, Excel spreadsheet|Variable|Specify whether to store the extracted data in a variable or an Excel spreadsheet|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExcelInstance|Excel instance|The Excel instance with the extracted data. Use this instance to manipulate the spreadsheet (or save and close it) by using the dedicated Excel actions.|
|DataFromWebPage|Datatable|The extracted data in the form of a single value, list, datarow or datatable|


##### <a name="extractdata_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to extract data|Indicates a problem extracting data|
|Failed to launch Excel instance|Indicates a problem launching an Excel instance|
|Failed to write values to Excel|Indicates a problem writing the values to an Excel|

### <a name="getdetailsofwebpage"></a> Get details of web page
Get a property of a web page, such as its title or its source text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|Get|N/A|Web page description, Web page meta keywords, Web page title, Web page text, Web page source, Web browser's current URL address|Web page description|Select the information to retrieve from the web page|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|WebPageProperty|Text value|The details retrieved from the web page|


##### <a name="getdetailsofwebpage_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to get details of web page|Indicates a problem getting the details of the specified web page|

### <a name="getdetailsofelement"></a> Get details of element on web page
Get the value of an element's attribute on a web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to get details from|
|Attribute name|Yes|Text value|Own Text|Enter or select the attribute whose value to retrieve|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|AttributeValue|Text value|The value of the web element's attribute|


##### <a name="getdetailsofelement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to retrieve attribute of UI element on web page|Indicates a problem retrieving attribute of web page element|

### <a name="takescreenshotbase"></a> Take screenshot of web page
Take a screenshot of the web page (or an element of the web page) currently displayed in the browser and save the image into a file or to the clipboard

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|Capture|N/A|Entire web page, Specific element|Entire web page|Specify whether to capture the entire web page or only a specific element of it|
|UI element|No|WebControl||Select the UI element on web page to capture|
|Save mode|N/A|Clipboard, File|Clipboard|Specify whether to save the image into a file or store it into the clipboard|
|Image file|No|File||Set the full path for the file to save the image capture|
|File format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|Select the format of the image file|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="takescreenshotbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to save file|Indicates a problem saving the specified file|
|Failed to save in the clipboard|Indicates a problem while saving to the clipboard|
|Failed to take screenshot|Indicates a problem taking a screenshot|

## Web form filling
Fill in forms on web applications
### <a name="focusbase"></a> Focus text field on web page
Set the focus on an input element of a web page and scroll it into view

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to focus|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="focusbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to set input focus on web page text field|Indicates a problem setting input focus on the specified web page text field|

### <a name="populatetextfieldbase"></a> Populate text Field on web page
Fill a text field in a web page with the specified text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the text field to populate|
|Text|No|Encrypted value||Enter the text to fill in the text field|
|Emulate typing|N/A|Boolean value|True|Specify whether to fill the text field at once by simply setting the value of the text box, or emulate a user typing by sending characters one by one. The latter method is slower, but required in some complex web pages.|
|Unfocus text box after filling it|N/A|Boolean value|False|Choose whether to unfocus the text box right after this action fills it with the specified text. In case of scraping autocompletion lists, this parameter should be set to "False".|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after populating the text field|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after populating the text field|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="populatetextfieldbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to write on text field|Indicates a problem writing to the specified text field|

### <a name="setcheckboxstatebase"></a> Set check box state on web page
Check or uncheck a check box in a web form

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the check box to set the state of|
|Check box state|N/A|Checked, Unchecked|Checked|Select the check box state|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after setting the check box state|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after setting the check box state|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setcheckboxstatebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to set the state of the checkbox|Indicates a problem in setting the state of the specified check box|

### <a name="selectradiobuttonbase"></a> Select radio button on web page
Select a radio button on the web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||The radio button to select|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after selecting the radio button|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after selecting the radio button|
|Dialog button to press|Yes|Text value|OK|The dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="selectradiobuttonbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to select radio button|Indicates a problem in selecting the specified radio button|

### <a name="setdropdownlistvaluebase"></a> Set drop-down list value on web page
Set or clear the selected option for a drop-down list in a web form

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the drop-down list to set its value|
|Operation|N/A|Clear all options, Select options by name, Select options by index|Clear all options|Select whether to select a value or clear the selected value of the drop-down list|
|Option name(s)|No|List of Text values||Enter one or more options (one per line if more than one) to be selected in the drop-down list. Multiple options make sense only when working with multi-select lists. If the list is single-selection, then only the first option specified will be used.|
|Option indices|No|List of Numeric values||Type a space-separated list of 1-based indices (e.g. 1 3 4)|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after setting the drop-down list value|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after setting the drop-down list value|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setdropdownlistvaluebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to set the selected option|Indicates a problem setting the selected drop-down list option|

### <a name="pressbuttonbase"></a> Press button on web page
Press a web page button

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the button to press|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after pressing the button|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after pressing the button|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="pressbuttonbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to click on web page button|Indicates a problem clicking the specified web page button|

### <a name="launchinternetexplorerbase"></a> Launch new Internet Explorer
Launch a new instance or attach to a running instance of Internet Explorer for automating web sites and web applications

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch automation browser, Launch new Internet Explorer, Attach to running Internet Explorer|Launch automation browser|Specify whether to launch the automation browser or a new instance of Internet Explorer or attach to an existing one|
|Attach to Internet Explorer tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to an Internet Explorer tab by its title, URL, or attach to the active tab of Internet Explorer running as the foreground window|
|Initial URL|No|Text value||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|Text value||Enter the title (or part of it) of the Internet Explorer tab to attach to|
|Tab URL|No|Text value||Enter the URL (or part of it) of the Internet Explorer tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized of maximized state|
|Clear cache|N/A|Boolean value|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|
|Custom user agent string|Yes|Text value||Specify the custom user agent string for the runtime web helper. If this field remains empty, the runtime web helper uses by default the user agent string of Internet Explorer installed on the machine.|

> [!NOTE]
> The **Clear cache** and **Clear cookies** options only work as intended if running in Protected Mode is disabled in the Internet options menu.

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|InternetExplorer|Web browser instance|The Internet Explorer instance to use with web automation actions|


##### <a name="launchinternetexplorerbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to launch Internet Explorer|Indicates a problem launching Internet Explorer|
|Invalid URL|Indicates that the provided URL was invalid|

### <a name="launchfirefoxbase"></a> Launch new Firefox
Launch a new instance or attach to a running instance of Firefox for automating web sites and web applications

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Firefox or attach to an existing one|
|Attach to Firefox tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to a Firefox tab by its title, URL, or attach to the active tab of Firefox running as the foreground window|
|Initial URL|No|Text value||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|Text value||Enter the title (or part of it) of the Firefox tab to attach to|
|Tab URL|No|Text value||Enter the URL (or part of it) of the Firefox tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized of maximized state|
|Clear cache|N/A|Boolean value|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Browser|Web browser instance|The Firefox instance to use with web automation actions|


##### <a name="launchfirefoxbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to launch Firefox|Indicates a problem launching Firefox|
|Invalid URL|Indicates that the provided URL was invalid|

### <a name="launchchromebase"></a> Launch new Chrome
Launch a new instance or attach to a running instance of Chrome for automating web sites and web applications

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Chrome or attach to an existing one|
|Attach to Chrome tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to a Chrome tab by its title, URL, or attach to the active tab of Chrome running as the foreground window|
|Initial URL|No|Text value||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|Text value||Enter the title (or part of it) of the Chrome tab to attach to|
|Tab URL|No|Text value||Enter the URL (or part of it) of the Chrome tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized of maximized state|
|Clear cache|N/A|Boolean value|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Browser|Web browser instance|The Chrome instance to use with web automation actions|


##### <a name="launchchromebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to launch Chrome|Indicates a problem launching Chrome|
|Invalid URL|Indicates that the provided URL was invalid|

### <a name="launchedgebase"></a> Launch new Edge
Launch a new instance or attach to a running instance of Edge for automating web sites and web applications

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Launch mode|N/A|Launch new Instance, Attach to running instance|Launch new Instance|Specify whether to launch a new instance of Edge or attach to an existing one|
|Attach to Edge tab|N/A|By title, By URL, Use foreground window|By title|Specify whether to attach to an Edge tab by its title, URL, or attach to the active tab of Edge running as the foreground window|
|Initial URL|No|Text value||Enter the URL of the web site to visit when the web browser is launched|
|Tab title|No|Text value||Enter the title (or part of it) of the Edge tab to attach to|
|Tab URL|No|Text value||Enter the URL (or part of it) of the Edge tab to attach to|
|Window state|N/A|Normal, Maximized, Minimized|Normal|Specify whether to launch the browser window in normal, minimized of maximized state|
|Clear cache|N/A|Boolean value|False|Specify whether to clear the entire cache of the web browser right after launching it|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all stored cookies in the web browser right after launching it|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the initial web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Browser|Web browser instance|The Edge instance to use with web automation actions|


##### <a name="launchedgebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to launch Edge|Indicates a problem launching Edge|
|Invalid URL|Indicates that the provided URL was invalid|

### <a name="createnewtabbase"></a> Create new tab
Create a new tab and navigate to the given URL (supported in Edge, Chrome and Firefox)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|URL to navigate to|No|Text value||Enter the URL, or a variable containing the URL, to navigate to|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|NewBrowser|Web browser instance|The new web browser instance to use with web automation actions|


##### <a name="createnewtabbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid URL|Indicates that the provided URL was invalid|
|Failed to create a new tab|Indicates a problem creating a new tab|

### <a name="gotowebpagebase"></a> Go to web page
Navigate the web browser to a new page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|Navigate|N/A|To URL, Back, Forward, Reload web page|To URL|Specify where to navigate to|
|URL|No|Text value||Enter the URL to navigate to|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the web page to load completely before proceeding|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears while loading the web page|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="gotowebpagebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to navigate to web page|Indicates a problem navigating to the specified web page|
|Invalid URL|Indicates that the provided URL was invalid|

### <a name="clickbase"></a> Click link on web page
Click on a link or any other element of a web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to click|
|Wait for page to load|N/A|Boolean value|True|Specify whether to wait for the new web page to load completely after clicking on the link|
|If a pop-up dialog appears|N/A|Close it, Press a button, Do nothing|Do nothing|Specify what to do if a pop-up dialog appears after clicking on the link|
|Dialog button to press|Yes|Text value|OK|Enter the dialog button to press if a pop-up dialog appears|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="clickbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to click UI element|Indicates a problem clicking the specified element|

### <a name="clickdownloadlink"></a> Click download link on web page
Click on a link in a web page that results in downloading a file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to click|
|Destination folder|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to save the downloaded file to|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|DownloadedFile|File|The file on the disk where the download is saved. This is a filepath that consists of the download folder as specified above plus the name of the file as provided by the web server.|


##### <a name="clickdownloadlink_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to download file|Indicates a problem downloading the specified file|
|Element with specified CSS selector not found|Indicates that a web page element with the specified CSS selector was not found|
|Failed to click UI element|Indicates a problem clicking the specified element|
|Failed to save file|Indicates a problem saving the specified file|

### <a name="executejavascript"></a> Run JavaScript function on web page
Run a JavaScript function on the web page and get the returned result

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|JavaScript function|Yes|Text value|function ExecuteScript() { /*your code here, return something (optionally); */ }|Enter the JavaScript function to run on the web page|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Result|Text value|The result of the JavaScript function that run|


##### <a name="executejavascript_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run JavaScript|Indicates a problem running JavaScript|

### <a name="hoveroverelement"></a> Hover mouse over element on web page
Hover the mouse over an element of a web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|UI element|No|WebControl||Select the UI element on web page to hover|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="hoveroverelement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to hover over element|Indicates a problem hovering over the specified element|

### <a name="closewebbrowser"></a> Close web browser
Close a web browser window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to close|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="closewebbrowser_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to close the web browser|Indicates a problem closing the web browser|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]