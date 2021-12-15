---
title: Text | Microsoft Docs
description: Text Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Text



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
|[Recognize entities in text](#recognizeentitiesintext)|

## Getting started with text actions

To combine a list of text values into a single text value, use the **Join text** action. Specify a list variable, and separate the list items by using a delimiter. To separate a single text value into a list of items, use the **Split text** action. Specify a text value that has recognizable delimiters by which to separate the list items. 

To find a string in a text and replace it with another string or character, use the **Replace text** action. The following figure demonstrates a replacement of the string "Product Characteristics" with "Characteristics".

![Screenshot of replace text action.](\media\text\replace-text-example.png)

Search a text value for a string of text with the **Parse text** action. Certain text actions contain the option to use regular expressions. Enable the option **Is regular expression** to search for text specifying a regular expression in **Text to find**. Additionally, disable **First occurence only** for the action to return a list of positions of the matched text. You can find more information in [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

In the figure below, the action searches for all occurences of words starting with a capital letter in "Items detected in Stock", and will return "Items" and "Stock" in the **Matches** list, and the position they are found at (1 and 18) in the **Positions** list.

![Screenshot of parse text action.](\media\text\parse-text-example.png)

To ensure that numbers are stored as numerical values, use the **Convert text to number** action. To perform the reverse conversion, use **Convert number to text**.

Similarly, the actions **Convert text to datetime** and **Convert datetime to text** are used to ensure that dates are correctly formatted.

### Use the Recognize entities in text action

Power Automate for desktop enables users to extract various entities from texts in natural language, such as numbers, dates, and measurement units, through the **Recognize entities in text** action.

![Screenshot of the Recognize entities in text action](\media\text\recognize-entities-text-action.png)

The **Recognize entities in text** action gets a text or a variable containing text as input and returns a datable containing the results. Each entity returns different results based on its structure, but all the datatables contain an **Original text** field that stores the entity part of the input text.

The following table displays various examples of entities that the **Recognize entities in text** action can recognize. 

|Entity      |Input text                                                            |Returned values                                                                    |
|------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------|
|Date time   |I'll go back 04th Jan 2019                                            |**Value:** 1/4/2019 12:00:00 AM </br> **Original text:** 04th Jan 2019             |
|Date time   |Schedule a meeting tonight at 7pm                                     |**Value:** 9/30/2021 7:00:00 PM </br> **Original text:** tonight at 7pm            |
|Dimension   |You weight 200lbs                                                     |**Value:** 200 </br> **Unit:** Pound </br> **Original text:** 200lbs               |
|Dimension   |Α twister roared through an area about ten miles long there           |**Value:** 10 </br> **Unit:** Mile </br> **Original text:** ten miles              |
|Temperature |Τhe temperature outside is 40 deg celsius                             |**Value:** 40 </br> **Unit:** C </br> **Original text:** 40 deg celsius            |
|Currency    |Νet interest income sank 27 percent in the quarter to /$ 254 million  |**Value:** 254000000 </br> **Unit:** Dollar </br> **Original text:** $ 254 million |
|Number range|This number is larger than twenty and less or equal than thirty five  |**From:** 20 </br> **To:** 35 </br> **Original text:** larger than twenty and less or equal than thirty five |
|Number range|From 5 to 10                                                          |**From:** 5 </br> **To:** 10 </br> **Original text:** From 5 to 10                 |
|Number range|Less than 4.565                                                       |**From:** 0 </br> **To:** 4.565 </br> **Original text:** Less than 4.565           |
|Number      |A dozen                                                               |**Value:** 12 </br> **Original text:** A dozen                                     |
|Number      |Two thirds                                                            |**Value:** 0.666666666666667 </br> **Original text:** Two thirds                   |
|Ordinal     |I like the first two books                                            |**Value:** 1 </br> **Original text:** first                                        |
|Ordinal     |Eleventh                                                              |**Value:** 11 </br> **Original text:** Eleventh                                    |
|Percentage  |100 percent                                                           |**Value:** 100 </br> **Original text:** 100 percent                                |
|Phone number|Tel: +1 209-555-0100                                                  |**Value:** +1 209-555-0100 </br> **Original text:** +1 209-555-0100                |
|Email       |felix@contoso.com                                                     |**Value:** felix@contoso.com </br> **Original text:** felix@contoso.com            |
|IP address  |My PC IP address is 1.1.1.1                                           |**Value:** 1.1.1.1 </br> **Original text:** 1.1.1.1                                |
|Mention     |@Alice                                                                |**Value:** @Alice </br> **Original text:** @Alice                                  |
|Hashtag     |#News                                                                 |**Value:** #News </br> **Original text:** #News                                    |
|URL         |www.microsoft.com |**Value:** www.microsoft.com  </br> **Original text:** www.microsoft.com           |
|GUID        |123e4567-e89b-12d3-a456-426655440000                                  |**Value:** 123e4567-e89b-12d3-a456-426655440000 </br> **Original text:** 123e4567-e89b-12d3-a456-426655440000 |
|Quoted text |Enter the value in the "value" field                                  |**Value:** "value" </br> **Original text:** "value"                                |

>[!NOTE]
> The **Recognize entities in text** action supports 14 different languages. However, some entities may not be available for specific languages. You can find more information about language restrictions in [Microsoft Recognizers Text - Supported entities across cultures](https://github.com/microsoft/Recognizers-Text#supported-entities-across-cultures).

## Text actions

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
|Start index or length are out of range|Indicates that the start index or length are out of range|

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

### <a name="reverse"></a> Reverse text
Reverses the order of letters in a text string

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to reverse|Yes|Text value||The text to reverse|

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ReversedText|Text value|The new reversed text|


##### <a name="reverse_onerror"></a> Exceptions
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
Creates a list containing the substrings of a text that are separated by a specified delimiter or a regular expression

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|The text to split|No|Text value||The text to split|
|Delimiter type|N/A|Standard, Custom|Standard|Whether the used delimiter is of a standard or custom format|
|Custom delimiter|No|Text value||The character(s) that were used as a delimiter|
|Standard delimiter|N/A|Space, Tab, New line|Space|The delimiter used|
|Times|Yes|Numeric value|1|Specify how many times is the delimiter used|
|Is regular expression|N/A|Boolean value|False|Specify whether the delimiter will be a regular expression. A regular expression creates a range of possibilities for the delimiter. For example, '\d' means that the delimiter could be any digit|

> [!NOTE]
> Power Automate's regular expression engine is .NET. You can find more information in [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

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

> [!NOTE]
> Power Automate's regular expression engine is .NET. You can find more information in [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

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

> [!NOTE]
> Power Automate's regular expression engine is .NET. You can find more information in [Regular Expression Language - Quick Reference](/dotnet/standard/base-types/regular-expression-language-quick-reference).

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

### <a name="recognizeentitiesintext"></a> Recognize entities in text
Recognizes entities in text, such as numbers, units, data/time and others expressed in natural language accross multiple languages

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Text to recognize from|No|Text value||The text to recognize entities from|
|Entity type|N/A|Date time, Dimension, Temperature, Currency, Number range, Number, Ordinal, Percentage, Phone number, Email, IP address, Mention, Hashtag, URL, GUID, Quoted text|Date time|The type of entity to recognize (e.g., Date time, Email, URL etc.)|
|Language|N/A|English, Chinese (Simplified), Spanish, Spanish (Mexico), Portuguese, French, German, Italian, Japanese, Dutch, Korean, Swedish, Turkish, Hindi|English|Specify the language of the text|

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RecognizedEntities|Datatable|The recognized entities|

##### <a name="recognizeentitiesintext_onerror"></a> Exceptions
- This action doesn't include any exceptions

[!INCLUDE[footer-include](../../includes/footer-banner.md)]