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



When you create variables in your flows, Power Automate Desktop converts them to a specific type based on their content.

Some of these data types are widely used throughout the application, such as **numbers**, while others, such as **browser instances**, require explicit actions or groups of actions.

## Simple data types

- **Text value** - Any kind of text, from email addresses to the text contents of a .txt file. 

  [Text data type properties](datatype-properties.md#texts)
  
  To create a **Text value** variable, use the **Set Variable action** and populate the input parameter with the desired text without any notation.

  ![An example of a created Text value variable.](media\variable-data-types\create-text-variable.png)

- **Numeric value** - This is the type applied to numbers. Only this data type can be used in mathematical operations. 

  Τo create a **Numeric value** variable, use the **Set Variable action** and populate the input parameter with a number without any notation. 
  
  Except for hardcoded numeric values, you can use mathematical expressions with variables within percentage signs. You can find more information about the mathematical expressions in the [Use variables and the % notation](variable-manipulation.md) article.

  ![An example of a created Numeric value variable.](media\variable-data-types\create-numeric-variable.png)

- **Boolean value** - The value can be either **True** or **False**. 
  
  Τo create a **Boolean value** variable, use the **Set Variable action** and populate the input parameter with the expressions **%True%** or  **%False%%**. 
  
  Additionally, you can create complex expressions using logical operators, variables and the percentage notation. You can find more information about the logical expressions in the [Use variables and the % notation](variable-manipulation.md) article.

  ![An example of a created Boolean value variable.](media\variable-data-types\create-boolean-variable.png)

## Advanced data types

- **List** - Lists are collections of items. Depending on the types of the individual list items, there can be lists of text values, lists of numerical values, and so on. The list data type is the equivalent of a single-dimension array in programming terms. 

  You can create a list through the **Create new list** action and add an item to that list through the **Add item to list** action.  

  ![An example of a list.](media\lists\create-list.png)

  You can also create a list through actions that generate lists as output. For example, the **Read text from file** action can return a list of text values and the **Get files in folder** action returns a list of files.

  To retrieve a specific item of a list, use the following notation: **%VariableName\[ItemNumber\]%**

  In the example below, the flow stores the first number of the previously displayed list to a new variable. Keep in mind that the index should be 0 for the first item of the list.

  ![An expression to access the first item of a list.](media\lists\list-first-item.png)

  A common practice is to use a **For each** action to iterate through the items of a list.

  [List data type properties](datatype-properties.md#lists)

- **Datarow** - A data row contains the values of a single row of a datatable. 

  [Datarow data type properties](datatype-properties.md#datarows) 

- **Datatable** - A datatable contains data in a tabular form. Datatables are the equivalent of two-dimensional arrays in programming terms. 

  A datatable contains rows and columns that describe the position of each item uniquely. Datatables can be considered as lists that contain other datarows as items.

  ![An example of a datatable variable.](media\data-tables\create-data-table.png)

  Power Automate Desktop doesn't provide an action way to create directly a datatable, but three actions generate a datatable as output: the **Read from Excel worksheet** action the **Execute SQL statement** action and the **Extract data from web page** action.

  Alternatively, you can create a data table using the **Set variable** action and the programming array notation. 

  This notation consists of multiple single-dimension arrays separated by commas and enclosed in curly brackets. The final expression must have the following form: **%{['Product1', '10 USD'], ['Product2', '20 USD']}%**.

  ![An example of a datatable variable.](media\data-tables\create-data-table-variable.png)

  To retrieve a specific item of a datatable, use the following notation: **%VariableName\[RowNumber\]\[ColumnNumber\]%**

  For example, suppose that a flow retrieves the content of an Excel worksheet and stores it in the **ExcelData** variable. To access the first cell on the second row of the retrieved table, use the expression displayed below. 
 
  Keep in mind that the **RowNumber** and the **ColumnNumber** should be 0 for the first item (row or column).

  > [!NOTE]
  > The **ExcelData** variable contains a table of values extracted from an Excel worksheet using the **Read from Excel worksheet** action. It contains some values of a specific worksheet and not the whole Excel file.

  ![An epxression to access the first row's second cell of a read Excel file.](media\data-tables\data-table-row-item.png)

  If you want to access a specific column in a datable that contains column headers, use the **%ExcelData[rowNumber]['ColumnName']** notation.

  If you loop through a datatable with a **For Each** action, the variable that will contain the current iteration’s data is considered to be a data row. 

  [Datatable data type properties](datatype-properties.md#datatables) 

- **Custom object** – Contains pairs of properties and values, which can be easily converted to JSON format. 

  To create a new **Custom object**, use the **Set variable** action and an epxression of the following structure: **%{ 'Property1': 'Value1', 'Property2': 'Value2', 'Property3': 'Value2' }%**. 

  ![An example of a created custom object variable.](media\variable-data-types\create-custom-object-variable.png)

### Known issues and limitations

- **Issue**: The values for datarow and datatable variables are not displayed properly in the variables pane.
- **Workarounds**: None.

## Instances

- **Web browser instance** – Contains a browser instance created through the **Launch new Internet Explorer** or other browser launching actions. 

  [Web browser instance data type properties](datatype-properties.md#web-browser-instance)

- **Window instance** – Contains a window instance created through the **Get window** action.

  [Window instance data type properties](datatype-properties.md#window-instance) 

- **Excel instance** – Contains an Excel instance created through the **Launch Excel** action.

  [Excel instance data type properties](datatype-properties.md#excel-instance) 

- **Outlook instance** - Contains an Outlook instance created through the **Launch Outlook** action.

## Connections

- **SQL connection** - Contains a connection to an SQL database established through the **Open SQL connection** action.

  [SQL connection data type properties](datatype-properties.md#sql-connection)

- **Exchange connection** - Contains a connection to an Exchange server established through the **Connect to Exchange server** action.

  [Exchange connection data type properties](datatype-properties.md#exchange-connection)

- **FTP connection** - Contains an FTP connection created through the **Open FTP connection** and **Open secure FTP connection** actions.

  [FTP connection data type properties](datatype-properties.md#ftp-connection) 

## Others

### Active Directory

- **Active Directory entry** - Contains a connection to an Active Directory server established through the **Connect to server** action.
- **Group info** - Contains information about a specified Active Directory group.
- **Group member** - Represents a member of a specified Active Directory group.
- **User info** - Contains information about a specified Active Directory user.

[Active Directory data type properties](datatype-properties.md#active-directory-entry)

### AWS

- **EC2 client** - Contains an EC2 session created through the **Create EC2 session** action.
- **EC2 instance** - Represents a retrieved EC2 instance.
- **EC2 instances info** - Contains information about an EC2 instance.
- **Instance state change** - Contains information about an EC2 instance that was started or stopped.
- **EBS snapshot** - Represents an EBS snapshot.
- **EBS volume** - Represents an EBS volume.

[AWS data type properties](datatype-properties.md#ebs-snapshot) 

### Azure

- **Azure client** - Contains an Azure session created through the **Create session** action.
- **Azure resource group** - Represents a retrieved Azure resource group.
- **Azure managed disk** - Represents a retrieved Azure disk.
- **Azure snapshot** - Represents an Azure snapshot.
- **Azure virtual machine** - Represents a retrieved Azure virtual machine.
- **Azure virtual machine info** - Contains information about an Azure virtual machine.
- **Azure subscription** - Represents a retrieved Azure subscription.

[Azure data type properties](datatype-properties.md#azure-managed-disk) 

### CMD

- **CMD session** - Contains a CMD session created through the **Open CMD session** action.

[CMD data type properties](datatype-properties.md#cmd-session)

### Dates and time

- **Datetime** - Contains date and time information. To create a datetime variable through the **Set Variable action**, populate the input parameter with the expressions **%d"yyyy-MM-dd HH:mm:ss.ff+zzz"%**, where:

  | Notation | Description |
  |----------|-------------|
  | **yyyy** | Year        |
  | **MM**   | Month       |
  | **dd**   | Day         |
  | **HH**   | Hour        |
  | **mm**   | Minitues    |
  | **ss**   | Seconds     |
  | **ff**   | Miliseconds |
  | **zzz**  | UTC Offset	 |

[Dates and time data type properties](datatype-properties.md#dates)

### Email

- **Mail message** - Represents an email message. The **Retrieve emails** action populates these variables.

[Email data type properties](datatype-properties.md#mail-messages)

### Exchange

- **Exchange mail message** - Represents an email message retrieved from an Exchange server. The **Retrieve Exchange email messages** action populates these variables.

[Exchange data type properties](datatype-properties.md#exchange-mail-messages)

### Files and folders

- **File** - Represents a file.
- **Folder** - Represents a folder.

[Files and folders data type properties](datatype-properties.md#files)

### FTP

- **FTP file** - Represents an FTP file.
- **FTP directory** - Represents an FTP directory

[FTP data type properties](datatype-properties.md#ftp-files)

### OCR

- **OCR Engine** – Contains an OCR engine created through the **Create OCR engine** action.

### Outlook

- **Outlook mail message** - Represents an email Outlook message. The **Retrieve email messages from Outlook** action populates these variables.

[Outlook data type properties](datatype-properties.md#outlook-mail-messages) 

### Terminal

- **Terminal session** - Contains a terminal session created through the **Open terminal session** action.

[Terminal data type properties](datatype-properties.md#terminal-session) 

### XML 
- **XML node** - Contains the content of an XML document. The **Read XML from file** action populates these variables.

[XML data type properties.](datatype-properties.md#xml-node) 