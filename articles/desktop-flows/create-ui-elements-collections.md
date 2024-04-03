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

<screenshot>

The **Flow repository** tab contains all the UI elements that are available only to that particular desktop flow. Older desktop flows that have been created with version 2.42 or previous than that, which contain UI elements, now display those elements under the Flow repository tab (so long as these desktop flows belong to a schema v2 environment).

> [!NOTE]
> - The UI elements collections is a [premium feature](premium-features.md), available only to organization premium or trial users. Users with a work or school account, or a free Microsoft account, do not have access to UI elements collections.

To create a new collection of UI elements, the said UI elements need to be captured first in the desktop flow, added by default under the Flow repository tab. The tree structure in the Flow repository tab remains the same: the desktop where the elements were captured appears on top, followed by the web pages or desktop application screens containing the elements, followed by the individual UI elements themselves.

> [!NOTE]
> - Any new UI element that is captured via the button **Add UI element** will be automatically added under the Flow repository tab. You can't add a UI element directly into a collection.

Every item in this tree structure comes with a checkbox, which is checked when that item is selected. Selecting a desktop (i.e. Local computer) also checks all its contained screens/web pages and UI elements, and similarly, selecting a screen or web page also checks all its related UI elements. This works in the opposite way as well - checking all UI elements under a screen/web page will also check the latter, and the same thing applies to screens/web pages and their desktop respectively.

There can only be one selected (highlighted) item at a time, even if more items are checked (either automatically when these items are related to the selected one in the elements structure, or manually when multiple items are checked directly via their checkbox). In the context menu of a selected item, the options 'Edit', 'Rename', 'Find usages' and 'Delete' are individual and apply on the said item (as was always the case), even if other items also happen to be checked.

## Known limitations



## Next steps

[Manage UI elements collections](manage-ui-elements-collections.md)

### See also

- [Assets library](assets-library.md)
- [Use and update UI elements collections](use-update-ui-elements-collections.md)
- [UI elements collections](ui-elements-collections.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
