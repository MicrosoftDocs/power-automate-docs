---
title: System | Microsoft Docs
description: System Actions Reference
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

# System

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

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
|[Set Environment Variable](#setenvironmentvariable)|
|[Get environment variable](#getenvironmentvariable)|
|[Delete environment variable](#deleteenvironmentvariable)|
|[Run JavaScript](#runjavascript)|
|[Run PowerShell script](#runpowershellscript)|
|[Get screen resolution](#getscreenresolution)|
|[Set screen resolution](#setscreenresolution)|
|[Run Python script](#runpythonscript)|

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

### <a name="rundoscommand"></a> Run DOS command
Executes a DOS command or console application in invisible mode and retrieves its output upon completion

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|DOS command or application|No|File||The name of DOS command or a console application, with arguments if applicable|
|Working folder|Yes|Folder||The full path of the folder to work out of, if applicable|


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
|Can't log off user in non-interactive mode|Indicates a problem logging off the user in non-interactive mode|
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
|Can't lock the computer in non-interactive mode|Indicates a problem locking the computer in non-interactive mode|
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

### <a name="setenvironmentvariable"></a> Set Environment Variable
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

### <a name="getenvironmentvariable"></a> Get environment variable
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

### <a name="deleteenvironmentvariable"></a> Delete environment variable
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
Sets the width, height, bit count and frequency of a selected monitor

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


