---
title: Subprocess filter (preview)
description: Learn how to remove part of a process from cases in the Minit desktop application in process advisor.
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

# Subprocess filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use this event level filter to „cut out" a part of the process from all the cases (where the criteria for subprocess don't apply, case is completely excluded). For example, in a purchase order approval process we want to focus on the part from purchase order creation until the purchase order is marked as approved, or in a service center ticket solving process we want to see only the part being dealt by the second level support department.

In general, this filter can be defined as:

**Extracting events of each case in chronological order from the first occurrence of event with a specific value(s) of first attribute until the last occurrence of event with specific value(s) of second attribute.**

The following screenshot depicts the settings for the subprocess from the first occurrence of **Status change to Approved** to the last occurrence of **Status changed to Accounted** activity.

:::image type="content" alt-text="Screenshot of the settings for a subprocess." source="media/image042.png":::

#### Select an attribute for comparing events

Select the attribute on the basis of which the events in the case are selected.

:::image type="content" alt-text="Screenshot of the dropdown menu of attributes for comparing events." source="media/image043.png":::

#### Specify the first event

Select which events belong to the first group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

First occurrence of this event will be evaluated.

:::image type="content" alt-text="Screenshot of events belonging to the first group of events." source="media/image044.png":::

#### Specify the second event

Select which events belong to the second group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

Last occurrence of this event will be evaluated.

:::image type="content" alt-text="Screenshot of the events belonging to the second group of events." source="media/image045.png":::


