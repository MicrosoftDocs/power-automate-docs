---
title: Convert Base64 text to hexadecimal format | Microsoft Docs
description: Convert Base64 text to hexadecimal format
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/13/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Convert Base64 text to hexadecimal format

Although cryptography actions produce variables encoded in Base64 format, some cryptography engines use the hexadecimal representation of the encrypted value.

To convert the Base64 text to hexadecimal format, use the **Run PowerShell script** action and populate the following command. Before running the flow, replace the **Text-in-Base64-format** placeholder with the text you want to convert or a variable containing it.

``` PowerShell
[System.Convert]::FromBase64String("Text-in-Base64-format") | Format-Hex
```

The action produces the PowershellOutput variable that stores the encrypted or hashed value in hexadecimal format.

![The Run PowerShell script action.](media/convert-base64-hexadecimal-format/run-powershell-script-action.png)