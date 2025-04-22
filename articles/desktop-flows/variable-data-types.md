---
title: Variable data types
description: See all the available variable data types in desktop flows.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/29/2024
ms.author: dipapa
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Variable data types

When you create variables in your flows, Power Automate converts them to a specific type based on their content.

Some of these data types are widely used throughout the application, such as **numbers**, while others, such as **browser instances**, require explicit actions or groups of actions.

## Simple data types

Simple data types represent single values, such as texts and numbers. You can use these data types independently or use them to create more complex data structures, such as lists and datatables.

### Text value

This is any kind of text, from email addresses to the text contents of a .txt file. 

[Text data type properties](datatype-properties.md#texts)

To create a **Text value** variable, use the **Set variable** action and populate the input parameter with the desired text without any notation.

![Screenshot of a Set variable action that creates a Text value variable.](media\variable-data-types\create-text-variable.png)

### Numeric value

Numeric is the type applied to numbers. Only this data type can be used in mathematical operations. 

Τo create a **Numeric value** variable, use the **Set variable** action and populate the input parameter with a number without any notation. 

Except for hardcoded numeric values, you can use mathematical expressions with variables within percentage signs. For more information about mathematical expressions, go to [Use variables and the % notation](variable-manipulation.md).

![Screenshot of a Set variable action that creates a Numeric value variable.](media\variable-data-types\create-numeric-variable.png)

### Boolean value

The value can be either **True** or **False**. 
  
Τo create a **Boolean value** variable, use the **Set variable** action and populate the input parameter with the expressions **%True%** or  **%False%**. 

Additionally, you can create complex expressions using logical operators, variables, and the percentage notation. For more information about logical expressions, go to [Use variables and the % notation](variable-manipulation.md).

![Screenshot of a Set variable action that creates a Boolean value variable.](media\variable-data-types\create-boolean-variable.png)

## Advanced data types

Advanced data types represent complex data structures. They function as collections of other data types that you can access as one entity.

### List

Lists are collections of items. Depending on the types of the individual list items, there can be lists of text values, lists of numerical values, and so on. The list data type is the equivalent of a single-dimension array in programming terms. 

You can create a list through the **Create new list** action and add an item to that list through the **Add item to list** action.  

![Screenshot of a flow that creates a list.](media\lists\create-list.png)

You can also create a list through actions that generate lists as output. For example, the **Read text from file** action can return a list of text values and the **Get files in folder** action returns a list of files.

To retrieve a specific item in a list, use the following notation: **%VariableName\[ItemNumber\]%**

In the example below, the flow stores the first number of the previously displayed list to a new variable. Keep in mind that the index should be 0 for the first item of the list.

![Screenshot of an expression that accesses the first item of a list.](media\lists\list-first-item.png)

A common practice is to use a **For each** action to iterate through the items of a list.

If you need to access only a specific part of a list, use the **%VariableName[StartIndex:StopIndex]%** notation. For example, the expression **%List[2:4]%** retrieves the third and fourth items of the list. The item in the **StopIndex** position is the boundary of the slicing and doesn't get retrieved.

To slice a list from the start to a specific item, don't set a **StartIndex** value, for example, **%List[:4]%**. To slice a list from a specific index to the end, don't set a **StopIndex** value, for example, **%List[2:]%**. 

[List data type properties](datatype-properties.md#lists)

### Datatable 

Datatables contain data in a tabular form and are the equivalent of two-dimensional arrays in programming terms. 

A datatable contains rows and columns that describe the position of each item uniquely. Datatables can be considered as lists that contain datarows as items.

![Screenshot of the contents of a datatable variable.](media\data-tables\create-data-table.png)

Power Automate provides the **Create new data table** action to generate new datatables. After deploying the action, you can use the visual builder to populate values and rename the column headers.

![Screenshot of the visual builder of the Create new data table action.](media\data-tables\create-new-data-table-action-visual-builder.png)

Apart from the **Create new data table** action, three more actions produce datatables to store extracted data: the **Read from Excel worksheet**, **Execute SQL statement**, and **Extract data from web page** actions.

Additionally, you can create a datatable using the **Set variable** action and the programming array notation. This notation consists of multiple single-dimension arrays separated by commas and enclosed in curly brackets. The final expression must have the following form: **%{['Product1', '10 USD'], ['Product2', '20 USD']}%**.

![Screenshot of Set variable action that creates a datatable.](media\data-tables\create-data-table-variable.png)

If you want to add column headers while creating a new datatable using the array notation, use the **^['ColumnName1', 'ColumnName2']** expression for the first row. 

![Screenshot of a Set variable action that creates a new datatable with column headers.](media\data-tables\set-variable-action-datatable-column-headers.png)

To add a new row to an existing table, use the **Insert row into data table** action. Alternatively, create an expression containing the variable name of the datatable, a plus character (**+**), and the values you want to add in brackets.

![Screenshot of a Set variable action that adds a new row to a datatable.](media\data-tables\set-variable-action-datatable-new-row.png)

Besides inserting rows into datatables, desktop flows offer various actions that manipulate datatables. You can find a full list with these actions in the [variable actions reference](actions-reference/variables.md).

To retrieve a specific item of a datatable, use the following notation: **%VariableName\[RowNumber\]\[ColumnNumber\]%**. Keep in mind that the **RowNumber** and the **ColumnNumber** should be 0 for the first item (row or column).

For example, suppose that a flow retrieves the content of an Excel worksheet and stores it in the **ExcelData** variable. To access the first cell on the second row of the retrieved table, use the expression displayed below. 

![Screenshot of an expression that accesses the first row's second cell of a read Excel file.](media\data-tables\data-table-row-item.png)

> [!NOTE]
> The **ExcelData** variable contains a table of values extracted from an Excel worksheet using the **Read from Excel worksheet** action. It contains some values of a specific worksheet and not the whole Excel file.

If you want to access a specific column in a datable that contains column headers, use the **%ExcelData[rowNumber]['ColumnName']%** notation.

If you loop through a datatable with a **For Each** action, the variable that contains the current iteration’s data is considered to be a datarow. 

Similarly to lists, you use the **%VariableName[StartRow:StopRow]%** notation to access a specific part of a datatable. The expression retrieves only the rows defined by the two indexes, while the **StopRow** position is the boundary of the slicing and doesn't get retrieved.

To slice a datatable from the first row to a specific row, don't use a **StartRow** value, for example, **%Datatable[:4]%**. Likewise, to slice a datatable from a specific row to the end, don't use a **StopRow** value, for example, **%Datatable[2:]**%. 

[Datatable data type properties](datatype-properties.md#datatables) 

### Datarow

A datarow contains the values of a single row of a datatable. When you loop through a datatable with a **For Each** action, the variable that contains the current iteration’s data is a datarow. 

To retrieve a specific item of a datarow, use the following notation: **%VariableName[ItemNumber]%**

Alternatively, you can use the **%VariableName['ColumnName']%** notation. The name of each column is defined by the datatable from which you retrieved the datarow.

[Datarow data type properties](datatype-properties.md#datarows)

![Screenshot of the contents of a datarow variable.](media\data-rows\data-row-data-type.png) 

### Custom object

Contains pairs of properties and values, which can be easily converted to JSON format. 

To create a new empty **Custom object**, use the **Set variable** action and populate the following expression **%{{ }}%**. To create a new **Custom object** and initialize it with properties and values, use an expression of the following structure: **%{ 'Property1': 'Value1', 'Property2': 'Value2', 'Property3': 'Value2' }%**.

![Screenshot of Set variable action that creates a new custom object.](media\variable-data-types\create-custom-object-variable.png)

> [!IMPORTANT]
> Reserved keywords can't be used as custom object properties. For the full list of reserved keywords go to [Reserved keywords in desktop flows](reserved-keywords.md).

To update the value of an existing property or add a new one, deploy a **Set variable** action, populate the property's name in the **Set** field, and enter its value in the **To** field.

![Screenshot of a Set variable action that adds a new property to a custom object.](media\variable-data-types\add-property-custom-object.png)

Apart from literal values, you can use variables to dynamically set the properties and values of custom objects. For example, the following flow uses two variables to add a new property to a new empty custom object.

![Screenshot of a flow that uses variables to add a new property to a custom object.](media\variable-data-types\add-property-custom-object-dynamically.png)

## Connector object

Connector objects store information from cloud connectors and work similarly to custom objects. Their properties usually contain lists of other connector objects. Accessing values works as in custom objects, although accessing nested values might require more complicated expressions.

:::image type="content" source="media\variable-data-types\connector-object.png" alt-text="Screenshot of a custom object variable in the variables viewer.":::

### List of PDF table info

A variable of this data type can be produced only through the **Extract tables from PDF** action.

Each item on the list describes an extracted table and provides all the essential information about it. To access a specific datatable info item, use the **%VariableName[ItemNumber]%** notation.

![Screenshot of a List of PDF table info.](media\variable-data-types\list-pdf-table-info.png) 

Every list item provides four properties that allow you to get a specific detail independently. The available properties are the following:

- **DataTable** – Returns the extracted table.
- **TableStartingPage** – Returns the index of the file page that contains the start of the table.
- **TableEndingPage** – Returns the index of the file page that contains the end of the table.
- **TableOrderInPage** – Returns the order of the table on the page. 

You can find more information regarding the properties of this data type in [Variables datatype properties](datatype-properties.md#pdf-table-info).

![Screenshot of the properties of a list of PDF table info.](media\variable-data-types\list-pdf-table-info-properties.png) 

To access the value of a specific property, use the **%VariableName[ItemNumber].PropertyName%** notation. For example, the following expression returns the datatable value of the first item of the **ExtractedPDFTables** variable.

![Screenshot of the datatable contained in a list of PDF table info variables.](media\variable-data-types\list-pdf-table-info-data-table-notation.png) 

### Known issues and limitations

- **Issue**: When a datatable or datarow cell contains a multiline entry, the variable viewer displays only the first line of it. 
- **Workarounds**: None.

## Instances

- **Web browser instance** – Contains a browser instance created through the **Launch new Internet Explorer** or other browser launching actions. 

  [Web browser instance data type properties](datatype-properties.md#web-browser-instance)

- **Window instance** – Contains a window instance created through the **Get window** action.

  [Window instance data type properties](datatype-properties.md#window-instance) 

- **Excel instance** – Contains an Excel instance created through the **Launch Excel** action.

  [Excel instance data type properties](datatype-properties.md#excel-instance) 

- **Outlook instance** – Contains an Outlook instance created through the **Launch Outlook** action.

## Connections

- **SQL connection** – Contains a connection to an SQL database established through the **Open SQL connection** action.

  [SQL connection data type properties](datatype-properties.md#sql-connection)

- **Exchange connection** – Contains a connection to an Exchange server established through the **Connect to Exchange server** action.

  [Exchange connection data type properties](datatype-properties.md#exchange-connection)

- **FTP connection** – Contains an FTP connection created through the **Open FTP connection** and **Open secure FTP connection** actions.

  [FTP connection data type properties](datatype-properties.md#ftp-connection) 

## Others

This section presents all the available data types that don't belong to any of the previous categories.

### General value

- **General value** – This data type is used during design time when Power Automate can't define the data type of a variable or an input parameter. General values get converted to other data types during runtime based on their data. 

### Active Directory

- **Active Directory entry** – Contains a connection to an Active Directory server established through the **Connect to server** action.
- **Group info** – Contains the name, the display name, a description, and the members of a specified Active Directory group.
- **Group member** – Represents a member of a specified Active Directory group.
- **User info** – Contains information about a specified Active Directory user, such as first and last name, initials and a distinguished name, work details (company, department, and title), contact information (telephone number, extension, and email), and location (country/region, city, state, street address, and postal code).

[Active Directory data type properties](datatype-properties.md#active-directory-entry)

### Amazon Web Services (AWS)

- **EC2 client** – Contains an EC2 session created through the **Create EC2 session** action.
- **EC2 instance** – Represents a retrieved EC2 instance.
- **EC2 instances info** – Contains information about an EC2 instance.
- **Instance state change** – Contains information about an EC2 instance that was started or stopped.
- **EBS snapshot** – Represents an EBS snapshot.
- **EBS volume** – Represents an EBS volume.

[AWS data type properties](datatype-properties.md#ebs-snapshot) 

### Azure

- **Azure client** – Contains an Azure session created through the **Create session** action.
- **Azure resource group** – Represents a retrieved Azure resource group.
- **Azure managed disk** – Represents a retrieved Azure disk.
- **Azure snapshot** – Represents an Azure snapshot.
- **Azure virtual machine** – Represents a retrieved Azure virtual machine.
- **Azure virtual machine info** – Contains information about an Azure virtual machine.
- **Azure subscription** – Represents a retrieved Azure subscription.

[Azure data type properties](datatype-properties.md#azure-managed-disk) 

### CMD

- **CMD session** – Contains a CMD session created through the **Open CMD session** action.

[CMD data type properties](datatype-properties.md#cmd-session)

### Credentials

- **Credential** – Contains a credential retrieved through the **Get credential (preview)** action.

[Credential data type properties](datatype-properties.md#credential)

### Dates and time

- **Datetime** – Contains date and time information. To create a datetime variable through the **Set Variable** action, populate the input parameter with the expressions **%d"yyyy-MM-dd HH:mm:ss.ff+zzz"%**, where:

  | Notation | Description |
  |----------|-------------|
  | **yyyy** | Year        |
  | **MM**   | Month       |
  | **dd**   | Day         |
  | **HH**   | Hour        |
  | **mm**   | Minutes    |
  | **ss**   | Seconds     |
  | **ff**   | Milliseconds |
  | **zzz**  | UTC Offset	 |

  For example, **%d"2022-03-25"%** assigns the 25th of March 2022 date to the target variable.

[Dates and time data type properties](datatype-properties.md#dates)

### Email

- **Mail message** – Represents an email message. The **Retrieve emails** action populates these variables.

[Email data type properties](datatype-properties.md#mail-messages)

### Exchange

- **Exchange mail message** – Represents an email message retrieved from an Exchange server. The **Retrieve Exchange email messages** action populates these variables.

[Exchange data type properties](datatype-properties.md#exchange-mail-messages)

### Files and folders

- **File** – Represents a file.
- **Folder** – Represents a folder.
- **FileSystemObject** – Represents either a folder or a file. This data type is used in input parameters that accept folders and files.

[Files and folders data type properties](datatype-properties.md#files)

### FTP

- **FTP file** – Represents an FTP file.
- **FTP directory** – Represents an FTP directory

[FTP data type properties](datatype-properties.md#ftp-files)

### OCR

- **OCR Engine** – Contains an OCR engine created through the **Create OCR engine** action.

### Outlook

- **Outlook mail message** – Represents an email Outlook message. The **Retrieve email messages from Outlook** action populates these variables.

[Outlook data type properties](datatype-properties.md#outlook-mail-messages) 

### Terminal

- **Terminal session** – Contains a terminal session created through the **Open terminal session** action.

[Terminal data type properties](datatype-properties.md#terminal-session) 

### XML 
- **XML node** – Contains the content of an XML document. The **Read XML from file** action populates these variables.

[XML data type properties](datatype-properties.md#xml-node) 

### Error
- **Error** – Contains information about the last occurred error in the desktop flow. The **Get last error** action creates this type of variable.

[Error properties](datatype-properties.md#error) 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
