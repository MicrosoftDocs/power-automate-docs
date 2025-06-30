---
title: Tags in desktop flows (preview)
description: Learn about tags in Power Automate desktop flows.
author: yiannismavridis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/30/2025
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

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Tags are available (in preview) in the Power Automate for desktop console to help you categorize and group desktop flows. Tags are custom text labels that let you organize your flows and manage them efficiently.

[!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

The **Tags (Preview)** column displays all the tags that are associated with a desktop flow. To manage tags, such as adding or removing them for a flow, select **Manage tags (Preview)** in its context menu in the console. Alternatively, open the **Flow properties** pane and go to the **Tags (preview)** section.

In this section, add your preferred tags to the selected flow by selecting a tag from the list or creating a new text label. As you type, the list of tags in your environment automatically filters to help you choose an existing tag or create a new one. From the same pane, you can remove any tags previously associated with your flow. Select **Save** in the flow properties for the tag changes to take effect.

> [!NOTE]
> - Users with the Environment Maker role can access and use all tags within an environment by default, including tags created by others. Explicit sharing of tags with other users isn't needed. They can associate the required tags with flows they own or co-own, but not flows shared with them as run-only users.
> - In versions 2.55 and 2.56, if a message appears in the console indicating that a user with a custom role doesn't have sufficient permissions to view or create flows in an environment, Read access must be provided to their respective security role on the Tag and Tagged Process tables in Dataverse. You can read more [here](https://community.powerplatform.com/forums/thread/details/?threadid=3ec33061-582b-f011-8c4d-7c1e5247028a). From version 2.57 and on, these permissions are optional, so that users with custom roles are still able to view their flows.

## Update tags for multiple flows

Select multiple desktop flows and update their tags at the same time by selecting the common context option **Manage tags (Preview)**. A dialog appears, displaying only the tags already associated with all the selected flows. Remove common tags or add new ones associated with all selected flows.

> [!NOTE]
> Tags associated with only a subset of the selected flows aren't displayed in this dialog and can't be removed this way.

## Filter flows based on tags

Select the **Filters** button in the console, and then select **Tags (Preview)** to filter your flows based on the tags you choose from the list. If you select two or more tags, there are two filtering modes:

- **Or**: Shows all flows that contain at least one of the selected tags.
- **And**: Shows only flows that contain all the selected tags.

Select **Clear** to reset the selected tags quickly.

## Delete a tag from your environment

Tags are solution-aware components, so you manage them in your environment's Default solution in the Power Automate portal. Go to the Power Automate portal, select the **Solutions** page, and then select the solution called *Default Solution*. In the list of objects on the left that displays the solution's contents, select the **Tag** component to see all tags available in the current environment (if you have the default *Environment Maker* role with the required permissions).

You can select one or more tags in the list and choose **Delete from this environment** to permanently delete them. You can only delete tags you own (tags you created yourself).

> [!NOTE]
> You can access and use tags created by others, but you can't delete them, unless you're an administrator in this environment.

## Prerequisites

- Power Automate for desktop version 2.55 or later.
- Dataverse solution version 1.9.1.1 or later. To confirm the latest version used, go to the Power Automate portal, then select the **Solutions** page, go to the **History** tab, and search for the key term *MicrosoftFlowExtensionsCore*. Check the **Version** column to verify the most recent version update.
- Tags are available only for users with a work or school account.
- This feature requires an environment with the [Power Automate v2 schema](schema.md) enabled. Tags aren't available in v1 schema environments.

## Known limitations

- Tags can't be renamed. You can delete them and create new ones instead.
- Tags aren't visible in the desktop flows page of the Power Automate portal.

## Related information

- [Desktop flow properties](console.md#desktop-flow-properties)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
