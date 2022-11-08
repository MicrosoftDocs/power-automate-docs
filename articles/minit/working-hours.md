---
title: Working hours (preview)
description: Learn how to define calendar templates in the Minit desktop application in process advisor.
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

# Working hours (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The Working hours section allows you to define calendar templates, which can be applied to process views in the Process explorer in order to influence the performance analysis calculation, which is by default performed on a 24/7 basis.

You can define a new calendar template by selecting **Create new calendar template** in the upper right corner of the screen or by duplicating existing calendar via the (**…**) button and selecting **Create duplicate** option to the right of the calendar template entry.

To edit the calendar template, select the template name. To delete it, select **Delete** in the **...** context menu. When a calendar template that's in use by any process view is deleted, you're informed when opening the view.

## Calendar template definition

The calendar template parameters are defined on three levels - **General**, **Working week** and **Non-working days**.

### General

In the general section you can defined the basic parameters.

- **Template name**: The name of the calendar template.

- **Calendar type**: You can choose from two options, which influence how calendar template influences the performance calculations, when applied to the process view:

    - **Resource specific:** The calendar template is applied only to work performed by resources (activities/nodes) in the process map (relevant for event logs with two timestamps). Waiting times between activities are calculated on a 24 hour, seven days a week basis.

    - **SLA specific:** The calendar template is applied to both activities and edges (relevant for all event logs). Both active and waiting time is recalculated with the applied calendar template configuration.

- **Template privacy**: You can specify if the calendar template is visible/usable by you only (checked) or shared with other colleagues (unchecked).

### Working week

In the working week section, you're defining the structure of your working time during a standard working week.

- **Calendar type**: This allows you to specify the behavior of the working time setting controls:

    - **Mo, Tu, We, Th, Fr, Sa, Su:** Time for each working day is set separately.

    - **Mo-Fr, Sa, Su:** Monday through Friday share the same settings. Time for Saturday and Sunday is set separately.

    - **Mo-Su:** Monday through Sunday share the same settings.

- **Settings**: To set the specific day as non-working, uncheck the Working checkbox on the right side of the item. To set the working time, drag the left and right side of the blue slider corresponding to the respective working day.

### Non-working days

Non-Working days section is used to define special non-working days such as bank holidays, national holidays or company specific holidays.

- There are two main types of non-working days:

    - **Recurring:** The day marked as non-working day (recurring) is defined as non-working for each year, regardless of where you set it.

    - **Non-recurring:** The day marked as non-working day is defined as non-working only for the respective year.

    To set the day(s) as Working or Non-working, select the desired day or range of days in the calendar view and select the relevant item below the calendar.

    To switch the displayed year, select the arrows next to the year label above the calendar view.

- **Holidays**: Minit allows you to simplify the definition of bank and national holidays by importing them all at once. To initialize the import, select **Import holidays** below the calendar view. A window is displayed where you can choose the specific calendar and specify the year range. Minit will automatically set holidays for the defined range and allows you to import as many countries as needed.

    If you imported a set of holidays by mistake, you can also easily delete them from the calendar template by selecting **Remove holidays** below the calendar view.
