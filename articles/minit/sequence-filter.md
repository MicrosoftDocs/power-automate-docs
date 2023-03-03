---
title: Sequence filter
description: Learn how to define the sequence in which two events with specific attribute values are performed and specify further requirements for the progress of events in a case in the Power Automate Process Mining desktop app.
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

# Sequence filter

This case level filter applies to the sequence in which events are performed in a case. You can use it to define the sequence in which two events with specific attribute values are performed and to specify further requirements for the progress of events in a case.

The Sequence filter doesn't take the waiting time into account, but only the event start sequence.

The following screenshot shows the filter configuration in which we are only interested in the cases where  Hansen started to work on a case immediately after Rivers.

:::image type="content" alt-text="Screenshot of the sequence filter." source="media/image024.png":::

## Event attribute selection for sequence filtering

Select an attribute of interest for sequence filtering.

:::image type="content" alt-text="Screenshot of the dropdown menu for attributes for sequence filtering." source="media/image025.png":::

## Select the attribute value for the first event in sequence

Choose from the available attribute values for the first event in sequence. You can choose the values by selecting attributes in the list on the right side of the screen.

:::image type="content" alt-text="Screenshot of the attribute value for the first event in sequence." source="media/image025a-1.png":::

## Requirements for chronological arrangement

Specify the requirements for the chronological arrangement of events.

:::image type="content" alt-text="Screenshot of the dropdown menu of requirement for chronological arrangement of events." source="media/Sequence-filter-options.png":::

Following are the requirements and their descriptions:

- **Is directly followed by:** Event 2 occurred immediately after event 1.

- **Is followed by:** Event 2 occurred some time after event 1. Another event may or may not have occurred between the two events.

- **Is not directly followed by:** Event 2 didn't occur immediately after event 1, but it may or may not have occurred at a later time.

- **Is not followed by:** Event 2 didn't occur at any time after event 1.

- **Is parallel with:** Event 2 did occur at least partly during the time of event 1.

- **Is not parallel with:** Event 2 didn't occur any time during the time of event 1.

- **Is directly followed by or parallel with:** Event 2 did occur immediately after event 1, or during the time of event 1.

- **Is followed by or parallel with:** Event 2 occurred some time after event 1 or during the time of event 1. Another event may or may not have occurred between the two events.

## Select the attribute value for the second event in sequence

Choose from available attribute values for the second event in sequence. You can choose the values by selecting attributes in the list on the right side of the screen.

:::image type="content" alt-text="Screenshot of an attribute value." source="media/image027-1.png":::

## Requirements and other common properties for events

Define other requirements for the same or different properties of the first and second event.

In the first field you choose if the given property (attribute) is to be the same or different. If you leave the setting as **[the same/different]**, this condition won't be taken into consideration.

In the second field, you choose which event attribute should have the same/different value.

:::image type="content" alt-text="Screenshot of an event attribute." source="media/image028.png":::

## Requirements for time between events

Define more specific requirements for the timespan between the first and second event. If you leave the first field as **[shorter/longer/equal]**, this condition won't be taken into consideration.

:::image type="content" alt-text="Screenshot of specific requirements." source="media/duration2.png":::

