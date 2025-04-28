---
title: Run macros on an Excel workbook
description: Run macros on an Excel workbook
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/24/2021
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

# Run macros on an Excel workbook

The **Run Excel macro** action enables you to run macros in open Excel instances.

To create an Excel instance, deploy the **Launch Excel** action and select to open the Excel file containing the needed macro.

> [!IMPORTANT]
> To run macros stored in your personal macro workbook (PERSONAL.XLSB), enable the **Nest under a new Excel process** and **Load add-ins and macros** options located in the advanced options of the **Launch Excel** action.

![Screenshot of the Launch Excel action.](media/run-macros-excel/launch-excel-action.png)

To run the macro, deploy the **Run Excel macro** action and populate its name in the **Macro** field.

![Screenshot of the Run Excel macro action.](media/run-macros-excel/run-excel-macro-action.png)

To find the name of a macro, open the respective workbook and navigate to **Developer** > **Macros**. The pop-up dialog displays all the available macros in the workbook.

![Screenshot of the Macros oprion in the Developer tab of Excel.](media/run-macros-excel/excel-developer-macros-option.png)

To find the name of a macro assigned to a button, open the workbook, right-click on the button, and select **Assign Macro**. The pop-up dialog is the same as in the previous case.

![Screenshot of the Assign Macro option of an Excel button.](media/run-macros-excel/assign-macro-excel-button.png)
