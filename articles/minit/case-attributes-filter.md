---
title: Case attributes filter (preview)
description: Learn how to use the case attributes filter in Minit desktop application in process advisor.
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

# Case attributes filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use this filter to select only those cases that contain or don't contain a specific attribute. For example, select cases in which a specific activity is being performed, or cases in which a specific resource is present.

## Attribute selection

Here you need to select an attribute for the filter rule. All available attributes in the process are selectable.

:::image type="content" alt-text="Screenshot of attribute selection." source="media/image014-3.png":::

### Select attribute values

Select attribute values for the filter rule on the right side of the screen. There are two ways to define the values for filter criteria. Select the respective tab to switch.

- **List:** (Available for string attributes.) In this tab, you can select and remove values to and from the list. You can also search for specific values in the list of possible values in case the list is too long.

   :::image type="content" alt-text="Screenshot of attribute values list." source="media/image015a.png":::

- **Expression:** Available for both string and numeric attributes. In this tab, you can specify an expression such as `„Starts with", „Contains"` for string, and an expression such as `„Greater than", „Equal"` also for numeric attributes.

   :::image type="content" alt-text="Screenshot of attribute values." source="media/expression.png":::

   For an expression, it's possible to use custom expression as in custom metrics. To switch between constant value and custom expression, select **Fx**.

   :::image type="content" alt-text="Screenshot of Expression tab." source="media/expressioncm.png":::


