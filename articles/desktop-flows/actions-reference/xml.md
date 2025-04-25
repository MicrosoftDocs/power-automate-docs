---
title: XML actions reference
description: Display the XML actions.
author: HeatherOrt
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/24/2022
ms.author: kisubedi
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# XML actions

Power Automate provides the capability to use desktop flows to manage XML attributes and elements.

To read an XML file, use the **Read XML from file** action. Specify the path or browse for the file, and select one of the encoding options.

After selecting a file, use the **Execute XPath expression** action to run an Xpath query. The following example uses a produced variable from the **Read XML from file** action to specify the document.

:::image type="content" source="media/xml/xpath-expression-example.png" alt-text="Screenshot of the Execute XPath expression action.":::

To retrieve an attribute from an XML file, use the **Get XML attribute** action. In the following example, **status** is an attribute of **client**, which is an element of **clientlist**. The value will be obtained as a text value.

:::image type="content" source="media/xml/get-xml-attribute-example.png" alt-text="Screenshot of the Get XML attribute action.":::

Similarly, to retrieve element values, use the **Get XML element value** action. You can manage elements and attributes using the respective action to get, set or remove XML attributes or elements.

## <a name="readfromfile"></a> Read XML from file

Read the contents of an XML file into a variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file that contains the XML document to read|
|Encoding|N/A|System default, ASCII, Unicode, Unicode big endian, UTF-8|System default|The encoding used for the specified file|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|XmlDocument|[XML node](../variable-data-types.md#xml)|The variable that holds the read XML document|

### <a name="readfromfile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Failed to read from file|Indicates a problem reading from file|
|File doesn't contain a valid XML document|Indicates that the file doesn't contain a valid XML document|

## <a name="writexmltofile"></a> Write XML to file

Write the contents of an XML node variable into a file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The file to write the XML document into|
|XML to write|No|[Text value](../variable-data-types.md#text-value)||The XML node or document to write into the file|
|Encoding|N/A|System default, ASCII, Unicode, Unicode big endian, UTF-8|System default|The encoding used for the specified file|
|Format XML|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to format the XML|
|Indentation per level|Yes|[Numeric value](../variable-data-types.md#numeric-value)|2|Specifies by how many spaces to indent each level of the XML|

### Variables produced

This action doesn't produce any variables.

### <a name="writexmltofile_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid directory specified|Indicates that the specified directory is invalid|
|Failed to write XML to file|Indicates a problem writing XML to file|

## <a name="executexpathquery"></a> Execute XPath expression

Extract values from an XML document based on the provided XPath query.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document to parse|No|[Text value](../variable-data-types.md#text-value)||The XML as text or a previously defined variable that contains the XML document to parse|
|XPath query|No|[Text value](../variable-data-types.md#text-value)||The XPath expression to execute against the XML document|
|Get first value only|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to retrieve a single value (the first value only) or all the values that match the provided XPath expression|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|XPathResult|[XML node](../variable-data-types.md#xml)|The extracted node(s) as an XML node|
|XPathResults|[List](../variable-data-types.md#list) of [XML nodes](../variable-data-types.md#xml)|The extracted node(s) as a list of XML nodes|

### <a name="executexpathquery_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XML document provided|Indicates that the XML document provided is invalid|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|

## <a name="getxmlelementattribute"></a> Get XML element attribute

Get the value of an attribute of an XML element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document or XML element to retrieve its attribute|
|XPath query|Yes|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the subelement and retrieve its attribute|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)||The name of the attribute to retrieve its value|
|Get value as|N/A|Text value, Numeric value, Datetime value, Boolean value|Text value|Specifies the data type for the attribute value|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|XmlAttributeValue|[Boolean value](../variable-data-types.md#boolean-value)|The retrieved value of the XML attribute|
|XmlAttributeValue|[Datetime](../variable-data-types.md#dates-and-time)|The retrieved value of the XML attribute|
|XmlAttributeValue|[Numeric value](../variable-data-types.md#numeric-value)|The retrieved value of the XML attribute|
|XmlAttributeValue|[Text value](../variable-data-types.md#text-value)|The retrieved value of the XML attribute|

### <a name="getxmlelementattribute_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Attribute not found in element|Indicates that the attribute doesn't exist in the element|
|Failed to convert attribute value to the requested data type|Indicates a problem converting the attribute value to the requested data type|

## <a name="setelementattribute"></a> Set XML element attribute

Set the value of an attribute of an XML element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document or XML element to set its attribute|
|XPath query|Yes|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the subelement and set its attribute|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)||The name of the attribute to set its value|
|Attribute value|No|[Text value](../variable-data-types.md#text-value)||The new value for the attribute|

### Variables produced

This action doesn't produce any variables.

### <a name="setelementattribute_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to set XML attribute|Indicates a problem setting the XML attribute|

## <a name="removeelementattribute"></a> Remove XML element attribute

Remove an attribute from an XML element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document or XML element to remove its attribute|
|XPath query|Yes|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the subelement and remove its attribute|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)||The name of the attribute to remove|

### Variables produced

This action doesn't produce any variables.

### <a name="removeelementattribute_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Attribute not found in element|Indicates that the attribute doesn't exist in the element|
|Failed to remove XML attribute|Indicates a problem removing the XML attribute|

## <a name="getxmlelementvalue"></a> Get XML element value

Get the value of an XML element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document or XML element to retrieve its value|
|XPath query|Yes|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the subelement and retrieve its value|
|Get value as|N/A|Text value, Numeric value, Datetime value, Boolean value|Text value|Specifies the data type for the XML element value|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|XmlElementValue|[Boolean value](../variable-data-types.md#boolean-value)|The XML element value|
|XmlElementValue|[Datetime](../variable-data-types.md#dates-and-time)|The XML element value|
|XmlElementValue|[Numeric value](../variable-data-types.md#numeric-value)|The XML element value|
|XmlElementValue|[Text value](../variable-data-types.md#text-value)|The XML element value|

### <a name="getxmlelementvalue_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to convert element value to the requested data type|Indicates a problem converting the element value to the requested data type|

## <a name="setelementvalue"></a> Set XML element value

Set the value of an XML element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document or XML element to retrieve it value|
|XPath query|Yes|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the subelement and retrieve its value|
|XML element value|No|[Text value](../variable-data-types.md#text-value)||The new value for the XML element|

### Variables produced

This action doesn't produce any variables.

### <a name="setelementvalue_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to set element value|Indicates a problem setting the element value|

## <a name="insertelement"></a> Insert XML element

Insert a new XML element into an XML document.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document to insert the new XML element|
|XPath query|No|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the parent XML element and insert the new element into it|
|XML element to insert|No|[XML node](../variable-data-types.md#xml)||The new XML element to insert into the XML document|

### Variables produced

This action doesn't produce any variables.

### <a name="insertelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to insert XML element|Indicates a problem inserting the XML element|

## <a name="removeelement"></a> Remove XML element

Remove one or more XML elements from an XML document.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document|No|[XML node](../variable-data-types.md#xml)||The XML document that contains the XML element(s) to remove|
|XPath query|No|[Text value](../variable-data-types.md#text-value)||The XPath expression to locate the element(s) to remove|

### Variables produced

This action doesn't produce any variables.

### <a name="removeelement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|Failed to remove XML element|Indicates a problem removing the XML element|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
