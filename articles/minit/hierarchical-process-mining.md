---
title: Hierarchical process mining (preview)
description: Learn how to define the hierarchy in the process map and social chart in the Minit desktop application in process advisor.
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 10/15/2022
ms.author: mmaslejova
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Hierarchical process mining (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

To define the hierarchy in the process map/social chart, go to the **Hierarchy section** of the Customize panel in the Process Map view and use the **Add hierarchy** option in the context menu:

:::image type="content" alt-text="Screenshot of the Hierarchy dropdown menu in the 'Map clustering' screen." source="media/addhierarchy.png":::

Use the **Edit hierarchy** and **Delete hierarchy** items to modify the defined hierarchies.

You can do the same via the **Process Context** menu item in the process context menu directly from the Project Hub (use **Map Hierarchies** tab). The opened dialog window allows you to define the name of the hierarchy and automatically identifies all clustering attributes in the process, specifying the number of unique attribute values - levels. To define the hierarchy, select and move the desired attributes to the right part of the window. Use drag & drop to reorder the items in the final list. The list of hierarchies is validated for correctness - the same rules that apply for the individual clustering attributes (see below) must be applied for the levels in the hierarchy - the lower level of the hierarchy must act as a clustering attribute for the higher hierarchy level.

The user is informed, if the validation rules are not met and saving of the hierarchy is not allowed.

:::image type="content" alt-text="Screenshot of the invalid hierarchy message." source="media/hierarchydef-1.png":::

The available clustering attributes must fulfill the following premises:

- In **process map** – each value of the attribute Activity must have exactly one corresponding value of the clustering attribute (it can also be an empty value – in this case the activity is placed on canvas outside of any cluster); for example, Approval must have always value Management in clustering attribute, PO archival must always have value Accounting, etc.

- In **social chart** – each value of the attribute Resource must have exactly one corresponding value of the clustering attribute (it can also be an empty value – in this case the resource is placed on canvas outside of any cluster); for example, John Doe must always have the value CostCenter1 in the clustering attribute, Mary Jane must always have the value CostCenter34, etc.

In other words – a specific activity or resource can be included only in one cluster, or outside of any cluster.
The same applies between clusters in lower and clusters in higher hierarchy level.

The clusters are collapsible/expandable so that you can simplify the process map by hiding the activities/resources in the cluster. To do this, select the blue **<<** in the top right corner of the cluster border. To expand the cluster,  select **>>** on the cluster (which is highlighted in blue).

:::image type="content" alt-text="Screenshot of a cluster borer." source="media/image028-v45-1.png":::

It is also possible to collapse/expand all clusters at the same time using the **Collapse All/Expand All** options in the clustering context menu.

:::image type="content" alt-text="Screenshot of Expand All and Collapse All options in the Hierarchy dropdown menu in the 'Map clustering' screen." source="media/expandallhier.png":::

The process may contain multiple levels of hierarchy. To quickly navigate through individual levels, use the hierarchy display options available in the bottom right corner of the **Process map** and **Process animation**. Using the selection list, you can select an exact level or expand all clusters. Using the buttons next to this list, you can successively increase and decrease the displayed level.

:::image type="content" alt-text="Screenshot of multiple levels in the hierarchy." source="media/hierarchy-levels.png":::

The defined hierarchy, as it is bound to process attributes, is valid and usable for all process views in the context of the process for which it has been defined.


