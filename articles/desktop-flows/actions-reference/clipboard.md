---
title: Clipboard actions reference
description: See all the available clipboard actions.
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

# Clipboard actions

Use the Clipboard actions to manipulate or extract the contents of your machine's clipboard.

To retrieve the contents of the clipboard and store them in a variable, use the **Get clipboard text** action.

To change the text of the clipboard, use the **Set clipboard text** action. The following example uses a variable to set the current date and time on the clipboard.

:::image type="content" source="media\clipboard\set-clipboard-text-example.png" alt-text="Screenshot of the Set clipboard text action.":::

To clear the clipboard, use the **Clear clipboard contents** action.

## <a name="gettext"></a> Get clipboard text

Gets clipboard text.

### Input parameters

This action doesn't require any input.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ClipboardText|[Text value](../variable-data-types.md#text-value)|The text stored in the clipboard|

### <a name="gettext_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't retrieve clipboard contents|Indicates a problem retrieving clipboard contents|

## <a name="settext"></a> Set clipboard Text

Sets clipboard text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Clipboard text|No|[Text value](../variable-data-types.md#text-value)||The text to set to the clipboard|

### Variables produced

This action doesn't produce any variables.

### <a name="settext_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't set clipboard contents|Indicates a problem setting clipboard contents|

## <a name="clear"></a> Clear clipboard contents

Clears clipboard contents.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="clear_onerror"></a> Exceptions
This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
