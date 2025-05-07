---
title: List of string operations
description: Learn bout the string operations that you can use in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/10/2025
ms.author: lali
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# List of string operations

Following are the string operations that you can use in the Power Automate Process Mining desktop app.

[!INCLUDE [papm-operations-note](../includes/papm-operations-note.md)]

## CONCAT([string1],...,[stringN])

Concatenates given strings.

**Parameters:**

- **[string1]** - input string

   Data type: STRING

- **[stringN]** - last input string

   Data type: STRING

**Output Data Type**: STRING

## CONTAINS([string],[value])

Returns TRUE if the string contains the given value, else returns FALSE.

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[value]** - value to be matched in input string

   Data type: STRING

**Output Data Type**: BOOL

## ENDSWITH([string],[value])

Returns TRUE if string ends with the given value, else returns FALSE.

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[value]** - value to match end of input string

   Data type: STRING

**Output Data Type**: BOOL

## LEFT([string],[count])

Extracts a given number of characters from the left side of a supplied text string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## LEN([string])

Returns the length of the string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: INT

## LOWER([string])

Returns a lower-case version of a given text string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## LTRIM([string])

Removes whitespace from the beginning of the string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## RIGHT([string],[count])

Extracts a given number of characters from the right side of a supplied text string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## RTRIM([string])

Removes whitespace from the end of the string.

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

Returns substring from the specified start position and by the specified number of characters.

**Parameters:**

- **[string]** - input string

   Data type: STRING

- **[start]** - start position of substring

   Data type: INT

- **[count]** - length of substring

   Data type: INT

**Output Data Type**: STRING

## TOINT([string],[default])

Converts a string to an integer. Returns 0 or default value (optional) if conversion error. occurs

**Parameters:**

- **[string]** - input string to be converted

   Data type: STRING

- **[default]** - default value

   Data type: INT, FLOAT

**Output Data Type**: INT

## TOSTRING([int],[format]*)

Converts an integer to a string according to the formatting string (if an optional parameter is specified).

**Parameters:**

- **[int]** - input int value

   Data type: STRING

- **[format*]** - formatting string

  [Learn more about formatting strings](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([float],[format]*)

Converts a float to a string according to the formatting string (if an optional parameter is specified).

**Parameters:**

- **[float]** - input float value

   Data type: FLOAT

- **[format*]** - formatting string

  [Learn more about formatting strings](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string in allowed)

**Output Data Type**: STRING

## TOSTRING([bool])

Converts boolean to a string - "True" or "False".

**Parameters:**

- **[bool]** - input boolean value

   Data type: BOOL

**Output Data Type**: STRING

## TOSTRING([date],[format]*)

Converts a date to a string according to the formatting string (if an optional parameter is specified).

**Parameters:**

- **[date]** - input date

   Data type: STRING

- **[format*]** - formatting string applied on date

  [Learn more about formatting strings  ](/dotnet/standard/base-types/formatting-types)

   Date type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([time],[format]*)

Converts a time to a string according to the formatting string (if an optional parameter is specified).

**Parameters:**

- **[time]** - input time

   Data type: STRING

- **[format*]** - formatting string applied on time

  [Learn more about formatting strings  ](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TRIM([string])

Removes whitespace at the beginning and at the end of the string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING

## UPPER([string])

Returns upper-case version of a given text string.

**Parameters:**

- **[string]** - input string

   Data type: STRING

**Output Data Type**: STRING
