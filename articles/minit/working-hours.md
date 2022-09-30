---
title: Working hours
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Working hours

The Working hours section allows you to define calendar templates, which can be applied to process views in the Process explorer in order to influence the performance analysis calculation, which is by default performed on a 24/7 basis.

You can define a new calendar template by clicking the** Create new calendar template** button in the upper right corner of the screen or by duplicating existing calendar via the **…** button and selecting **Create duplicate** option at the right end of the calendar template entry.

To edit the calendar template, simply click the template name. To delete it choose the **Delete** option available in the … context menu. When a calendar template, which is in use by any process view, is deleted, user is informed when opening the view.

## Calendar template definition

The calendar template parameters are defined on three levels - **General**, **Working week** and **Non-Working days**.

## General

In the general section you can defined the basic parameters.

### Template name

The name of the calendar template.

### Calendar type

You can choose from two options, which influence how calendar template influences the performance calculations, when applied to the process view:

- **Resource specific** - the calendar template is applied only to work performed by resources, i.e. activities/nodes in the process map (relevant for eventlogs with 2 timestamps). Waiting times between activities are calculated on a 24/7 basis.

- **SLA specific** - the calendar template is applied to both activities and edges (relevant for all eventlogs). Both active and waiting time is recalculated with the applied calendar template configuration.

### Template privacy

You can specify if the calendar template is visible/usable by you only (checked) or shared with other colleagues (unchecked).

## Working week

In the working week section you are defining the structure of your working time during a standard working week.

### Calendar type

This allows you to specify the behaviour of the working time setting controls:

- **Mo, Tu, We, Th, Fr, Sa, Su** - time for each working day is set separately

- **Mo-Fr, Sa, Su** - Monday to Friday share the same settings, time for Saturday and Sunday is set separately

- **Mo-Su** - Monday to Sunday share the same settings

### Settings

To set the specific day as non-working, uncheck the Working checkbox on the right side of the item. To set the working time, drag the left and right side of the blue slider corresponding to the respective working day.

## Non-Working days

Non-Working days section is used to define special non-working days such as bank holidays, national holidays or company specific holidays.

There are 2 main types of non-working days:

- **Recurring** - the day marked as Non-working day (recurring) is defined as non-working for each year, no matter where you set it

- **Non-recurring** - the day marked as Non-working day is defined as non-working only for the respective year

To set the day(s) as Working or Non-working, select the desired day or range of days in the calendar view and click on the relevant item below the calendar.

To switch the displayed year, click the arrows next to the year label above the calendar view.

### Holidays

Minit allows you to simplify the definition of bank and national holidays by importing them all at once. To initialise the import, click on the Import holidays button below the calendar view. A dialog window is displayed, where you can choose the specific calendar and specify the year range. Minit will automatically set holidays for the defined range and allows you to import as many countries as needed.

If you, by mistake, imported a set of holidays, you can also easily delete them from the calendar template by clicking the Remove holidays button below the calendar view.


