---
title: Case categorization (preview)
description: Learn how to define categories for cases in the minit desktop application in process advisor.
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptuaL
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Case categorization (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Case categorization allows you to define which cases are **Finished**, **Running**, **Stuck**, and **Incompletely imported**. These settings can then be used in any custom metric.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

Definition of the case categories can be done in the **Process Context** window in the **Project hub**, using the Process context menu.

Case categories are split into two groups:
- Exclusive (Finished, Running, Stuck)
- Case flags (Incompletely imported)

In the Exclusive group, a case may belong to only one of the three categories: either it is Finished, Running, or Stuck.

As for Incompletely imported, this category can be combined with any of the above-mentioned categories, for any case.

Initialization and Setup

:::image type="content" alt-text="media/image-49.png" source="media/image-49.png":::

After initialization, all cases are categorized as **Finished**.

The user can set rules for categorization in a simple or advanced mode. Any rule set in simple mode will be translated into advanced mode, however,** switching from advanced mode back to simple mode will reset the settings to the default**.

In simple mode, to set finished cases, please select which activities are finishing activities. Cases that end in one of these activities are considered **Finished**.

Cases that are not **Finished** are considered **Stuck** or **Running**. To distinguish between Stuck and Running, the user can define when the case is considered Stuck. In simple mode, it can be defined by setting the time difference between the last activity in the case and a set date. This can be selected either manually or by the last timestamp of any event in the dataset.

Cases that are **neither Finished nor Stuck are considered Running**.
The case is evaluated in a sequence. If it satisfies the conditions for Finished, it stops there. If not, it will check the condition for Stuck. If that is also false, it will mark the case as Running.

Incompletely imported cases are independent of this sequence, and any case that **does not satisfy** the condition is marked as Incompletely imported.

The goal of the Incompletely imported category is to mark those cases where the export from the original database split the case in half and only included the latter part of the case.

Advanced settings

For advanced settings, the logic with evaluation in the sequence is the same. Each category can be set in simple or advanced settings, irrelevant of the settings in other categories.

Using Case Categorization

After defining the case categorization, each category has its own function within custom metrics, returning True or False for each case.


```
ISFINISHED()
ISSTUCK()
ISRUNNING()
ISINCOMPLETEIMPORT()
```



