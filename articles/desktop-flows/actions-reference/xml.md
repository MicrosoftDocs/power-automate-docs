---
title: XML | Microsoft Docs
description: XML Actions Reference
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

# XML

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Manage and manipulate XML files

|<!-- --> |
|-----|
|[Read XML from file](#readfromfile)|
|[Write XML to file](#writexmltofile)|
|[Execute XPath expression](#executexpathquery)|
|[Get XML element attribute](#getxmlelementattribute)|
|[Set XML element attribute](#setelementattribute)|
|[Remove XML element attribute](#removeelementattribute)|
|[Get XML element value](#getxmlelementvalue)|
|[Set XML element value](#setelementvalue)|
|[Insert XML element](#insertelement)|
|[Remove XML element](#removeelement)|

### <a name="readfromfile"></a> Read XML from file
Read the contents of an XML file into a variable

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path:|No|File||The file that contains the XML document to read|
|Encoding:|N/A|Default, ANSI, Unicode, Unicode big endian, UTF-8|Default|The encoding used for the specified file|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|XmlDocument|XML node|The variable that holds the read XML document|


##### <a name="readfromfile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Directory not found|Indicates that the directory doesn't exist|
|File not found|Indicates that the file doesn't exist|
|Failed to read from file|Indicates a problem reading from file|
|File doesn't contain a valid XML document|Indicates that the file doesn't contain a valid XML document|

### <a name="writexmltofile"></a> Write XML to file
Write the contents of an XML node variable into a file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|File path:|No|File||The file to write the XML document into|
|XML to write:|No|Text value||The XML node or document to write into the file|
|Encoding:|N/A|Default, ANSI, Unicode, Unicode big endian, UTF-8|Default|The encoding used for the specified file|
|Format XML:|N/A|Boolean value|True|Specifies whether to format the XML|
|Indentation per level:|Yes|Numeric value|2|Specifies by how many spaces to indent each level of the XML|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="writexmltofile_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid directory specified|Indicates that the specified directory is invalid|
|Failed to write XML to file|Indicates a problem writing XML to file|

### <a name="executexpathquery"></a> Execute XPath expression
Extract values from an XML document based on the provided XPath query

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document to parse:|No|Text value||The XML as text or a previously defined variable that contains the XML document to parse|
|XPath query:|No|Text value||The XPath expression to execute against the XML document|
|Get first value only:|N/A|Boolean value|False|Specifies whether to retrieve a single value (the first value only) or all the values that match the provided XPath expression|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|XPathResult|XML node|The extracted node(s) as an XML node|
|XPathResults|List of XML nodes|The extracted node(s) as a list of XML nodes|


##### <a name="executexpathquery_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XML document provided|Indicates that the XML document provided is invalid|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|

### <a name="getxmlelementattribute"></a> Get XML element attribute
Get the value of an attribute of an XML element

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document or XML element to retrieve its attribute|
|XPath query|Yes|Text value||The XPath expression to locate the sub-element and retrieve its attribute|
|Attribute name:|No|Text value||The name of the attribute to retrieve its value|
|Get value as:|N/A|Text value, Numeric value, Datetime value, Boolean value|Text value|Specifies the data type for the attribute value|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|XmlAttributeValue|Boolean value|The retrieved value of the XML attribute|
|XmlAttributeValue|Datetime|The retrieved value of the XML attribute|
|XmlAttributeValue|Numeric value|The retrieved value of the XML attribute|
|XmlAttributeValue|Text value|The retrieved value of the XML attribute|


##### <a name="getxmlelementattribute_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Attribute not found in element|Indicates that the attribute doesn't exist in the element|
|Failed to convert attribute value to the requested data type|Indicates a problem converting the attribute value to the requested data type|

### <a name="setelementattribute"></a> Set XML element attribute
Set the value of an attribute of an XML element

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document or XML element to set its attribute|
|XPath query:|Yes|Text value||The XPath expression to locate the sub-element and set its attribute|
|Attribute name:|No|Text value||The name of the attribute to set its value|
|Attribute value:|No|Text value||The new value for the attribute|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setelementattribute_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to set XML attibute|Indicates a problem setting the XML attibute|

### <a name="removeelementattribute"></a> Remove XML element attribute
Remove an attribute from an XML element

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document or XML element to remove its attribute|
|XPath query:|Yes|Text value||The XPath expression to locate the sub-element and remove its attribute|
|Attribute name:|No|Text value||The name of the attribute to remove|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="removeelementattribute_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Attribute not found in element|Indicates that the attribute doesn't exist in the element|
|Failed to remove XML attibute|Indicates a problem removing the XML attibute|

### <a name="getxmlelementvalue"></a> Get XML element value
Get the value of an XML element

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document or XML element to retrieve its value|
|XPath query:|Yes|Text value||The XPath expression to locate the sub-element and retrieve its value|
|Get value as:|N/A|Text value, Numeric value, Datetime value, Boolean value|Text value|Specifies the data type for the XML element value|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|XmlElementValue|Boolean value|The XML element value|
|XmlElementValue|Datetime|The XML element value|
|XmlElementValue|Numeric value|The XML element value|
|XmlElementValue|Text value|The XML element value|


##### <a name="getxmlelementvalue_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to convert element value to the requested data type|Indicates a problem converting the element value to the requested data type|

### <a name="setelementvalue"></a> Set XML element value
Set the value of an XML element

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document or XML element to retrieve it value|
|XPath query:|Yes|Text value||The XPath expression to locate the sub-element and retrieve its value|
|XML element value:|No|Text value||The new value for the XML element|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="setelementvalue_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to set element value|Indicates a problem setting the element value|

### <a name="insertelement"></a> Insert XML element
Insert a new XML element into an XML document

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document to insert the new XML element|
|XPath query:|No|Text value||The XPath expression to locate the parent XML element and insert the new element into it|
|XML element to insert:|No|XML node||The new XML element to insert into the XML document|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="insertelement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|XPath expression returns no element|Indicates that the XPath expression returns no element|
|Failed to insert XML element|Indicates a problem inserting the XML element|

### <a name="removeelement"></a> Remove XML element
Remove one or more XML elements from an XML document

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|XML document:|No|XML node||The XML document that contains the XML element(s) to remove|
|XPath query:|No|Text value||The XPath expression to locate the element(s) to remove|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="removeelement_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid XPath expression provided|Indicates that the XPath expression provided is invalid|
|Failed to remove XML element|Indicates a problem removing the XML element|


