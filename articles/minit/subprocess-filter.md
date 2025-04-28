---
title: Subprocess filter
description: Learn how to remove part of a process from cases in Power Automate Process Mining.
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

# Subprocess filter

Use this event level filter to `„cut out"` a part of the process from all the cases. Where the criteria for the subprocess doesn't apply, the case is completely excluded. For example, in a purchase order approval process, you want to focus on the part from purchase order creation until the purchase order is marked as approved. Another example is, in a service center ticket solving process, you want to see only the part being dealt with by the second level support department.

The following screenshot depicts the settings for the subprocess from the first occurrence of **Mark order as complete** or **Suggest relevant options** to the last occurrence of **Notify customer that bike is ready for pickup** activity.

:::image type="content" alt-text="Screenshot of the settings for a subprocess filter." source="media/subprocess-filter.png":::

## Define the subprocess filter

In general, this filter can be defined as extracting events of each case in chronological order from the first occurrence of event with a specific value(s) of first attribute until the last occurrence of event with specific value(s) of second attribute.

1. From the **events located between the first occurrence of event with attribute** dropdown menu, select the attribute on the basis of which the events in the case are selected.

1. Select the **having one of these values** field, and then select which events belong to the first group of events in the **List** tab to the right. Your selections appear in the field.

1. Select the **and the last occurrence of event having one of these values** field, and then select which events belong to the second group of events in the **List** tab to the right. Your selections appear in the field.

## Use list and expression values

There are two possibilities to define the values for filter criteria. This is done in the **List** or **Expression** tab.

- **List:** Available for string attributes. Select or remove values to and from the list. If the list is long, you can use search to find specific values.

- **Expression:** Available for both string and numeric attributes. Specify an expression such as `„Starts with", „Contains"` for string and, an expression such as `„Greater than", „Equal"` for numeric attributes.

    You can also select **fx** to use [custom metrics](custom-metrics.md).

