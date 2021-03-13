---
title: Known issues and limitations with Power Automate Desktop  | Microsoft Docs
description: This article describes the known issues and limitations with Power Automate Desktop .
author: olegmelnykov
ms.service: power-automate
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Known issues and limitations with Power Automate Desktop 



This article provides details about the known issues and limitations in Power Automate Desktop.

## Datatables

- **Issue**: The preview of datatable variables may not display correctly in the variables pane.

    **Workarounds**: None.


## Desktop recorder

- **Issue**: When adding elements or capturing images, the console and the flow designer might get in the way of the user, as they are not hidden as they should during these procedures.

    **Workarounds**: None.

- **Issue**: The Desktop recorder may not record all steps from the Start Menu or system tray. 

    **Workarounds**: None.

## Web recorder

- **Issue**: When adding elements or capturing images, the console and the designer are visible and they might obstruct the user.

    **Workarounds**: Minimize the designer and console windows when you're adding UI elements or capturing screenshots.

## Loops

- **Issue**: An *Invalid Value* message may be displayed inside the configuration of the **Loop Action** when using a variable in **Start from**, **End to**, or **Increment by** even if the inputs are valid numeric expressions. The actions can still be saved and run successfully despite this message.

    **Workarounds**: None.

## Variables

- **Issue**: In some cases, when you rename a variable or an image, actions that use the renamed variable or image may no longer work as you might expect. 
    
    **Workarounds**: Open and save one of the actions that uses the variable or image resolves the issue.

## Microsoft Excel

- **Issue**: If a Microsoft Excel cell that has a null value is used in a numeric comparison, the flow might end unexpectedly, without an error message.
    
    **Workarounds**: Populate cells with null values with 0 (zero) before each numeric comparison.



[!INCLUDE[footer-include](../includes/footer-banner.md)]