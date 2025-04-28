---
title: End events filter
description: Learn how to restrict cases according to the property of the event that occurred at the beginning or at the end of the case in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# End events filter

Use this filter to restrict cases according to the property of the event that occurred at the beginning or at the end of the case.

The filter in the following screenshot will only select the cases starting with the **Confirm order** activity and ending with the **Mark order as complete** activity.

:::image type="content" alt-text="Screenshot of a filter that specifies start and end." source="media/end-events-filter.png":::

In the same way, you can create a resource-based condition (for example, if you want to select only the cases that Anna started to deal with).

## Define the end events filter

1. From the **attribute** dropdown menu, select which attribute is of interest when assessing events.

1. Select the **on a starting event of the single case holds any of the values** field, and then select the attribute value for the end event in the **List** tab to the right. Your selections appear in the field.

    Only the values that are present in the starting events of the process are available for selection. If the attribute values of the starting event are of no interest, all values should remain active/selected.

1. Select the **and on a finishing event of the single case holds any of the values** field, and then select the attribute value for the end event in the **List** tab to the right. Your selections appear in the field.

    Only the values that are present in the finishing events of the process are available for selection. If the attribute values of the finishing event are of no interest, all values should remain active/selected.


