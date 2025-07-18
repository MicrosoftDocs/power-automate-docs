---
title: Scripting actions reference
description: See all the available scripting actions.
author: cochamos
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 03/21/2025
ms.update-cycle: 180-days
ms.author: cochamos
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Scripting actions

> [!IMPORTANT]
> To prevent unauthorized access, Windows require administrator rights to access protected resources. To access protected resources (such as files) using the scripting actions, run Power Automate with administrator rights. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

Scripting actions enable you to run blocks of code and implement custom behavior in your desktop flows.

> [!IMPORTANT]
> As announced on [October 2023](/windows/whats-new/deprecated-features), VBScript is deprecated from Windows. In future releases of Windows, VBScript will be available as a feature on demand before its removal from the operating system. [For more information, see Resources for deprecated features.](/windows/whats-new/deprecated-features-resources#vbscript)

All scripting actions follow the basic structure of the respective programming or scripting language: PowerShell, Python, VBScript, JavaScript, and C#/VB.NET.

> [!NOTE]
> Supported version for **C#:** v 5.0. For **VB.NET**: v 11.0

## Natural language to script powered by Copilot (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Natural language to script is a new Copilot capability added in Power Automate for desktop. It lets you quickly generate the code used in the scripting actions by just describing it in natural language. This feature is available in the following scripting actions:

- **Run PowerShell**
- **Run VBScript**
- **Run DOS command**
- **Run Python**
- **Run JavaScript**

[!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

### Availability by region

Currently, natural language to script is available in environments located in the following regions/countries:
  - Asia Pacific
  - Australia
  - Brazil
  - Canada
  - Europe
  - France
  - Germany
  - India
  - Japan
  - Norway
  - Singapore
  - South Africa
  - South Korea
  - Sweden
  - Switzerland
  - United Arab Emirates
  - United Kingdom
  - United States
    
### Availability by account type

Currently, Copilot in Power Automate for desktop is only available for users with a work or school account.

> [!NOTE]
> If your environment is in one of the previously listed regions and you still need to see the copilot in Power Automate for desktop experience, contact your tenant administrator.

### How to generate scripts using copilot and natural language

To generate scripts in one of the supported scripting actions drag and drop the action in the designer and select **Generate script with Copilot**.

:::image type="content" source="media\scripting\powershell_action.png" alt-text="Screenshot of the run PowerShell action with the Generate script with Copilot button highlighted":::

The create prompt screen opens where you can type your natural language prompt.

:::image type="content" source="media\scripting\powershell_action2.png" alt-text="Screenshot of the generate PowerShell action with the prompt dialog open":::

To create a script, write your prompt and select **Generate**. If you need to re-create it, you can change the prompt and select **Regenerate**. Otherwise, select **Use this script** to go back to the main action window, where you can modify it and add any necessary variables.

:::image type="content" source="media\scripting\powershell_action3.png" alt-text="Screenshot of the use this script PowerShell action with the prompt dialog open":::

> [!IMPORTANT]
> Make sure that you always review the content generated by the AI model.

### Help us improve this feature

Send feedback by selecting the thumb up or thumb down icon underneath the AI-generated content. Once you do, a feedback dialog appears, which you can use to submit feedback to Microsoft.
:::image type="content" source="media\scripting\feedback_dialog1.png" alt-text="Animated gif that shows the copilot answering a user's question from the designer.":::

> [!NOTE]
> If you can't see the dialog, your tenant admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

### Disabling the user feedback functionality

As a [Power Platform admin](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator), prevent users from sending Copilot feedback to Microsoft by using the "Copilot feedback" [tenant setting](/power-platform/admin/tenant-settings).

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback from their users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then selecting **Health** > **Product feedback**.

### AI with Power Automate resources

- [FAQ for Generating scripts with natural language](../../faqs-copilot-nl-to-code.md)
- [Responsible AI FAQs for Power Automate](../../responsible-ai-overview.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

## Working with variables in scripting actions

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

- For .NET scripts, use the **Script Parameters** window, accessed through the [Run .NET script](#rundotnetscript) action's configuration card. You can set the type of the respective variable:

:::image type="content" source="media\scripting\run-dotnet-script-action-scriptparameters1.png" alt-text="Screenshot of the Script Parameters window in Run .NET script action, setting the variable type":::

In addition, you can set whether it's an input to the .NET script (**In** option in Direction dropdown), an output of the script (**Out** option in Direction dropdown) or both (**In-Out** option in Direction dropdown).

:::image type="content" source="media\scripting\run-dotnet-script-action-scriptparameters2.png" alt-text="Screenshot of the Script Parameters window in Run .NET script action, setting the direction":::

To use Power Automate variables in scripting actions, use the percentage notation (**%**) and handle the variables the same way as hardcoded values.

:::image type="content" source="media\scripting\run-python-script-action.png" alt-text="Screenshot of a Python script that contains the percentage notation.":::

## <a name="rundoscommand"></a> Run DOS command

Executes a DOS command or console application in invisible mode and retrieves its output upon completion.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|DOS command or application|No|[File](../variable-data-types.md#files-and-folders)||The name of DOS command or a console application, with arguments if applicable|
|Working folder|Yes|[Folder](../variable-data-types.md#files-and-folders)||The full path of the folder to work out of, if applicable|
|Fail after timeout|Yes|[Boolean value](../variable-data-types.md#boolean-value)||Specify whether the DOS command or application will run indefinitely or fail after a set period of time|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|10|The maximum number of seconds to wait for the script to complete (-1 for indefinitely)|
|Change code page|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to change the session's current code page|
|Encoding|No|ASMO-708: Arabic (ASMO 708), big5: Chinese Traditional (Big5), cp1025: IBM EBCDIC (Cyrillic Serbian-Bulgarian), cp866: Cyrillic (DOS), cp875: IBM EBCDIC (Greek Modern), csISO2022JP: Japanese (JIS-Allow 1 byte Kana), DOS-720: Arabic (DOS), DOS-862: Hebrew (DOS), EUC-CN: Chinese Simplified (EUC), EUC-JP: Japanese (JIS 0208-1990 and 0212-1990), euc-jp: Japanese (EUC), euc-kr: Korean (EUC), GB18030: Chinese Simplified (GB18030), gb2312: Chinese Simplified (GB2312), hz-gb-2312: Chinese Simplified (HZ), IBM-Thai: IBM EBCDIC (Thai), IBM00858: OEM Multilingual Latin I, IBM00924: IBM Latin-1, IBM01047: IBM Latin-1, IBM01140: IBM EBCDIC (US-Canada-Euro), IBM01141: IBM EBCDIC (Germany-Euro), IBM01142: IBM EBCDIC (Denmark-Norway-Euro), IBM01143: IBM EBCDIC (Finland-Sweden-Euro), IBM01144: IBM EBCDIC (Italy Euro), IBM01145: IBM EBCDIC (Spain-Euro), IBM01146: IBM EBCDIC (UK-Euro), IBM01147: IBM EBCDIC (France-Euro), IBM01148: IBM EBCDIC (International-Euro), IBM01149: IBM EBCDIC (Icelandic-Euro), IBM037: IBM EBCDIC (US-Canada), IBM1026: IBM EBCDIC (Turkish Latin-5), IBM273: IBM EBCDIC (Germany), IBM277: IBM EBCDIC (Denmark-Norway), IBM278: IBM EBCDIC (Finland-Sweden), IBM280: IBM EBCDIC (Italy), IBM284: IBM EBCDIC (Spain), IBM285: IBM EBCDIC (UK), IBM290: IBM EBCDIC (Japanese katakana), IBM297: IBM EBCDIC (France), IBM420: IBM EBCDIC (Arabic), IBM423: IBM EBCDIC (Greek), IBM424: IBM EBCDIC (Hebrew), IBM437: OEM United States, IBM500: IBM EBCDIC (International), ibm737: Greek (DOS), ibm775: Baltic (DOS), ibm850: Western European (DOS), ibm852: Central European (DOS), IBM855: OEM Cyrillic, ibm857: Turkish (DOS), IBM860: Portuguese (DOS), ibm861: Icelandic (DOS), IBM863: French Canadian (DOS), IBM864: Arabic (864), IBM865: Nordic (DOS), ibm869: Greek, Modern (DOS), IBM870: IBM EBCDIC (Multilingual Latin-2), IBM871: IBM EBCDIC (Icelandic), IBM880: IBM EBCDIC (Cyrillic Russian), IBM905: IBM EBCDIC (Turkish), iso-2022-jp: Japanese (JIS), iso-2022-jp: Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr: Korean (ISO), iso-8859-1: Western European (ISO), iso-8859-13: Estonian (ISO), iso-8859-15: Latin 9 (ISO), iso-8859-2: Central European (ISO), iso-8859-3: Latin 3 (ISO), iso-8859-4: Baltic (ISO), iso-8859-5: Cyrillic (ISO), iso-8859-6: Arabic (ISO), iso-8859-7: Greek (ISO), iso-8859-8: Hebrew (ISO-Visual), iso-8859-8-i: Hebrew (ISO-Logical), iso-8859-9: Turkish (ISO), Johab: Korean (Johab), koi8-r: Cyrillic (KOI8-R), koi8-u: Cyrillic (KOI8-U), ks_c_5601-1987: Korean, macintosh: Western European (Mac), shift_jis: Japanese (Shift-JIS), us-ascii: US-ASCII, utf-16: Unicode, utf-16BE: Unicode (Big-Endian), utf-32: Unicode (UTF-32), utf-32BE: Unicode (UTF-32 Big-Endian), utf-7: Unicode (UTF-7), utf-8: Unicode (UTF-8), windows-1250: Central European (Windows), windows-1251: Cyrillic (Windows), Windows-1252: Western European (Windows), windows-1253: Greek (Windows), windows-1254: Turkish (Windows), windows-1255: Hebrew (Windows), windows-1256: Arabic (Windows), windows-1257: Baltic (Windows), windows-1258: Vietnamese (Windows), windows-874: Thai (Windows), x-Chinese-CNS: Chinese Traditional (CNS), x-Chinese-Eten: Chinese Traditional (Eten), x-cp20001: TCA Taiwan, x-cp20003: IBM5550 Taiwan, x-cp20004: TeleText Taiwan, x-cp20005: Wang Taiwan, x-cp20261: T.61, x-cp20269: ISO-6937, x-cp20936: Chinese Simplified (GB2312-80), x-cp20949: Korean Wansung, x-cp50227: Chinese Simplified (ISO-2022), x-EBCDIC-KoreanExtended: IBM EBCDIC (Korean Extended), x-Europa: Europa, x-IA5: Western European (IA5), x-IA5-German: German (IA5), x-IA5-Norwegian: Norwegian (IA5), x-IA5-Swedish: Swedish (IA5), x-iscii-as: ISCII Assamese, x-iscii-be: ISCII Bengali, x-iscii-de: ISCII Devanagari, x-iscii-gu: ISCII Gujarati, x-iscii-ka: ISCII Kannada, x-iscii-ma: ISCII Malayalam, x-iscii-or: ISCII Oriya, x-iscii-pa: ISCII Punjabi, x-iscii-ta: ISCII Tamil, x-iscii-te: ISCII Telugu, x-mac-arabic: Arabic (Mac), x-mac-ce: Central European (Mac), x-mac-chinesesimp: Chinese Simplified (Mac), x-mac-chinesetrad: Chinese Traditional (Mac), x-mac-croatian: Croatian (Mac), x-mac-cyrillic: Cyrillic (Mac), x-mac-greek: Greek (Mac), x-mac-hebrew: Hebrew (Mac), x-mac-icelandic: Icelandic (Mac), x-mac-japanese: Japanese (Mac), x-mac-korean: Korean (Mac), x-mac-romanian: Romanian (Mac), x-mac-thai: Thai (Mac), x-mac-turkish: Turkish (Mac), x-mac-ukrainian: Ukrainian (Mac)`|utf-8: Unicode (UTF-8)|The encoding to use when reading the output|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CommandOutput|[Text value](../variable-data-types.md#text-value)|The text output from the DOS command or application|
|CommandErrorOutput|[Text value](../variable-data-types.md#text-value)|The text describing the errors occurred (if any) during the execution of the DOS command or application|
|CommandExitCode|[Numeric value](../variable-data-types.md#numeric-value)|The command or application exit code. This value is numeric|

### <a name="rundoscommand_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't execute command or console application|Indicates a problem executing the specified command or console application|
|Failed to run script in the allotted time|Indicates a problem running the provided script in the allotted time|

## <a name="runvbscript"></a> Run VBScript

Executes some custom VBScript code and retrieves its output into a variable.

You can use this action to include your own custom VBScript code in the desktop flow, while also having the ability to use variables therein, to generate dynamic VBScript content if needed.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|VBScript to run|Yes|[Text value](../variable-data-types.md#text-value)||The VBScript code to execute. Variables might be included within the script since they evaluate before the execution of the VBScript|
|Fail after timeout|Yes|[Boolean value](../variable-data-types.md#boolean-value)|N/A|Specify whether the VBScript script will run indefinitely or fail after a set period of time|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|10|The maximum number of seconds to wait for the script to complete (-1 for indefinitely)|

### Variables produced
|Argument|Type|Description|
|-----|-----|-----|
|VBScriptOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that might occur during the execution of the VBScript code|

### <a name="runvbscript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run script in the allotted time|Indicates a problem running the provided script in the allotted time|

## <a name="runjavascript"></a> Run JavaScript

Executes some custom JavaScript code and retrieves its output into a variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|JavaScript to run|Yes|[Text value](../variable-data-types.md#text-value)||The JavaScript code to execute. Variables might be included within the script since they evaluate before the JavaScript code's execution|
|Fail after timeout|Yes|[Boolean value](../variable-data-types.md#boolean-value)||Specify whether the JavaScript script will run indefinitely or fail after a set period of time|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|10|The maximum number of seconds to wait for the script to complete (-1 for indefinitely)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JavascriptOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that might occur during the execution of the JavaScript code|

### <a name="runjavascript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run script in the allotted time|Indicates a problem running the provided script in the allotted time|

## <a name="runpowershellscript"></a> Run PowerShell script

Executes some custom PowerShell script and retrieves its output into a variable.

You can use this action to include your own custom PowerShell code in the desktop flow, while also having the ability to use variables therein, to generate dynamic PowerShell content if needed.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PowerShell code to run|Yes|[Text value](../variable-data-types.md#text-value)||The PowerShell code to execute. Variables can be included within the script since they evaluate before the execution of the PowerShell code|
|Fail after timeout|Yes|[Boolean value](../variable-data-types.md#boolean-value)||Specify whether the PowerShell script will run indefinitely or fail after a set period of time|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|10|The maximum number of seconds to wait for the script to complete (-1 for indefinitely)|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|PowershellOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that might occur during the execution of the PowerShell code|

### <a name="runpowershellscript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run PowerShell script|Indicates a problem running the provided PowerShell script|
|Failed to run script in the allotted time|Indicates a problem running the provided script in the allotted time|

## <a name="runpythonscript"></a> Run Python script

Executes Python script code and retrieves its output.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Python script to run|No|[Text value](../variable-data-types.md#text-value)||The Python script code to execute|
|Python version|No|Python 2.7, Python 3.4|Python 2.7|Specify which version of Python to use when executing the script|
|Module folder paths|Yes|[List](../variable-data-types.md#list) of [Folders](../variable-data-types.md#files-and-folders)||The paths of folders where external Python modules lie|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|PythonScriptOutput|[Text value](../variable-data-types.md#text-value)|The script's output|
|ScriptError|[Text value](../variable-data-types.md#text-value)|The errors that might occur during the execution of the Python script code|

### <a name="runpythonscript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run Python script|Indicates a problem running the provided Python script|
|Directory not found|Indicates that the directory wasn't found|

## <a name="rundotnetscript"></a> Run .NET script

Executes .NET (C#/VB.NET) script code and retrieves its output.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Language|N/A|C#/ VB.NET|C#|The language of the script|
|.NET script imports|Yes|[Text value](../variable-data-types.md#text-value)||The .NET script imports to be included in the script|
|References to be loaded|Yes|[Folder](../variable-data-types.md#files-and-folders)||The root path where .NET dynamic link libraries (.dll files) references are located|
|Script parameters|Yes|Script Parameters as defined by the user||Setting the values of the parameters that are defined in the script|
|.NET code to run|No|[Text value](../variable-data-types.md#text-value)||The .NET code to run|

### Variables produced

This action might produce variables, depending on the configuration made by the user when using the **Script Parameters** window.
> [!NOTE]
> In the case the action is configured to produce output parameters (using the **Out** direction when configuring them), you should always ensure that the parameter inside the script is set to a value other than null. Otherwise, the script execution results in an error since the output parameter hasn't been set.

### <a name="rundotnetscript_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to run the .NET script|Indicates a problem running the provided .NET script|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
