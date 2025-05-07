---
title: Working hours
description: Learn how to define calendar templates in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: concept-article
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Working hours

The **Working hours** tab allows you to define calendar templates, which can be applied to process views in order to influence the performance analysis calculation. The default setting is 24 hours, 7 days per week.

You can define a new calendar template by selecting **Create new calendar template** in the upper right corner. You can also define a new calendar by duplicating an existing calendar by selecting the ellipses (**...**) > **Create duplicate** to the right of the calendar template name.

To edit the calendar template, select the template name. After you make changes, remember to select **Save**.

## Define basic parameters

On the **General** tab, define basic parameters.

- **Template name:** The name of the calendar template.

- **Calendar type:** You can choose from two options, which influence how calendar template influences the performance calculations, when applied to the process view.

    - **Resource specific (nodes only):** The calendar template is applied only to work performed by resources (activities/nodes) in the process map (relevant for event logs with two timestamps). Waiting times between activities are calculated on a 24 hour, seven days a week basis.

    - **SLA specific (nodes and edges):** The calendar template is applied to both activities and edges (relevant for all event logs). Both active and waiting time are recalculated with the applied calendar template configuration.

## Define your working week time

On the **Working week** tab, define the structure of your working time during a standard working week.

- **Calendar type:** Specify the behavior of the working time setting controls:

    - **Mo, Tu, We, Th, Fr, Sa, Su:** Time for each working day is set separately.

    - **Mo-Fr, Sa, Su:** Monday through Friday share the same settings. Time for Saturday and Sunday is set separately.

    - **Mo-Su:** Monday through Sunday share the same settings.

- **Working/not working:** To set the specific day as non-working, uncheck the **Working** checkbox on the right side of the item. To set the working time, drag the left and right side of the blue slider corresponding to the respective working day.

## Define your non-working days

On the **Non-Working days** tab, define special non-working days such as bank holidays, national holidays, or company specific holidays.

- There are two main types of non-working days:

    - **Recurring:** Non-working for each year, regardless of where you set it.

    - **Non-recurring:** Non-working only for the respective year.

    To set the days as working or non-working, select the desired day or range of days in the calendar view and select the relevant item below the calendar.

    To switch the displayed year, select the arrows next to the year label above the calendar view.

- **Holidays**: Simplify the definition of bank and national holidays by importing them all at once. To initialize the import, select **Import holidays** below the calendar view. A window opens where you can choose the specific calendar and specify the year range. The Power Automate Process Mining desktop app automatically sets holidays for the defined range. You can import as many countries as needed.

    If you imported a set of holidays by mistake, you can delete them from the calendar template by selecting **Remove holidays** below the calendar view.

## Related information

[Settings overview](settings.md)
