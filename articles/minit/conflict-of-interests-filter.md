---
title: Conflict of interest filter
description: Learn how to use the conflict of interest filter in the Power Automate Process Mining desktop app.
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

# Conflict of interest filter

Use this filter to expose cases with conflict of interests. A typical example is the violation of rules for assigning roles in performing critical tasks.

By means of the filter, you can specify two sets of events which should/should not have the same value of an attribute. All events from the first group are always compared with all events from the second group. If there is the intersection of the two groups, the filter result will always return all such events.

The sample screenshot shows a situation where this filter is used to find out if there has ever been invoice accounted by the same person as the one who actually approved it. For this purpose, the filter is set to select all cases where these two activities occurred and were carried out by the same person.

:::image type="content" alt-text="screenshot of the conflict of interest filter." source="media/image035.png":::

### Selecting an attribute for comparing events

Here you choose the attribute on the basis of which the events in the case are selected.

:::image type="content" alt-text="Screenshot of an attribute for comparing events." source="media/image036.png":::

### Specification of the first event

Here you choose which events belong to the first group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

:::image type="content" alt-text="Screenshot of values for the first event." source="media/image037.png":::

### Specification of the second event

Here you choose which events belong to the second group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

:::image type="content" alt-text="Screenshot of values for the second event." source="media/image038.png":::

### Specification of the common attribute value

Here you choose which attribute is decisive for assessing the conflict of interests.


