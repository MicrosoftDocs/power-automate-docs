---
title: Tags in desktop flows (preview)
description: Learn about tags in Power Automate desktop flows.
author: yiannismavridis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 04/11/2025
ms.author: iomavrid
ms.reviewer: dmartens
contributors:
  - yiannismavridis
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Tags in desktop flows (preview)

Tags are available (in preview) in the console of Power Automate for desktop to help you categorize and group desktop flows. Tags are custom text labels that let you organize your flows and manage them efficiently.

The **Tags (Preview)** column displays all the tags that are associated with a desktop flow. To manage tags (for example, add or remove them) for a flow, select **Manage tags (Preview)** in its context menu in the console. Alternatively, open the **Flow properties** pane and go to the **Tags (preview)** section.

In this section, you can add the tags of your preference to the selected flow, by selecting a tag from the list or creating a new text label. As you type, the list of tags in your environment filters automatically to help you choose an existing tag or create a new one. From the same pane, you can remove any tags previously associated with your flow. You need to **Save** the flow properties for the tag changes to take place.

> [!NOTE]
> - Makers can access and use all tags within an environment by default, including those created by others; no explicit sharing with other users is needed. They can associate the required tags with flows they own or co-own, but not flows shared with them as run-only users.

## Update tags for multiple flows

You can select multiple desktop flows and update their tags at the same time, selecting the common context option **Manage tags (Preview)**. In this case, a dialog comes up, displaying only the tags that are already associated with all the selected flows. You can remove those common tags, or add new ones that will be associated with all the selected flows.

> [!NOTE]
> - Tags that are associated with only a subset of the selected flows are not displayed in this dialog and can't be removed in this way.

## Filter flows based on tags

Using the **Filters** button in the console and then selecting **Tags (Preview)**, you can filter your flows based on the tags you select from the list. In case two or more tags are selected, there are two filtering modes:
* **Or**: All the flows containing at least one of the selected tags are displayed.
* **And**: Only the flows containing all the selected tags are displayed.

You can also **Clear** your filters to quickly reset the selected tags.

## Delete a tag from your environment

Tags are solution aware components, so they can be managed in your Default solution in the portal of Power Automate.

## Prerequisites

- Power Automate for desktop version 2.55 or later.
- Dataverse solution version 1.9.1.1 or later. To confirm the latest version used, go to the Power Automate portal, then select the **Solutions** page, go to the **History** tab, and search for the key term *MicrosoftFlowExtensionsCore*. Check the *Version* column to verify the most recent version update.
- Tags are available only for users with a work or school account.
- This feature requires an environment with the [Power Automate v2 schema](schema.md) enabled. Tags aren't available in v1 schema environments.

## Known limitations

- Tags can't be renamed. You can delete them and create new ones instead.

## Related information

- [Desktop flow properties](console.md#desktop-flow-properties)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
