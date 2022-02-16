---
title: Convert a file to Base64 string format | Microsoft Docs
description: Convert a file to Base64 string format
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/13/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Convert a file to Base64 string format

In some web services, you can upload files via the POST method only if the files are in Base64 string format. 

To convert a file to this format, use the **Run PowerShell script** action and populate the following command. Before deploying the **Run PowerShell script** action, use a **Set variable** action to store the path of the file you want to convert into a variable. In this example, the script converts a file specified by the **FilePath** variable.

``` PowerShell
[convert]::ToBase64String((Get-Content -path "%FilePath%" -Encoding byte))
```

> [!NOTE]
> You can find more information regarding PowerShell utility cmdlets in [this article](/powershell/module/microsoft.powershell.utility).

The action produces the **PowershellOutput** variable that stores a text value representing the contents of the specified file in Base64 format.

![Screenshot of the Run PowerShell script action.](media/convert-file-base64-format/run-powershell-scripti-action.png)

