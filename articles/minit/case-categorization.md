---
title: Categorize cases
description: Learn how to categorize cases in the Power Automate Process Mining desktop app for Power Automate.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptuaL
ms.date: 11/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Categorize cases

Case categorization allows you to identify which cases are finished, running, stuck, and incompletely imported. You can then use these categories in custom metrics.

Case categories are split into two groups:

- Exclusive (**Finished**, **Running**, and **Stuck**)

- Case flags (**Incompletely imported**)

A case can be placed in only one of the three categories: either it's **Finished**, **Running**, or **Stuck**. The **Incompletely imported** flag can be applied to any case, regardless of its category. For example, a case can be both **Running** and **Incompletely imported**.

## Initialize and create categorization rules

Categorize cases in the **Process context** page in the Minit project hub.

1. Open the **Process context** page: Either select the icon below the process name, or select (**...**) to the right of the process name and then select **Process context**.

    :::image type="content" source="media/PC-overview-1.png" alt-text="Screenshot of the process hub, with the process context icon highlighted.":::

1. In the left side panel, select **Case categorization**.

1. Select **INITIALIZE**.

1. Set rules for categorizing cases as directed in the following sections.

    You can set rules in simple or advanced mode. Any rule that you set in simple mode carries over to advanced mode. However, *switching from advanced mode back to simple mode resets the rules to the default*.

1. Select **Save**.

## Categorize cases as Finished

Initially, all cases are categorized as **Finished**. Turn the **Advanced mode** button off to continue in the simple mode.

Select which activities are finishing activities. Cases that end in one of these activities are considered **Finished**.

### Use the simple mode

In simple mode, select an activity in the **List** tab. Alternatively, search for an activity in the **Search in attribute values** field and then select it. You can also select the **Expression** tab and use the comparison dropdown menu and value field to define an activity in terms of an expression.

:::image type="content" source="media/case-cat-finished-simple.png" alt-text="Screenshot of categorizing Finished cases in simple mode.":::

### Use the advanced mode

When **Advanced mode** is turned on, you have more options:

- Select a filter in the **Add filter** dropdown menu to specify attributes that define a finishing activity.

- Remove all filters.

- Use the import and export filters by selecting (**...**).

- Set the case to end events on or off.

:::image type="content" source="media/case-cat-finished-advanced.png" alt-text="Screenshot of categorizing Finished cases in advanced mode.":::

## Categorize cases as Stuck

Cases that aren't **Finished** are either **Stuck** or **Running**. To distinguish between them, you can define when the case is considered **Stuck**. If a case isn't **Finished** and the time between the last activity in the case and the date you select exceeds the time value, the case is considered **Stuck**.

1. In simple mode, select **Stuck**.

1. Enter or select a date, or select the last event in the dataset.

1. Enter a time value.

When **Advanced mode** is turned on, you have more options:

- Select a filter in the **Add filter** dropdown menu to specify attributes that define a **Stuck** case.

- Use the import filter by selecting (**...**).

### Categorize cases as Running

Cases that aren't **Finished** or **Stuck** are considered **Running**.

The case is evaluated in sequence. If it satisfies the conditions for **Finished**, categorization stops there. If it doesn't, the app checks the conditions for **Stuck**. If those conditions are also false, it categorizes the case as **Running**.

### Categorize cases flagged as Incompletely imported

Cases that don't start where they should are flagged as **Incompletely imported**. This can happen when the export from the original database split the case in half and only included the latter part of the case activities.

To clear the **Incompletely imported** flag, select which activities are starting activities.

- In simple mode, select an activity in the **List** tab. Alternatively, search for an activity in the **Search in attribute values** field and then select it. You can also select the **Expression** tab and use the comparison dropdown menu and value field to define an activity in terms of an expression.

- When **Advanced mode** is turned on, you have more options:

    - Select a filter in the **Add filter** dropdown menu.

    - Remove all filters.

    - Use the import and export filters by selecting (**...**).

    - Set the case to end events on or off.

## Use case categories

After you categorize the case, each category has its own function in custom metrics, returning True or False for each case:

- ISFINISHED()
- ISSTUCK()
- ISRUNNING()
- ISINCOMPLETEIMPORT()

### See also

[Explore the home page](process-hub.md)

