---
title: Hierarchical process mining
description: Learn how to define the hierarchy in the process map and social chart in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Hierarchical process mining

The defined hierarchy, as it's bound to process attributes, is valid and usable for all process views in the context of the process for which it has been defined.

To define the hierarchy in the process map view and social chart:

1. On the panel to the right, selevt **Customize** (the top icon).

1. On the toolbar in the **Customize** panel, select the **Hierarchy** tab.

1. Next to the **Hierarchy** field, select the ellipses (**...**), and then select **Add hierarchy**.

    :::image type="content" alt-text="Screenshot of the invalid hierarchy message." source="media/hierarchy-add.png":::

Use the **Edit hierarchy** and **Delete hierarchy** items to modify the defined hierarchies.

You can do the same in the **Process context** menu screen. It allows you to define the name of the hierarchy, and automatically identifies all clustering attributes in the process, specifying the number of unique attribute values - levels. To define the hierarchy, select and move the desired attributes to the right part of the screen. Use drag and drop to reorder the items in the final list. The list of hierarchies is validated for correctness. The same rules that apply for the individual clustering attributes must be applied for the levels in the hierarchy. The lower level of the hierarchy must act as a clustering attribute for the higher hierarchy level.

You're informed if the validation rules aren't met and saving of the hierarchy isn't allowed.

The available clustering attributes must fulfill the following premises:

- **Process map:** Each value of the attribute **Activity** must have exactly one corresponding value of the clustering attribute. It can also be an empty value (in this case. the activity is placed on canvas outside of any cluster). For example, **Approval** must have always value **Management** in the clustering attribute, and **PO archival** must always have value **Accounting**.

- **Social chart:** Each value of the attribute **Resource** must have exactly one corresponding value of the clustering attribute. It can also be an empty value. In this case, the resource is placed on canvas outside of any cluster. For example, John Doe must always have the value *CostCenter1* in the clustering attribute and Mary Jane must always have the value *CostCenter34*.

A specific activity or resource can be included only in one cluster, or outside of any cluster. The same applies between clusters in lower and clusters in higher hierarchy level.

The clusters are collapsible and expandable so that you can simplify the process map by hiding the activities or resources in the cluster. To do this, select the blue **<<** in the top right corner of the cluster border. To expand the cluster, select **>>** on the cluster, which is highlighted in blue.

:::image type="content" alt-text="Screenshot of a cluster borer." source="media/image028-v45-1.png":::

It's also possible to collapse and expand all clusters at the same time using the **Collapse All/Expand All** options in the clustering context menu.

The process may contain multiple levels of hierarchy. To quickly navigate through individual levels, use the hierarchy display options available in the bottom right corner of the **Process map** and **Process animation**. Using the selection list, you can select an exact level or expand all clusters. Using the buttons next to this list, you can successively increase and decrease the displayed level.

## Related information

[Process map overview](process-map.md)

