---
title: Case attributes filter (preview)
description: Learn how to use the case attributes filter in the Minit desktop application for Microsoft Power Automate process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case attributes filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The **Attributes** filter selects cases that contain&mdash;or don't contain&mdash;a specific attribute. Use it, for example, to select cases that include a certain activity or resource.

1. Select the filter **Attributes**.

    :::image type="content" source="media/image014.png" alt-text="Screenshot of the Attributes (conditional) filter.":::

1. Select an attribute.

1. Select either the **List** tab or the **Expression** tab and select or enter the attribute value.

    - **List**: Select, or search for and select, values. It may take a moment for the list to populate after you select the **List** tab.

       :::image type="content" alt-text="Screenshot of an attribute values list." source="media/image015a.png":::

    - **Expression**: You can include both string and numeric attributes in an expression.

       :::image type="content" alt-text="Screenshot of an attribute value specified as an expression." source="media/expression.png":::

## Create a custom expression

You can include custom metrics in an expression, too.

1. To switch between a constant value and a custom expression, select **Fx**.

    :::image type="content" alt-text="Screenshot of an attribute value specified as a custom expression." source="media/expressioncm.png":::

1. Specify the value or values, or custom expression.

    To learn how to create a custom expression, go to [Custom metrics overview (preview)](custom-metrics.md).

    :::image type="content" alt-text="Screenshot of an attribute value specified as a custom expression." source="media/expressioncm2.png":::

### See also

[Custom metrics overview (preview)](custom-metrics.md)<br/>
[Tips and examples (preview)](general-information.md)