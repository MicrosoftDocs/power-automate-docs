---
title: Run SQL queries on Excel files | Microsoft Docs
description: Run SQL queries on Excel files
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/22/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run SQL queries on Excel files

Although Excel actions can handle most Excel automation scenarios, SQL queries can retrieve and manipulate significant amounts of Excel data more efficiently.

Suppose a flow has to modify Excel registries that contain a particular value. To achieve this functionality without SQL queries, you need loops, conditionals, and multiple Excel actions.

Oppositely, you can implement this functionality with SQL queries using only two actions, the **Open SQL connection** action and the **Execute SQL statements** action.

## Open an SQL connection to an Excel file

Before running an SQL query, you have to open a connection with the Excel file you want to access. 

To establish the connection, deploy the **Open SQL connection** action and populate the following connection string in its properties.

**Provider=Microsoft.ACE.OLEDB.12.0;Data Source=%Excel_File_Path%;Extended Properties="Excel 12.0 Xml;HDR=YES";**

> [!NOTE]
> To use the following connection string successfully, you have to download and install [Microsoft Access Database Engine 2010 Redistributable](https://www.microsoft.com/download/details.aspx?id=13255).

The **%Excel_File_Path%** variable, located in the source part of the connection string, contains the path of the Excel file.

You can initialize this variable using a **Set variable** action before the **Open SQL connection** action. Alternatively, you can replace it with the hardcoded path of the file.

## Open an SQL connection to a password-protected Excel file

A different approach is required in scenarios where you run SQL queries on password-protected Excel files. The **Open SQL connection** action can't connect to password-protected Excel files, so you have to remove the protection.

To achieve that, launch the Excel file using the **Launch Excel** action. The file is password-protected, so populate the appropriate password in the **Password** field.

Next, deploy the appropriate UI automation actions and navigate to **File** > **Info** > **Protect Workbook** > **Encrypt with Password**.

> [!NOTE}
> You can find more information about UI automation and how to use the respective actions in [Automate desktop flows](../desktop-automation.md).

After selecting **Encrypt with Password**, populate an empty string in the popup dialog using the **Populate text field in windows** action. To notate the empty string, use the following expression: **%""%**.

To press the **OK** button and apply the change, deploy the **Press button in window** action.

Lastly, deploy the **Close Excel** action to save the non-protected workbook as a new Excel file.

After saving the file, follow the instructions in [Open an SQL connection to Excel files](sql-queries-excel.md) to open a connection to it.

When the manipulation of the Excel file is completed, use the **Delete file(s)** action to delete the non-protected copy of the Excel file.


