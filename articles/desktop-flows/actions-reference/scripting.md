---
title: Scripting | Microsoft Docs
description: Scripting Actions Reference
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

# Scripting

Incorporate scripting languages code in you automation

[Run DOS command](#rundoscommand)  
[Run VBScript](#runvbscript)  
[Run JavaScript](#runjavascript)  
[Run PowerShell script](#runpowershellscript)  
[Run Python script](#runpythonscript)  


## Getting started with scripting actions

Scripting actions are a major part of the system actions group. These actions enable users to run blocks of code and implement custom behavior in Power Automate.

All scripting actions follow the basic structure of the respective programming or scripting language: PowerShell, Python, VBScript, and JavaScript.

To declare variables in scripting actions and return results in Power Automate, use the following commands:

- To declare new variables in PowerShell scripts, use the **$** notation. To return values from [Run PowerShell script](#runpowershellscript) actions to Power Automate, use the **Write-Output** command.

  ```PowerShell
  $variableName = "variableValue"
  Write-Output $variableName
  ```

- Python scripts don't require any special notation to declare new variables. To return values from [Run Python script](#runpythonscript) actions, use the **print** function.

  ```Python
  variableName = "variableValue"
  print variableName
  ```

- VBScript doesn't require any special notation to declare new variables. Use the **WScript.Echo** function to return values from [Run VBScript](#runvbscript) actions to Power Automate.

  ```VBScript
  variableName = "variableValue"
  WScript.Echo variableName
  ```

- In JavaScript scripts, use the **var** notation to declare new variables and the **WScript.Echo** function to return values from [Run JavaScript](#runjavascript) actions. 

    ```JavaScript
    var variableName = "variableValue";
    WScript.Echo(variableName);
    ```

To use Power Automate variables in scripting actions, use the percentage notation (**%**) and handle the variables the same way as hardcoded values.

![Screenshot of a Python script that contains the percentage notation.](media\scripting\run-python-script-action.png)

## Scripting actions

> [!IMPORTANT]
> To prevent unauthorized access, Windows require administrator rights to access protected resources. To access protected resources (such as files) using the scripting actions, run Power Automate with administrator rights. You can find more information regarding running Power Automate as an administrator in [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).
.


### <a name="rundoscommand"></a> Run DOS command
Executes a DOS command or console application in invisible mode and retrieves its output upon completion

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|DOS command or application|No|[File](../variable-data-types.md#files-and-folders)||The name of DOS command or a console application, with arguments if applicable|
|Working folder|Yes|[Folder](../variable-data-types.md#files-and-folders)||The full path of the folder to work out of, if applicable|
|Change code page|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to change the session's current code page|
|Encoding|No|ASMO-708 : Arabic (ASMO 708), big5 : Chinese Traditional (Big5), cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), cp866 : Cyrillic (DOS), cp875 : IBM EBCDIC (Greek Modern), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), DOS-720 : Arabic (DOS), DOS-862 : Hebrew (DOS), EUC-CN : Chinese Simplified (EUC), EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), euc-jp : Japanese (EUC), euc-kr : Korean (EUC), GB18030 : Chinese Simplified (GB18030), gb2312 : Chinese Simplified (GB2312), hz-gb-2312 : Chinese Simplified (HZ), IBM-Thai : IBM EBCDIC (Thai), IBM00858 : OEM Multilingual Latin I, IBM00924 : IBM Latin-1, IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), IBM037 : IBM EBCDIC (US-Canada), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), iso-2022-jp : Japanese (JIS), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), iso-8859-1 : Western European (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-8-i : Hebrew (ISO-Logical), iso-8859-9 : Turkish (ISO), Johab : Korean (Johab), koi8-r : Cyrillic (KOI8-R), koi8-u : Cyrillic (KOI8-U), ks_c_5601-1987 : Korean, macintosh : Western European (Mac), shift_jis : Japanese (Shift-JIS), us-ascii : US-ASCII, utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), windows-874 : Thai (Windows), x-Chinese-CNS : Chinese Traditional (CNS), x-Chinese-Eten : Chinese Traditional (Eten), x-cp20001 : TCA Taiwan, x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-cp20261 : T.61, x-cp20269 : ISO-6937, x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, x-cp50227 : Chinese Simplified (ISO-2022), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), x-Europa : Europa, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Norwegian : Norwegian (IA5), x-IA5-Swedish : Swedish (IA5), x-iscii-as : ISCII Assamese, x-iscii-be : ISCII Bengali, x-iscii-de : ISCII Devanagari, x-iscii-gu : ISCII Gujarati, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-or : ISCII Oriya, x-iscii-pa : ISCII Punjabi, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-mac-arabic : Arabic (Mac), x-mac-ce : Central European (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-croatian : Croatian (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-greek : Greek (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-japanese : Japanese (Mac), x-mac-korean : Korean (Mac), x-mac-romanian : Romanian (Mac), x-mac-thai : Thai (Mac), x-mac-turkish : Turkish (Mac), x-mac-ukrainian : Ukrainian (Mac)`|utf-8 : Unicode (UTF-8)|The encoding to use when reading the output|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CommandOutput|[Text value](../variable-data-types.md#text-value)|The text output from the DOS command or application|
|CommandErrorOutput|[Text value](../variable-data-types.md#text-value)|The text describing the errors occurred (if any) during the execution of the DOS command or application|
|CommandExitCode|[Numeric value](../variable-data-types.md#numeric-value)|The command or application exit code. This will be a numeric value|


##### <a name="rundoscommand_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't execute command or console application|Indicates a problem executing the specified command or console application|

### <a name="runvbscript"></a> Run VBScript
Executes some custom VBScript code and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|VBScript to run|Yes|[Text value](../variable-data-types.md#text-value)||The VBScript code to execute. Variables may be included within the script since they will be evaluated prior to the execution of the VBScript|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|VBScriptOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that may occur during the execution of the VBScript code|


##### <a name="runvbscript_onerror"></a> Exceptions
- This action doesn't include any exceptions





### <a name="runjavascript"></a> Run JavaScript
Executes some custom JavaScript code and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|JavaScript to run|Yes|[Text value](../variable-data-types.md#text-value)||The JavaScript code to execute. Variables may be included within the script since they will be evaluated prior to the JavaScript code's execution|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JavascriptOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that may occur during the execution of the JavaScript code|


##### <a name="runjavascript_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="runpowershellscript"></a> Run PowerShell script
Executes some custom PowerShell script and retrieves its output into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PowerShell code to run|Yes|[Text value](../variable-data-types.md#text-value)||The PowerShell code to execute. Variables may be included within the script since they will be evaluated prior to the execution of the PowerShell code|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PowershellOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that may occur during the execution of the PowerShell code|


##### <a name="runpowershellscript_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run PowerShell script|Indicates a problem running the provided PowerShell script|


### <a name="runpythonscript"></a> Run Python script
Executes Python 2 script code and retrieves its output

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Python script to run|No|[Text value](../variable-data-types.md#text-value)||Τhe Python script code to execute|
|Module folder paths|Yes|[List of Folders](../variable-data-types.md#list)||The path(s) of folder(s) where external Python modules lie|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PythonScriptOutput|[Text value](../variable-data-types.md#text-value)|Τhe script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that may occur during the execution of the Python script code|


##### <a name="runpythonscript_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to run Python script|Indicates a problem running the provided Python script|
|Directory not found|Indicates that the directory was not found|