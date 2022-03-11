---
title: System | Microsoft Docs
description: System Actions Reference
author: mariosleon

ms.subservice: desktop-flow
ms.topic: reference
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
>[!NOTE]
>The System group of actions has been segregated into some new categories. You can find details on the [Workstation](workstation.md) actions and [Scripting](scripting.md) actions in their respective pages.

Perform a variety of tasks in a Windows environment and retrieve information from the system

[If process](#ifprocessaction)  
[Wait for process](#waitprocessaction)  
[Run application](#runapplicationbase)  
[Terminate process](#terminateprocess)  
[Ping](#ping)  
[Set Windows environment variable](#setenvironmentvariable)  
[Get Windows environment variable](#getenvironmentvariable)  
[Delete Windows environment variable](#deleteenvironmentvariable)  

## Getting started with system actions

Use system actions to automate tasks which are fundamental to the Windows operating system. 

Launch any of your installed applications with the **Run application** action. Command line arguments require placement in quotes and a space among them. In the figure below, the **Run application** actions opens a specific document in Word in quiet mode:

![Screenshot of the Run application action.](\media\system\run-application-example.png)

Apart from running applications, Power Automate for desktop enables you to terminate processes by name or ID through the **Terminate process** action and wait for processes to start or stop through the **Wait for process** action.

![Screenshot of the Wait for process action.](\media\system\wait-process-action.png)

If you want to handle Windows environment variables, use the **Set Windows environment variable**, **Get Windows environment variable**, and **Delete Windows environment variable** actions for the respective tasks.

## System actions
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


### <a name="runapplicationbase"></a> Run application
Executes an application or opens a document by executing the associated application

> [!IMPORTANT]
> The **Run application** action may not launch an application successfully if the application requires elevated privileges, while Power Automate doesn't run with administrator rights.

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

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
