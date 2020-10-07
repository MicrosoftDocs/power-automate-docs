---
title: Variable data types | Microsoft Docs
description: Variable data types
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Variable datatypes

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

## Lists

Lists are collections of items. Depending on the types of the individual list items, there can be lists of text values, lists of numerical values, and so on. The list data type is the equivalent of a single-dimension array in programming terms. 

You can create a list through the **Create new list** action and add an item to that list through the **Add item to list** action.

![An example of a list.](media\lists\create-list.png)

You can also create a list through actions that generate lists as output. For example, the **Read text from file** action can return a list of text values and the **Get files in folder** action returns a list of files.

To retrieve a specific item of a list, use the following notation: **%VariableName\[ItemNumber\]%**

In the example below, the flow stores the first number of the previously displayed list to a new variable. Keep in mind that the index should be 0 for the first item of the list.

![An expression to access the first item of a list.](media\lists\list-first-item.png)

A common practice is to use a **For each** action to iterate through the items of a list.

## Datatables

A datatable contains data in a tabular form. Datatables are the equivalent of two-dimensional arrays in programming terms. 

A datatable contains rows and columns that describe the position of each item uniquely. Datatables can be considered as lists that contain other datarows as items.

![An example of a datatable variable.](media\data-tables\data-table-first-item.png)

Power Automate Desktop doesn't provide a direct way to create a datatable, but three actions generate a datatable as output: the **Read from Excel worksheet** action the **Execute SQL statement** action and the **Extract data from web page** action.

To retrieve a specific item of a datatable, use the following notation: **%VariableName\[RowNumber\]\[ColumnNumber\]%**

For example, to access the A2 cell of an Excel file, use the expression displayed below. Keep in mind that the **RowNumber** and the **ColumnNumber** should be 0 for the first item (row or column).

![An epxression to access the first row's second cell of a read Excel file.](media\data-tables\data-table-row-item.png)

If you want to access a specific column in a datable that contains column headers, use the **%ExcelData[rowNumber]['ColumnName']** notation.

If you loop through a datatable with a **For Each** action, the variable that will contain the current iteration’s data is considered to be a data row. 

## Know issues and limitations

- **Issue**: The values for datarow and datatable variables are not displayed properly in the variables pane.
- **Workarounds**: None.

## Other data types

Every variable belongs to a specific type, according to its content. Power Automate Desktop recognizes 17 distinct data types. 

Some of them can be used only with explicit actions, like **FTP connection**, while others are widely used throughout the platform like  **numbers**.  

## Simple data types

- **Text value** - Any kind of text, from email addresses to the text contents of a .txt file. 
- **Numeric value** - This is the type applied to numbers. Only this data type can be used in mathematical operations.
- **Boolean value** - The value can be either **True** or **False**.

## Advanced data types

- **List** - Collection of other items. Lists are the equivalent of single-dimension arrays in programming terms. 
- **Datarow** - A data row contains the values of a single row of a datatable.
- **Datatable** - Contains data in a tabular form. Datatables are the equivalent of a two-dimensional array in programming terms. 
- **Custom object** – Contains pairs of properties and values, which can be easily converted to JSON format. 

## Instances

- **Web browser instance** – Contains a browser instance created through the **Launch new Internet Explorer** or other browser launching actions.
- **Window instance** – Contains a window instance created through the **Get window** action.
- **Excel instance** – Contains an Excel instance created through the **Launch Excel** action.
- **Outlook instance** - Contains an Outlook instance created through the **Launch Outlook** action.

## Connections

- **SQL connection** - Contains a connection to an SQL database established through the **Open SQL connection** action.
- **Exchange connection** - Contains a connection to an Exchange server established through the **Connect to Exchange server** action.

## Active Directory

- **Active Directory entry** - Contains a connection to an Active Directory server established through the **Connect to server** action.
- **Group info** - Contains information about a specified Active Directory group.
- **Group member** - Represents a member of a specified Active Directory group.
- **User info** - Contains information about a specified Active Directory user.

## Azure

- **Azure client** - Contains an Azure session created through the **Create session** action.
- **Azure resource group** - Represents a retrieved Azure resource group.
- **Azure managed disk** - Represents a retrieved Azure disk.
- **Azure snapshot** - Represents an Azure snapshot.
- **Azure virtual machine** - Represents a retrieved Azure virtual machine.
- **Azure virtual machine info** - Contains information about an Azure virtual machine.
- **Azure subscription** - Represents a retrieved Azure subscription.

## AWS

- **EC2 client** - Contains an EC2 session created through the **Create EC2 session** action.
- **EC2 instance** - Represents a retrieved EC2 instance.
- **EC2 instances info** - Contains information about an EC2 instance.
- **Instance state change** - Contains information about an EC2 instance that was started or stopped.
- **EBS snapshot** - Represents an EBS snapshot.
- **EBS volume** - Represents an EBS volume.

## Others

- **Datetime** - Contains date and time information.
- **File** - Represents a file.
- **Folder** - Represents a folder.
- **FTP connection** - Contains an FTP connection created through the **Open FTP connection** and **Open secure FTP connection** actions.
- **FTP file** - Represents an FTP file.
- **FTP directory** - Represents an FTP directory
- **Mail message** - Represents an email message. The **Retrieve emails** action populates these variables.
- **Exchange mail message** - Represents an email message retrieved from an Exchange server. The **Retrieve Exchange email messages** action populates these variables.
- **Outlook mail message** - Represents an email Outlook message. The **Retrieve email messages from Outlook** action populates these variables.
- **OCREngineObject** – Contains an OCR engine created through the **Create OCR engine** action.
- **CMD session** - Contains a CMD session created through the **Open CMD session** action.
- **Terminal session** - Contains a terminal session created through the **Open terminal session** action.
- **XML node** - Contains the content of an XML document. The **Read XML from file** action populates these variables.