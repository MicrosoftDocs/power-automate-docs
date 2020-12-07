---
title: Clipboard | Microsoft Docs
description: Clipboard Actions Reference
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

# Clipboard

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Set or get data from the clipboard

|<!-- --> |
|-----|
|[Get clipboard text](#gettext)|
|[Set clipboard Text](#settext)|
|[Clear clipboard contents](#clear)|

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

