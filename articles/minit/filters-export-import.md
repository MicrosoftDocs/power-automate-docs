---
title: Export and import filters
description: Learn how to export existing filters in the view and re-use them in another view or process in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Export and import filters

The Power Automate Process Mining desktop app offers an option to export existing set of filters in the view and re-use them in another view or process. To export or import filters, select (**...**) in the menu at the top of the **Filtering** screen.

:::image type="content" alt-text="Screenshot of the export filters option." source="media/import-export-filter.png":::

## Filter export

Filter export saves filter definitions into a file on a disk. The file extension is **mfltr**. The exported file can be re-used by another user on different Process Mining desktop app installation.

All the filter types are exportable, except for the variant filters which are dependent on the actual data set (Variant 1 in two different processes may mean totally different process variants). Only enabled view filters are exported, so it's possible to manage the set of filters for export without deleting any filter.

## Filter import

Filter import enables you to load previously exported filters and apply them into the current view. As filters might contain references to attributes or custom metrics which aren't available in the current view (process), there's a mapping wizard for filter import. It helps align the filter definition with the actual process data structure and definitions.

There are three categories of filters in terms of import mappings:

- No dependencies to data structure
- Attribute references
- Custom metric references

## No dependencies to data structure

In some cases, filters don't depend on the actual data structure but on the reference to general metrics like case duration, case start, or end time. Such filters are valid in all processes and no mapping activity is needed during the filter import.

## Attribute references

A filter using references to process attributes requires the user mapping of which attribute in the active process will be used instead of the original one saved in the filter. For example, the original attribute filter might be using **"CostCenter Code"** attribute. Such attribute doesn't exist in the current process, but if you're using mapping to **"CC.Code"** attribute, the imported filter will be valid using reference to new attribute.

If straightforward mapping between attributes isn't possible, the option to delete attribute reference is available. After such import, the filter will be saved in the view with a missing reference to any attribute.

The Process Mining desktop app notifies you of the missing attribute reference and the filter is marked with **asterisk**.

The filter definition is saved in the view, but all the original values from filter are lost, just as is the missing attribute reference. You'll need to assign the relevant attribute and relevant filter values to create working filter again.

## Custom metrics references

Filters using references to custom metrics require two-step mapping. First, you need to map the custom metric, then the referenced attributes within the custom metric. The attributes mapping is the same as previously described. Custom metric mapping offers three options:

- Custom metric mapping to existing one.
- Create new custom metric.
- Delete custom metric reference.

### Custom metric mapping to existing one

If there's a custom metric in the current process which can be replaced with the original one, you can map these two custom metrics. The imported filter will contain a reference to the existing custom metric in the active process.

### Create a new custom metric

If you're able to recreate an original custom metric using attributes from the active process, you can select the **NEW** option. In the first step, the name of the new custom metric is confirmed. To see what attributes need to be mapped, the custom metric formula may be displayed in the mapping wizard panel.

If the custom metric doesn't contain reference to any process specific attribute, this is the end of mapping wizard. If the custom metric is referencing a process-specific attribute like **"CostCenter Code"**, in next step, you need to map the used attributes in the original custom metric to the attributes in the active process. Notice that the attribute mapping is the only available operation. The custom metric formula isn't updated in any other way.

The filter is imported using reference to newly created custom metric and is ready to use.

If you select to create a new custom metric, yet are unable to map referenced attributes in the custom metric, the filter import isn't possible. The option to delete the attribute reference works only for attributes mapping. For attributes mapping, it's possible to delete attribute reference, but not for a new custom metric. In such a situation, the creation of new custom metric is stopped and you're not able to import the filter.

### Delete a custom metric reference

The last option is to delete reference to the custom metric in original filter.

The Process Mining desktop app notifies you of the missing custom metric reference in the filter. In the filter, the original custom metric reference is empty. Also, the filter values are lost. Until a new metric and filter values are selected by the user, the filter isn't valid.


