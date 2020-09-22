---
title: Lists | Microsoft Docs
description: Lists
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Lists

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Lists are collections of items. Depending on the types of the individual list items, there can be lists of text values, lists of numerical values, and so on. The list data type is the equivalent of a single-dimension array in programming terms. 

You can create a list through the **Create new list** action and add an item to that list through the **Add item to list** action.

![An example of a list.](media\lists\create-list.png)

You can also create a list through actions that generate lists as output. For example, the **Read text from file** action can return a list of text values and the **Get files in folder** action returns a list of files.

To retrieve a specific item of a list, use the following notation: **%VariableName\[ItemNumber\]%**

In the example below, the flow stores the first number of the previously displayed list to a new variable. Keep in mind that the index should be 0 for the first item of the list.

![An expression to access the first item of a list.](media\lists\list-first-item.png)

A common practice is to use a **For each** action to iterate through the items of a list.