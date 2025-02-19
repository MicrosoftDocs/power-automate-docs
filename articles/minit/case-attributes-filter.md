---
title: Case attributes filter
description: Learn how to use the case attributes filter in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Case attributes filter

The **Attributes** filter selects cases that contain&mdash;or don't contain&mdash;a specific attribute.

## Filter values from a list

Use the filter to select cases that include a certain activity or resource.

1. On the left panel, select your attributes filter.

1. In the **Filter result** dropdown menu, select if the cases you select for the filter should or shouldn't be included.

1. In the **cases in which attribute** dropdown menu, select an attribute.

1. In the **holds any of the values** dropdown menu, select one or more values in the **List** tab to the right.

1. Select **Apply**.

    :::image type="content" source="media/attributes-filter.png" alt-text="Screenshot of the Attributes filter screen.":::

## Filter values from an expression

Use the filter to select cases that include an expression. You can include both string and numeric attributes in an expression.

1. Follow steps 1 through 3 in [Filter values from a list](#filter-values-from-a-list) in this article.

1. On the panel to the right, select **Expression**.

1. In the first dropdown menu, select the operator for your expression.

1. In the field next to the operator, enter the value.

1. Select **Apply**.

## Enter a custom expression

You can switch between a constant value and a custom expression by selecting **Fx** in the **Expression** tab.

To learn how to use a custom expression, go to [Custom metrics overview](custom-metrics.md).

## Related information

[Custom metrics overview](custom-metrics.md)<br/>
[Tips and examples](general-information.md)
