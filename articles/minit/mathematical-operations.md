---
title: List of mathematical operations
description: Learn about the parameters and output data types for mathematical features in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/10/2025
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# List of mathematical operations

[!INCLUDE [papm-operations-note](../includes/papm-operations-note.md)]

## ABS([value])

Returns the absolute value of the number.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## CEIL([value])

Returns the smallest integer greater that or equal to the given number.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## FLOOR([value])

Returns the greatest integer smaller than or equal to the given number.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## MAX([value1],[value2])

Returns the maximum of the given values (value1 and value2).

**Parameters:**

- **[value1]** - input value

   Data type: FLOAT, INT, DATE, TIME

- **[value2]** - input value
Date type: FLOAT, INT, DATE, TIME

**Output Data Type**: FLOAT, INT, DATE, TIME

## MIN([value1],[value2])

Returns the minimum of the given values (value1 and value2).

**Parameters:**

- **[value1]** - input value

   Data type: FLOAT, INT, DATE, TIME

- **[value2]** - input value

   Data type: FLOAT, INT, DATE, TIME

**Output Data Type**: FLOAT, INT

## LOG([value],[base])

Returns the logarithm of the number to the specified base.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[base]** - base of the logarithm

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## POWER([value],[exponent])

Returns the value of the specified expression to the specified power.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[exponent]** - specified power

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## ROUND([value],[digits])

Rounds a number to a specified number of digits.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[digits]** - number of digits

   Data type: INT

**Output Data Type**: FLOAT

## SIGN([value])

Returns -1 if value is smaller than 0, 0 if value is 0, 1 if value is greater than 0.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: INT

## SQR([value])

Calculates the square of the value (second power).

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## SQRT([value])

Calculates the square root of the value.

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## TRUNCATE([value])

Returns the integer part of the number (rounded to the nearest integer toward zero).

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT


