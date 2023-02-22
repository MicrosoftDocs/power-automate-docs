---
title: Event attributes filter
description: Learn how to use the event attributes filter in the Power Automate Process Mining desktop app.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Event attributes filter

Use this event level filter to only select those events in cases that contain/don't contain a specific attribute value – such as only certain activities or events performed by a certain department (for example, First line support department for ServiceDesk).

:::image type="content" alt-text="Screenshot of the event attributes filter in the List tab." source="media/image013.png":::

#### Attribute selection

Here you need to select an attribute for the filter rule. All available attributes in the process are selectable.

:::image type="content" alt-text="Screenshot of the attributes for the filter rule." source="media/image014.png":::

#### Attribute value selection

Attribute values for the filter rule are selected on the right side of the screen.
There are two possibilities to define the values for filter criteria (select the respective tab to switch):

- List (available for string attributes) – in this tab you can select/remove values to/from the list and you can use search to find specific values in the list of possible values, in case the list is too long (don't forget to select them).

   :::image type="content" alt-text="Screenshot of string attributes in the  List tab." source="media/image015a.png":::

- To make the selection of attribute values easier, you can use the selection buttons to select all values, to cancel the selection of all values and to invert the selected values.

- Expression (available for both string and numeric attributes) – in this tab, you can specify an expression such as „Starts with", „Contains" for string and, an expression such as „Greater than", „Equal" also for numeric attributes. You can further select **fx** to use [custom metrics](custom-metrics.md).

   :::image type="content" alt-text="Screenshot of attributes in the Expression tab." source="media/expression.png":::




