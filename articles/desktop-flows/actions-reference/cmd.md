---
title: CMD session actions reference
description: See all the available CMD session actions.
author: mattp123

ms.service: power-automate
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

# CMD session actions

Use the **Open CMD session** action to commence a command prompt session. Specify the working folder, and optionally change the code page in the **Advanced** section. All CMD session actions require the produced CMD session variable. 

To run a command, deploy the **Write to CMD session** action, specify a command, and select to send **Enter**. The following example creates a new folder in the current working directory.

:::image type="content" source="media\cmd\write-to-cmd-example.png" alt-text="Screenshot of the Write to CMD session action.":::

To ensure that a specific output appears on the command prompt before proceeding with subsequent actions, use the **Wait for text on CMD session** action. Specify the text to expect or enter a regular expression and enable the appropriate option for regular expressions.

:::image type="content" source="media\cmd\wait-for-text-cmd-example.png" alt-text="Screenshot of the Wait for text on cmd session action.":::

When all the CMD tasks are complete, use the **Close CMD session** action to terminate the CMD session.

## <a name="open"></a> Open CMD session

Open a new CMD session.

> [!IMPORTANT]
> To prevent unauthorized access, Windows require administrator rights to access protected folders. To use a protected folder as a working folder in the **Open CMD session** action, run Power Automate with administrator rights. To find more information regarding running Power Automate as an administrator, go to [Run Power Automate with elevated rights](../setup.md#run-power-automate-with-elevated-rights).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Working folder|Yes|[Folder](../variable-data-types.md#files-and-folders)||The full path of the folder to start the CMD session, if applicable|
|Change code page|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to change the session's current code page|
|Encoding|No|ASMO-708 : Arabic (ASMO 708), big5 : Chinese Traditional (Big5), cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), cp866 : Cyrillic (DOS), cp875 : IBM EBCDIC (Greek Modern), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), DOS-720 : Arabic (DOS), DOS-862 : Hebrew (DOS), EUC-CN : Chinese Simplified (EUC), EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), euc-jp : Japanese (EUC), euc-kr : Korean (EUC), GB18030 : Chinese Simplified (GB18030), gb2312 : Chinese Simplified (GB2312), hz-gb-2312 : Chinese Simplified (HZ), IBM-Thai : IBM EBCDIC (Thai), IBM00858 : OEM Multilingual Latin I, IBM00924 : IBM Latin-1, IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), IBM037 : IBM EBCDIC (US-Canada), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), iso-2022-jp : Japanese (JIS), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), iso-8859-1 : Western European (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-8-i : Hebrew (ISO-Logical), iso-8859-9 : Turkish (ISO), Johab : Korean (Johab), koi8-r : Cyrillic (KOI8-R), koi8-u : Cyrillic (KOI8-U), ks_c_5601-1987 : Korean, macintosh : Western European (Mac), shift_jis : Japanese (Shift-JIS), us-ascii : US-ASCII, utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), windows-874 : Thai (Windows), x-Chinese-CNS : Chinese Traditional (CNS), x-Chinese-Eten : Chinese Traditional (Eten), x-cp20001 : TCA Taiwan, x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-cp20261 : T.61, x-cp20269 : ISO-6937, x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, x-cp50227 : Chinese Simplified (ISO-2022), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), x-Europa : Europa, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Norwegian : Norwegian (IA5), x-IA5-Swedish : Swedish (IA5), x-iscii-as : ISCII Assamese, x-iscii-be : ISCII Bengali, x-iscii-de : ISCII Devanagari, x-iscii-gu : ISCII Gujarati, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-or : ISCII Oriya, x-iscii-pa : ISCII Punjabi, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-mac-arabic : Arabic (Mac), x-mac-ce : Central European (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-croatian : Croatian (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-greek : Greek (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-japanese : Japanese (Mac), x-mac-korean : Korean (Mac), x-mac-romanian : Romanian (Mac), x-mac-thai : Thai (Mac), x-mac-turkish : Turkish (Mac), x-mac-ukrainian : Ukrainian (Mac)`|utf-8 : Unicode (UTF-8)|The encoding to use when reading the output|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CmdSession|[CMD session](../variable-data-types.md#cmd)|The CMD session for use with later CMD actions|

### <a name="open_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't start command session|Indicates a problem initiating a CMD session|
|Working directory doesn't exist|Indicates that an error occurred trying to locate the working directory|

## <a name="readfromcmdsession"></a> Read from CMD session

Read the output of a CMD session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|[CMD session](../variable-data-types.md#cmd)||A previously opened CMD session|
|Separate output from error|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to store the standard output and the standard error into different variables or combined into one|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CmdOutput|[Text value](../variable-data-types.md#text-value)|The CMD session's standard output|
|CmdError|[Text value](../variable-data-types.md#text-value)|The CMD session's standard error|

### <a name="readfromcmdsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|CMD session is closed|Indicates that the CMD session specified is closed|

## <a name="write"></a> Write to CMD session

Execute a command on an open CMD session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|[CMD session](../variable-data-types.md#cmd)||A previously opened CMD session variable|
|Command|No|[Text value](../variable-data-types.md#text-value)||The name of the command to execute|
|Send **Enter** after command|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to send an **Enter** the command|

### Variables produced

This action doesn't produce any variables.

### <a name="write_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't write to CMD session|Indicates an error writing to a CMD session|
|CMD session is closed|Indicates that the CMD session specified is closed|

## <a name="waitfortext"></a> Wait for text on CMD session

Wait for a specific text on a previously opened CMD session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|[CMD session](../variable-data-types.md#cmd)||An open CMD session variable|
|Text to wait|No|[Text value](../variable-data-types.md#text-value)||The text or regular expression to wait to appear on standard output or on standard error|
|Is regular expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to wait for a regular expression instead of plain text|
|Ignore case|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether the text to wait should match with standard output or standard error without taking into account the case of the text|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|Specifies whether to wait indefinitely for the text to appear or to fail if the text doesn't show up within a set time period|

> [!NOTE]
> Power Automate's regular expression engine is .NET. To find more information about regular expressions, go to [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

### Variables produced

This action doesn't produce any variables.

### <a name="waitfortext_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|CMD session is closed|Indicates that the CMD session specified is closed|
|Timeout occurred while waiting for text|Indicates that the specified timeout period has elapsed before the text appeared in the command session|

## <a name="close"></a> Close CMD session

Close a previously opened CMD session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CMD session|No|[CMD session](../variable-data-types.md#cmd)||The CMD session to close. Specify this variable in an open CMD session action|

### Variables produced

This action doesn't produce any variables.

### <a name="close_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
