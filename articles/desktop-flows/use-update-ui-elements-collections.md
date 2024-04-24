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

To open the Assets library, select **Assets library** in the designer.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-button.png" alt-text="Screenshot of the Assets library button" border="false":::

Alternatively, use the **Tools** bar.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-tools.png" alt-text="Screenshot of the Assets library button under tools" border="false":::

You can also use the option **Import collection**, found in the context menu at the top right of the UI elements pane.

<screenshot with Import collection in context menu>

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

## Use UI elements collections in the actions of a flow

After a collection is imported and becomes available in a desktop flow, the UI elements it contains can be used in the UI and web automation actions of that flow. In the corresponding action modals, in the field where the action's associated UI element is specified, you can now find the same two tabs of the UI elements pane, Flow repository and Collections (preview). Under the Collections (preview) tab, you can use any UI element you need that belongs to an imported collection.

<Screenshot of Click UI element action with two tabs open>

## Edit a UI elements collection

After creating and publishing a collection, it can be shared with other users so that it's imported and used in multiple flows. However, the application that the collection targets may eventually undergo an update, which could lead to the need to update the CSS/UI selectors of the UI elements that belong to the said collection. Similarly, you may need to add more UI elements to an existing collection, or remove some obsolete, no longer needed ones from it. 

To make any required adjustments to a collection, that collection needs to be imported to a desktop flow, so that you can access the collection's contents in the flow designer. In addition, you need to be an **Owner** or have at least **Co-owner** rights on that collection, to be able to proceed to changes.

You can find below all the different ways to edit and update a collection.

### Add additional UI elements to an imported collection

When you want to add new UI elements to a collection, you have to normally capture them first, if they are not already available in the flow via the UI elements pane. You then need to mark those elements as checked through their checkbox in the tree structure, and then select the option **Add to imported collection**, either via the main context menu at the top right of the UI elements pane, or through the context menu of the currently selected (highlighted) element that should be included in the checked ones.

<Screenshot of Add to imported collection option>

Selecting this option brings up a confirmation dialog, where you need to choose the target collection to which the elements should be added. The respective dropdown field lists all the eligible collections for this action, based on the following criteria:
* The target collection is already imported into this flow
* All the checked UI elements, as well as the target collection, belong to the same desktop in the tree structure of the UI elements pane.

Furthermore, in case you have already associated any or all of the selected UI elements with UI or web automation actions in your desktop flow, you can also check the 'Auto-update' option below the dropdown field. Doing so will automatically update the aforementioned actions for you, so that they no longer reference the UI elements that are only 'locally' available in this flow, but rather their newly added equivalents that will now be part of the target collection.

<Screenshot with add confirmation dialog>

> [!IMPORTANT]
> You can't add UI elements to an existing collection that is not imported in the flow you are working on. If no collection is imported or meets the required criteria mentioned above for a certain selection of UI elements, the option **Add to imported collection** is disabled.

> [!NOTE]
> You can add UI elements to an imported collection by making a selection either from the Flow repository tab, or even the Collections (preview) tab. In the second scenario, you can add UI elements from one collection to another, or even add duplicates to the same collection if needed.

Adding some UI elements to a collection does not automatically update that collection with the new changes. See more in the section **Update a UI elements collection** below.

### Edit or rename the UI elements of a collection

Editing a UI element that belongs to a collection is identical to editing any other UI element found in the Flow repository tab. In the Collections (preview) tab, select and highlight the UI element whose CSS/UI selectors you want to edit, then double click on it, hit 'Enter' or select the option **Edit** in its context menu. This will bring up the selectors screen for that UI element, where you can proceed to the necessary changes to the selectors, and even Repair or Test them through the corresponding options.

Similarly, you can rename a UI element belonging to a collection, by hitting 'F2' or selecting the option **Rename** in its context menu.

> [!NOTE]
> In the context menu of a selected (highlighted) item, the options 'Edit' and 'Rename' are individual and apply only to the said item. However, these options become disabled, if other unrelated items also happen to be checked, to avoid any potential confusion around the item they target.

Editing or renaming UI elements in a collection does not automatically update that collection with the new changes. See more in the section **Update a UI elements collection** below.

### Delete UI elements from a collection

Deleting a UI element that belongs to a collection is identical to deleting any other UI element found in the Flow repository tab. In the Collections (preview) tab, select and highlight the UI element you want to delete, then hit the key 'Del' or select the option **Delete** in its context menu. This will bring up the respective confirmation dialog to permanently delete that UI element.

> [!IMPORTANT]
> The option **Remove unused UI elements** in the main context menu at the top right of the UI elements pane is disabled, when you navigate to the Collections (preview) tab. This option is only available in the Flow repository tab. This behavior is meant to protect you from the unintentional deletion of a collection's UI elements; there can be elements that are unused in your current flow, which may still be used in other flows where the same collection is referenced.

> [!NOTE]
> In the context menu of a selected (highlighted) item, the option 'Delete' is individual and applies only to the said item. However, this option becomes disabled, if other unrelated items also happen to be checked, to avoid any potential confusion around the item it targets.

Deleting UI elements from a collection does not automatically update that collection with the new changes. See more in the section **Update a UI elements collection** below.

### Rename a UI elements collection

Apart from the their portal page, collections can also be renamed via the flow designer, after being imported to a flow. In the Collections (preview) tab, select (highlight) the collection whose name you want to change, and hit 'F2' or select the option **Rename** in its context menu.

Renaming a collection does not automatically update that collection with the new change. See more in the section **Update a UI elements collection** below.

### Update a UI elements collection

After making any of the changes described above, a collection is only updated locally within the context of the desktop flow. This is to ensure that you can safely go through the necessary testing and debugging in the flow designer, to confirm that your changes in the collection have the expected behavior, before affecting any other flows that may reference the same collection.

As soon as you are certain that the collection changes are the proper ones, you can publish your changes by updating the collection. To do this, in the Collections (preview) tab, select the collection that has undergone changes, and then select the option **Update collection** in its context menu. As a shortcut, you can also select the Update icon, between the collection's name and its context icon.

<screenshot with update collection option>

Upon selecting **Publish** in the confirmation dialog that pops up, the flow will enter a Publishing state, during which the collection is saved and uploaded in Dataverse, so that its changes become available in the specific environment. While publishing takes place, the UI of the flow designer remains disabled.

<screenshot with update confirmation dialog>

When the collection is succesfully updated in this way, the corresponding success banner appears in the UI elements pane to inform you accordingly. At this point, the collection's new state has overwritten the previous one, and the desktop flows that reference this collection in the current environment will be affected accordingly in their following runs, without requiring any manual update themselves.

<screenshot with update success banner>

> [!NOTE]
> If the collection is up-to-date, the option **Update collection** is disabled.

In case you have made changes in multiple collections at the same time, you can always use the option **Update unsaved collections** in the main context menu at the top right of the UI elements pane, to update all of them at once.

> [!IMPORTANT]
> When your imported collections have unpublished changes, trying to save your flow first will prompt you to also update the collections. If you don't confirm publishing the updated state of the collections, your flow won't be saved.

## Known limitations

- When a collection is included in a Dataverse solution via the Power Automate portal, and that collection is updated, the solution is not updated automatically with the new binaries. The option **Advanced > Add required objects** needs to be selected manually, in the context menu of the collection component in that solution.
- When selected to be added to an imported collection, individual screens and web pages will always carry over their child UI elements with them, as the latter are automatically checked.

### See also

- [Assets library](assets-library.md)
- [Manage UI elements collections](manage-ui-elements-collections.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)
