---
title: Export and import filters (preview)
description:
author: nijemcevic
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Export and import filters (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Minit offers an option to export existing filters in the view and re-use them in another view or process. To export or import filters, click the last icon in the Filters header column.

:::image type="content" alt-text="media/expicon.png" source="media/expicon.png":::

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

### Filter export

Filter export saves filter definitions into a file on a disk. The file extension is **mfltr**. The exported file can be re-used by another user on different Minit installation.

:::image type="content" alt-text="media/filterexport.png" source="media/filterexport.png":::

All the filter types are exportable, except for the variant filters which are dependent on the actual data set (Variant 1 in two different processes may mean totally different process variants). Also, only enabled view filters are exported, so it is possible to manage the set of filters for export without deleting any filter.

## Filter import

Filter import enables you to load previously exported filters and apply them into the current view. As filters may contain references to attributes or custom metrics which are not available in the current view (process), there is a mapping wizard for filter import. It helps align the filter definition with the actual process data structure and definitions. There are three categories of filters in terms of import mappings:

- No dependencies to data structure

- Attribute references

- Custom metric references

### No dependencies to data structure

In some cases, filters do not depend on the actual data structure but on the reference to general metrics like Case Duration, Case start, or End time. Such filters are valid in all processes and no mapping activity is needed during the filter import.

:::image type="content" alt-text="media/filternodeps.png" source="media/filternodeps.png":::

### Attribute references

A filter using references to process attributes requires the user mapping of which attribute in the active process will be used instead of the original one saved in the filter. In the example below, the original Attribute filter is using **"CostCenter Code"** attribute. Such attribute does not exist in the current process, but using mapping to **"CostCenter.Code"** attribute, the imported filter will be valid using reference to new attribute.

:::image type="content" alt-text="media/filterattrmapping.png" source="media/filterattrmapping.png":::

If straighforward mapping between attributes is not possible, the option to delete attribute reference is available. After such import, the filter will be saved in the view with a missing reference to any attribute.

:::image type="content" alt-text="media/filterattrdelete.png" source="media/filterattrdelete.png":::

Minit notifies the user about the missing attribute reference and the filter is marked with **asterisk**.

:::image type="content" alt-text="media/attrmissing.png" source="media/attrmissing.png":::

The filter definition is saved in the view, but all the original values from filter are lost, just as is the missing attribute reference. The user needs to assign the relevant attribute and relevant filter values to create working filter again.

:::image type="content" alt-text="media/attrmissingfilter.png" source="media/attrmissingfilter.png":::

### Custom metrics references

Filters using references to custom metrics require two step mapping. First, the user needs to map the custom metric, then the referenced attributes within the custom metric. The attributes mapping is the same as described above. Custom metric mapping offers the user three options:

- custom metric mapping to existing one

- create new custom metric

- delete custom metric reference

#### Custom metric mapping to existing one

If there is a custom metric in the current process which can be replaced with the original one, the user can simply map these two custom metrics. The imported filter will contain a reference to the existing custom metric in the active process. There is no need for the second mapping step - mapping the attributes, as the existing custom metrics are using attributes from the active process.

:::image type="content" alt-text="media/cmmapmetric.png" source="media/cmmapmetric.png":::

#### Create new custom metric

If the user is able to recreate original custom metric using attributes from the active process, they can select **NEW** option. In the first step, the name of the new custom metric is confirmed. To see what attributes need to be mapped, the custom metric formula may be displayed in the mapping wizard panel.

:::image type="content" alt-text="media/cmnewmetric.png" source="media/cmnewmetric.png":::

If the custom metric does not contain reference to any process specific attribute, this is the end of mapping wizard. If the custom metric is referencing a process-specific attribute like **"CostCenter Code"**, in next step, the user needs to map the used attributes in the original custom metric to the attributes in the active process. Notice that the attribute mapping is the only available operation. The custom metric formula is not updated in any other way (change of calculation expressions).

:::image type="content" alt-text="media/cmnewmetric2ndstep.png" source="media/cmnewmetric2ndstep.png":::

The filter is imported using reference to newly created custom metric and is ready to use.

If the user selects to create a new custom metric, yet is unable to map referenced attributes in the custom metric, the filter import is not possible. The option to delete the attribute reference works only for attributes mapping. For attributes mapping, it is possible to delete attribute reference, but not for a new custom metric. In such a situation, the creation of new custom metric is stopped and the user is not able to import the filter.

:::image type="content" alt-text="media/cmunableimport.png" source="media/cmunableimport.png":::

#### Delete custom metric reference

The last option is to delete reference to the custom metric in original filter.

:::image type="content" alt-text="media/cmdelmetric-1.png" source="media/cmdelmetric-1.png":::

Minit notifies the user about the missing custom metric reference in the filter. In the filter, the original custom metric reference is empty. Also, the filter values are lost. Until a new metric and filter values are selected by the user, the filter is not valid.

:::image type="content" alt-text="media/cmmissing-1.png" source="media/cmmissing-1.png":::


