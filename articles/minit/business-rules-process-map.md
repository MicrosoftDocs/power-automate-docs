---
title: Business rules for process maps (preview)
description: Learn how to select various process map views in Minit desktop application in process advisor.
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

# Business rules for process maps (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Process map in the **Customize** panel under the **Business rules** tab allows you to select from two main display modes:

- Single business rule - displays results per single business rule

- Severity display - displays the total count of all business rules results over elements in Process Map with given severity.

   :::image type="content" alt-text="Screenshot of the Customize screen display modes." source="media/brpmmodes.png":::

In Process Map, it is possible to display all business rules except for process scope business rules.

## Single business rule display

In the single business rule mode, the results are displayed for a selected business rule. The user is able to select a different business rule for activities and edges. Case scope business rules can be displayed for both activities and edges dropdown menus, as they represent complete cases (including activities and edges). Event and edge scope business rules are available only from the relevant dropdown menus.

:::image type="content" alt-text="Screenshot of the Customize screen in the single business rule mode." source="media/brpmdropdowns.png":::

Using the value switch icon next to the business rule dropdown menu, it's possible to choose between default output (count) and custom output (custom formula). In the following screenshot, the same case scope business rule is selected. For activities, it displays custom output&mdash;a sum of the financial attributes. For edges it displays default output&mdash;count of cases.

:::image type="content" alt-text="Screenshot of a single business rule process map." source="media/brpmsingle.png":::

## Severity display

For each activity and edge, the business rule severity display mode over Process map shows the total number of occurrences of such element when business rule resulted in chosen severity. The result doesn't represent the number of applied business rules with a given severity, but number of elements (cases, activities and edges) which fit into the data sets for each business rule that resulted in the chosen severity.

:::image type="content" alt-text="Screenshot of a process map severity display mode." source="media/brpmseverity.png":::

## Details display

In the details panel, it is possible to define several business rules to be displayed. In the detailed view, both default and custom results are displayed.

:::image type="content" alt-text="Screenshot of a process map details display mode." source="media/brpmdetails.png":::


