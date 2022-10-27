---
title: Case categorization (preview)
description: Learn how to categorize cases in the Minit desktop application for Microsoft Power Automate process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptuaL
ms.date: 10/27/2022
ms.author: tatn
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case categorization (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Case categorization allows you to identify which cases are **Finished**, **Running**, **Stuck**, and **Incompletely imported**. You can then use these categories in custom metrics.

Case categories are split into two groups:

- Exclusive (Finished, Running, Stuck)
- Case flags (Incompletely imported)

A case may be placed in only one of the three categories: either it's **Finished**, **Running**, or **Stuck**. The **Incompletely imported** flag can be applied to any case, regardless of its category. For instance, a case may be both **Running** and **Incompletely imported**.

## Initialize and create categorization rules

Categorize cases in the **Process context** page in the Minit project hub.

1. Open the **Process context** page: Either select the icon below the process name, or select (**...**) to the right of the process name and then select **Process context**.

    :::image type="content" source="media/PC-overview-1.png" alt-text="Screenshot of the process hub, with the process context icon highlighted.":::

1. In the left side panel, select **Case categorization**.

1. Select **INITIALIZE**.

1. Set rules for categorizing cases as directed in the following sections.

    You can set rules in simple or advanced mode. Any rule that you set in simple mode carries over to advanced mode. However, *switching from advanced mode back to simple mode resets the rules to the default*.

1. Select **Save**.

### Categorize cases as Finished

Initially, all cases are categorized as **Finished**.

Select which activities are finishing activities. Cases that end in one of these activities are considered **Finished**.

In simple mode, select an activity in the **List** tab, or use the search box to search for an activity and then select it. Or, select the **Expression** tab and use the comparison and value boxes and the **Fx** button to define an activity in terms of an expression.

:::image type="content" source="media/case-cat-finished-simple.png" alt-text="Screenshot of categorizing Finished cases in simple mode.":::

In advanced mode, use the filter icons under the **Advanced mode** toggle to add, delete, or import filters. Select the link under **Cases** to specify attributes that define a finishing activity.

:::image type="content" source="media/case-cat-finished-advanced.png" alt-text="Screenshot of categorizing Finished cases in advanced mode.":::

### Categorize cases as Stuck

Cases that aren't **Finished** are either **Stuck** or **Running**. To distinguish between them, you can define when the case is considered **Stuck**.

1. In simple mode, select **Stuck**.
1. Enter or select a date, or select the last event in the dataset.
1. Enter a time value.

    :::image type="content" source="media/case-cat-stuck-simple.png" alt-text="Screenshot of categorizing Stuck cases in simple mode.":::

In advanced mode, use the filter icons under the **Advanced mode** toggle to add, delete, or import filters. Select the link under **Cases** to specify attributes that define a **Stuck** case.

:::image type="content" source="media/case-cat-stuck-advanced.png" alt-text="Screenshot of categorizing Stuck cases in advanced mode.":::

If a case isn't **Finished** and the time between the last activity in the case and the date you select exceeds the time value, the case is considered **Stuck**.

### Categorize cases as Running

Cases that aren't **Finished** or **Stuck** are considered **Running**.

The case is evaluated in sequence. If it satisfies the conditions for **Finished**, categorization stops there. If it doesn't, the app checks the conditions for **Stuck**. If those conditions are also false, it categorizes the case as **Running**.

### Categorize cases flagged as Incompletely imported

Cases that don't start where they should are flagged as **Incompletely imported**. This can happen when the export from the original database split the case in half and only included the latter part of the case activities.

:::image type="content" source="media/case-cat-incompletely-imported.png" alt-text="Screenshot of a case with the Incompletely imported flag.":::

Select which activities are starting activities.

In simple mode, select an activity in the **List** tab, or use the search box to search for an activity and then select it. Or, select the **Expression** tab and use the comparison and value boxes and the **Fx** button to define an activity in terms of an expression.

In advanced mode, use the filter icons under the **Advanced mode** toggle to add, delete, or import filters. Select the link under **Cases** to specify attributes that define a starting activity.

After you select one or more starting activities, the **Incompletely imported** flag should clear.

:::image type="content" source="media/case-cat-incompletely-imported-clear.png" alt-text="Screenshot of a case with the Incompletely imported flag cleared after selecting a starting activity.":::

## Use case categories

After you categorize the case, each category has its own function in custom metrics, returning True or False for each case:

- ISFINISHED()
- ISSTUCK()
- ISRUNNING()
- ISINCOMPLETEIMPORT()

## Next steps

[Explore process views](process-explorer.md)
