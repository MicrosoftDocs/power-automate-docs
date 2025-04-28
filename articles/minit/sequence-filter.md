---
title: Sequence filter
description: Learn how to define the sequence in which two events with specific attribute values are performed and specify further requirements in Power Automate Process Mining.
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

# Sequence filter

This case level filter applies to the sequence in which events are performed in a case. You can use it to define the sequence in which two events with specific attribute values are performed and to specify further requirements for the progress of events in a case.

The following screenshot shows the filter configuration in which we are only interested in the cases where Riley started to work on a case immediately after Alex.

:::image type="content" alt-text="Screenshot of the sequence filter." source="media/sequence-filter.png":::

## Define the sequence filter

The sequence filter doesn't take the waiting time into account. It takes into account only the event start sequence.

1. From the **for attribute** dropdown menu, select an attribute of interest for sequence filtering.

1. Select the **an event with the attribute value in** field, and then select the attribute values for the first event in sequence in the **List** tab to the right. Your selections appear in the field.

1. In the next field, specify the requirements for the chronological arrangement of events (for example, **is directly followed by**).

    For a list of other requirements, go to [Event attribute requirements for sequence filtering](#event-attribute-requirements-for-sequence-filtering) in this article.

1. Select the **an event with the attribute value in** field, and then select the attribute values for the second event in sequence in the **List** tab to the right. Your selections appear in the field.

1. In the next field, define other requirements for the same or different properties of the first and second event. For example, select if the given property (attribute) is to be the same or different.

    If you leave the setting as **[the same/different]**, this condition won't be taken into consideration.

1. From the the **values of attribute** dropdown menu, select which event attribute should have the same/different value.

1. From the **and the time between the events is** dropdown menu, select the time span between the first and second event.

    If you leave the first field as **[shorter/longer/equal]**, this condition won't be taken into consideration.

## Event attribute requirements for sequence filtering

Following are the selections and their descriptions:

- **Is directly followed by:** Event 2 occurred immediately after event 1.

- **Is followed by:** Event 2 occurred some time after event 1. Another event may or may not have occurred between the two events.

- **Is not directly followed by:** Event 2 didn't occur immediately after event 1, but it may or may not have occurred at a later time.

- **Is not followed by:** Event 2 didn't occur at any time after event 1.

- **Is parallel with:** Event 2 did occur at least partly during the time of event 1.

- **Is not parallel with:** Event 2 didn't occur any time during the time of event 1.

- **Is directly followed by or parallel with:** Event 2 did occur immediately after event 1, or during the time of event 1.

- **Is followed by or parallel with:** Event 2 occurred some time after event 1 or during the time of event 1. Another event may or may not have occurred between the two events.
