---
title: List of string operations
description: Learn bout the string operations that you can use in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 08/28/2026
ms.author: michalrosik
ms.reviewer: cyanderson
search.audienceType:
- flowmaker
- enduser
---

# List of string operations

The following string operations are available in the Power Automate Process Mining desktop app.

[!INCLUDE [papm-operations-note](../includes/papm-operations-note.md)]

## CONCAT([string1],...,[stringN])

Concatenates the specified strings.

**Parameters:**

- **[string1]** - input string

   Data type: `STRING`

- **[stringN]** - last input string

   Data type: `STRING`

**Output Data Type**: STRING

## CONTAINS([string],[value])

Returns `true` if the string contains the given value. Otherwise, returns `false`.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[value]** - value to match in the input string

   Data type: `STRING`

**Output Data Type**: `BOOL`

## ENDSWITH([string],[value])

Returns `TRUE` if the string ends with the specified value. Otherwise, returns `FALSE`.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[value]** - value to match at the end of the input string

   Data type: `STRING`

**Output Data Type**: `BOOL`

## LEFT([string],[count])

Extracts a given number of characters from the left side of a supplied text string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## LEN([string])

Returns the length of the string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: INT

## LOWER([string])

Returns a lowercase version of a given text string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: STRING

## LTRIM([string])

Removes whitespace from the beginning of the string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: STRING

## RIGHT([string],[count])

Extracts a given number of characters from the right side of a supplied text string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[count]** - number of characters

   Data type: INT

**Output Data Type**: STRING

## RTRIM([string])

Removes whitespace from the end of the string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: STRING

## STARTSWITH([string],[value])

Returns `true` if the string starts with the given value. Otherwise, returns `false`.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[value]** - value to match

   Data type: `STRING`

**Output Data Type**: `BOOL`

## SUBSTRING([string],[start],[count])

Returns a substring that starts at the specified position and includes the specified number of characters.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

- **[start]** - start position of substring

   Data type: INT

- **[count]** - length of substring

   Data type: INT

**Output Data Type**: STRING

## TOINT([string],[default])

Converts a string to an integer. Returns 0 or the default value if there's a conversion error.

**Parameters:**

- **[string]** - input string to convert

   Data type: `STRING`

- **[default]** - default value

   Data type: INT, FLOAT

**Output Data Type**: INT

## TOSTRING([int],[format]*)

Converts an integer to a string according to the formatting string (if you specify this optional parameter).

**Parameters:**

- **[int]** - input integer value

   Data type: `STRING`

- **[format*]** - formatting string

  [Learn more about formatting strings](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([float],[format]*)

Converts a float to a string according to the formatting string (if you specify this optional parameter).

**Parameters:**

- **[float]** - input float value

   Data type: FLOAT

- **[format*]** - formatting string

  [Learn more about formatting strings](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string allowed)

**Output Data Type**: STRING

## TOSTRING([bool])

Converts a boolean to a string - "True" or "False".

**Parameters:**

- **[bool]** - input boolean value

   Data type: BOOL

**Output Data Type**: STRING

## TOSTRING([date],[format]*)

Converts a date to a string according to the formatting string (if you specify this optional parameter).

**Parameters:**

- **[date]** - input date

   Data type: `STRING`

- **[format*]** - formatting string applied on date

  [Learn more about formatting strings  ](/dotnet/standard/base-types/formatting-types)

   Date type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TOSTRING([time],[format]*)

Converts a time to a string according to the formatting string (if you specify the optional parameter).

**Parameters:**

- **[time]** - input time

   Data type: `STRING`

- **[format*]** - formatting string applied on time

  [Learn more about formatting strings  ](/dotnet/standard/base-types/formatting-types)

   Data type: STRING (only fixed string is allowed)

**Output Data Type**: STRING

## TRIM([string])

Removes whitespace at the beginning and at the end of the string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: STRING

## UPPER([string])

Returns an uppercase version of a given text string.

**Parameters:**

- **[string]** - input string

   Data type: `STRING`

**Output Data Type**: STRING
