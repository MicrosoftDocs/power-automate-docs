---
title: Conflict of interests filter
description: Learn how to use the conflict of interests filter in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Conflict of interests filter

Use this filter to expose cases with conflict of interests. A typical example is the violation of rules for assigning roles in performing critical tasks.

By means of the filter, you can specify two sets of events which should happen in the process in given order and should or shouldn't have the same value of an attribute. All events from the first group are always compared with all events from the second group. If there is the intersection of the two groups, the filter result will always return all such events.

The screenshot shows a situation where this filter is used to find out if there's been a customer who was charged by the same person as the one who actually collected payment. For this purpose, the filter is set to select all cases where these two activities occurred and were carried out by the same person.

:::image type="content" alt-text="Screenshot of the conflict of interest filter." source="media/conflict-of-interests-filter.png":::

## Define the conflict of interests filter

1. From the **2 consecutive events exist with attribute** dropdown menu, select the attribute on the basis of which the events in the case are selected.

1. Select the **for the first event, values** field, and then select the attribute values in the **List** tab to the right. Your selections appear in the field.

1. Select the **for the second event, values** field, and then select the attribute values in the **List** tab to the right. Your selections appear in the field.

1. From the **and both events have equal value of attribute** dropdown menu, select which attribute is decisive for assessing the conflict of interests.

