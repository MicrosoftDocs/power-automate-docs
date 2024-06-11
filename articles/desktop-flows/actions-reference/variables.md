---
title: Variables actions reference
description: See all the available variables actions.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 06/18/2024
ms.author: kenseongtan
ms.reviewer: dipapa
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
ms.contributors:
 - kenseongtan
 - dipapa
 - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Variables actions

To manually create a variable in a desktop flow, deploy the **Set variable** action. This action requires you to provide a name and a value for the new variable.

:::image type="content" source="media/variables/set-var-action-properties.png" alt-text="Screenshot of the Set variable action.":::

> [!IMPORTANT]
> Reserved keywords can't be used as variable names. For the full list of reserved keywords go to [Reserved keywords in desktop flows](../reserved-keywords.md).

To increase or decrease the value of a numeric variable, use the **Increase variable** and **Decrease variable** actions, respectively.

:::image type="content" source="media/variables/increase-var-action-properties.png" alt-text="Screenshot of the Increase variable action.":::

Most actions output their result into a variable. For example, the **Create new list** action produces an empty list.

Similarly, the **Generate random number** action produces a random numeric value. If you enable **Generate multiple numbers** in this action, you create a list variable containing multiple random numeric values.

:::image type="content" source="media/variables/generate-random-num-action-properties.png" alt-text="Screenshot of the Generate random number action.":::

To add items to an existing list, deploy the **Add item to list** action, and populate a hard-coded value or a variable to define the item to add. Likewise, you can remove items from a list with the **Remove item from list** action.

>[!NOTE]
>List indexes start from 0, meaning that the first item in the list always has an index of 0. Use the notation **%ListName[0]%** to refer to the first item in the list, **%ListName[1]%** to the second, and so on.

If you want to create a data table variable, deploy the **Create new data table** action and specify the initial items of it using the visual builder.

To manipulate a data table variable, use the actions of the respective action subgroup, such as the **Find or replace in data table** and **Update data table item** actions.

:::image type="content" source="media/variables/create-new-data-table-action-properties.png" alt-text="Screenshot of the Create new data table action.":::

## <a name="createnewdatatable"></a> Create new data table

Creates a new data table variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|New table|No|[Datatable](../variable-data-types.md#datatable)||The input data table|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|DataTable|[Datatable](../variable-data-types.md#datatable)|The new data table|

### <a name="createnewdatatable_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="addrowtodatatable"></a> Insert row into data table

Inserts a row at the end or before a specific index value.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must have been previously specified by an action that produces a data table variable|
|Into location|N/A|End of data table, Before row index|End of data table|Specify whether to insert the new row at the end of the data table or before a specified row index|
|Row index|No|[Numeric value](../variable-data-types.md#numeric-value)||Insert the row index value to be used when before row index is specified as the into location parameter|
|New value(s)|No|[List](../variable-data-types.md#list), [Datarow](../variable-data-types.md#datarow)||This parameter accepts a list or datarow variable where the column count should match the column count in the data table|

### Variables produced

This action doesn't produce any variables.

### <a name="addrowtodatatable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Item index is out of range|Indicates that the provided item index is out of range|
|Invalid input arguments|Indicates that there's an invalid input parameter|
|Incompatible type error|Indicates that an input parameter of an incompatible type is provided|

## <a name="deleterowfromdatatable"></a> Delete row from data table

Delete a data table row at the corresponding row index.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must be specified by an action that produces a data table variable|
|Row index|No|[Numeric value](../variable-data-types.md#numeric-value)||The row index within a data table that should be deleted|

### Variables produced

This action doesn't produce any variables.

### <a name="deleterowfromdatatable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Item index is out of range|Indicates that the specified data table item is out of range|

## <a name="modifydatatableitem"></a> Update data table item

Update a data table row item on a defined column.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must have been previously specified by an action that produces a data table variable.|
|Column|No|[Text value](../variable-data-types.md#text-value)||The column name or index of the item to update.|
|Row|No|[Numeric value](../variable-data-types.md#numeric-value)||The row index of the item to update.|
|New value|No|[Text value](../variable-data-types.md#text-value)||The new value to update at the specified row index and column.|

### Variables produced

This action doesn't produce any variables.

### <a name="modifydatatableitem_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Item index is out of range|Indicates that the specified data table item is out of range|
|Column name doesn't exist|Indicates that the provided column name doesn't exist|
|Column index is out of range|Indicates that the provided column index is out of range|
|Incompatible type error|Indicates that an input parameter of an incompatible type was provided|

## <a name="findorreplaceindatatable"></a> Find or replace in data table

Finds and/or replaces data table values.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must have been previously specified by an action that produces a data table variable|
|Search mode|N/A|Find, Find and replace|Find|The mode to search with (find or find and replace)|
|All matches|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to find or replace text in all the matching cells found or the first matching cell only|
|Text to find|No|[Text value](../variable-data-types.md#text-value)||The text to find in the data table|
|Find using a regular expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to use a regular expression to match the cell contents with the text to find|
|Match case|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to search for case-sensitive data|
|Match entire cell contents|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to search for cells that contain just the specified text|
|Text to replace with|No|[Text value](../variable-data-types.md#text-value)||The text used to replace the matching cells|
|Search by|N/A|Everywhere, On column|Everywhere|The order in which to search for the text (everywhere, or on column)|
|Column index or name|No|[Text value](../variable-data-types.md#text-value)||The column header or index value|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|DataTableMatches|[Datatable](../variable-data-types.md#datatable)|The data table containing the row and column indexes for matches|

### <a name="findorreplaceindatatable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Provided regular expression is invalid|Indicates that the provided regular expression is invalid|
|Column name doesn't exist|Indicates that the provided column name doesn't exist|
|Column index is out of range|Indicates that the provided column index is out of range|
|Incompatible type error|Indicates that an input parameter of an incompatible type is provided|

## <a name="addcolumntodatatableaction"></a> Insert column into data table

Inserts a column at the end or before a specific index value.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must be specified by an action that produces a data table variable.|
|Into location|N/A|End of data table, Before column index|End of data table|Specify whether to insert the new column at the end of the data table or before a specified column index.|
|Column name|No|[Text value](../variable-data-types.md#text-value)||Specify the header of the new column.|
|Column index|No|[Numeric value](../variable-data-types.md#numeric-value)||Specify the column index value that is utilized when the **Before column index** option is selected for the **Into location** parameter.|

### Variables produced

This action doesn't produce any variables.

### <a name="addcolumntodatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column index is out of range|Indicates that the provided column index is out of range.|
|Duplicate column name|Indicates that the provided column name already exists.|

## <a name="deletecolumnfromdatatableaction"></a> Delete column from data table

Delete a data table column at the specified column index or column name.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must be specified by an action that produces a data table variable.|
|Specify column with|N/A|Name, Index|Name|Specify whether to find the column by name or index.|
|Column name|No|[Text value](../variable-data-types.md#text-value)||The name of the column that should be deleted.|
|Column index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the column that should be deleted. Column indexes start from 0.|

### Variables produced

This action doesn't produce any variables.

### <a name="deletecolumnfromdatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column name doesn't exist|Indicates that the provided column name doesn't exist|
|Column index is out of range|Indicates that the provided column index is out of range|

## <a name="deleteemptyrowsfromdatatableaction"></a> Delete empty rows from data table

Deletes the rows of the data table that have all of their cells empty.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. This variable must have been previously specified by an action that produces a data table variable|

### Variables produced

This action doesn't produce any variables.

### <a name="deleteemptyrowsfromdatatableaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="deleteduplicaterowsfromdatatableaction"></a> Delete duplicate rows from data table

Deletes all the rows that are duplicate from the data table, if the values have the same data type in each column.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. The specified variable must be defined through an action that generates a data table variable.|

### Variables produced

This action doesn't produce any variables.

### <a name="deleteduplicaterowsfromdatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Type mismatch in the cells of a column|​Indicates that two or more values in a single column are of different data type|

## <a name="cleardatatableaction"></a> Clear data table

Deletes all the rows of the data table, keeping table headers unaffected.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. The specified variable must be defined through an action that generates a data table variable.|

### Variables produced

This action doesn't produce any variables.

### <a name="cleardatatableaction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="sortdatatableaction"></a> Sort data table

Sorts the data table rows in ascending or descending order by the specified column, if all its values have the same data type.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. The specified variable must be defined through an action that generates a data table variable.|
|Specify column with|N/A|Name, Index|Name|Specify whether to find the column by name or index.|
|Column name|No|[Text value](../variable-data-types.md#text-value)||The name of the column that should be sorted.|
|Column index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index of the column that should be sorted. Column indexes start from 0.|
|Order|N/A|Ascending, Descending|Ascending|The order to sort the data table.|

### Variables produced

This action doesn't produce any variables.

### <a name="sortdatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column name doesn't exist|​Indicates that the provided column name doesn't exist|
|Column index is out of range|​Indicates that the provided column index is out of range|
|Type mismatch in the cells of a column|​Indicates that two or more values in a single column are of different data type|

## <a name="filterdatatableaction"></a> Filter data table

Filters the data table rows based on the applied rules.

In the action's built-in wizard that helps you create the filters needed, you can apply multiple filters to different columns that are defined by name or index. Every filter is composed of a specific column it targets, an operator that is selected, and the value that is assigned to it.

In addition, multiple filters are applied together via AND and/or OR rules. AND rules are resolved first in the resulting filter expression, followed by the OR rules.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. The specified variable must be defined through an action that generates a data table variable.|
|Filters to apply|No|Filtering rules as defined by the user|N/A|Filtering rules applied to the defined columns|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FilteredDataTable|[Datatable](../variable-data-types.md#datatable)|The generated data table after applying the filters|

### <a name="filterdatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column name doesn't exist|​Indicates that the provided column name doesn't exist|
|Column index is out of range|​Indicates that the provided column index is out of range|
|Type mismatch in the cells of a column|​Indicates that two or more values in a single column are of different data type|

## <a name="mergedatatablesaction"></a> Merge data tables

Merges two data tables together, specifying the merging behavior in case their number of columns is different.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First data table|No|[Datatable](../variable-data-types.md#datatable)||The first data table variable to work with. This is also the action's produced variable that holds the merged data table|
|Second data table|No|[Datatable](../variable-data-types.md#datatable)||The second data table that is merged into the first data table|
|Merge mode|N/A|Add extra columns, Ignore extra columns, Error on extra columns|Add extra columns|The merging behavior that is applied when the tables don't have the same number of columns|

### Variables produced

This action doesn't produce any variables.

### <a name="mergedatatablesaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Missing Schema|​​Indicates that the data tables don't have the same number of columns|

## <a name="joindatatableaction"></a> Join data tables

Joins two data tables based on the specified join rule.

In the action's built-in wizard that helps you create the join rules needed, you can set multiple rules by specifying the column from the first and the second datatable accordingly, and the comparison operator that applies between them.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First data table|No|[Datatable](../variable-data-types.md#datatable)||The first data table variable to work with. The specified variable must be defined through an action that generates a data table variable. |
|Second data table|No|[Datatable](../variable-data-types.md#datatable)||The second data table variable to work with. The specified variable must be defined through an action that generates a data table variable. |
|Join operation|N/A|Inner, Left, Full|Inner|The join operation that is used to join the two tables|
|Join rules|No|Join rules as defined by the user|N/A|Define the columns and the operation to be used for joining the two data tables|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JoinedDataTable|[Datatable](../variable-data-types.md#datatable)|The generated data table after the join operation|

### <a name="joindatatableaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column name doesn't exist|​Indicates that the provided column name doesn't exist|
|Column index is out of range|​Indicates that the provided column index is out of range|

## <a name="generatedatatablefromcsv"></a> Read from CSV text variable

Generates a data table from a CSV text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|CSV text|No|[Text value](../variable-data-types.md#text-value)||The CSV text variable to read.|
|Trim fields|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to automatically trim off the leading and trailing whitespaces of the extracted cells.|
|First line contains column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use the first row of the CSV text to set the column names of the resulting data table. Enable this option to avoid reading the names as data into the table. Subsequent actions might access the data held by the data table using column names (instead of column numbers).|
|Get CSV fields as text|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to retrieve the content of the CSV text fields purely as text or as the closest matching type. For example, Date Time for dates and Numeric for numbers.|
|Columns separator|N/A|Predefined, Custom, Fixed Column Widths|Predefined|Specifies whether to use a predefined columns separator, a custom separator, or fixed column widths.|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column-separator to parse the CSV text.|
|Custom separator|No|[Text value](../variable-data-types.md#text-value)||The custom column-separator to use for parsing the CSV text.|
|Fixed column widths|No|[Text value](../variable-data-types.md#text-value)||The fixed column-widths to use for parsing the CSV text. Separate the widths using commas, spaces, tabs, or newlines.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CSVTable|[Datatable](../variable-data-types.md#datatable)|The contents of the CSV text as a data table|

### <a name="generatedatatablefromcsv_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|CSV parsing failed|​Indicates a problem parsing the CSV text|

## <a name="convertdatatabletocsvaction"></a> Convert data table to text 

Converts a data table to a CSV text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table variable to work with. The specified variable must be defined through an action that generates a data table variable.|
|Include column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether the column names of the variant specified should become the first row of the CSV text.|
|Use custom columns separator|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to use a custom column separator or a predefined column separator.|
|Separator|N/A|System default, Comma, Semicolon, Tab|System default|The column separator to use in the specified CSV text.|
|Custom columns separator|No|[Text value](../variable-data-types.md#text-value)||The custom column separator to use in the specified CSV text.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CSVText|[Text value](../variable-data-types.md#text-value)|The variable in which the CSV result is stored|

### <a name="convertdatatabletocsvaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Conversion failed|​Indicates a problem converting the data table to CSV text|

## <a name="truncatenumber"></a> Truncate number

Get the integral or fractional digits of a numeric value, or round up the value to a specified number of decimal places.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Number to truncate|No|[Numeric value](../variable-data-types.md#numeric-value)||The number or variable that holds the numeric value to truncate/round up|
|Operation|N/A|Get integer part, Get decimal part, Round number|Get integer part|Specifies the operation to perform on the given number|
|Decimal places|Yes|[Numeric value](../variable-data-types.md#numeric-value)|3|The number of decimal places to round the given number up to. Enter 0 to return an integer as a result|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TruncatedValue|[Numeric value](../variable-data-types.md#numeric-value)|The truncated or rounded number|

### <a name="truncatenumber_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="generaterandomnumber"></a> Generate random number

Generate a random number or a list of random numbers that fall between a minimum and maximum value.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Minimum value|Yes|[Numeric value](../variable-data-types.md#numeric-value)|0|The lower boundary for the random number(s) to generate|
|Maximum value|Yes|[Numeric value](../variable-data-types.md#numeric-value)|100|The upper boundary for the random number(s) to generate|
|Generate multiple numbers|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to generate a single random number or a list of random numbers|
|How many numbers|Yes|[Numeric value](../variable-data-types.md#numeric-value)|10|Specifies how many random numbers to generate|
|Allow duplicates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to permit or prevent the same number from appearing more than once in the random numbers list|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RandomNumber|[Numeric value](../variable-data-types.md#numeric-value)|The newly generated random number|
|RandomNumbers|[List](../variable-data-types.md#list) of [Numeric values](../variable-data-types.md#numeric-value)|The newly generated list of random numbers|

### <a name="generaterandomnumber_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to generate random number|Indicates that there's an error generating a random number|

## <a name="clearlist"></a> Clear list

Remove all items from a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to clear|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||A list variable to remove its elements|

### Variables produced

This action doesn't produce any variables.

### <a name="clearlist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="removeitemfromlist"></a> Remove item from list

Remove one or multiple items from a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Remove item by|N/A|Index, Value|Index|Specifies whether to remove the item at a specified index or the item(s) with a specific value|
|At index|No|[Numeric value](../variable-data-types.md#numeric-value)||The index number of the item to remove|
|With value|No|[General value](../variable-data-types.md#general-value)||The item to remove|
|Remove all item occurrences|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Removes all the occurrences that match the item specified|
|From list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The list with items to remove|

##### Variables produced

This action doesn't produce any variables.

### <a name="removeitemfromlist_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Item index is out of range|Indicates that item index is out of range|
|Item not found|Indicates that item doesn't exist in the list|

## <a name="sortlistbase"></a> Sort list

Sort the items of a list. Use items of the same type.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to sort|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that holds the list to sort|
|Sort by list item's properties|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|If the list items are objects (such are files, folders, etc.), enable this option to sort the item by a specific property. Leave this option disabled to sort the elements by their default property (for example, file objects are sorted by their full path)|
|First property to sort by|Yes|[Text value](../variable-data-types.md#text-value)||The name of an item's property to sort the list by. Refer to the help file for the property names of each object|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the first property ascending or descending|
|Second property to sort by|Yes|[Text value](../variable-data-types.md#text-value)||The name of a second property to sort the list by|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the second property ascending or descending|
|Third property to sort by|Yes|[Text value](../variable-data-types.md#text-value)||The name of a third property to sort the list by|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the third property ascending or descending|

### Variables produced

This action doesn't produce any variables.

### <a name="sortlistbase_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="shufflelist"></a> Shuffle list

Create a random permutation of a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to shuffle|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that contains the list to shuffle|

### Variables produced

This action doesn't produce any variables.

### <a name="shufflelist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="mergelists"></a> Merge lists

Merge two lists into one.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The first list of items to merge|
|Second list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The second list of items to merge|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|OutputList|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md)|The merged list. The initial lists aren't affected|

### <a name="mergelists_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|The lists supplied are of incompatible types|Indicates that the lists supplied are of incompatible types|

## <a name="reverselist"></a> Reverse list

Reverse the order of the items of a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to reverse|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The list whose items order to reverse|

##### Variables produced

This action doesn't produce any variables.

### <a name="reverselist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="removeduplicateitemsfromlist"></a> Remove duplicate items from list

Remove the multiple occurrences of items in a list, so that in the resulting list each item is unique.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to remove duplicate items from|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The list variable to remove duplicate items from|
|Ignore text case while searching for duplicate items|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to perform case insensitive comparison of text while searching for duplicate items (only applies to lists made of text items)|

### Variables produced

This action doesn't produce any variables.

### <a name="removeduplicateitemsfromlist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="findcommonlistitems"></a> Find common list items

Compare two lists and create a new list with the items that are common to both.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that contains the first list to compare|
|Second list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that contains the second list to compare|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|IntersectionList|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)|The new list of common items|

### <a name="findcommonlistitems_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="subtractlists"></a> Subtract lists

Compare two lists and create a new list with the items that are in the first list but not in the second.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that holds the first list to compare|
|Second list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||The variable that holds the second list to compare|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ListDifference|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)|The new resulting list|

### <a name="subtractlists_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="retrievedatatablecolumnintolist"></a> Retrieve data table column into list

Convert the contents of a data table column into a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|[Datatable](../variable-data-types.md#datatable)||The data table with the column to convert into a list|
|Column name or index|No|[Text value](../variable-data-types.md#text-value)||The column name, if column names are defined, or the index number of the column to retrieve|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ColumnAsList|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)|The new list that holds the contents of the specified data table|

### <a name="retrievedatatablecolumnintolist_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Column name doesn't exist|Indicates that the column name isn't in the data table|
|Column index is out of range|Indicates that the column index is out of range|

## <a name="convertjsontocustomobject"></a> Convert JSON to custom object

Convert a JSON string to a custom object.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|JSON|No|[Text value](../variable-data-types.md#text-value)||A JSON text, or a previously created variable containing one, to convert it to a custom object|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JsonAsCustomObject|[General value](../variable-data-types.md#general-value)|The converted custom object from the provided JSON|

### <a name="convertjsontocustomobject_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error parsing the JSON|Indicates that there's an error parsing the specified JSON|

## <a name="convertcustomobjecttojson"></a> Convert custom object to JSON

Convert a custom object to a JSON string.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Custom object|No|[Custom object](../variable-data-types.md#custom-object)||The custom object to convert to JSON|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|CustomObjectAsJson|[Text value](../variable-data-types.md#text-value)|The converted JSON from the provided custom object|

### <a name="convertcustomobjecttojson_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Error parsing the custom object|Indicates that there's an error parsing the custom object|

## <a name="additemtolist"></a> Add item to list

Append a new item to a list.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Add item|No|[General value](../variable-data-types.md#general-value)||A value or a variable to add to the list. Provide a list of values to append multiple elements. If the list has a specific type of elements, the new element is converted over to that type|
|Into list|No|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)||A list variable to append the new elements to|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|NewList|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)|The new list|

### <a name="additemtolist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="createnewlist"></a> Create new list

Create a new empty list.

### Input parameters

This action doesn't require any input.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|List|[List](../variable-data-types.md#list) of [General values](../variable-data-types.md#general-value)|The new list|

### <a name="createnewlist_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="increasevariable"></a> Increase variable

Increase the value of a variable by a specific amount.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable name|No|[Numeric value](../variable-data-types.md#numeric-value)||The numeric value to increase|
|Increase by|No|[Numeric value](../variable-data-types.md#numeric-value)||A numeric value, or a previously created variable containing one, to increase the variable by|

### Variables produced

This action doesn't produce any variables.

### <a name="increasevariable_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="decreasevariable"></a> Decrease variable

Decrease the value of a variable by a specific amount.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable name|No|[Numeric value](../variable-data-types.md#numeric-value)||A numeric value, or a previously created variable containing one, to decrease the variable by|
|Decrease by|No|[Numeric value](../variable-data-types.md#numeric-value)||A numeric value, or a previously created variable containing one, to decrease the variable by|

### Variables produced

This action doesn't produce any variables.

### <a name="decreasevariable_onerror"></a> Exceptions

This action doesn't include any exceptions.

## Run Power Fx expression

Runs the provided Power Fx expression.

>[!NOTE]
>This action is only available for Power Fx enabled desktop flows (preview).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Expression|No|*||The Power Fx expression to run|

### Variables produced

This action doesn't produce any variables.

##### Exceptions

This action doesn't include any exceptions.

## <a name="assign"></a> Set variable

Set the value of a new or existing variable, create a new variable or overwrite a previously created variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|To|No|*||The value to assign to the variable|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|NewVar|*|The name of the variable to set|

>[!NOTE]
> Variable names must start with either a letter or an underscore (_). After the first character, variable names can contain letters, underscores, and digits (0-9). Names are not case-sensitive, meaning myVar, myvar, and MYVAR are considered the same variable.
> The following reserved keywords cannot be used as variable names: if, then, else, switch, case, default, loop, from, to, step, foreach, in, while, next, exit, label, goto, call, output, function, block, end, error, wait, for, set, main, and, or, xor, not, true, false, yes, no, disable, on, repeat, times, throw, action, mod, global, input, import

##### <a name="assign_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
