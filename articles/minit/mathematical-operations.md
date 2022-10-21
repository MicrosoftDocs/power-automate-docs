---
title: List of mathematical operations (preview)
description: Get a list of the parameters and output data types for mathematical features in the init desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# List of mathematical operations (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## ABS([value])

returns the absolute value of the number

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## CEIL([value])

returns the smallest integer greater that or equal to the given number

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## FLOOR([value])

returns the greatest integer smaller than or equal to the given number

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT, INT

## MAX([value1],[value2])

returns the maximum of the given values (value1 and value2)

**Parameters:**

- **[value1]** - input value

   Data type: FLOAT, INT, DATE, TIME

- **[value2]** - input value
Date type: FLOAT, INT, DATE, TIME

**Output Data Type**: FLOAT, INT, DATE, TIME

## MIN([value1],[value2])

returns the minimum of the given values (value1 and value2)

**Parameters:**

- **[value1]** - input value

   Data type: FLOAT, INT, DATE, TIME

- **[value2]** - input value

   Data type: FLOAT, INT, DATE, TIME

**Output Data Type**: FLOAT, INT

## LOG([value],[base])

returns the logarithm of the number to the specified base

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[base]** - base of the logarithm

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## POWER([value],[exponent])

returns the value of the specified expression to the specified power

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[exponent]** - specified power

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## ROUND([value],[digits])

rounds a number to a specified number of digits

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

- **[digits]** - number of digits

   Data type: INT

**Output Data Type**: FLOAT

## SIGN([value])

returns -1 if value is smaller than 0, 0 if value is 0, 1 if value is greater than 0

**Parameters:

**- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: INT

## SQR([value])

calculates the square of the value (second power)

**Parameters:

**- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## SQRT([value])

calculates the square root of the value

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT

## TRUNCATE([value])

returns the integer part of the number (rounded to the nearest integer toward zero)

**Parameters:**

- **[value]** - input value

   Data type: FLOAT, INT

**Output Data Type**: FLOAT


