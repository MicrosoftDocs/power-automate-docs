---
title: Manage UI elements collections
description: Learn how to manage UI elements collections in Power Automate desktop flows.
author: iomavrid
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 03/27/2024
ms.author: iomavrid
ms.reviewer: tapanm-msft
contributors:
  - iomavrid
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage UI elements collections in desktop flows

After publishing a UI elements collection through the flow designer of a desktop flow, that collection is uploaded in Dataverse, and specifically in the same environment where the flow exists.

## Portal page of UI elements collections

To inspect this collection, as well as the list of any other collections that are available to you in this environment, you can:

1. Go to [Power Automate](https://make.powerautomate.com).

2. Select **More** in the navigation list on the left, then hit the button **Discover all**.

<screenshot>

3. Select **UI elements collections (preview)** under **Data**. You can optionally pin this option, so that it remains visible in the left navigation pane.

<screenshot>

This is the page containing all the collections that are accessible to you. You can hit on the Refresh button at the top, to quickly retrieve any recent changes and update your collections list. By selecting one of the available UI elements collections, you can go into its details page.

<screenshot>

For each collection, you can perform the following actions.

## Edit a UI elements collections

You can edit a UI elements collection, modifying its name and/or description.

<screenshot>

## Share a UI elements collection

You can share UI elements collections to provide access to those collections and determine the given type of access.

There are three types of access a maker can have regarding UI elements collections.

- **User** – can only use the respective collection in desktop flows.
-	**User + Share** – can use, but also share the collection.
- **Co-owner** – can use, share, update and/or delete the collection.

<screenshot>

## Delete a UI elements collection

Only owners and co-owners can delete collections. Deleting a collection is not possible, if that collection is already imported and used in one or more desktop flows. It needs to be removed first from those flows, before you can delete it.

<screenshot>

## Next steps

[Use and update UI elements collections](use-update-ui-elements-collections.md)

### See also

- [Assets library](assets-library.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)
