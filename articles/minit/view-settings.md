---
title: View settings
description: Learn how to define various settings valid for the current process in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 04/03/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# View settings

You can define various settings for the current process view on the **View settings** screen.

The screen consists of four tabs:

- General settings

- Duration settings

- Activity label

- Calendar settings

## General settings

The **General settings** tab allows you to define the duration format to be used for the current view. The global settings of the duration format used for all new processes and views can be defined in **Settings > Options > General**.

To learn more, go to [Settings](settings.md).

## Duration settings

The **Duration settings** tab allows you to select the maximum unit of time to be displayed. For example, if you select **Day**, all the larger units of time (for example, weeks, months, and years) will be converted into days while all the smaller units (hours, minutes, seconds, and milliseconds) will display normally based on the time format precision setting.

Since the length of months and years vary, they are converted to days using their average length:

```
1 month = 30.436875 days
1 year = 365.2425 days

```

Use the **Time format precision** dropdown menu to define how many time units will displayedFor example, when you select **Year** in the **Max time unit** dropdown menu, and then select **2** in the **Time format precision**, only years and months will display. If you select **3**, years, months, and weeks will display.

> [!NOTE]
>
> The values of the units that aren't displayed aren't converted into larger ones but are completely omitted. For example, 15 days will display as 2 weeks and not 2.07 weeks.

The **Show duration in working hours**checkbox automatically sets the max time unit to "hour" and time format precision to "unlimited".

## Activity label

The **Activity label** tab allows you to do the following:

- Set the default activity label.

- Select the display format (**Activity**, **Label**, or **Custom**)

- (If the default label is **Custom**) Edit the display format.

## Calendar settings

Select an existing calendar in the **Calendar** dropdown menu. If the menu options don't include the calendar template that you want to use, select the ellipses (**...**) to define a new template. If an existing calendar is close to what you want, select it in the **Calendar** dropdown menu, and then select (**...**) > **Edit**.

Calendar templates can be shared across Power Automate Process Mining projects. To manage all calendar templates, select **Settings** > **Working hours**. To learn more, go to [Settings](settings.md).

## Related information

[Process map overview](process-map.md)
