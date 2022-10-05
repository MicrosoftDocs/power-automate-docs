---
title: Subprocess filter (preview)
description: Learn how to remove part of a process from cases in the minit desktop application in process advisor.
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

# Subprocess filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use this event level filter to „cut out" a part of the process from all the cases (where the criteria for subprocess do not apply, case is completely excluded). For example, in a purchase order approval process we want to focus on the part from purchase order creation until the purchase order is marked as approved, or in a service center ticket solving process we want to see only the part being dealt by the second level support department.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

In general, this filter can be defined as:

**Extracting events of each case in chronological order from the first occurrence of event with a specific value(s) of first attribute until the last occurrence of event with specific value(s) of second attribute.**

The following screenshot depicts the settings for the subprocess from the first occurrence of **Status change to Approved** to the last occurrence of **Status changed to Accounted** activity.

:::image type="content" alt-text="media/image042.png" source="media/image042.png":::

#### Selecting an attribute for comparing events

Here you choose the attribute on the basis of which the events in the case are selected.

:::image type="content" alt-text="media/image043.png" source="media/image043.png":::

#### Specification of the first event

Here you choose which events belong to the first group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

First occurrence of this event will be evaluated.

:::image type="content" alt-text="media/image044.png" source="media/image044.png":::

#### Specification of the second event

Here you choose which events belong to the second group of events. Select permissible values for its selected attribute in the list on the right side of the screen.

Last occurrence of this event will be evaluated.

:::image type="content" alt-text="media/image045.png" source="media/image045.png":::


