---
title: Variables | Microsoft Docs
description: Variables Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Variables

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

All variable-related actions for different datatypes

|<!-- --> |
|-----|
|[Truncate number](#truncatenumber)|
|[Generate random number](#generaterandomnumber)|
|[Clear list](#clearlist)|
|[Remove item from list](#removeitemfromlist)|
|[Sort List](#sortlistbase)|
|[Shuffle list](#shufflelist)|
|[Merge lists](#mergelists)|
|[Reverse list](#reverselist)|
|[Remove duplicate items from list](#removeduplicateitemsfromlist)|
|[Find common list items](#findcommonlistitems)|
|[Subtract lists](#subtractlists)|
|[Retrieve data table column into list](#retrievedatatablecolumnintolist)|
|[Convert JSON to custom object](#convertjsontocustomobject)|
|[Convert custom object to JSON](#convertcustomobjecttojson)|
|[Add item to list](#additemtolist)|
|[Create new list](#createnewlist)|
|[Increase variable](#increasevariable)|
|[Decrease variable](#decreasevariable)|
|[Set variable](#assign)|

### <a name="truncatenumber"></a> Truncate number
Get the integral or fractional digits of a numeric value, or round up the value to a specified number of decimal places

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Number to truncate|No|Numeric value||The number or variable that holds the numeric value to truncate/round up|
|Operation|N/A|Get integer part, Get decimal part, Round number|Get integer part|Specifies the operation to perform on the given number|
|Decimal places|Yes|Numeric value|3|The number of decimal places to round the given number up to. Enter 0 to return an integer as a result|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TruncatedValue|Numeric value|The truncated or rounded number|


##### <a name="truncatenumber_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="generaterandomnumber"></a> Generate random number
Generate a random number or a list of random numbers that fall between a minimum and maximum value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Minimum value|Yes|Numeric value|0|The lower boundary for the random number(s) to generate|
|Maximum value|Yes|Numeric value|100|The upper boundary for the random number(s) to generate|
|Generate multiple numbers|N/A|Boolean value|False|Specifies whether to generate a single random number or a list of random numbers|
|How many numbers|Yes|Numeric value|10|Specifies how many random numbers to generate|
|Allow duplicates|N/A|Boolean value|False|Specifies whether to permit or prevent the same number from appearing more than once in the random numbers list|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RandomNumber|Numeric value|The newly generated random number|
|RandomNumbers|List of Numeric values|The newly generated list of random numbers|


##### <a name="generaterandomnumber_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to generate random number|Indicates that there is an error generating a random number|

### <a name="clearlist"></a> Clear list
Remove all items from a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to clear|No|List of General values||A list variable to remove its elements|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="clearlist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="removeitemfromlist"></a> Remove item from list
Remove one or multiple items from a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Remove item by|N/A|Index, Value|Index|Specifies whether to remove the item at a specified index or the item(s) with a specific value|
|At index|No|Numeric value||The index number of the item to remove|
|With value|No|General value||The item to remove|
|Remove all item occurrences|N/A|Boolean value|False|Removes all the occurrences that match the item specified|
|From list|No|List of General values||The list with items to remove|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="removeitemfromlist_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Item index is out of range|Indicates that item index is out of range|
|Item not found|Indicates that item doesn't exist in the list|

### <a name="sortlistbase"></a> Sort List
Sort the items of a list. Use items of the same type

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to sort|No|List of General values||The variable that holds the list to sort|
|Sort by list item's properties|N/A|Boolean value|False|If the list items are objects (such are files, folders, etc), enable this option to sort the item by a specific property. Leave this option disabled to sort the elements by their default property (e.g., file objects will be sorted by their full path)|
|First property to sort by|Yes|Text value||The name of an item's property to sort the list by. Refer to the help file for the property names of each object|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the first property ascending or descending|
|Second property to sort by|Yes|Text value||The name of a second property to sort the list by|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the second property ascending or descending|
|Third property to sort by|Yes|Text value||The name of a third property to sort the list by|
|Sort|N/A|Ascending, Descending|Ascending|Specifies whether to sort by the third property ascending or descending|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="sortlistbase_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="shufflelist"></a> Shuffle list
Create a random permutation of a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to shuffle|No|List of General values||The variable that contains the list to shuffle|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="shufflelist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="mergelists"></a> Merge lists
Merge two lists into one

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|List of General values||The first list of items to merge|
|Second list|No|List of General values||The second list of items to merge|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|OutputList|List of General values|The merged list. The initial lists aren't affected|


##### <a name="mergelists_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|The lists supplied are of incompatible types|Indicates that the lists supplied are of incompatible types|

### <a name="reverselist"></a> Reverse list
Reverse the order of the items of a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to reverse|No|List of General values||The list whose items order to reverse|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="reverselist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="removeduplicateitemsfromlist"></a> Remove duplicate items from list
Remove the multiple occurrences of items in a list, so that in the resulting list each item will be unique

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|List to remove duplicate items from|No|List of General values||The list variable to remove duplicate items from|
|Ignore text case while searching for duplicate items|N/A|Boolean value|False|Specifies whether to perform case insensitive comparison of text while searching for duplicate items (only applies to lists made of text items)|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="removeduplicateitemsfromlist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="findcommonlistitems"></a> Find common list items
Compare two lists and create a new list with the items that are common to both

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|List of General values||The variable that contains the first list to compare|
|Second list|No|List of General values||The variable that contains the second list to compare|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|IntersectionList|List of General values|The new list of common items|


##### <a name="findcommonlistitems_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="subtractlists"></a> Subtract lists
Compare two lists and create a new list with the items that are in the first list but not in the second

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|First list|No|List of General values||The variable that holds the first list to compare|
|Second list|No|List of General values||The variable that holds the second list to compare|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ListDifference|List of General values|The new resulting list|


##### <a name="subtractlists_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="retrievedatatablecolumnintolist"></a> Retrieve data table column into list
Convert the contents of a data table column into a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Data table|No|Datatable||The data table with the column to convert into a list|
|Column name or index|No|Text value||The column name, if column names are defined, or the index number of the column to retrieve|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ColumnAsList|List of General values|The new list that holds the contents of the specified data table|


##### <a name="retrievedatatablecolumnintolist_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Column name doesn't exist|Indicates that the column name isn't in the data table|
|Column index is out of range|Indicates that the column index is out of range|

### <a name="convertjsontocustomobject"></a> Convert JSON to custom object
Convert a JSON string to a custom object

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|JSON|No|Text value||A JSON text, or a previously created variable containing one, to convert it to a custom object|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JsonAsCustomObject|General value|Τhe converted custom object from the provided JSON|


##### <a name="convertjsontocustomobject_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Error parsing the JSON|Indicates that there is an error parsing the specified JSON|

### <a name="convertcustomobjecttojson"></a> Convert custom object to JSON
Convert a custom object to a JSON string

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Custom object|No|Custom object||The custom object to convert to JSON|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|CustomObjectAsJson|Text value|The converted JSON from the provided custom object|


##### <a name="convertcustomobjecttojson_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Error parsing the custom object|Indicates that there is an error parsing the custom object|

### <a name="additemtolist"></a> Add item to list
Αppend a new item to a list

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Add item|No|General value||A value or a variable to add to the list. Provide a list of values to append multiple elements. If the list has a specific type of elements, the new element is converted over to that type|
|Into list|No|List of General values||A list variable to append the new elements to|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="additemtolist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="createnewlist"></a> Create new list
Create a new empty list

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|List|List of General values|The new list|


##### <a name="createnewlist_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="increasevariable"></a> Increase variable
Increase the value of a variable by a specific amount

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable name|No|Numeric value||The numeric value to increase|
|Increase by|No|Numeric value||A numeric value, or a previously created variable containing one, to increase the variable by|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="increasevariable_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="decreasevariable"></a> Decrease variable
Decrease the value of a variable by a specific amount

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Variable name|No|Numeric value||A numeric value, or a previously created variable containing one, to decrease the variable by|
|Decrease by|No|Numeric value||A numeric value, or a previously created variable containing one, to decrease the variable by|


##### Variables Produced
- This action doesn't produce any variables


##### <a name="decreasevariable_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="assign"></a> Set variable
Set the value of a new or existing variable, create a new variable or overwrite a previously created variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|To|No|*||The value to assign to the variable|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|NewVar|*|The name of the variable to set|


##### <a name="assign_onerror"></a> Exceptions
- This action doesn't include any exceptions

