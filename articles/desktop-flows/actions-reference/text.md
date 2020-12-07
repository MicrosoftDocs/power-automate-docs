---
title: Text | Microsoft Docs
description: Text Actions Reference
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

# Text

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Control and manipulate text

|<!-- --> |
|-----|
|[Append line to text](#appendline)|
|[Get subtext](#getsubtextbase)|
|[Pad text](#pad)|
|[Trim text](#trim)|
|[Change text case](#changecase)|
|[Convert text to number](#tonumber)|
|[Convert number to text](#fromnumber)|
|[Convert text to datetime](#converttexttodatetime)|
|[Convert datetime to text](#convertdatetimetotext)|
|[Create random text](#random)|
|[Join text](#jointext)|
|[Split text](#splittext)|
|[Parse text](#parsetext)|
|[Replace text](#replace)|
|[Escape text for regular expression](#escapeforregularexpression)|

### <a name="appendline"></a> Append line to text
Appends a new line of text to a text value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Original text|No|Text value||The original text|
|Line to append|Yes|Text value||The text to add on as a new line|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Result|Text value|The new text|


##### <a name="appendline_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="getsubtextbase"></a> Get subtext
Retrieve a subtext from a text value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Original text|No|Text value||The text to retrieve a section of text from|
|Start index|N/A|Start of text, Character position|Character position|Specify how to find the starting point for text retrieval|
|Character position|No|Numeric value||The position of the first character to retrieve. This is a zero-based index, counting from zero for the first character|
|Length|N/A|End of text, Number of chars|Number of chars|Specify whether the subtext continues to the end of the text, or includes only a certain number of characters|
|Number of chars|No|Numeric value||The number of characters to retrieve|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Subtext|Text value|The retrieved subtext|


##### <a name="getsubtextbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|StartIndex or length are out of range|Indicates that the start index or length are out of range|

### <a name="pad"></a> Pad text
Creates a fixed length text by adding characters to the left or to the right of an existing text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to pad|Yes|Text value||The text to lengthen|
|Pad|N/A|Left, Right|Left|Specify whether to add characters to the left or right of the existing text|
|Text for padding|Yes|Text value||The character or text that will be added to lengthen the original text|
|Total length|Yes|Numeric value|10|The total character length of the final padded text. This means that the text for padding will be repeatedly added until the final text is of the specified length|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|PaddedText|Text value|The new, padded text|


##### <a name="pad_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="trim"></a> Trim text
Removes all occurrences of white space characters (such as space, tab, or new line) from the beginning and/or end of an existing text

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to trim|Yes|Text value||Text to trim|
|What to trim|N/A|whitespace characters from the beginning, whitespace characters from the end, whitespace characters from the beginning and end|whitespace characters from the beginning and end|Specify where white space characters will be removed from|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TrimmedText|Text value|The new trimmed text|


##### <a name="trim_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="changecase"></a> Change text case
Changes the casing of a text to uppercase, lowercase, title case or sentence case

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to convert|Yes|Text value||The text to convert|
|Convert to|N/A|Upper case, Lower case, Title case, Sentence case|Upper case|Specify the text case style to use|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TextWithNewCase|Text value|The new converted text|


##### <a name="changecase_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="tonumber"></a> Convert text to number
Converts a text representation of a number to a variable that contains a numeric value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to convert|No|Text value||A text variable containing only a number, to convert to a numeric value variable. Spaces are ignored, but non-number text throws an exception|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TextAsNumber|Numeric value|The new numeric value|


##### <a name="tonumber_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Provided text value can't be converted into a valid number|Indicates that the provided text value can't be converted into a valid number|

### <a name="fromnumber"></a> Convert number to text
Converts a number to text using a specified format

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Number to convert|No|Numeric value||A numeric value to convert to text|
|Decimal places|Yes|Numeric value|2|The number of decimal places that will be included before truncation. Zeros can also be added to the end to pad the text in this way|
|Use thousands separator|N/A|Boolean value|True|Specify whether or not to use punctuation as a 1000 separator|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FormattedNumber|Text value|The formatted number as text|


##### <a name="fromnumber_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="converttexttodatetime"></a> Convert text to datetime
Converts a text representation of a date and/or time value to a datetime value

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to convert|No|Text value||The text to convert to a datetime value. This text must be in a recognizably datetime value format|
|Date is represented in custom format|N/A|Boolean value|False|Specify whether the text to convert contains a representation of the date and time in a non-standard, non-recognizable format|
|Custom format|No|Text value||The format in which the date is stored in the text. A custom format can be expressed as, for example, yyyyMMdd for date and hhmmss for time|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TextAsDateTime|Datetime|The datetime value|


##### <a name="converttexttodatetime_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Provided text value can't be converted into a valid datetime|Indicates that the provided text value can't be converted into a valid datetime|

### <a name="convertdatetimetotext"></a> Convert datetime to text
Converts a datetime value to text using a specified custom format

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Datetime to convert|No|Datetime||The datetime value to convert to text|
|Format to use|N/A|Standard, Custom|Standard|Specify whether to use a standard datetime format, or create a custom one|
|Custom Format|No|Text value||The custom format to display the datetime value in. A datetime can be expressed as, for example, MM/dd/yyyy for date and hh:mm:sstt for time|
|Standard format|N/A|Short date, Long date, Short time, Long time, Full datetime (short time), Full datetime (long time), General datetime (short time), General datetime (long time), Sortable datetime|Short date|The standard datetime format the action uses to display the datetime value|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|FormattedDateTime|Text value|The formatted datetime as a text value|


##### <a name="convertdatetimetotext_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="random"></a> Create random text
Generates a text of specified length consisting of random characters. This can be useful for generating passwords

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Use uppercase letters (A-Z)|N/A|Boolean value|True|Specify whether uppercase characters will be included in the generated text|
|Use lowercase letters (a-z)|N/A|Boolean value|True|Specify whether lowercase characters will be included in the generated text|
|Use digits (0-9)|N/A|Boolean value|True|Specify whether digits will be included in the generated text|
|Use symbols ( , . < > ? ! + - _ # $ ^ )|N/A|Boolean value|True|Specify whether symbols will be included in the generated text|
|Minimum length|Yes|Numeric value|6|The minimum length of the random text. For a certain length of text, set the minimum and maximum values to that number|
|Maximum length|Yes|Numeric value|10|The maximum length of the random text. For a certain length of text, set the minimum and maximum values to that number|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RandomText|Text value|The generated random text|


##### <a name="random_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="jointext"></a> Join text
Converts a list into a text value by separating its items with a specified delimiter

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Specify the list to join|No|List of Text values||The list to convert to text|
|Delimiter to separate list items|N/A|None, Standard, Custom|None|Specify whether to use no delimiter, a standard delimiter or a custom one|
|Custom delimiter|No|Text value||The character(s) to use as delimiter|
|Standard delimiter|N/A|Space, Tab, New line|Space|Specify the delimiter to use|
|Times|Yes|Numeric value|1|Specify how many times to use the specified delimiter|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JoinedText|Text value|The new delimited text|


##### <a name="jointext_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="splittext"></a> Split text
Creates a list containing the substrings of a text that are separated by a specified delimeter or a regular expression

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|The text to split|No|Text value||The text to split|
|Delimiter type|N/A|Standard, Custom|Standard|Whether the used delimiter is of a standard or custom format|
|Custom delimiter|No|Text value||The character(s) that were used as a delimiter|
|Standard delimiter|N/A|Space, Tab, New line|Space|The delimiter used|
|Times|Yes|Numeric value|1|Specify how many times is the delimiter used|
|Is regular expression|N/A|Boolean value|False|Specify whether the delimiter will be a regular expression. A regular expression creates a range of possibilities for the delimiter. For example, '\d' means that the delimiter could be any digit|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|TextList|List of Text values|The new list|


##### <a name="splittext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Provided regular expression is invalid|Indicates that the provided regular expression is invalid|

### <a name="parsetext"></a> Parse text
Parses a text to find the first or all occurrences of a specified subtext or a regular expression pattern

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to Parse|No|Text value||The text to parse|
|Text to Find|No|Text value||The subtext or a regular expression to search for|
|Is regular expression|N/A|Boolean value|False|Specify whether the subtext is a regular expression. For example \d means that the subtext could be any digit|
|Start Parsing at Position|No|Numeric value||The position to start looking for the 'Text to Find'. The first position is zero, so use 0 to start from the beginning|
|First occurrence only|N/A|Boolean value|True|Specify whether to find the first occurrence only, or each occurrence of the 'Text to find'|
|Ignore case|N/A|Boolean value|False|Specify whether to find the specified text using case-sensitive or case-insensitive matching|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Position|Numeric value|The position of the 'Text to find' into the 'Text to parse'. If the text isn't found within the original text, this variable will hold the value -1|
|Positions|List of Numeric values|The positions of the 'Text to find' into the 'Text to parse'. If the text isn't found within the original text, this variable will hold the value -1|
|Match|Text value|The result that matches the given regular expression|
|Matches|List of Text values|The results that match the given regular expression|


##### <a name="parsetext_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Provided regular expression is invalid|Indicates that the provided regular expression is invalid|

### <a name="replace"></a> Replace text
Replaces all occurrences of a specified subtext with another text. It can also be used with regular expressions

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to parse|No|Text value||The text to parse|
|Text to find|No|Text value||The subtext or a regular expression to search for|
|Use regular expressions for find and replace|N/A|Boolean value|False|Specify whether the subtexts are regular expressions. A regular expression creates a range of possibilities for the subtext. For example, '\d' means that the subtext could be any digit|
|Ignore case|N/A|Boolean value|False|Specify whether to find the subtext to replace using case-sensitive or case-insensitive matching|
|Replace with|No|Text value||The text or a regular expression to replace found text|
|Activate escape sequences|N/A|Boolean value|False|Specify whether to use special sequences. For example, '\t' in the replacement text will be interpreted as a tab|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Replaced|Text value|The new updated text|


##### <a name="replace_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="escapeforregularexpression"></a> Escape text for regular expression
Escapes a minimal set of characters (\, *, +, ?, |, {, [, (,), ^, $,., #, and white space) by replacing them with their escape codes

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to escape|No|Text value||The text to escape|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|EscapedText|Text value|The escaped text|


##### <a name="escapeforregularexpression_onerror"></a> Exceptions
- This action doesn't include any exceptions

