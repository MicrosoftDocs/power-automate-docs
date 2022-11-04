---
title: List of string operations (preview)
description: Get a list of string operations that you can use in the Minit desktop application in process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# List of string operations (preview)

Following are the string operations that you can use in the minit desktop application in process advisor.

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## CONCAT([string1],...,[stringN])

concatenates given strings



**Parameters:**

- **[string1]** - input string

   Data type: STRING

- **[stringN]** - last input string

   Data type: STRING

**Output Data Type**: STRING

## CONTAINS([string],[value])

returns TRUE if the string contains the given value, else returns FALSE

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[value]** - value to be matched in input string

   Data type: STRING

**Output Data Type**: BOOL

## ENDSWITH([string],[value])

returns TRUE if string ends with the given value, else returns FALSE

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[value]** - value to match end of input string

   Data type: STRING

**Output Data Type**: BOOL

## LEFT([string],[count])

extracts a given number of characters from the left side of a supplied text string

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## LEN([string])

returns the length of the string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: INT

## LOWER([string])

returns a lower-case version of a given text string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## LTRIM([string])

removes whitespace from the beginning of the string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## RIGHT([string],[count])

extracts a given number of characters from the right side of a supplied text string

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## RTRIM([string])

removes whitespace from the end of the string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## STARTSWITH([string],[value])

returns TRUE if string starts with the given value, else returns FALSE

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[value]** - value to be matched

   Data type: STRING

**Output Data Type**: BOOL

## SUBSTRING([string],[start],[count])

returns substring from the specified start position and by the specified number of characters

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[start]** - start position of substring

   Data type: INT

- **[count]** - length of substring

   Data type: INT

**Output Data Type**: STRING

## TOINT([string],[default])

converts a string to an integer. Returns 0 or default value (optional) if conversion error occurs

**Parameters:**

- **[string]** - input string to be converted

   Data type: STRING

- **[default]** - default value

   Data type: INT, FLOAT

**Output Data Type**: INT

## TOSTRING([int],[format]*)

converts an integer to a string according to the formatting string (if an optional parameter is specified)

**Parameters:**

- **[int]** - input int value

   Data type: STRING

- **[format*]** - formatting string

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([float],[format]*)

converts a float to a string according to the formatting string (if an optional parameter is specified)

**Parameters:**

- **[float]** - input float value

   Data type: FLOAT

- **[format*]** - formatting string

   Data type: STRING (only fixed string in allowed)

**Output Data Type**: STRING

## TOSTRING([bool])

converts boolean to a string - "True" or "False"

**Parameters:**

- **[bool]** - input boolean value

   Data type: BOOL

**Output Data Type**: STRING

## TOSTRING([date],[format]*)

converts a date to a string according to the formatting string (if an optional parameter is specified)

**Parameters:**

- **[date]** - input date

   Data type: STRING

- **[format*]** - formatting string applied on date

   Date type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([time],[format]*)

converts a time to a string according to the formatting string (if an optional parameter is specified)

**Parameters:**

- **[time]** - input time

   Data type: STRING

- **[format*]** - formatting string applied on time

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TRIM([string])

removes whitespace at the beginning and at the end of the string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## UPPER([string])

returns upper-case version of a given text string

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

\* To learn more about standard or custom formatting string, go to [How to format numbers, dates, enums, and other types in .NET](/dotnet/standard/base-types/formatting-types).

