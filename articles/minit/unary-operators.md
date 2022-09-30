---
title: Unary Operators
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Unary Operators

| OPERATOR | DESCRIPTION | INPUT DATA TYPE | OUTPUT DATA TYPE |
| - | - | - | - |
| returns the value x | INT, FLOAT, TIME | INT, FLOAT, TIME |
| returns negation of the value x (its opposite value) | INT, FLOAT, TIME | INT, FLOAT, TIME |
| returns negation of the value x (produces a value of true when its operand is false and a value of false when its operand is true) | BOOL | BOOL |


## Binary Operators

| OPARATOR | DESCRIPTION | INPUT DATA TYPE | OUTPUT DATA TYPE |
| - | - | - | - |
| **x + y** | adds the arguments | INT, FLOAT, DATE, TIME | INT + INT = INT, INT + FLOAT = FLOAT, FLOAT + INT = FLOAT, FLOAT + FLOAT = FLOAT, DATE + TIME = DATE, TIME + TIME = TIME |
| **x - y** | subtracts the arguments | INT, FLOAT, DATE, TIME | INT - INT = INT, INT - FLOAT = FLOAT, FLOAT - INT = FLOAT, FLOAT - FLOAT = FLOAT, DATE - DATE = TIME, DATE - TIME = DATE, TIME - TIME = TIME |
| **x * y** | multiplies the arguments | INT, FLOAT, TIME | INT * INT = INT, INT * FLOAT = FLOAT, FLOAT * INT = FLOAT, FLOAT * FLOAT = FLOAT, TIME * INT = TIME, INT * TIME = TIME, TIME * FLOAT = TIME, FLOAT * TIME = TIME |
| **x / y** | divides the arguments | INT, FLOAT, TIME | INT / INT = INT, INT / FLOAT = FLOAT, FLOAT / INT = FLOAT, FLOAT / FLOAT = FLOAT, TIME / TIME = FLOAT, TIME / FLOAT = TIME, TIME / INT = TIME, |
| **x % y** | finds the remainder after division of x by y | INT, FLOAT, TIME | INT % INT = INT, INT % FLOAT = FLOAT, FLOAT % INT = FLOAT, FLOAT % FLOAT = FLOAT, TIME % TIME = TIME |
| **x == y** | returns TRUE only if x is equal to y, else returns FALSE | INT, FLOAT, BOOL, STRING,DATE, TIME | BOOL |
| **x != y** | returns TRUE only if x is NOT equal to y, else returns FALSE | INT, FLOAT, BOOL, STRING,DATE, TIME | BOOL |
| **x > y** | returns TRUE only if x is greater than y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| **x >= y** | returns TRUE only if x is greater than OR equal to y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| **x < y** | returns TRUE only if x is less than y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| **x <= y** | returns TRUE only if x is less than OR equal to y, else returns FALSE | INT, FLOAT, DATE, TIME | BOOL |
| **x && y** | returns TRUE only if BOTH x and y are TRUE, else FALSE | BOOL | BOOL |
| **x || y** | returns TRUE if either x OR y is TRUE, else FALSE | BOOL | BOOL |




