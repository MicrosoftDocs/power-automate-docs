---
title: Wait | Microsoft Docs
description: Wait Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Wait

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]



|<!-- --> |
|-----|
|[Wait for file](#waitforfileaction)|
|[Wait for process](#waitprocessaction)|
|[Wait for service](#waitforserviceaction)|
|[Wait for text on screen (OCR)](#waittextonscreenaction)|
|[Wait for web page content](#waitforwebpagecontentaction)|
|[Wait for window content](#waitforwindowcontentaction)|
|[Wait for image](#waitforimageaction)|
|[Wait for window](#waitforwindowaction)|
|[Wait for mouse](#waitformouseaction)|
|[Wait](#wait)|

### <a name="waitforfileaction"></a> Wait for file
Suspend the execution of the automation until a file is created or deleted

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for file to be|N/A|Created, Deleted|Created|Specifies whether to pause the flow on the creation or deletion of a certain file|
|File path|No|File||The full path to look for the file|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforfileaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="waitprocessaction"></a> Wait for process
Suspends the execution until a process starts or stops

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Process name|No|Text value||The name of the process to check|
|Wait for process to|N/A|Start, Stop|Start|Whether to wait until a certain process starts or stops|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitprocessaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't retrieve list of processes|Indicates a problem retrieving the list of processes|

### <a name="waitforserviceaction"></a> Wait for service
Suspend the execution of the automation until a service is running, paused or stopped on the computer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for service to|N/A|Stop, Start, Pause|Start|Specifies whether the flow pauses until a certain service starts, stops or pauses|
|Service name|No|Text value||The name of the service to check|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforserviceaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there is a problem retrieving the status of the service|

### <a name="waittextonscreenaction"></a> Wait for text on screen (OCR)
Wait until a specific text appears/disappears on the screen, on the foreground window, or relative to an image on the screen or foreground window using OCR

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for text to|N/A|Appear, Disappear|Appear|Specifies whether to wait for the text to appear or disappear|
|OCR engine|No|OCREngineObject||The engine to use for the OCR operation|
|Text to find|No|Text value||The text to search for in the specified source|
|Is regular expression|N/A|Boolean value|False|Specifies whether to use a regular expression to find the specified text|
|Search for text on|N/A|Entire screen, Foreground window|Entire screen|Specifies whether to search for the specified text on the entine visible screen or just the foreground window|
|Search mode|N/A|Whole of specified source, Specific subregion only, Subregion relative to image|Whole of specified source|Specifies whether to scan the entire screen (or window) or a narrowed down subregion of it|
|Image(s)|No|List of Image||The image(s) specifying the subregion (relative to the top left corner of the image) to scan for the supplied text|
|X1|Yes|Numeric value||The start X coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|Numeric value|10|Specifies how much the image(s) searched for can differ from the originally chosen image|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion to scan for the supplied text|
|X1|Yes|Numeric value||The start X coordinate of the subregion relative to the specified image to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion relative to the specified image to scan for the supplied text|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|LocationOfTextFoundX|Numeric value|The X coordinate of the point where the text appears on the screen. If the search is performed in the foreground window, the coordinate returned is relative to the top left corner of the window|
|LocationOfTextFoundY|Numeric value|The X coordinate of the point where the text appears on the screen. If the search is performed in the foreground window, the coordinate returned is relative to the top left corner of the window|


##### <a name="waittextonscreenaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't check if text exists in non interactive mode|Indicates that it isn't possible to check for the text on the screen when in non-interactive mode|
|Invalid subregion coordinates|Indicates that the specified subregion coordinates are invalid|
|Failed to analyze text with OCR|Indicates an error occured while trying to analyze the text using OCR|
|OCR engine not alive|Indicates that the OCR engine isn't alive|

### <a name="waitforwebpagecontentaction"></a> Wait for web page content
Suspend the flow until a specific piece of text or web page element appears or disappears from a web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|Wait for web page to|N/A|Contain element, Not contain element, Contain text, Not contain text|Contain element|Specify whether to wait for a specific text or web page element to (dis)appear in a web page|
|UI element|No|WebControl||Select the UI element on web page to check for|
|Text|No|Text value||Enter the text on web page to check for|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforwebpagecontentaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="waitforwindowcontentaction"></a> Wait for window content
Suspends the execution of the automation until a specific piece of text or UI element appears or disappears from a Window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait until window|N/A|Contains UI element, Doesn't contain UI element, Contains text, Doesn't contain text|Contains UI element|Whether to wait for a specific text or UI element to appear in a window|
|Check UI element state|N/A|Boolean value|False|Check whether a specific UI element is enabled or disabled|
|Text|No|Text value||The text to check for|
|State|N/A|Enabled, Disabled|Enabled|The UI element state to check for|
|Window|No|UIControl||The window to check if the text exists on|
|UI element|No|UIControl||The UI element to check for|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforwindowcontentaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="waitforimageaction"></a> Wait for image
This action waits unti a specific image appears on the screen or on the foreground window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for image to|N/A|Appear, Disappear|Appear|Check whether to wait for the image(s) to appear or disappear|
|Image to wait for|No|List of Image||The image/s that the action will check if it/they exist|
|Search for image on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified image in the foremost window only or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search Mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Whether to scan the entire screen (or window) to find the supplied text or only a narrowed down subregion of it|
|Wait for all images|N/A|Boolean value|False|Whether to wait for all the images on the list to appear(disappear), or just one of them|
|X1|Yes|Numeric value||The start X coordinate of the subregion to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|Numeric value|10|Specify how much the image(s) searched for can differ from the originally chosen image|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|X|Numeric value|The X coordinate of the point where the text was found on the screen. If the text has been search in the foreground window this is relative to the top left corner of the window.|
|Y|Numeric value|The Y coordinate of the point where the text was found on the screen. If the text has been search in the foreground window this is relative to the top left corner of the window.|


##### <a name="waitforimageaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't check image in non interactive mode|Indicates that an image can't be identified in non-interactive mode|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|

### <a name="waitforwindowaction"></a> Wait for window
Suspends the execution or the process until a specific window opens, closes, get or loses the focus

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Find window|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the window using a UI element  or a combination of window title/class|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window|No|UIControl||The window UI element|
|Window instance|No|Numeric value||The instance or handle of the window to check|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to be used|
|Wait for window to|N/A|Open, Close, Become focused, Lose focus|Open|Whether to wait for a specific window to open, close, become focused (i.e become the foreground window), or lose focus (i.e stop being the foreground window).|
|Focus window after it opens|N/A|Boolean value|False|Bring the window to the front after it opens, so later actions are directed at this window|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitforwindowaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't focus window|Indicates a problem focusing the specified window|
|Wait for window failed|Indicates that the wait operation failed|
|Can't perform window-related action in non interactive mode|Indicates a problem performing window-related action in non-interactive mode|

### <a name="waitformouseaction"></a> Wait for mouse
Suspends the execution of the flow until the mouse pointer changes, usually to or from the 'wait cursor' or hourglass

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for mouse pointer to|N/A|Become, Become not|Become|Choose what action of the mouse cursor to wait for.|
|Mouse pointer|N/A|Arrow, App starting, Cross, Hand, Help, IBeam, Wait cursor|Arrow|Specify the mouse pointer state.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitformouseaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="wait"></a> Wait
Suspends the execution of the flow for a specified amount of seconds

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Duration|No|Numeric value||Time duration in seconds|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="wait_onerror"></a> Exceptions
- This action doesn't include any exceptions

