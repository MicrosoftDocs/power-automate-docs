---
title: Tips and examples
description: Get tips on how to define a metric formula, reference an attribute name, and more in minit.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/31/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Tips and examples

## Metric formula

Define the metric formula in a text form. It can consist of predefined operations.

Individual operations are divided into two basic groups:

- [**Aggregation operations:**](aggregations.md) Input of aggregation operation is a set of values for which the resulting value will be calculated (for example, average, maximum, and more).

- **Scalar operations:** The input of scalar operation is one or more values for which the resulting value will be calculated (for example, absolute value of the number, obtaining part of the tax, and more).

Operations can use [constants](constants.md), can be combined using [unary or binary operators](unary-operators.md) (for example, addition, subtraction, and more), or be nested.

Scalar operations also include operations to obtain a value, either directly available in the form of an attribute or in the form of derived statistics (event duration).

Some operations also support specifying the context for which the operation is evaluated. This is important for aggregation operations that can aggregate values, for example, only for a specific activity, or for all activities or events. The implicit context resulting from the metric context or the parent operation context is also supported.

A metric formula can return one of the [supported data types](data-types-custom-metrics.md). Data types for specific formulas are defined in this article next to the formula syntax definition.

### Aggregation operations

[Aggregation operations](aggregations.md) are the basis of each metric. The most commonly used aggregation operations are:

- **COUNT:** Returns the number of aggregated values (`incl. COUNTIF, COUNTUNIQUE`).

- **SUM:** Returns the sum of aggregated values (`incl. SUMIF`).

- **AVG:** Returns the average of aggregated values.

- **MIN:** Returns the minimum of aggregated values.

- **MAX:** Returns the maximum of aggregated values.

The voluntary parameter of the aggregation operations will be the operation context and the scalar operation for modification of the input value. The complete list of supported calculation contexts is described in [**Calculation context**](calculation-context.md).

### Scalar operations

The purpose of scalar operations is to get one value and its transformation to the desired state. Currently supported operations can be divided into several types:

- [**Mathematical**](mathematical-operations.md) - this includes operations to obtain the absolute value of a number, rounding, etc.

- [**Date and Time**](date-and-time-operations.md) - includes operations to work with the date, such as getting part of the date, adding up dates, etc.

- [**String**](string-operations.md) - this includes operations to work with string data, such as getting a substring, splitting strings, etc.

- [**Statistical**](statistical-operations.md) – includes operations to get different statistics such as number of cases, case waiting time, etc.

- [**Other**](other-operations.md) - includes other operations, eg. operations accessing event, case, derived statistics, etc.

## Attribute names

If an attribute name is used as a parameter for operation, there are three ways for how to reference it:

- Use **the attribute name directly** (for example, `Resource`).

- Use the **GETVALUE("attribute name")** operation (for example, `GETVALUE("Resource")`).

- Use the **shortened attribute name** directly (for example, `attribute "Resource ID"` might be referenced as `ResourceID`).

The second form is used when the attribute name doesn't fulfill the naming convention. The attribute naming convention is defined as following:

- The Attribute name should start with a letter character or underscore.

- The Attribute name can contain only characters from the following Unicode standard classes: letter character (Lu, Ll, Lt, Lm, Lo, or Nl), combining character (Mn or Mc), decimal digit character (Nd), connecting character (Pc), or formatting character (Cf).

    For information on the Unicode character classes mentioned above, see The Unicode Standard, Version 3.0, section 4.5.

The third form is used optionally when the attribute name fulfills the naming convention, but also contains space characters. Instead of using the second form `GETVALUE("attribute name"`), it's possible to remove space characters and use the shortened version, `attributename`. Both forms are equivalent.

## Examples of VALID attribute names

- `DocumentCategory`

- `DocCat`

- `DocCat23`

## Examples of INVALID attribute names

- `Document.Category`

- `Document Category`

- `23DocCat`

## Metric formula examples

To calculate the relative duration of activity in a map:

```
AVG (DURATION()) / AVG (VIEWCASES, DURATION())


```



