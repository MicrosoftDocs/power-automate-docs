---
title: Run macros on an Excel workbook | Microsoft Docs
description: Run macros on an Excel workbook
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/24/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run macros on an Excel workbook

The **Run Excel macro** action enables you to run macros in open Excel instances.

To create an Excel instance, deploy the **Launch Excel action** and select to open the Excel file containing the needed macro.

![The Launch Excel action action.](media/run-macros-excel/launch-excel-action.png)

To run the macro, deploy the **Run Excel macro** action and populate its name in the **Macro** field.

![The Run Excel macro action.](media/run-macros-excel/run-excel-macro-action.png)

To find the name of a macro, open the respective workbook and navigate to **Developer** > **Macros**. The pop-up dialog displays all the available macros in the workbook.

![The Macros oprion in the Developer tab of Excel.](media/run-macros-excel/excel-developer-macros-option.png)

To find the name of a macro assigned to a button, open the workbook, right-click on the button, and select **Assign Macro**. The pop-up dialog is the same as in the previous case.

![The Assign Macro option of an Excel button.](media/run-macros-excel/assign-macro-excel-button.png)