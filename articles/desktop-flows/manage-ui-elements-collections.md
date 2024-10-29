---
title: Manage UI elements collections
description: Learn how to manage UI elements collections in Power Automate desktop flows.
author: yiannismavridis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/04/2024
ms.author: iomavrid
ms.reviewer: dmartens
contributors:
  - yiannismavridis
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage UI elements collections in desktop flows

After you publish a UI elements collection through the flow designer of a desktop flow, that collection is uploaded in Dataverse in the same environment where the flow exists.

## Portal page of UI elements collections

To inspect this collection, and the list of any other collections that are available to you in this environment, you can:

1. Go to [Power Automate](https://make.powerautomate.com).

1. Select **More** in the navigation list on the left, then hit the button **Discover all**.

    :::image type="content" source="media/ui-elements-collections/portal-more-discover-all.png" alt-text="Screenshot showing the 'Discover all' option in the portal." border="false":::

1. Select **UI elements collections** under **Data**. You can optionally pin this option, so that it remains visible in the left navigation pane.

    :::image type="content" source="media/ui-elements-collections/portal-data-ui-elements-collections-option--GA.png" alt-text="Screenshot of UI elements collections option under Data pane in portal." border="false":::

This is the page containing all the collections that are accessible to you. You can hit on the Refresh button at the top, to quickly retrieve any recent changes and update your collections list. By selecting one of the available UI elements collections, you can go into its details page.

:::image type="content" source="media/ui-elements-collections/portal-ui-elements-collections-page--GA.png" alt-text="Screenshot of UI elements collections main page in portal." border="false":::

For each collection, you can perform the following actions.

## Edit a UI elements collection

Only owners and co-owners can edit collections. You can edit a UI elements collection, modifying its name and/or description.

:::image type="content" source="media/ui-elements-collections/portal-edit-collection--GA.png" alt-text="Screenshot of edit a UI elements collection in portal." border="false":::

## Share a UI elements collection

You can share UI elements collections to provide access to those collections and determine the given type of access.

There are three types of access a maker can have regarding UI elements collections.

- **User** – can only use the respective collection in desktop flows.
- **User + Share** – can use, but also share the collection.
- **Co-owner** – can use, share, update and/or delete the collection.

:::image type="content" source="media/ui-elements-collections/portal-share-collection--GA.png" alt-text="Share a UI elements collection in portal." border="false":::

## Delete a UI elements collection

Only owners and co-owners can delete collections. Deleting a collection isn't possible, if that collection is already imported and used in one or more desktop flows. You need to remove it from any flows before you can delete it.

:::image type="content" source="media/ui-elements-collections/portal-delete-collection--GA.png" alt-text="Screenshot of delete UI elements collection in portal." border="false":::

## Create a copy of a UI elements collection

Quickly create a copy of a collection by selecting the option **Save as**. This option allows you to create a duplicate collection, which you can also rename.

> [!NOTE]
> Power Automate for desktop version 2.45 or greater is required to properly import collections that have been created in this way (copied from other collections).

## Next steps

[Use and update UI elements collections](use-update-ui-elements-collections.md)

## Related information

- [Assets library](assets-library.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)
