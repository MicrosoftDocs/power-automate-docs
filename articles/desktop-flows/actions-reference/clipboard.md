---
title: Clipboard | Microsoft Docs
description: Clipboard Actions Reference
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

# Clipboard



Set or get data from the clipboard

[Get clipboard text](#gettext)  
[Set clipboard Text](#settext)  
[Clear clipboard contents](#clear)  

## Getting started with clipboard actions

To manipulate or extract the contents of the clipboard, use the Clipboard action group.

To obtain the contents of the clipboard and store them in a variable, use the **Get clipboard text** action.

To change the text of the clipboard, use the **Set clipboard text** action. In the example below, a variable with the current date and time has been set to the clipboard. The next paste command will paste the value of the variable.

![Screenshot of the Set clipboard text action.](media\clipboard\set-clipboard-text-example.png)

To clear the clipboard, use the **Clear clipboard contents** action.


## Clipboard actions

### <a name="gettext"></a> Get clipboard text
Gets clipboard text

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ClipboardText|Text value|The text stored in the clipboard|


##### <a name="gettext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't retrieve clipboard contents|Indicates a problem retrieving clipboard contents|

### <a name="settext"></a> Set clipboard Text
Sets clipboard text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Clipboard text|No|Text value||The text to set to the clipboard|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="settext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Can't set clipboard contents|Indicates a problem setting clipboard contents|

### <a name="clear"></a> Clear clipboard contents
Clears clipboard contents

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="clear_onerror"></a> Exceptions
- This action doesn't include any exceptions



[!INCLUDE[footer-include](../../includes/footer-banner.md)]