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

## Import collections through the UI elements collections (preview) tab of the Assets library

The [UI elements collections](ui-elements-collections.md) tab shows you the collections that are published in the environment you've selected and are accessible to you.

> [!NOTE]
> You can only see UI elements collections that you have created or are shared with you. The list of collections in the respective Assets library tab is identical to the list available in the portal page for each maker.

<screenshot with collections tab in assets library>

After selecting the collection you want to add to your flow, you also need to select a specific desktop under which the collection will be imported. This will determine in which desktop will the collection's UI elements be searched for, when the flow runs.

<screenshot with confirmation dialog to select a machine>

> [!NOTE]
> The list of available desktops includes the local computer, the RDP and/or Citrix desktops that may have already been added in the Flow repository tab, as well as any currently active RDP an/or Citrix connections in your machine.

> [!NOTE]
> Each collection can only be imported in one target desktop per flow.

After you complete the collection inclusion and close the assets library, the collection will now appear in the Collections (preview) tab of the UI elements pane, imported under the desktop that was previously selected.

<screenshot with collections tab and imported collection>

## Remove collections through the UI elements collections (preview) tab of the Assets library

After being added to a flow, a collection can similarly be removed through the Assets library. All added collections are tagged accordingly, so you can select the option **Remove** that is available for those collections, to remove them from the flow. In this way, the UI elements they contain will no longer be available in that flow. 

> [!IMPORTANT]
> Removing a collection from a flow doesn't delete the collection from the environment. Permanently deleting a collection is only available through the UI elements collections' dedicated portal page.

> [!NOTE]
> If a collection is removed from a flow while any of its UI elements are already used in the flow's actions, those actions will throw an error and will need fixing.

## Use UI elements collections in flow actions

After a collection is imported and becomes available in a desktop flow, the UI elements it contains can be used in the UI and web automation actions of that flow. In the corresponding action modals, in the field where the action's associated UI element is specified, you can now find the the same two tabs of the UI elements pane, Flow repository and Collections (preview). Under the Collections (preview) tab, you can use any UI element you need that belongs to an imported collection.

<Screenshot of Click UI element action with two tabs open>

## Edit a UI elements collection

### Add additional UI elements to an imported collection

### Edit the UI elements of a collection

### Delete UI elements from a collection

## Update a UI elements collection

### See also

- [Assets library](assets-library.md)
- [Manage UI elements collections](manage-ui-elements-collections.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)
