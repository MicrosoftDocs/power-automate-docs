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

In this section, you can add the tags of your preference to the selected flow, by typing the proper text label. As you type, the list of tags in your environment filters automatically to help you choose an existing tag or create a new one. From the same pane, you can remove any tags previously associated with your flow.

> [!NOTE]
> - Makers can access and use all tags within an environment by default, including those created by others; no explicit sharing with other users is needed. They can associate the required tags with flows they own or co-own, but not flows shared with them as run-only users.

## Update multiple flows

## Delete a tag

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
