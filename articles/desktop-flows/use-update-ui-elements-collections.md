---
title: Use and update UI elements collections 
description: Learn how to use and update UI elements collections in desktop flows
author: yiannismavridis
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 04/08/2024
ms.author: iomavrid
ms.reviewer: tapanm-msft
contributors:
  - tapanm-msft
search.audienceType: 
  - flowmaker
  - enduser
---

# Use and update UI elements collections

> [!NOTE]
> An Attended RPA license is required to include and use UI elements collections in desktop flows, given that access to the flow designer of Power Automate for desktop is needed.

You can include UI elements collections in desktop flows through the [Assets library](assets-library.md) using Power Automate for desktop's designer.

To use Assets library, select **Assets library** in the designer.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-button.png" alt-text="Screenshot of the Assets library button" border="false":::

Alternatively, use the **Tools** bar.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-tools.png" alt-text="Screenshot of the Assets library button under tools" border="false":::

> [!IMPORTANT]
> This feature requires Power Automate for desktop v2.43 or later.

## Import collections through the UI elements collections (preview) tab

The [UI elements collections](ui-elements-collections.md) tab shows you the collections that are published in the environment you've selected.

> [!NOTE]
> You can only see UI elements collections that you have created or are shared with you.

<screenshot with collections tab in assets library>

After selecting the collection you want to add to your flow, you also need to select a specific desktop under which the collection will be imported. This will determine in which desktop will the collection's UI elements be searched for, when the flow runs.

<screenshot with confirmation dialog to select a machine>

> [!NOTE]
> The list of available desktops includes the local computer, the RDP and/or Citrix desktops that may have already been added in the Flow repository tab, as well as any currently active RDP an/or Citrix connections in your machine.

> [!NOTE]
> Each collection can only be imported in one target desktop per flow.

After you complete the collection inclusion and close the assets library, the collection will now appear in the Collections (preview) tab of the UI elements pane, under the desktop that was previously selected.

<screenshot with collections tab and imported collection>

### See also

- [Assets library](assets-library.md)
- [Manage UI elements collections](manage-ui-elements-collections.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)
