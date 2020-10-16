---
title: Mouse and keyboard | Microsoft Docs
description: Mouse and keyboard Actions Reference
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

# Mouse and keyboard

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Take control of the mouse and keyboard

|<!-- --> |
|-----|
|[Block Input](#blockinput)|
|[Get mouse position](#getmouseposition)|
|[Move mouse](#movemouse)|
|[Move mouse to image](#movemousetoimagebase)|
|[Move mouse to text on screen (OCR)](#movemousetotextonscreenwithocraction)|
|[Send mouse click](#sendmouseclick)|
|[Send keys](#sendkeys)|
|[Press/release key](#pressreleasekey)|
|[Set key state](#setkeystate)|
|[WaitForHotKeyAction](#waitforhotkeyaction)|

### <a name="blockinput"></a> Block Input
Blocks user mouse and keyboard input, so that the flow can perform mouse and keyboard actions without interference from the user

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Block it|N/A|Boolean value|True|Specify whether to block or unblock mouse and keyboard input|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="blockinput_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't block/unblock user input in non-interactive mode|Indicates a problem blocking/unblocking input in non-interactive mode|
|Failed to block/unblock input|Indicates a problem blocking/unblocking input|

### <a name="getmouseposition"></a> Get mouse position
Retrieves the current position of the mouse cursor on the screen in pixel coordinates

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Relative to|N/A|Screen, Foreground window|Screen|Specify whether to retrieve the mouse position in screen coordinates or relative to the top left corner of the active window|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|MousePosX|Numeric value|The horizontal (X) value of the mouse position|
|MousePosY|Numeric value|The vertical (Y) value of the mouse position|


##### <a name="getmouseposition_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't retrieve the mouse position in non-interactive mode|Indicates a problem retrieving the mouse cursor position in non-interactive mode|

### <a name="movemouse"></a> Move mouse
Moves the mouse to a specific position

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Position X|No|Numeric value||The horizontal (X) value of the position to send the mouse to|
|Position Y|No|Numeric value||The vertical (Y) value of the position to send the mouse to|
|Relative to|N/A|Screen, Active window, Current mouse position|Screen|Specify whether the new mouse position will be relative to the top left corner of the screen, the foremost window, or the current mouse position|
|Move mouse From previous position|N/A|Instant, With animation (low Speed), With animation (normal Speed), With animation (high speed)|Instant|Specify how to move the mouse|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="movemouse_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't move mouse in non-interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|

### <a name="movemousetoimagebase"></a> Move mouse to image
Moves the mouse over an image found on screen or on the foreground window

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Image to move mouse to|No|List of Image||The list of Images to move the mouse to|
|Search for Image on|N/A|Entire screen, Foreground window only|Entire screen|Specify whether to search for the specified Image in the foremost window only, or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Specify whether to scan the entire screen (or window) to find the supplied image or only a subregion of it|
|X1|Yes|Numeric value||The starting X of the subregion to search in|
|Y1|Yes|Numeric value||The starting Y of the subregion to search in|
|X2|Yes|Numeric value||The ending X of the subregion to search in|
|Y2|Yes|Numeric value||The ending Y of the subregion to search in|
|Mouse position relative to image|N/A|top left corner, top center, top right corner, middle left part, center, middle right part, bottom left corner, bottom center, bottom right corner|center|The section of the image the mouse will be moved to|
|Offset X|Yes|Numeric value|0|The pixels to offset the mouse from the position to the right|
|Offset Y|Yes|Numeric value|0|The pixels to offset the mouse from the position down|
|Tolerance|Yes|Numeric value|10|Specify how much the specified image can differ from the originally chosen image|
|Mouse movement style|N/A|Instant, With animation (low Speed), With animation (normal Speed), With animation (high speed)|Instant|Specify the style of movement in which the mouse will move from its previous position to the beginning of the recorded route (or to its final position)|
|Occurrence|Yes|Numeric value|1|The occurrence of the image found to move the mouse to|
|Fail timeout|Yes|Numeric value|0|The fail timeout in seconds|
|Send a click after moving mouse|N/A|Boolean value|False|Specify whether to send a click after the mouse is positioned over the image|
|Click type|N/A|Left click, Right click, Middle click|Left click|The mouse click to send to the image|
|Seconds before click|Yes|Numeric value|0|The number of seconds to wait before sending the click|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|X|Numeric value|The X coordinate of the point where the image is found on the screen. If the image is being searched for on the foreground window, the coordinate returned is relative to the top left corner of the window|
|Y|Numeric value|The Y coordinate of the point where the image is found on the screen. If the image is being searched for on the foreground window, the coordinate returned is relative to the top left corner of the window|


##### <a name="movemousetoimagebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Image not found on screen|Indicates that the specified image wasn't found on the screen|
|Can't move mouse in non-interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|
|Not enough Image occurrences found on screen|Indicates that not enough occurrences of the specified Image were found on the screen|

### <a name="movemousetotextonscreenwithocraction"></a> Move mouse to text on screen (OCR)
Moves the mouse over a text found on the screen or on the foreground window using OCR

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|OCR engine|No|OCREngineObject||The OCR engine to use to search for the text with|
|Text to find|No|Text value||The text to move the mouse over|
|Is regular expression|N/A|Boolean value|False|Whether to use a regular expression to look for the text on screen|
|Occurrence|Yes|Numeric value|1|A positive number that will be used as the occurrence of the input text on screen|
|Search for text on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified text in the foremost window only or the entire visible screen. Neither choice will find the text if it isn't clearly visible on the screen|
|Search mode|N/A|Whole of specified source, Specific subregion only, Subregion relative to image|Whole of specified source|Whether to scan the entire screen (or window) to find the supplied text or only a narrows down subregion of it|
|Image(s)|No|List of Image||The image(s) specifying the subregion (relative to the top left corner of the image) to scan for the supplied text|
|X1|Yes|Numeric value||The start X coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|Numeric value|10|Specify how much the image(s) searched for can differ from the originally chosen image|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion to scan for the supplied text|
|X1|Yes|Numeric value||The start X coordinate of the subregion relative to the specified image to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|Numeric value||The start Y coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion to scan for the supplied text|
|X2|Yes|Numeric value||The end X coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|Numeric value||The end Y coordinate of the subregion relative to the specified image to scan for the supplied text|
|Move mouse From previous position|N/A|Instant, With animation (low Speed), With animation (normal Speed), With animation (high speed)|Instant|The style of movement in which the mouse will move from its previous position to its final position|
|Wait for text to appear|N/A|Boolean value|False|Specify whether to wait if the text isn't found on the screen or foreground window|
|Fail if text doesn't appear within|Yes|Numeric value|10|The number of seconds to wait for the supplied text to appear|
|Send a click after moving mouse|N/A|Boolean value|False|Specify whether to send a click after the mouse is positioned over the text|
|Click type|N/A|Left click, Right click, Middle click|Left click|The mouse click type to send to the text|
|Wait before clicking for|Yes|Numeric value|1|The number of seconds to wait before clicking|
|Mouse position relative to text|N/A|top left corner, top center, top right corner, middle left part, center, middle right part, bottom left corner, bottom center, bottom right corner|center|Specify which section of the text the mouse will be moved to|
|Offset X|Yes|Numeric value|0|Offset the mouse from the position by this many pixels to the right|
|Offset Y|Yes|Numeric value|0|Offset the mouse from the position by this many pixels down|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|LocationOfTextFoundX|Numeric value|The X coordinate of the point where the text is found on the screen. If the text is searched for in the foreground window, this is relative to the top left corner of the window|
|LocationOfTextFoundY|Numeric value|The Y coordinate of the point where the text is found on the screen. If the text is searched for in the foreground window this is relative to the top left corner of the window|
|WidthOfTextFound|Numeric value|The width of the area the text was found on|
|HeightOfTextFound|Numeric value|The width of the area the text was found on|


##### <a name="movemousetotextonscreenwithocraction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Text not found on screen|Indicates that the specified text couldn't be found on the screen|
|Can't move mouse in non-interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|
|OCR engine isn't alive|Indicates that the OCR engine specified isn't alive|

### <a name="sendmouseclick"></a> Send mouse click
Sends a mouse click event

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Mouse event to send|N/A|Left click, Right click, Double click, Left button down, Left button up, Right button down, Right button up|Left click|Specify what form of mouse event to send|
|Wait|Yes|Numeric value|0|The time to delay before sending the mouse event in 1/1000 of a second|
|Move mouse|N/A|Boolean value|False|Move mouse|
|X|No|Numeric value||The horizontal (X) position of the mouse in pixel coordinates|
|Y|No|Numeric value||The vertical (Y) position of the mouse in pixel coordinates|
|Relative to|N/A|Screen, Active window, Current mouse position|Screen|Specify whether the new mouse position will be relative to the top left corner of the screen, the foremost window, or the current mouse position|
|Mouse movement style|N/A|Instant, With animation (low Speed), With animation (normal Speed), With animation (high speed)|Instant|The style of movement in which the mouse will move from its previous position to the beginning of the recorded route (or to its final position)|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="sendmouseclick_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't send mouse click in non-interactive mode|Indicates a problem sending a mouse click in non-interactive mode|
|Mouse click out of screen bounds|Indicates that the mouse click was out of the screen bounds|
|Failed to send mouse click|Indicates a problem sending a mouse click|

### <a name="sendkeys"></a> Send keys
Sends keys to the application that is currently active

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to send|No|Text value||The text to send to the application|
|Delay between keystrokes|Yes|Numeric value|10|Specify the delay in milliseconds between sending keystrokes to avoid input errors|
|Send Text as hardware keys|N/A|Boolean value|False|Emulate the actual keystrokes on keyboard when sending whole Text|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="sendkeys_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't send keystrokes in non-interactive mode|Indicates a problem sending keystrokes in non-interactive mode|
|Text to send doesn't represent valid keystrokes|Indicates that the text given doesn't represent valid keystrokes|
|There isn't an active application to send keystrokes to|Indicates that there isn't an active application to send keystrokes to|
|Failed to send keystrokes|Indicates a problem sending keystrokes|

### <a name="pressreleasekey"></a> Press/release key
Presses (and holds) or releases one or more modifier keys (Alt, Control, or Shift)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Action to perform|N/A|Press, Release|Press|Specify whether to press or release keys with this action|
|Control|N/A|Boolean value|False|Specify whether the Ctrl key will be pressed/released or not|
|Alt|N/A|Boolean value|False|Specify whether the Alt key will be pressed/released or not|
|Shift|N/A|Boolean value|False|Specify whether the Shift key will be pressed/released or not|
|Win|N/A|Boolean value|False|Specify whether the Windows key will be pressed/released or not|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="pressreleasekey_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't press or release key in non-interactive mode|Indicates a problem pressing or releasing the key in non-interactive mode|

### <a name="setkeystate"></a> Set key state
Sets the state (on or off) for the keys Caps Lock, Num Lock or Scroll Lock

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Key|N/A|Caps Lock, Num Lock, Scroll Lock|Caps Lock|Specify the key to set|
|State|N/A|Off, On|On|Whether to set the key state to on or off|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setkeystate_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't set key state in non-interactive mode|Indicates a problem setting the key state in non-interactive mode|

### <a name="waitforhotkeyaction"></a> WaitForHotKeyAction


##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Hotkeys|Yes|List of Text values|Ctrl + A|Specify the hotkeys that you want to wait for|
|Proceed on timeout|N/A|Boolean value|False|Specify whether the action will proceed anyway when the set period of time waiting for the hotkey expires|
|Continue after|No|Numeric value||The time limit to wait before continuing with the flow|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|IndexOfHotKeyPressed|Numeric value|The ordinal position of the hotkey, pressed by the user|


##### <a name="waitforhotkeyaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Hotkey failed to register|Indicates that a hotkey failed to register.|


