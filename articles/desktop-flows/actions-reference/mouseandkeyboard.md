---
title: Mouse and keyboard actions reference
description: See all the available mouse and keyboard actions.
author: mattp123

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Mouse and keyboard actions

Simulate keyboard activity with the **Send Keys** action. To insert special keys, such as the arrow keys and Caps Lock, and modifies, such as Shift and Control, select **Insert special key**.

The following examples add a signature to an email message, starting with two line breaks. Then, the action sends **Ctrl + A** and **Ctrl + C** to select and copy the text to the clipboard.

> [!NOTE]
> To use a key as a modifier, use the curly brackets notation for both keys.

:::image type="content" source="media\mousekeyboard\send-keys-example.png" alt-text="Screenshot of the Send keys action.":::

To simulate mouse movements, use the **Move mouse** action. The following example moves the mouse manually to specific coordinates at normal speed.

:::image type="content" source="media\mousekeyboard\move-mouse-example.png" alt-text="Screenshot of the Move mouse action.":::

Move the mouse to a specific image on the screen with the **Move mouse to image** action. The following example moves the cursor to the first occurrence of the search icon and left-clicks it.

:::image type="content" source="media\mousekeyboard\move-mouse-to-image-example.png" alt-text="Screenshot of the Move mouse to image action.":::

In the **Advanced** section of the action, you can see that the action waits 30 seconds for the image to appear in the foreground window, and the mouse will point to the center of the image.

:::image type="content" source="media\mousekeyboard\move-mouse-to-image-advanced-example.png" alt-text="Screenshot of the Move mouse to image action advanced properties.":::

## <a name="blockinput"></a> Block Input

Blocks user mouse and keyboard input, so that the flow can perform mouse and keyboard actions without interference from the user.

> [!IMPORTANT]
> Because of its critical functionality, the **Block input** action requires elevated rights to run. Therefore, before using the action, ensure that Power Automate runs with administrator rights. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Block it|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to block or unblock mouse and keyboard input|

### Variables produced

This action doesn't produce any variables.

### <a name="blockinput_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't block/unblock user input in non interactive mode|Indicates a problem blocking/unblocking input in non-interactive mode|
|Failed to block/unblock input|Indicates a problem blocking/unblocking input|

## <a name="getmouseposition"></a> Get mouse position

Retrieves the current position of the mouse cursor on the screen in pixel coordinates.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Relative to|N/A|Screen, Foreground window|Screen|Specify whether to retrieve the mouse position in screen coordinates or relative to the top left corner of the active window|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|MousePosX|[Numeric value](../variable-data-types.md#numeric-value)|The horizontal (X) value of the mouse position|
|MousePosY|[Numeric value](../variable-data-types.md#numeric-value)|The vertical (Y) value of the mouse position|

### <a name="getmouseposition_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't retrieve the mouse position in non interactive mode|Indicates a problem retrieving the mouse cursor position in non-interactive mode|

## <a name="movemouse"></a> Move mouse

Moves the mouse to a specific position.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Position X|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal (X) value of the position to send the mouse to|
|Position Y|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical (Y) value of the position to send the mouse to|
|Relative to|N/A|Screen, Active window, Current mouse position|Screen|Specify whether the new mouse position will be relative to the top left corner of the screen, the foremost window, or the current mouse position|
|Move mouse from previous position|N/A|Instant, With animation (low speed), With animation (normal speed), With animation (high speed)|Instant|Specify how to move the mouse|

### Variables produced

This action doesn't produce any variables.

### <a name="movemouse_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't move mouse in non interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|

## <a name="movemousetoimagebase"></a> Move mouse to image

Moves the mouse over an image found on screen or on the foreground window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Image to move mouse to|No|[List](../variable-data-types.md#list) of [Images](../images.md)||The list of Images to move the mouse to|
|Mouse movement style|N/A|Instant, With animation (low speed), With animation (normal speed), With animation (high speed)|Instant|Specify the style of movement in which the mouse will move from its previous position to the beginning of the recorded route (or to its final position)|
|Occurrence|Yes|[Numeric value](../variable-data-types.md#numeric-value)|1|The occurrence of the image found to move the mouse to|
|Send a click after moving mouse|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to send a click after the mouse is positioned over the image|
|Click type|N/A|Left click, Right click, Double click, Middle click, Left button down, Left button up, Right button down, Right button up|Left click|The mouse click to send to the image|
|Wait for image to appear|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Choose whether you want the action to wait if the image isn't found on the screen or foreground window|
|Fail timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|The fail timeout in seconds|
|Seconds before click|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|The number of seconds to wait before sending the click|
|Image matching algorithm|N/A|Basic, Advanced|Basic|Which image algorithm to use when searching for image|
|Mouse position relative to image|N/A|top left corner, top center, top right corner, middle left part, center, middle right part, bottom left corner, bottom center, bottom right corner|center|The section of the image the mouse will be moved to|
|Offset X|No|[Text value](../variable-data-types.md#text-value)|0|The pixels to offset the mouse from the position to the right|
|Offset Y|No|[Text value](../variable-data-types.md#text-value)|0|The pixels to offset the mouse from the position down|
|Tolerance|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specify how much the specified image can differ from the originally chosen image|
|Search for image on|N/A|Entire screen, Foreground window only|Entire screen|Specify whether to search for the specified Image in the foremost window only, or the entire visible screen. Neither choice will find the image if it isn't clearly visible on the screen|
|Search mode|N/A|Search whole screen or foreground window, Search on specified subregion of screen or foreground window|Search whole screen or foreground window|Specify whether to scan the entire screen (or window) to find the supplied image or only a subregion of it|
|X1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The starting X of the subregion to search in|
|Y1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The starting Y of the subregion to search in|
|X2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The ending X of the subregion to search in|
|Y2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The ending Y of the subregion to search in|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|X|[Numeric value](../variable-data-types.md#numeric-value)|The X coordinate of the point where the image is found on the screen. If the image is being searched for on the foreground window, the coordinate returned is relative to the top left corner of the window|
|Y|[Numeric value](../variable-data-types.md#numeric-value)|The Y coordinate of the point where the image is found on the screen. If the image is being searched for on the foreground window, the coordinate returned is relative to the top left corner of the window|

### <a name="movemousetoimagebase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Image not found on screen|Indicates that the specified image wasn't found on the screen|
|Can't move mouse in non interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|
|Not enough Image occurrences found on screen|Indicates that not enough occurrences of the specified Image were found on the screen|

## <a name="movemousetotextonscreenwithocraction"></a> Move mouse to text on screen (OCR)

Moves the mouse over a text found on the screen or on the foreground window using OCR.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|OCR engine type|No|OCR engine variable, Tesseract engine|OCR engine variable|The OCR engine type to use. Select a peconfigured OCR engine or set up a new one.|
|OCR engine variable|No|[OCREngineObject](../variable-data-types.md#ocr)||The OCR engine to search for the text with|
|Text to find|No|[Text value](../variable-data-types.md#text-value)||The text to move the mouse over|
|Is regular expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Whether to use a regular expression to look for the text on screen|
|Occurrence|Yes|[Numeric value](../variable-data-types.md#numeric-value)|1|A positive number that will be used as the occurrence of the input text on screen|
|Search for text on|N/A|Entire screen, Foreground window only|Entire screen|Whether to look for the specified text in the foremost window only or the entire visible screen. Neither choice will find the text if it isn't clearly visible on the screen|
|Search mode|N/A|Whole of specified source, Specific subregion only, Subregion relative to image|Whole of specified source|Whether to scan the entire screen (or window) to find the supplied text or only a narrows down subregion of it|
|Image(s)|No|[List](../variable-data-types.md#list) of [Images](../images.md)||The image(s) specifying the subregion (relative to the top left corner of the image) to scan for the supplied text|
|X1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start X coordinate of the subregion to scan for the supplied text|
|Tolerance|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specify how much the image(s) searched for can differ from the originally chosen image|
|Y1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start Y coordinate of the subregion to scan for the supplied text|
|X1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start X coordinate of the subregion relative to the specified image to scan for the supplied text|
|X2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end X coordinate of the subregion to scan for the supplied text|
|Y1|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The start Y coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end Y coordinate of the subregion to scan for the supplied text|
|X2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end X coordinate of the subregion relative to the specified image to scan for the supplied text|
|Y2|Yes|[Numeric value](../variable-data-types.md#numeric-value)||The end Y coordinate of the subregion relative to the specified image to scan for the supplied text|
|Move mouse from previous position|N/A|Instant, With animation (low speed), With animation (normal speed), With animation (high speed)|Instant|The style of movement in which the mouse will move from its previous position to its final position|
|Windows OCR language|N/A|Chinese (Simplified), Chinese (Traditional), Czech, Danish, Dutch, English, Finnish, French, German, Greek, Hungarian, Italian, Japanese, Korean, Norwegian, Polish, Portuguese, Romanian, Russian, Serbian (Cyrillic), Serbian (Latin), Slovak, Spanish, Swedish, Turkish|English|The language of the text that the Windows OCR engine detects|
|Use other language|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use a language not given in the 'Tesseract language' field|
|Tesseract language|N/A|English, German, Spanish, French, Italian|English|The language of the text that the Tesseract engine detects|
|Language abbreviation|No|[Text value](../variable-data-types.md#text-value)||The Tesseract abbreviation of the language to use. For example, if the data is 'eng.traineddata', set this parameter to 'eng'|
|Language data path|No|[Text value](../variable-data-types.md#text-value)||The path of the folder that holds the specified language's Tesseract data|
|Image width multiplier|No|[Numeric value](../variable-data-types.md#numeric-value)|1|The width multiplier of the image|
|Image height multiplier|No|[Numeric value](../variable-data-types.md#numeric-value)|1|The height multiplier of the image|
|Wait for text to appear|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to wait if the text isn't found on the screen or foreground window|
|Fail if text doesn't appear within|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|The number of seconds to wait for the supplied text to appear|
|Send a click after moving mouse|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to send a click after the mouse is positioned over the text|
|Click type|N/A|Left click, Right click, Double click, Middle click, Left button down, Left button up, Right button down, Right button up|Left click|The mouse click type to send to the text|
|Wait before clicking for|Yes|[Numeric value](../variable-data-types.md#numeric-value)|1|The number of seconds to wait before clicking|
|Mouse position relative to text|N/A|Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right|Middle center|Specify which section of the text the mouse will be moved to|
|Offset X|No|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse from the position by this many pixels to the right|
|Offset Y|No|[Text value](../variable-data-types.md#text-value)|0|Offset the mouse from the position by this many pixels down|
|Image matching algorithm|N/A|Basic, Advanced|Basic|Which image algorithm to use when searching for image|

> [!NOTE]
> Power Automate's regular expression engine is .NET. To find more information about regular expressions, go to [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|LocationOfTextFoundX|[Numeric value](../variable-data-types.md#numeric-value)|The X coordinate of the point where the text is found on the screen. If the text is searched for in the foreground window, this coordinate is relative to the top left corner of the window|
|LocationOfTextFoundY|[Numeric value](../variable-data-types.md#numeric-value)|The Y coordinate of the point where the text is found on the screen. If the text is searched for in the foreground window, this coordinate is relative to the top left corner of the window|
|WidthOfTextFound|[Numeric value](../variable-data-types.md#numeric-value)|The width of the area the text was found on|
|HeightOfTextFound|[Numeric value](../variable-data-types.md#numeric-value)|The width of the area the text was found on|

### <a name="movemousetotextonscreenwithocraction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Text not found on screen|Indicates that the specified text couldn't be found on the screen|
|Can't move mouse in non interactive mode|Indicates a problem moving the mouse in non-interactive mode|
|Failed to move mouse|Indicates a problem moving the mouse|
|Invalid subregion coordinates|Indicates that the coordinates of the given subregion were invalid|
|Failed to create the OCR engine|Indicates an error occurred while trying to create the OCR engine|
|Data path folder doesn't exist|Indicates that the folder specified for the language data doesn't exist|
|The selected Windows language pack isn't installed on the machine|Indicates that the selected Windows language pack hasn't been installed on the machine|
|OCR engine isn't alive|Indicates that the OCR engine isn't alive|

## <a name="sendmouseclick"></a> Send mouse click

Sends a mouse click event.

> [!IMPORTANT]
> To prevent unauthorized access, Power Automate needs to run with the same or higher privileges as the applications it automates. To use the **Send mouse click** action to interact with applications that run with elevated privileges, run Power Automate as administrator. You can find more information regarding running Power Automate as an administrator in [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Mouse event to send|N/A|Left click, Right click, Double click, Middle click, Left button down, Left button up, Right button down, Right button up|Left click|Specify what form of mouse event to send|
|Wait|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|The time to delay before sending the mouse event in 1/1000 of a second|
|Move mouse|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Move mouse|
|X|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal (X) position of the mouse in pixel coordinates|
|Y|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical (Y) position of the mouse in pixel coordinates|
|Relative to|N/A|Screen, Active window, Current mouse position|Screen|Specify whether the new mouse position will be relative to the top left corner of the screen, the foremost window, or the current mouse position|
|Mouse movement style|N/A|Instant, With animation (low speed), With animation (normal speed), With animation (high speed)|Instant|The style of movement in which the mouse will move from its previous position to the beginning of the recorded route (or to its final position)|

### Variables produced

This action doesn't produce any variables.

### <a name="sendmouseclick_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't send mouse click in non interactive mode|Indicates a problem sending a mouse click in non-interactive mode|
|Mouse click out of screen bounds|Indicates that the mouse click was out of the screen bounds|
|Failed to send mouse click|Indicates a problem sending a mouse click|

## <a name="sendkeys"></a> Send keys

Sends keys to the application that is currently active.

> [!IMPORTANT]
> To prevent unauthorized access, Power Automate needs to run with the same or higher privileges as the applications it automates. To use the **Send keys** action to interact with applications that run with elevated privileges, run Power Automate as administrator. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Send keys to|N/A|Foreground window, By UI element, By window instance/handle, By title and/or class|Foreground window|Specify whether to send the keys to the foreground window or to a UI element or to a window instance or a combination of window title/class|
|Text to send|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The text to send to the application|
|Delay between keystrokes|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specify the delay in milliseconds between sending keystrokes to avoid input errors|
|Send Text as hardware keys|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Emulate the actual keystrokes on keyboard when sending whole Text|

### Variables produced

This action doesn't produce any variables.

### <a name="sendkeys_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't send keystrokes in non interactive mode|Indicates a problem sending keystrokes in non-interactive mode|
|Text to send doesn't represent valid keystrokes|Indicates that the text given doesn't represent valid keystrokes|
|There isn't an active application to send keystrokes to|Indicates that there isn't an active application to send keystrokes to|
|Failed to send keystrokes|Indicates a problem sending keystrokes|

> [!NOTE]
> To simulate a physical key being pressed inside a **Send keys** action, use the curly brackets **{}** notation. To use a key as a modifier, use the curly brackets **{}** notation for both keys. The **Send keys** action accepts the [Virtual-Key Codes](/windows/win32/inputdev/virtual-key-codes).

### Valid keys

|Category|Keys|
|-----|-----|
|Buttons|LButton, RButton, Cancel, MButton, XButton1, XButton2|
|Keyboard Control|Back, Tab, LineFeed, Clear, Enter, Return, ShiftKey, ControlKey,Menu, Pause, CapsLock, Capital, Escape, Space, Prior, PageUp, PageDown, Next, End, Home, Left, Up, Right, Down, Select, Print, Execute, Snapshot, PrintScreen, Insert, Delete, Help|
|Buttons|HangulMode, HanguelMode, KanaMode, JunjaMode, FinalMode, KanjiMode, HanjaMode|
|IME keys|IMEConvert, IMENonconvert, IMEAccept, IMEAceept, IMEModeChange|
|Browser keys|BrowserSearch, BrowserFavorites, BrowserHome|
|Volume keys|VolumeMute, VolumeDown, VolumeUp|
|Media keys|MediaNextTrack, MediaPreviousTrack, MediaStop, MediaPlayPause|
|Buttons|LaunchMail, SelectMedia, LaunchApplication1, LaunchApplication2|
|OEM keys|OemSemicolon, Oem1, Oemplus, Oemcomma, OemMinus, OemPeriod, Oem2, OemQuestion, Oem3, Oemtilde, Oem4, OemOpenBrackets, OemPipe, Oem5, OemCloseBrackets, Oem6, OemQuotes, Oem7, Oem8, Oem102, OemBackslash, OemClear|
|Buttons|ProcessKey, Packet, Attn, Crsel, Exsel, EraseEof, Play, Zoom, NoName, Pa1|
|Buttons|KeyCodem, Shift, Control, Alt, Modifiers|
|D keys|D0, D1, D2, D3, D4, D5, D6, D7, D8, D9|
|Letters|A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z|
|Windows keys|LWin, RWin, Apps, Sleep|
|NumPad keys|NumPad0, NumPad1, NumPad2, NumPad3, NumPad4, NumPad5, NumPad6, NumPad7, NumPad8, NumPad9|
|Calculation keys|Multiply, Add, Separator, Subtract, Decimal, Divide|
|Function keys|F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20, F21, F22, F23, F24|
|Buttons|NumLock, Scroll, LShiftKey, RShiftKey, LControlKey, RControlKey, LMenu, RMenu, BrowserBack, BrowserForward, BrowserRefresh, BrowserStop|

## <a name="pressreleasekey"></a> Press/release key

Presses (and holds) or releases one or more modifier keys (Alt, Control, or Shift).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Action to perform|N/A|Press, Release|Press|Specify whether to press or release keys with this action|
|Control|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the Ctrl key will be pressed/released or not|
|Alt|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the Alt key will be pressed/released or not|
|Shift|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the Shift key will be pressed/released or not|
|Win|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the Windows key will be pressed/released or not|

### Variables produced

This action doesn't produce any variables.

### <a name="pressreleasekey_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't press or release key in non interactive mode|Indicates a problem pressing or releasing the key in non-interactive mode|

## <a name="setkeystate"></a> Set key state

Sets the state (on or off) for the keys Caps Lock, Num Lock or Scroll Lock

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Key|N/A|Caps Lock, Num Lock, Scroll Lock|Caps Lock|Specify the key to set|
|State|N/A|Off, On|On|Whether to set the key state to on or off|

### Variables produced

This action doesn't produce any variables.

### <a name="setkeystate_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't set key state in non interactive mode|Indicates a problem setting the key state in non interactive mode|

## <a name="waitformouseaction"></a> Wait for mouse

Suspends the execution of the flow until the mouse pointer changes, usually to or from the 'wait cursor' or hourglass.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Wait for mouse pointer to|N/A|Become, Become not|Become|Choose what action of the mouse cursor to wait for.|
|Mouse pointer|N/A|Arrow, App starting, Cross, Hand, Help, IBeam, Wait cursor|Arrow|Specify the mouse pointer state.|

### Variables produced

This action doesn't produce any variables.

### <a name="waitformouseaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="getkeyboardlayout"></a> Get keyboard identifier

Retrieves the active keyboard identifier from the machine's registry.

### Input parameters

This action doesn't require any input.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|KeyboardLayoutId|[Numeric value](../variable-data-types.md#numeric-value)|The registry key of the active keyboard identifier|

### <a name="getkeyboardlayout_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Keyboard identifier wasn’t found|Indicates an error while retrieving the keyboard identifier|

## <a name="waitforshortcutkeyaction"></a> Wait for shortcut key

Pause the flow run until a specific shortcut key is pressed. Shortcut keys must contain at least one key or a key and one of (ctrl, alt, shift). Multiple shortcut keys can be defined.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Shortcut keys|N/A|Keys combination|Ctrl + A|Specify the shortcut keys to wait for. Shortcut keys must contain exactly one key or a key and a combination of (ctrl, alt, shift). To add more than one shortcut key, select 'New shortcut key'|
|Continue flow run on timeout|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the flow run will continue anyway when the set period of time waiting for the shortcut key expires|
|Continue after|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|The time in seconds before continuing the flow run|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|IndexOfShortcutKeyPressed|[Numeric value](../variable-data-types.md#numeric-value)|The index of the shortcut key if the shortcut keys are in a list format.|

### <a name="waitforshortcutkeyaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Shortcut key failed to register|Indicates that a shortcut key failed to register.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
