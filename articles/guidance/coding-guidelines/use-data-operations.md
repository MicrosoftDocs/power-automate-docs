---
title: Use data operations
description: Learn how to use data operations
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

## Working with data operations

Data operations in Power Automate refer to the manipulation, transformation, and management of data within your automation flows in an efficient way.

Actions like Filter Array, Select, and Join actions can help avoid any unnecessary loops to process data.

For example, when you need to append to variables to make a final array to do any filtering, if the element doesn't come from information from external data source, often they can be simplified by data operations like filter or select.

![A screenshot of a computer Description automatically generated](media/5c4dc4ca6dde950f862ccac67b508c30.png)

Here's how the flow execution looks like when using append variable within a loop compared to Filter Array. In the example, to filter an array of 100 records, the Filter action takes a few milliseconds compared to Append to array within a loop which took 48 seconds and added more actions and complexity to the flow.

![A screenshot of a computer Description automatically generated](media/307d9622d52077002c407761946235e2.png)

## Variables vs compose

Compose aren't update-able at run-time. It's useful for write-once, read-many type of usage. If we need to write or update in many places in the flow, variables are much more appropriate. Similarly, using compose to create variables can also perform faster than initializing+ Declare variables.

When working with a set of variables that are updated within the same logical blocks in the flow, you can use JSON variables instead of individual variables. This help reduces the number of actions in the flow.

![A screenshot of a computer Description automatically generated](media/f5b7344fd0a44f53ec011f7593221c7d.png)

Consider the example: Instead of working with Var1 and Var2 as separate variables, we can use one Object Variable to manage both values.

![A screenshot of a computer Description automatically generated](media/6c4a9573da92351b92ed45881d00bebe.png)

![A screenshot of a computer Description automatically generated](media/df7b69d04a980cad676892db4a8e49ce.png)
