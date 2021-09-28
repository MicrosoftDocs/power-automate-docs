---
title: System | Microsoft Docs
description: System Actions Reference
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

# System



Perform a variety of tasks in a Windows environment and retrieve information from the system

|<!-- --> |
|-----|
|[Run application](#runapplicationbase)|
|[Run DOS command](#rundoscommand)|
|[Run VBScript](#runvbscript)|
|[Terminate process](#terminateprocess)|
|[Print document](#printdocument)|
|[Get default printer](#getdefaultprinter)|
|[Set default printer](#setdefaultprinter)|
|[Log off user](#logoffuser)|
|[Shutdown computer](#shutdowncomputer)|
|[Show desktop](#showdesktop)|
|[Lock workstation](#lockworkstation)|
|[Play sound](#playsoundbase)|
|[Empty recycle bin](#emptyrecyclebin)|
|[Take screenshot](#takescreenshotbase)|
|[Control screen saver](#controlscreensaver)|
|[Ping](#ping)|
|[Set Windows environment Variable](#setenvironmentvariable)|
|[Get Windows environment variable](#getenvironmentvariable)|
|[Delete Windows environment variable](#deleteenvironmentvariable)|
|[Run JavaScript](#runjavascript)|
|[Run PowerShell script](#runpowershellscript)|
|[Get screen resolution](#getscreenresolution)|
|[Set screen resolution](#setscreenresolution)|
|[Run Python script](#runpythonscript)|

## Getting started with system actions

Use system actions to automate tasks which are fundamental to the Windows operating system. 

Launch any of your installed applications with the **Run application** action. Command line arguments require placement in quotes and a space among them. In the figure below, Run application opens a specific document in Word in quiet mode:

![screenshot of the run application action properties window.](\media\system\run-application-example.png)

Take a screenshot of a screen, or a window only with the **Take screenshot** action. 

The **Print document** action prints a specified document and requires the file path. 

Shutdown, Restart, Suspend, or Hibernate the computer with the **Shutdown computer** action. 


## Getting started with scripting actions

Scripting actions are a major part of the system actions group. These actions enable users to run blocks of code and implement custom behavior in Power Automate.

All scripting actions follow the basic structure of the respective programming or scripting language: PowerShell, Python, VBScript, and JavaScript.

To declare variables in scripting actions and return results in Power Automate, use the following commands:

- To declare new variables in PowerShell scripts, use the **$** notation. To return values from [Run PowerShell script](#runpowershellscript) actions to Power Automate, use the **Write-Output** command.

  ```
  $variableName = "variableValue"
  Write-Output $variableName
  ```

- Python scripts don't require any special notation to declare new variables. To return values from [Run Python script](#runpythonscript) actions, use the **print** function.

  ```
  variableName = "variableValue"
  print variableName
  ```

- VBScript doesn't require any special notation to declare new variables. Use the **WScript.Echo** function to return values from [Run VBScript](#runvbscript) actions to Power Automate.

  ```
  variableName = "variableValue"
  WScript.Echo variableName
  ```

- In JavaScript scripts, use the **var** notation to declare new variables and the **WScript.Echo** function to return values from [Run JavaScript](#runjavascript) actions. 

    ```
    var variableName = "variableValue";
    WScript.Echo(variableName);
    ```

To use Power Automate variables in scripting actions, use the percentage notation (**%**) and handle the variables the same way as hardcoded values.

![A Python script that contains the  percentage notation.](\media\system\run-python-script-action.png)

## System actions

### <a name="runapplicationbase"></a> Run application
Executes an application or opens a document by executing the associated application

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Application path|No|File||The executable file as a complete file path|
|Command line arguments|Yes|Text value||Add extra arguments that would go after the executable file name. For example, enter notepad.exe in the application path and a specific text file in the command line arguments|
|Working folder|Yes|Folder||The full path of the folder to work out of, if applicable.|
|Window style|N/A|Normal, Hidden, Minimized, Maximized|Normal|Choose the appearance and size of the application window when it opens|
|After application launch|N/A|Continue immediately, Wait for application to load, Wait for application to complete|Continue immediately|Whether the next action execute immediately, or wait until the program loads or completes|
|Timeout|Yes|Numeric value|0|The maximum wait time, and how long before forcing a continue|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|AppProcessId|Numeric value|The process ID output|
|AppExitCode|Numeric value|The application exit code|
|WindowHandle|Numeric value|The window handle. When opening a new window, this will catch the value of the window handle, and store it in this variable. A window handle is useful to specifically identify a window in a later action|


##### <a name="runapplicationbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|File or application not found|Indicates that the specified file or application was not found|
|Access denied for application or File|Indicates that access was denied for the specified application or file|
|Can't retrieve application's main window handle|Indicates a problem retrieving the application's main window handle|
|Can't execute application or open file|Indicates a problem executing the specified application or opening the specified file|

>[!IMPORTANT]
>The Application path field has to point to the executable of the application. Certain default windows applications can be opened by entering **notepad** or **calc** for calculator.
>
>Any command line arguments have to be entered in double quotes and separated by a space. For example, to open Microsoft Word in quiet mode with the file InvoiceTemplate.docx from the user's desktop, format the field like so:
>**"/q" "C:\Users\username\Desktop\InvoiceTemplate.docx"**

##### <a name="runapplicationbase_example"></a> Example
![Run application action example.](media\system\run-application-example.png)

### <a name="rundoscommand"></a> Run DOS command
Executes a DOS command or console application in invisible mode and retrieves its output upon completion

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|DOS command or application|No|File||The name of DOS command or a console application, with arguments if applicable|
|Working folder|Yes|Folder||The full path of the folder to work out of, if applicable|
|Change code page|N/A|Boolean value|False|Specifies whether to change the session's current code page|
|Encoding|No|ASMO-708 : Arabic (ASMO 708), big5 : Chinese Traditional (Big5), cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), cp866 : Cyrillic (DOS), cp875 : IBM EBCDIC (Greek Modern), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), DOS-720 : Arabic (DOS), DOS-862 : Hebrew (DOS), EUC-CN : Chinese Simplified (EUC), EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), euc-jp : Japanese (EUC), euc-kr : Korean (EUC), GB18030 : Chinese Simplified (GB18030), gb2312 : Chinese Simplified (GB2312), hz-gb-2312 : Chinese Simplified (HZ), IBM-Thai : IBM EBCDIC (Thai), IBM00858 : OEM Multilingual Latin I, IBM00924 : IBM Latin-1, IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), IBM037 : IBM EBCDIC (US-Canada), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), iso-2022-jp : Japanese (JIS), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), iso-8859-1 : Western European (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-8-i : Hebrew (ISO-Logical), iso-8859-9 : Turkish (ISO), Johab : Korean (Johab), koi8-r : Cyrillic (KOI8-R), koi8-u : Cyrillic (KOI8-U), ks_c_5601-1987 : Korean, macintosh : Western European (Mac), shift_jis : Japanese (Shift-JIS), us-ascii : US-ASCII, utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), windows-874 : Thai (Windows), x-Chinese-CNS : Chinese Traditional (CNS), x-Chinese-Eten : Chinese Traditional (Eten), x-cp20001 : TCA Taiwan, x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-cp20261 : T.61, x-cp20269 : ISO-6937, x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, x-cp50227 : Chinese Simplified (ISO-2022), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), x-Europa : Europa, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Norwegian : Norwegian (IA5), x-IA5-Swedish : Swedish (IA5), x-iscii-as : ISCII Assamese, x-iscii-be : ISCII Bengali, x-iscii-de : ISCII Devanagari, x-iscii-gu : ISCII Gujarati, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-or : ISCII Oriya, x-iscii-pa : ISCII Punjabi, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-mac-arabic : Arabic (Mac), x-mac-ce : Central European (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-croatian : Croatian (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-greek : Greek (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-japanese : Japanese (Mac), x-mac-korean : Korean (Mac), x-mac-romanian : Romanian (Mac), x-mac-thai : Thai (Mac), x-mac-turkish : Turkish (Mac), x-mac-ukrainian : Ukrainian (Mac)`|utf-8 : Unicode (UTF-8)|The encoding to use when reading the output|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CommandOutput|Text value|The text output from the DOS command or application|
|CommandErrorOutput|Text value|The text describing the errors occurred (if any) during the execution of the DOS command or application|
|CommandExitCode|Numeric value|The command or application exit code. This will be a numeric value|


##### <a name="rundoscommand_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't execute command or console application|Indicates a problem executing the specified command or console application|

### <a name="runvbscript"></a> Run VBScript
Executes some custom VBScript code and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|VBScript to run|Yes|Text value||The VBScript code to execute. Variables may be included within the script since they will be evaluated prior to the execution of the VBScript|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|VBScriptOutput|Text value|The script's output|
|ScriptError|Text value|The errors that may occur during the execution of the VBScript code|


##### <a name="runvbscript_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="terminateprocess"></a> Terminate process
Immediately stops a running process

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Specify process by|N/A|Process ID, Process name|Process name|Specify whether the process to terminate will be specified by its name, or by its ID|
|Process ID|No|Numeric value||The ID of the process to terminate|
|Process name|No|Text value||The name of the process to terminate. If more than one processes with the same name are running, all of them will be terminated|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="terminateprocess_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Process with specified ID not running|Indicates that a process with the specified ID isn't running|
|Failed to terminate process|Indicates a problem terminating the process|

### <a name="printdocument"></a> Print document
Prints a document on the default printer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Document to print|No|File||The path of the document to print|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="printdocument_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Document not found|Indicates that the specified document was not found|
|Access denied for document|Indicates that access was denied for the provided document|
|Can't print document|Indicates a problem printing the specified document|

### <a name="getdefaultprinter"></a> Get default printer
Gets the name of the default printer

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PrinterName|Text value|The name of the default printer|


##### <a name="getdefaultprinter_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't get default printer|Indicates a problem getting the default printer|

### <a name="setdefaultprinter"></a> Set default printer
Sets a printer as the default printer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Printer name|No|Text value||The name of the printer to set as default|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setdefaultprinter_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't set default printer|Indicates a problem setting the default printer|

### <a name="logoffuser"></a> Log off user
Logs off the current user

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Force log off|N/A|Boolean value|False|Specify whether to force the user account to log off, regardless of unsaved files or programs that won't close|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="logoffuser_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't log off user in non interactive mode|Indicates a problem logging off the user in non-interactive mode|
|Can't log off the current user|Indicates a problem logging off the current user|

### <a name="shutdowncomputer"></a> Shutdown computer
Shuts down the computer

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Action to perform|N/A|Shutdown, Restart, Suspend, Hibernate|Shutdown|Specify which shutdown option the computer will perform|
|Force|N/A|Boolean value|False|Specify whether to force the computer to shut down, regardless of unsaved files or programs that won't close|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="shutdowncomputer_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't shut down the computer|Indicates a problem shutting down the computer|

### <a name="showdesktop"></a> Show desktop
Shows the desktop

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operation|N/A|Minimize all windows (show desktop), Restore all windows (undo show desktop)|Minimize all windows (show desktop)|Specify whether to minimize all windows to reveal the desktop or restore all windows to their original respective states|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="showdesktop_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="lockworkstation"></a> Lock workstation
Locks the workstation's display to protect it from unauthorized use

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="lockworkstation_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't lock the computer in non interactive mode|Indicates a problem locking the computer in non interactive mode|
|Can't lock the computer|Indicates a problem locking the computer in non-interactive mode|

### <a name="playsoundbase"></a> Play sound
Plays a system sound or a wav file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Play sound from|N/A|System, WAV file|System|The type of sound to play|
|Sound to play|N/A|Asterisk, Beep, Exclamation, Hand, Question|Asterisk|The specific sound to play|
|File to play|No|File||The full path of the specific WAV file to play|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="playsoundbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't find sound file|Indicates that the sound file could not be found|
|Invalid sound file|Indicates an invalid sound file|

### <a name="emptyrecyclebin"></a> Empty recycle bin
Deletes all files from the windows recycle bin

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="emptyrecyclebin_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="takescreenshotbase"></a> Take screenshot
Takes a screenshot of the foreground window or the specified screen and saves the image in a file or to the clipboard

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Capture|N/A|All screens, Primary screen, Select screen, Foreground window|All screens|The area to capture|
|Screen to capture|No|Numeric value||Specify which screen to capture|
|Save screenshot to|N/A|Clipboard, File|Clipboard|The location to save the screenshot to|
|Image file|No|File||The full path of the file name where the captured image will be saved|
|Image format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|The format for the image file to save|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="takescreenshotbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to take screenshot|Indicates a problem taking the screenshot|
|Failed to save screenshot to file|Indicates a problem saving the screenshot to a file|
|Failed to set screenshot to clipboard|Indicates a problem setting the screenshot to the clipboard|
|Failed to get specified screen|Indicates a problem getting the specified screen|

### <a name="controlscreensaver"></a> Control screen saver
Enables, disables, starts or stops the screensaver

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Screen saver action|N/A|Enable, Disable, Start, Stop|Enable|The function of the screensaver|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="controlscreensaver_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="ping"></a> Ping
Sends a message to determine whether a remote computer is accessible over the network

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Host name|No|Text value||The name of the remote computer or an IP address|
|Timeout|Yes|Numeric value|5000|The maximum number of milliseconds to wait for the Ping reply message|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PingResult|Text value|The status of the ping message (success or failure)|
|RoundTripTime|Numeric value|The number of milliseconds taken for the Ping to complete|


##### <a name="ping_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't complete ping action|Indicates a problem completing the ping action|

### <a name="setenvironmentvariable"></a> Set Windows environment variable
Sets an environment variable to a given value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variable name|No|Text value||The name of the environment variable|
|New environment variable value|No|Text value||The value that is set to the environment variable|
|Type|N/A|User, System|User|The type of the environment variable|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setenvironmentvariable_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Indicates a problem setting the environment variable's value|Indicates a problem setting the environment variable's value|
|Insufficient permissions|Indicates that the user has insufficient permissions to perform this action|

### <a name="getenvironmentvariable"></a> Get Windows environment variable
Retrieves the value of an environment variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variable name|No|Text value||The name of the environment variable whose value will be retrieved|
|Search for variable only in scope|N/A|Boolean value|False|Specify whether to search for the variable only in a specific scope|
|Scope|N/A|User, System|User|The scope from which the environment variable should be retrieved|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|EnvironmentVariableValue|Text value|The environment variable's value|


##### <a name="getenvironmentvariable_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Environment variable doesn't exist|Indicates that the specified environment variable doesn't exist|
|Insufficient permissions|Indicates that the user has insufficient permissions to perform this action|

### <a name="deleteenvironmentvariable"></a> Delete Windows environment variable
Deletes an environment variable from a given scope

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variable name|No|Text value||The name of the environment variable to delete|
|Type|N/A|User, System|User|The type of the environment variable to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deleteenvironmentvariable_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to delete environment variable|Indicates a problem deleting an environment variable|
|Insufficient permissions|Indicates that the user has insufficient permissions to perform this action|

### <a name="runjavascript"></a> Run JavaScript
Executes some custom JavaScript code and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|JavaScript to run|Yes|Text value||The JavaScript code to execute. Variables may be included within the script since they will be evaluated prior to the JavaScript code's execution|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JavascriptOutput|Text value|The script's output|
|ScriptError|Text value|The errors that may occur during the execution of the JavaScript code|


##### <a name="runjavascript_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="runpowershellscript"></a> Run PowerShell script
Executes some custom PowerShell script and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PowerShell code to run|Yes|Text value||The PowerShell code to execute. Variables may be included within the script since they will be evaluated prior to the execution of the PowerShell code|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PowershellOutput|Text value|The script's output|
|ScriptError|Text value|The errors that may occur during the execution of the PowerShell code|


##### <a name="runpowershellscript_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run PowerShell script|Indicates a problem running the provided PowerShell script|

### <a name="getscreenresolution"></a> Get screen resolution
Gets the width, height, bit count and frequency of a selected monitor

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Monitor number|No|Numeric value||The number of the monitor to get the resolution of|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|MonitorWidth|Numeric value|The width of the monitor|
|MonitorHeight|Numeric value|The height of the monitor|
|MonitorBitCount|Numeric value|The monitor bit count|
|MonitorFrequency|Numeric value|The monitor frequency|


##### <a name="getscreenresolution_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to get the screen's resolution|Indicates a problem getting the screen's resolution|

### <a name="setscreenresolution"></a> Set screen resolution
Sets the width, height, bit count and frequency of a selected monitor during an attended desktop flow run. 

> [!Important]
>To use the **Set screen resolution** action in flows triggered through the Power Automate portal, you have to be connected to the console session of your machine, where you can manually change the screen resolution. For example, you can use your machine's physical screen to connect to the machine. In remote sessions, such as unattended scenarios that use remote desktop clients, the action has no effect, as users can't manually change the resolution.

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Monitor number|No|Numeric value||The number of monitor to set the resolution of|
|Monitor width|No|Numeric value||The value to set the monitor width to|
|Monitor height|No|Numeric value||The value to set the monitor height to|
|Monitor bit count|No|Numeric value||The value to set the monitor bit count to|
|Monitor frequency|No|Numeric value||The value to set the monitor frequency to|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setscreenresolution_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to set the screen's resolution|Indicates a problem setting the screen's resolution|

### <a name="runpythonscript"></a> Run Python script
Executes Python 2 script code and retrieves its output

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Python script to run|No|Text value||Τhe Python script code to execute|
|Module folder paths|Yes|List of Folders||The path(s) of folder(s) where external Python modules lie|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PythonScriptOutput|Text value|Τhe script's output|
|ScriptError|Text value|The errors that may occur during the execution of the Python script code|


##### <a name="runpythonscript_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run Python script|Indicates a problem running the provided Python script|
|Directory not found|Indicates that the directory was not found|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]
