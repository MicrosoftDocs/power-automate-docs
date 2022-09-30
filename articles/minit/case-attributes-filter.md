---
title: Case Attributes Filter
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

# Case Attributes Filter

Use this filter to only select those cases that contain/do not contain a specific attribute – such as cases in which a specific activity is being performed or cases in which a specific resource is present.

:::image type="content" alt-text="media/image013-3.png" source="media/image013-3.png":::

## Attribute selection

Here you need to select an attribute for the filter rule. All available attributes in the process are selectable.

:::image type="content" alt-text="media/image014-3.png" source="media/image014-3.png":::

### Attribute value selection

Attribute values for the filter rule are selected on the right side of the screen.
There are two possibilities to define the values for filter criteria (click on the respective tab to switch):

- List (available for string attributes) – in this tab you can select/remove values to/from the list and you can use search to find specific values in the list of possible values, in case the list is too long (do not forget to select them).
:::image type="content" alt-text="media/image015a.png" source="media/image015a.png":::



- Expression (available for both string and numeric attributes) – in this tab you can specify an expression such as „Starts with", „Contains" for string, and an expression such as „Greater than", „Equal" also for numeric attributes.
:::image type="content" alt-text="media/expression.png" source="media/expression.png":::



For an expression, it is possible to use custom expression as in custom metrics. To switch between constant value and custom expression, click on the **Fx** icon.

:::image type="content" alt-text="media/expressioncm.png" source="media/expressioncm.png":::


