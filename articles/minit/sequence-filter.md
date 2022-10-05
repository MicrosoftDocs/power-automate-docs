---
title: Sequence filter (preview)
description: Learn how to define the sequence in which two events with specific attribute values are performed and specify further requirements for the progress of events in a case in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Sequence filter (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

This case level filter applies to the sequence in which events are performed in a case. You can use it to define the sequence in which two events with specific attribute values are performed and to specify further requirements for the progress of events in a case.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

The Sequence filter does not take the waiting time into account, but only the event start sequence.

The sample picture shows the filter configuration in which we are only interested in the cases where Azalia Hansen started to work on a case immediately after Abra Rivers.

:::image type="content" alt-text="media/image024.png" source="media/image024.png":::

#### Event attribute selection for sequence filtering

Here you need to select an attribute of interest for sequence filtering.

:::image type="content" alt-text="media/image025.png" source="media/image025.png":::

#### Selecting the attribute value for the first event in sequence

Choose from the available attribute values for the first event in sequence. You can choose the values by selecting attributes in the list on the right side of the screen.

:::image type="content" alt-text="media/image025a-1.png" source="media/image025a-1.png":::

#### Requirements for chronological arrangement

Here you specify the requirements for the chronological arrangement of events.

:::image type="content" alt-text="media/Sequence-filter-options.png" source="media/Sequence-filter-options.png":::

**Is directly followed**

Event No. 2 occurred immediately after Event No. 1.

**Is followed**

Event No. 2 occurred some time after Event No. 1. Another event may or may not have occurred between the two events.

**Is not directly followed**

Event No. 2 did not occur immediately after Event No. 1, but it may or may not have occurred at a later time.

**Is not followed**

Event No. 2 did not occur at any time after Event No. 1.

**Is parallel with**

Event No. 2 did occur at least partly during the time of Event No. 1.

**Is not parallel with**

Event No. 2 did not occur any time during the time of Event No. 1.

**Is directly followed by or parallel with**

Event No. 2 did occur immediately after Event No. 1,  or during the time of Event No. 1.

**Is followed by or parallel with**

Event No. 2 occurred some time after Event No. 1 or during the time of Event No. 1.  Another event may or may not have occurred between the two events.

#### Selecting the attribute value for the second event in sequence

Choose from available attribute values for the second event in sequence. You can choose the values by selecting attributes in the list on the right side of the screen.

:::image type="content" alt-text="media/image027-1.png" source="media/image027-1.png":::

#### Requirements and other common properties for events

Here you can define other requirements for the same or different properties of the first and second event.

In the first field you choose if the given property (attribute) is to be the same or different. If you leave the setting as **[the same/different]**, this condition will not be taken into consideration.

In the second field, you choose which event attribute should have the same/different value.

:::image type="content" alt-text="media/image028.png" source="media/image028.png":::

#### Requirements for time between events

Here you can define more specific requirements for the timespan between the first and second event.

If you leave the first field as **[shorter/longer/equal]**, this condition will not be taken into consideration.

:::image type="content" alt-text="media/duration2.png" source="media/duration2.png":::


