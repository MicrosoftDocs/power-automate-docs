---
title: Conditionals | Microsoft Docs
description: Conditionals Actions Reference
author: mariosleon
ms.service: power-automate
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

# Conditionals


|<!-- --> |
|-----|
|[If file exists](#iffileaction)|
|[If folder exists](#iffolderexistsaction)|
|[If process](#ifprocessaction)|
|[If service](#ifserviceaction)|
|[If text on screen (OCR)](#iftextonscreenaction)|
|[If web page contains](#ifwebpagecontainsaction)|
|[If window contains](#ifwindowcontainsaction)|
|[If image](#ifimageaction)|
|[If window](#ifwindowaction)|
|[Case](#case)|
|[Default case](#casedefault)|
|[Else](#else)|
|[Else if](#elseif)|
|[If](#if)|
|[Switch](#switch)|

## Getting started with conditionals

Conditional actions allow you to modify flow actions at runtime, based on information available in the environment.

Useful applications and features:
* Use the If group of conditionals to evaluate any type of condition.
* Use the Switch group of conditionals to compare a single variable with multiple possible values.
* Explore additional options when evaluating conditions.
* Provide default and alternative behaviors to flows based on the available data.

You can find more information on how to use the conditional actions [here](../use-conditionals.md)

## Conditionals actions

### <a name="iffileaction"></a> If file exists
Marks the beginning of a conditional block of actions depending on whether a file exists or not

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If file|N/A|Exists, Doesn't exist|Exists|The state of the file to check|
|File path|No|File||The full path to look for the file|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="iffileaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="iffolderexistsaction"></a> If folder exists
Mark the beginning of a conditional block of actions depending on whether a folder exists or not

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If folder|N/A|Exists, Doesn't exist|Exists|Choose the state of the folder to check|
|Folder path|No|Folder||Enter or choose the full path of the folder, or a variable containing the folder, to check its state|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="iffolderexistsaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="ifprocessaction"></a> If process
Marks the beginning of a conditional block of actions depending on whether a process is running or not

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If process|N/A|Is running, Isn't running|Is running|State of the process to check|
|Process name|No|Text value||The name of the process to check|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifprocessaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't retrieve list of processes|Indicates a problem retrieving the list of processes|

### <a name="ifserviceaction"></a> If service
Marks the beginning of a conditional block of actions depending on whether a service is running, paused, stopped or installed on the computer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If service|N/A|Is stopped, Is installed, Isn't installed, Is running, Is paused|Is running|The state of the service to check|
|Service name|No|Text value||The name of the service to check|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifserviceaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Service not found|Indicates that the service can't be found|
|Can't retrieve status for service|Indicates that there is a problem retrieving the status of the service|

### <a name="iftextonscreenaction"></a> If text on screen (OCR)
Marks the beginning of a conditional block of actions depending on whether a given text appears on the screen or not, using OCR

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If text|N/A|Exists, Doesn't exist|Exists|Specifies whether to check if the text exists or not on the given source to analyze|
|OCR engine type|No|OCR engine variable, Tesseract engine|OCR engine variable|The OCR engine type to use. Select a peconfigured OCR engine or set up a new one.|
|OCR engine variable|No|OCREngineObject||The engine to use for the OCR operation|
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

> [!NOTE]
> Power Automate Desktop's regular expression engine is .NET. You can find more information in [Regular Expression Language - Quick Reference](https://docs.microsoft.com/dotnet/standard/base-types/regular-expression-language-quick-reference).


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|LocationOfTextFoundX|Numeric value|The X coordinate of the point where the text appears on the screen. If the search is performed in the foreground window, the coordinate returned is relative to the top left corner of the window|
|LocationOfTextFoundY|Numeric value|The X coordinate of the point where the text appears on the screen. If the search is performed in the foreground window, the coordinate returned is relative to the top left corner of the window|


##### <a name="iftextonscreenaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't check if text exists in non interactive mode|Indicates that it isn't possible to check for the text on the screen when in non-interactive mode|
|Invalid subregion coordinates|Indicates that the specified subregion coordinates are invalid|
|Failed to analyze text with OCR|Indicates an error occured while trying to analyze the text using OCR|
|OCR engine not alive|Indicates that the OCR engine isn't alive|

### <a name="ifwebpagecontainsaction"></a> If web page contains
Mark the beginning of a conditional block of actions, depending on whether a specific piece of text or element exists in a web page

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Web browser instance|No|Web browser instance||Enter or choose the variable that contains the web browser instance to work with|
|Check if web page|N/A|Contains element, Doesn't contain element, Contains text, Doesn't contain text|Contains element|Check whether a specific text or web page element exists in a web page|
|UI element|No|WebControl||Select the UI element on web page to check for|
|Text|No|Text value||Enter the text on web page to check for|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifwebpagecontainsaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to communicate with the browser|Indicates that an error with the browser occured|

### <a name="ifwindowcontainsaction"></a> If window contains
Marks the beginning of a conditional block of actions depending on whether a specific piece of text or UI element exists in a window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Check if window|N/A|Contains UI element, Doesn't contain UI element, Contains text, Doesn't contain text|Contains UI element|Check whether a specific text or UI element exists in a window|
|Check UI element state|N/A|Boolean value|False|Check whether a specific UI element is enabled or disabled|
|Text|No|Text value||The text to check for|
|UI element|No|UIControl||The UI element to check for|
|Window|No|UIControl||The window to check if the text exists on|
|State|N/A|Enabled, Disabled|Enabled|The UI element state to check for|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifwindowcontainsaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="ifimageaction"></a> If image
This action marks the beginning of a conditional block of actions depending on whether a selected image is found on the screen or not

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|If image|N/A|exists, doesn't exist|exists|Whether to check for the existence or absence of the selected image|
|Image to check|No|List of Image||The image/s that the action will check if it/they exist|
|Search for image on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified image in the foremost window only or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search Mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Whether to scan the entire screen (or window) to find the supplied text or only a narrowed down subregion of it|
|Find all images in the list|N/A|Boolean value|False|Check whether all images on the list exist or don't exist|
|X1|Yes|Numeric value||The start X coordinate of the subregion to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|Numeric value|10|Specify how much the image(s) searched for can differ from the originally chosen image|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifimageaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't check image in non interactive mode|Indicates that an image can't be identified in non-interactive mode|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|

### <a name="ifwindowaction"></a> If window
This action marks the beginning of a conditional block of actions depending on whether a window is open or not or whether a window is the focused (foreground) window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get window|N/A|By window UI element, By window instance/handle, By title and/or class|By window UI element|Specify whether to look for the Window using a UI element or a combination of window title/class|
|Window title|Yes|Text value||The window title. Wildcards can be used, like '?' or '*'.|
|Window|No|UIControl||The window UI element|
|Window instance|No|Numeric value||The instance or handle of the window to check|
|Window class|Yes|Text value||If there are two windows with the same title, window class may help differentiate between them. In this case, enter the class of the window to be used.|
|Check if window|N/A|Is open, Isn't open, Is focused, Isn't focused|Is open|The state of the window to be checked|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="ifwindowaction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="case"></a> Case
An expression that, if met, a block of actions associated with that particular case runs

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|The comparison operator of this case|
|Value to compare|No|*||Enter a value to compare with the switch-block value|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="case_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="casedefault"></a> Default case
A block of actions that is run, if no case expression has been met in the switch body

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="casedefault_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="else"></a> Else
Marks the beginning of a block of actions that ran if the condition specified in the preceding 'If' statements aren't met

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="else_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="elseif"></a> Else if
Marks the beginning of a block of actions that ran if the conditions specified in the preceding 'If' statements aren't met, but the condition specified in this statement is met

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|Choose the relationship of first operand to the second operand.|
|First operand|No|*||Enter a value name defined by a previous action, text, number or expression to compare with the second operand.|
|Second operand|No|*||Enter a value name produced by a previous action, text, number or expression to compare with the first operand.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="elseif_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="if"></a> If
Marks the beginning of a block of actions that is run if the condition specified in this statement is met

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operator|N/A|Equal to (=), Not equal to (<>), Greater than (>), Greater than or equal to (>=), Less than (<), Less than or equal to (<=), Contains, Does not contain, Is empty, Isn't empty, Starts with, Doesn't start with, Ends with, Doesn't end with|Equal to (=)|Choose the relationship of first operand to the second operand.|
|First operand|No|*||Enter a value name defined by a previous action, text, number or expression to compare with the second operand.|
|Second operand|No|*||Enter a value name produced by a previous action, text, number or expression to compare with the first operand.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="if_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="switch"></a> Switch
Dispatches execution to different parts of the switch body based on the value of the expression

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Value to check|No|*||Enter a value name, text, or number to compare with the following cases.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="switch_onerror"></a> Exceptions
- This action doesn't include any exceptions



[!INCLUDE[footer-include](../../includes/footer-banner.md)]