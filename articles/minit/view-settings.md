---
title: View settings (preview)
description: Learn how to define various settings valid for the current process in the minit desktop application in process advisor.
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

# View settings (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

The View settings panel enables defining various settings valid for the current process view. This panel is easily accessible from any Minit screen such as Process Map, Variants, Statistics, and others. The View setting icon can be found in the bottom left corner, above the Filters icon. With no changes applied (i.e. with default settings), the icon remains grey.

:::image type="content" alt-text="media/image001-v48.png" source="media/image001-v48.png":::

Once the default settings are modified, the icon color changes to teal. The actual settings display on mouseover.

:::image type="content" alt-text="media/image002-v48.png" source="media/image002-v48.png":::

The View settings panel consists of three groups of settings - *General settings*, *Activity label* and *Working hours*.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## General settings

The General settings section allows defining the duration format to be used for the current view. The global settings of the duration format used for all new processes and views can be defined in **Settings > Options > General**. See [Settings](settings.md) for more information.

:::image type="content" alt-text="media/image-51.png" source="media/image-51.png":::

## Duration settings

Use Duration Settings to select the maximum unit of time to be displayed. E.g. when you select "day", all the larger units of time (i.e. weeks, months and years) will be converted into days while all the smaller units (hours, minutes, seconds and milliseconds) will display normally based on the time format precision setting.

Since the length of months and years vary, they are converted to days using their average length:


```
1 month = 30.436875 days
1 year = 365.2425 days


```
Use the **Time format precision** drop-down menu to define how many time units will be displayed. E.g. when you select "year" and set the format precision to 2, only years and months will display. If you select 3, years, months and weeks will be displayed.

**The values of the units that are not displayed are not converted into larger ones but completely omitted. E.g. 15 days will display as 2 weeks and not 2,07 weeks.**

The **Show duration in working hours** button automatically sets the max time unit to "hour" and time format precision to "unlimited".

:::image type="content" alt-text="media/image-53.png" source="media/image-53.png":::

## Working hours

The working hours calendar template is applied to the process view by selecting the calendar template using the *Calendar* drop-down menu.

:::image type="content" alt-text="media/image-52.png" source="media/image-52.png":::

If the list does not include the calendar template that you want to use, click the **...** button to define a new template or select an existing one and click **Edit** to modify it according to your needs.

Calendar templates can be shared across Minit projects. To manage all available calendar templates go to **Options > Working hours**. See [Settings](settings.md) for more information.


