---
title: List of unary operators
description: Get a list of unary operators in minit.
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

# List of unary operators

The following tables describe unary and binary operators.

| Operator | Description | Input data type | Output data type |
| - | - | - | - |
| +x | Returns the value x | INT, FLOAT, TIME | INT, FLOAT, TIME |
| -x |Returns negation of the value x (its opposite value) | INT, FLOAT, TIME | INT, FLOAT, TIME |
| !x | Returns negation of the value x (produces a value of true when its operand is false and a value of false when its operand is true) | BOOL | BOOL |

## Binary Operators

The following table describes binary operators.

| Operator | Description | Input data type | Output data type |
| --- | --- | --- | --- |
| x + y | Adds the arguments | INT, FLOAT, DATE, TIME | INT + INT = INT, INT + FLOAT = FLOAT, FLOAT + INT = FLOAT, FLOAT + FLOAT = FLOAT, DATE + TIME = DATE, TIME + TIME = TIME |
| x - y | Subtracts the arguments | INT, FLOAT, DATE, TIME | INT - INT = INT, INT - FLOAT = FLOAT, FLOAT - INT = FLOAT, FLOAT - FLOAT = FLOAT, DATE - DATE = TIME, DATE - TIME = DATE, TIME - TIME = TIME |
| x * y | Multiplies the arguments | INT, FLOAT, TIME | INT * INT = INT, INT * FLOAT = FLOAT, FLOAT * INT = FLOAT, FLOAT * FLOAT = FLOAT, TIME * INT = TIME, INT * TIME = TIME, TIME * FLOAT = TIME, FLOAT * TIME = TIME |
| x / y | Divides the arguments | INT, FLOAT, TIME | INT / INT = INT, INT / FLOAT = FLOAT, FLOAT / INT = FLOAT, FLOAT / FLOAT = FLOAT, TIME / TIME = FLOAT, TIME / FLOAT = TIME, TIME / INT = TIME, |
| x % y | Finds the remainder after division of x by y | INT, FLOAT, TIME | INT % INT = INT, INT % FLOAT = FLOAT, FLOAT % INT = FLOAT, FLOAT % FLOAT = FLOAT, TIME % TIME = TIME |
| x == y | Returns TRUE only if x is equal to y, else returns FALSE | INT, FLOAT, BOOL, STRING,DATE, TIME | BOOL |
| x != y | Returns TRUE only if x is NOT equal to y, else returns FALSE | INT, FLOAT, BOOL, STRING,DATE, TIME | BOOL |
| x > y | Returns TRUE only if x is greater than y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| x >= y | Returns TRUE only if x is greater than OR equal to y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| x < y | Returns TRUE only if x is less than y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| x <= y | Returns TRUE only if x is less than OR equal to y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| x && y |Returns TRUE only if BOTH x and y are TRUE, else FALSE | BOOL | BOOL |
| x \| \| y | Returns TRUE if either x OR y is TRUE, else FALSE | BOOL | BOOL |

