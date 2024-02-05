---
title: Convert Excel to PDF using VBScript
description: Convert Excel to PDF using VBScript
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/13/2021
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

# Convert Excel to PDF using VBScript

To convert an Excel file to PDF:

1. Use the **Set variable** action to create a new variable containing the path of the Excel file you want to convert. In this example, the variable is named **ExcelFile**.

    ![Screenshot of the Set variable action containing the Excel file path.](media/convert-excel-pdf-vbscript/set-variable-action-excel-file.png)

1. Use a second **Set variable** action to create a variable containing the path of the PDF file you want to create. In this example, the variable is named **PdfFile**.

    ![Screenshot of the Set variable action containing the pdf file path.](media/convert-excel-pdf-vbscript/set-variable-action-pdf-file.png)

1. Deploy the **Run VBScript** action and populate the following code. 

    ``` VBScript
    Dim Excel
    Dim ExcelDoc

    'Opens the Excel file'
    Set Excel = CreateObject("Excel.Application")
    Set ExcelDoc = Excel.Workbooks.open("%ExcelFile%")

    'Creates the pdf file'
    Excel.ActiveSheet.ExportAsFixedFormat 0, "%PdfFile%" ,0, 1, 0,,,0

    'Closes the Excel file'
    Excel.ActiveWorkbook.Close
    Excel.Application.Quit
    ```

    ![Screenshot of the configured Run VBScript action.](media/convert-excel-pdf-vbscript/run-vbscript-action.png)
