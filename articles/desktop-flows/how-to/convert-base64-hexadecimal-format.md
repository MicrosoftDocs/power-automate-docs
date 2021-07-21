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

To convert the Base64 text to hexadecimal format, use the **Run PowerShell script** action and populate the following command. Before deploying the **Run PowerShell script** action, use a **Set variable** action to store the text you want to convert into a variable. In this example, the PowerShell command converts the text stored into the **Base64Text** variable.

``` PowerShell
[System.Convert]::FromBase64String("%Base64Text%") | Format-Hex
```

> [!NOTE]
> You can find more information regarding PowerShell commands in [this article](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/?view=powershell-7.1).

The action produces the PowershellOutput variable that stores the encrypted or hashed value in hexadecimal format.

![The Run PowerShell script action.](media/convert-base64-hexadecimal-format/run-powershell-script-action.png)