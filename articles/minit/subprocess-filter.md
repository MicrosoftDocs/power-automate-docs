---
title: Subprocess filter
description: Learn how to remove part of a process from cases in minit.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/31/2023
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Subprocess filter

Use this event level filter to `„cut out"` a part of the process from all the cases. Where the criteria for the subprocess doesn't apply, the case is completely excluded. For example, in a purchase order approval process, you want to focus on the part from purchase order creation until the purchase order is marked as approved. Another example is, in a service center ticket solving process, you want to see only the part being dealt with by the second level support department.

The following screenshot depicts the settings for the subprocess from the first occurrence of **Status change to Approved** to the last occurrence of **Status changed to Accounted** activity.

:::image type="content" alt-text="Screenshot of the settings for a subprocess filter." source="media/subprocess-filter.png":::

## Define the subprocess filter

In general, this filter can be defined as extracting events of each case in chronological order from the first occurrence of event with a specific value(s) of first attribute until the last occurrence of event with specific value(s) of second attribute.

1. From the **events located between the first occurrence of event with attribute** dropdown menu, select the attribute on the basis of which the events in the case are selected.

1. Select the **having one of these values** field, and then select which events belong to the first group of events in the **List** tab to the right. Your selections appear in the field.

1. Select the **and the last occurrence of event having one of these values** field, and then select which events belong to the second group of events in the **List** tab to the right. Your selections appear in the field.



