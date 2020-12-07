---
title: CMD session | Microsoft Docs
description: CMD session Actions Reference
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

# CMD session

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Automate a CMD session

|<!-- --> |
|-----|
|[Open CMD session](#open)|
|[Read from CMD session](#readfromcmdsession)|
|[Write to CMD session](#write)|
|[Wait for text on CMD session](#waitfortext)|
|[Close CMD session](#close)|

### <a name="open"></a> Open CMD session
Open a new CMD session

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Working folder|Yes|Folder||The full path of the folder to start the CMD session, if applicable|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CmdSession|CMD session|The CMD session for use with later CMD actions|


##### <a name="open_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't start command session|Indicates a problem initiating a CMD session|
|Working directory doesn't exist|Indicates that an error occurred trying to locate the working directory|

### <a name="readfromcmdsession"></a> Read from CMD session
Read the output of a CMD session

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|CMD session||A previously opened CMD session|
|Separate output from error|N/A|Boolean value|False|Specifies whether to store the standard output and the standard error into different variables or combined into one|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CmdOutput|Text value|The CMD session's standard output|
|CmdError|Text value|The CMD session's standard error|


##### <a name="readfromcmdsession_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|CMD session is closed|Indicates that the CMD session specified is closed|

### <a name="write"></a> Write to CMD session
Execute a command on an open CMD session

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|CMD session||A previously opened CMD session variable|
|Command|No|Text value||The name of the command to execute|
|Send <Enter> after command|N/A|Boolean value|True|Specifies whether to send an <Enter> the command|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="write_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't write to CMD session|Indicates an error writing to a CMD session|
|CMD session is closed|Indicates that the CMD session specified is closed|

### <a name="waitfortext"></a> Wait for text on CMD session
Wait for a specific text on a previously opened CMD session

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|CMD session||An open CMD session variable|
|Text to wait|No|Text value||The text or regular expression to wait to appear on standard output or on standard error|
|Is regular expression|N/A|Boolean value|False|Specifies whether to wait for a regular expression instead of plain text|
|Ignore case|N/A|Boolean value|True|Specifies whether the text to wait should match with standard output or standard error without taking into account the case of the text|
|Timeout|Yes|Numeric value|0|Specifies whether to wait indefinitely for the text to appear or to fail if the text doesn't show up within a set time period|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="waitfortext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|CMD session is closed|Indicates that the CMD session specified is closed|
|Timeout occurred while waiting for text|Indicates that the specified timeout period has elapsed before the text appeared in the command session|

### <a name="close"></a> Close CMD session
Close a previously opened CMD session

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|CMD session||The CMD session to close. Specify this variable in an open CMD session action|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="close_onerror"></a> Exceptions
- This action doesn't include any exceptions

