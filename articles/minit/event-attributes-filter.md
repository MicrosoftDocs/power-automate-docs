---
title: Event attributes filter
description: Learn how to use the event attributes filter in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Event attributes filter

Use this event level filter to only select those events in cases that contain/don't contain a specific attribute value – such as only certain activities or events performed by a certain department (for example, First line support department for ServiceDesk).

:::image type="content" alt-text="Screenshot of the event attributes filter in the List tab." source="media/event-attributes-filter.png":::

## Define the event attributes filter

1. From the **events in which attribute** dropdown menu, select an attribute for the filter rule.

1. Select the **holds any of the values** field, and then select the attribute values in the **List** tab to the right. Your selections appear in the field.

## Use list and expression values

There are two possibilities to define the values for filter criteria. This is done in the **List** or **Expression** tab.

- **List:** Available for string attributes. Select or remove values to and from the list. If the list is long, you can use search to find specific values.

- **Expression:** Available for both string and numeric attributes. Specify an expression such as `„Starts with", „Contains"` for string and, an expression such as `„Greater than", „Equal"` for numeric attributes.

    You can also select ***fx*** to use [custom metrics](custom-metrics.md).

