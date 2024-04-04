---
title: Create UI elements collections 
description: Learn how to create UI elements collections in Power Automate desktop flows.
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

# Create UI elements collections in desktop flows

Creating and publishing a UI elements collection is possible through the flow designer of any desktop flow, old or new. In the UI elements pane, there are now two different tabs available, **Flow repository** and **Collections (preview)**.

<screenshot with two tabs>

The **Flow repository** tab contains all the UI elements that are available only to that particular desktop flow. Older desktop flows that have been created with version 2.42 or previous than that, which contain UI elements, now display those elements under the Flow repository tab (so long as these desktop flows belong to a schema v2 environment).

> [!NOTE]
> - The UI elements collections is a [premium feature](premium-features.md), available only to organization premium or trial users. Users with a work or school account, or a free Microsoft account, do not have access to UI elements collections.

To create a new collection of UI elements, the said UI elements need to be captured first in the desktop flow, added by default under the Flow repository tab. The tree structure here remains the same: the desktop where the elements were captured appears on top, followed by the web pages or desktop application screens containing the elements, followed by the individual UI elements themselves.

> [!NOTE]
> - Any new UI element that is captured via the button **Add UI element** will be automatically added under the Flow repository tab. You can't add a new UI element directly into a collection.

## Marking multiple UI elements as checked

Every item in this tree structure comes with a checkbox, which is checked when that item is selected. Selecting a desktop (i.e. Local computer) also checks all its contained screens/web pages and UI elements, and similarly, selecting a screen or web page also checks all its related UI elements. This works in the opposite way as well - checking all UI elements under a screen/web page will also check the latter, and the same thing applies to screens/web pages and their desktop respectively.

There can only be one selected (highlighted) item at a time, even if more items are checked (either automatically when these items are related to the selected one in the elements structure, or manually when multiple items are checked directly via their checkbox). In the context menu of a selected item, the options 'Edit', 'Rename', 'Find usages' and 'Delete' are individual and apply only to the said item. However, these options become disabled, if other unrelated items also happen to be checked, to avoid any potential confusion around the item they target.

<screenshot with disabled options>

## Publish a new UI elements collection

After marking as checked the UI elements you need to include in a new collection, you can select the option **Publish as new collection**, either via the main context menu at the top right of the UI elements pane, or through the context menu of the currently selected (highlighted) element that should be included in the checked ones.

<screenshot with option publish as new collection>

> [!NOTE]
> - The collection related options in the items' context menus apply to all **checked** UI elements and screens/web pages.

> [!IMPORTANT]
> - In case you check screens/web pages and UI elements that belong to different desktops at the same time, the option **Publish as new collection** becomes disabled. To create a new collection, all its UI elements should be captured under the same desktop (Local computer, RDP or Citrix). 

Selecting this option brings up a confirmation dialog, where you can provide a name for the new collection. Furthermore, in case you have already associated any or all of the selected UI elements with UI or web automation actions in your desktop flow, you can also check the 'Auto-update' option below the collection name field. Doing so will automatically update the aforementioned actions, so that they no longer reference the UI elements that are only 'locally' available in this flow, but rather their equivalents that will now be part of the new collection.

<screenshot with Publish confirmation dialog>



## Known limitations



## Next steps

[Manage UI elements collections](manage-ui-elements-collections.md)

### See also

- [Assets library](assets-library.md)
- [Use and update UI elements collections](use-update-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
