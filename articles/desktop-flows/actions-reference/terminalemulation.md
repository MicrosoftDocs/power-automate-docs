---
title: Terminal emulation actions reference
description: See all the available terminal emulation actions.
author: mattp123
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/21/2024
ms.author: matp
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Terminal emulation actions

Power Automate provides integration with terminal emulators through the **Terminal emulation** actions. These actions enable you to handle terminals and mainframes, and perform operations such as moving the cursor, setting and getting text, and sending keys.

Before deploying any terminal actions, use the **Open terminal session** action to open a new connection with the installed provider.

> [!IMPORTANT]
> Before trying to connect to a terminal session, make sure that the actual terminal session is already open on your machine.

If you've installed Micro Focus Reflection on your machine, choose the respective option in the **Provider** parameter of the action and populate the required configuration.

:::image type="content" source="media/terminalemulation/open-terminal-session-action.png" alt-text="Screenshot of the Open terminal session action.":::

If you've installed another provider, select **HLLAPI** that works with most terminal emulation providers.

Depending on the provider you're using, select the appropriate HLLAPI DLL file located in its installation folder. In the following list, you can see the HLLAPI DLL file names of some popular terminal emulation providers:

- RocketSoftware BlueZone: **ehlapi64.dll**
- IBM Personal Communications: **EHLAPI32.dll**
- MicroFocus Rumba: **System/ehlapi32.Dll**
- Cybelesoft zScope: **zHllap32.dll**

> [!NOTE]
> The Windows HLLAPI DLL (WinHLLAPI) is not currently supported.

:::image type="content" source="media/terminalemulation/open-terminal-session-action-hllapi.png" alt-text="Screenshot of the Open terminal session action with the HLLAPI option selected.":::

After opening a terminal session and completing all the wanted operations, terminate the connection using the **Close terminal session** action. If you don't close the connection, some providers won't let you connect again to the already open session without restarting the software or the connection.

:::image type="content" source="media/terminalemulation/close-terminal-session-action.png" alt-text="Screenshot of the Close terminal session action.":::

## <a name="openterminalsession"></a> Open terminal session

Open a new terminal session.

> [!NOTE]
> Learn more about configuring the action in [How to configure the open terminal session action](../how-to/terminal-emulation-open-new-session.md).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Provider|N/A|Micro focus reflection, HLLAPI|Micro focus reflection|The terminal emulation to use|
|HLLAPI DLL path|No|[File](../variable-data-types.md#files-and-folders)||The HLLAPI DLL of the provider. RocketSoftware BlueZone default name: 'ehlapi64.dll'. IBM Personal Communications default name: 'EHLAPI32.dll'. MicroFocus Rumba default path: 'System/ehlapi32.Dll'. Cybelesoft zScope default name: 'zHllap32.dll'. Any other provider that offers an HLLAPI DLL in its installation folder.|
|Installation path|No|[Folder](../variable-data-types.md#files-and-folders)||The installation path of the provider's application on the user's file system|
|Configuration|N/A|Existing profile, Specify connection|Existing profile|Choose 'Existing profile' to select a file containing a preconfigured terminal emulation connection. Choose 'Specify connection' to specify the type of the connection, the host address and the port.|
|Session name|No|[Text value](../variable-data-types.md#text-value)||The session name to connect to.  The HLLAPI short name, and it's a unique identifier for the host session. It can be found in the Terminal emulator's configuration settings.|
|Host type|N/A|IBM 3270, IBM 5250|IBM 3270|The host type of the connection|
|Profile|No|[File](../variable-data-types.md#files-and-folders)||The file that contains the preconfigured connection|
|Host address|No|[Text value](../variable-data-types.md#text-value)||The host's address to connect to|
|Port|No|[Numeric value](../variable-data-types.md#numeric-value)||The port to be used for this connection|
|Attach to running session|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to attach to a currently open/running terminal session|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TerminalSession|[Terminal session](../variable-data-types.md#terminal)|The specific terminal session for use with later terminal emulation commands|

### <a name="openterminalsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|
|Profile error|Profile error|

## <a name="closesession"></a> Close terminal session

Close an open terminal session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session to close|No|[Terminal session](../variable-data-types.md#terminal)||The previously opened terminal session|

### Variables produced

This action doesn't produce any variables.

### <a name="closesession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|

## <a name="movecursor"></a> Move cursor on terminal session

Move the terminal's cursor on the specified position.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The terminal session to work with|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical position of the cursor on the screen|
|Column|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal position of the cursor on the screen|

### Variables produced

This action doesn't produce any variables.

### <a name="movecursor_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Screen position out of bounds|Indicates that the screen position is out of bounds|
|Position commands aren't supported by the emulator|Indicates that position commands used aren't supported by the emulator|
|Operation is unavailable for this session type|Indicates that the operation is unavailable for this session type|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|

## <a name="gettextfromterminalsession"></a> Get text from terminal session

Get text from a terminal session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The terminal session to work with|
|Get text from|N/A|Field, Entire screen, Cursor position, Specific position|Field|The location to get the text from|
|Get field by|N/A|Label, Index, Position|Label|Specifies how to look for the field|
|Label|No|[Text value](../variable-data-types.md#text-value)||The label of the field to look for|
|Index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the field to look for|
|Text length|No|[Numeric value](../variable-data-types.md#numeric-value)||The length of the text to receive|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical position of the field on the screen|
|Column|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal position of the field on the screen|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TerminalText|[Text value](../variable-data-types.md#text-value)|The text retrieved from the terminal session|

### <a name="gettextfromterminalsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|
|Field index out of bounds|Indicates that the field index is out of bounds|
|Field label not found|Indicates that the field label doesn't exist|
|Screen position out of bounds|Indicates that the screen position is out of bounds|
|No field found at the given position|Indicates that no field exists at the given position|
|Terminal screen is unformatted|Indicates that the terminal screen is unformatted|
|Position commands aren't supported by the emulator|Indicates that position commands used aren't supported by the emulator|
|Operation is unavailable for this session type|Indicates that the operation is unavailable for this session type|

## <a name="settextonterminalsession"></a> Set text on terminal session

Set text on a terminal session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The terminal session to work with|
|Text|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The text to set on the specified location|
|Set text|N/A|Cursor position, Field|Field|The location to set the text to|
|Get field by|N/A|Label, Index, Position|Label|Specifies the way by which to look for the field|
|Label|No|[Text value](../variable-data-types.md#text-value)||The label of the field to look for|
|Index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the field on the screen|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical position of the field on the screen|
|Column|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal position of the field on the screen|
|Treat @ character as literal|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Check this box to send the '@' character literally. Leave this option disabled to sent it as a special character|

### Variables produced

This action doesn't produce any variables.

### <a name="settextonterminalsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|
|Field index out of bounds|Indicates that the field index is out of bounds|
|Field label not found|Indicates that the field label doesn't exist|
|Screen position out of bounds|Indicates that the screen position is out of bounds|
|No field found at the given position|Indicates that no field exists at the given position|
|Terminal screen is unformatted|Indicates that the terminal screen is unformatted|
|Position commands aren't supported by the emulator|Indicates that position commands used aren't supported by the emulator|
|Operation is unavailable for this session type|Indicates that the operation is unavailable for this session type|
|Input text was rejected|Indicates that the input text was rejected|

## <a name="sendkey"></a> Send key to terminal session

Send a control key to a terminal session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The terminal session to work with|
|Control key|N/A|Transmit, Alt cursor, Attention, Backspace, Back tab, Block toggle, Break, Cancel, Center, Clear, Clear comm, Clear display, Clear line, Clear page, Clear partition, Comma, Command line, Command window, Compose, Ctrl+F1, Ctrl+F2, Ctrl+F3, Ctrl+F4, Ctrl+F5, Ctrl+F6, Ctrl+F7, Ctrl+F8, Ctrl+F9, Ctrl+F10, Ctrl+F11, Ctrl+F12, Ctrl+Shift+F1, Ctrl+Shift+F2, Ctrl+Shift+F3, Ctrl+Shift+F4, Ctrl+Shift+F5, Ctrl+Shift+F6, Ctrl+Shift+F7, Ctrl+Shift+F8, Ctrl+Shift+F9, Ctrl+Shift+F10, Ctrl+Shift+F11, Ctrl+Shift+F12, Cursor blink, Cursor select, Decimal, Delete, Delete char, Delete line, Delete word, Destructive back space, Disconnect, Do, Down, Down double, Dup, Duplicate, Edit script, Key end, End of field, Erase EOF, Erase EOL, Erase EOP, Erase input, Escape, ExtGr, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20, F21, F22, F23, F24, F25, F26, F27, F28, F29, F30, F31, F32, F33, F34, F35, F36, F37, F38, F39, F40, F41, F42, F43, F44, F45, F46, F47, F48, Field delimiter, Field exit, Field mark, Field minus, Field plus, Find, Hard reset, Help, Hex, Hex 00, Hex 01, Hex 02, Hex 03, Hex 04, Hex 05, Hex 06, Hex 07, Hex 08, Hex 09, Hex 0A, Hex 0B, Hex 0C, Hex 0D, Hex 0E, Hex 0F, Hex 10, Hex 11, Hex 12, Hex 13, Hex 14, Hex 15, Hex 16, Hex 17, Hex 18, Hex 19, Hex 1A, Hex 1B, Hex 1C, Hex 1D, Hex 1E, Hex 1F, Hex 7F, Hold, Hold clear, Hold set, Home, Home down, Home up, Insert, Insert char, Insert here, Insert line, Insert mode, Invalid key, KeyPad0, KeyPad1, KeyPad2, KeyPad3, KeyPad4, KeyPad5, KeyPad6, KeyPad7, KeyPad8, KeyPad9, Left, Left double, Line feed, Minus, Monitor toggle, New line, Next page, Next screen, Next word, Nul, NumLock, PA1, PA2, PA3, Page, Page down, Page up, Pan left, Pan right, Partition jump, PF1, PF2, PF3, PF4, Plus Cr, Previous word, PrevPage, PrevScreen, Print, Print line, Print Msg, Prent screen, Remove, Replace, Reset, Return, Reserve field, Right, Right double, Roll down, Roll up, Rile line, Run script, Scroll down, Scroll left, Scroll right, Scroll up, Select, Send, Send answer back, Send delete, Send line, Send Msg, Shift+Backspace, Shift+Delete, Shift+Down, Shift+F1, Shift+F2, Shift+F3, Shift+F4, Shift+F5, Shift+F6, Shift+F7, Shift+F8, Shift+F9, Shift+F10, Shift+F11, Shift+F12, Shift+F13, Shift+F14, Shift+F15, Shift F16, Shift+F17, Shift+F18, Shift+F19, Shift+F20, Shift+Home, Shift+Insert, Shift+Left, Shift+Print screen, Shift+Right, Shift+Up, Soft reset, System request, Tab, Tek zoom, Term next page, Term prev page, Test, Text assist begin bold, Text assist begin of line, Text assist begin underline, Text assist bottom of page, Text assist carrier return, Text assist center, Text assist end bold, Text assist end of line, Text assist half index down, Text assist half index up, Text assist insert symbols, Text assist next stop, Text assist next text column, Text assist page end, Text assist required space, Text assist required tab, Text assist stop, Text assist text tab advance, Text assist top of page, Text assist word underline, Trace Toggle, Udk 10, Udk 6, Udk 7, Udk 8, Udk 9, Udk 11, Udk 12, Udk 13, Udk 14, Udk 15, Udk 16, Udk 17, Udk 18, Udk 19, Udk 20, Up, Up double|Transmit|The key to submit to the session|

### Variables produced

This action doesn't produce any variables.

### <a name="sendkey_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|
|Key not supported|Indicates that the key isn't supported|

## <a name="waitfortextonterminalsession"></a> Wait for text on terminal session

Wait for a specific text to appear on a terminal session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The previously opened terminal session|
|Text to wait for|No|[Text value](../variable-data-types.md#text-value)||The text or regular expression to wait to appear on the terminal screen or on a specified field|
|Regular expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to wait for a regular expression instead of plain text|
|Wait for text location|N/A|Screen, Field|Screen|The location to wait for the text to appear on|
|Get field by|N/A|Label, Index, Position|Label|Specifies the way by which to look for the field|
|Label|No|[Text value](../variable-data-types.md#text-value)||The label of the field to look for|
|Index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the field to look for|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The vertical position of the field on the screen|
|Column|No|[Numeric value](../variable-data-types.md#numeric-value)||The horizontal position of the field on the screen|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|The maximum amount of time to wait|

> [!NOTE]
> Power Automate's regular expression engine is .NET. To find more information about regular expressions, go to [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

### Variables produced

This action doesn't produce any variables.

### <a name="waitfortextonterminalsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator|
|Field index out of bounds|Indicates that the field index is out of bounds|
|Field label not found|Indicates that the field label doesn't exist|
|Screen position out of bounds|Indicates that the screen position is out of bounds|
|No field found at the given position|Indicates that no field exists at the given position|
|Terminal screen is unformatted|Indicates that the terminal screen is unformatted|
|Position commands aren't supported by the emulator|Indicates that position commands used aren't supported by the emulator|
|Operation is unavailable for this session type|Indicates that the operation is unavailable for this session type|
|Timeout expired|Indicates that the timeout has been expired|


## <a name="searchfortextonterminalsession"></a> Search for text on terminal session

Search for all occurrences of a specific text on a terminal session

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Terminal session|No|[Terminal session](../variable-data-types.md#terminal)||The previously opened terminal session|
|Text to search for|No|[Text value](../variable-data-types.md#text-value)||The text or regular expression to search for on the terminal screen|
|Regular expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to search for a regular expression instead of plain text|
|Column size|No|[Numeric value](../variable-data-types.md#numeric-value)|80|The number of the columns on the terminal screen|

> [!NOTE]
> Power Automate's regular expression engine is .NET. To find more information about regular expressions, go to [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FindResults|[Datatable](../variable-data-types.md#datatable)|The search results retrieved from the terminal session screen|

### <a name="searchfortextonterminalsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error communicating with the emulator|Indicates a problem connecting to the emulator| 
|Text not found|Indicates that the text searching for was not found| 
|Invalid regex expression|Indicates that the Regular Expression used is invalid|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]
