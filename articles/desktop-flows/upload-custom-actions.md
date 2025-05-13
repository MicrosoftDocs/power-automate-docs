---
title: Upload custom actions
description: Learn about how to upload custom developed actions for desktop flows
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 10/19/2023
ms.author: dipapa
ms.reviewer: jpapadimitriou
contributors:
  - jpapadimitriou
  - tapanm-msft
search.audienceType: 
  - flowmaker
  - enduser
---

# Uploading custom actions to an environment

This article explains how to upload custom actions to an environment.

## Prerequisites

Ensure that you have the following permissions to upload a custom actions group to an environment.

- You have access to the Power Platform environment.
- You're assigned **Desktop Flow Module Developer** role in the [Power Platform admin center](https://admin.powerplatform.com).
- This feature requires Power Automate for desktop v2.32 or later.

## Upload custom actions

1. Go to [Power Automate](https://make.powerautomate.com).

1. Select **Custom actions** under **Data**. 

    :::image type="content" source="media/custom-actions/upload-custom-actions/custom-actions.png" alt-text="Screenshot of Custom actions under Data section" border="true":::

1. Select **Upload custom action** from the top of the screen.

    :::image type="content" source="media/custom-actions/upload-custom-actions/button.png" alt-text="Screenshot of Upload custom actions button" border="true":::

1. Enter the required details for your custom actions group.

    | Name | Required or optional | Description
    | - | - | - |
    | Name | Required | This is how your custom actions group name appears in the custom actions list, assets library, and if included in a desktop flow, in the actions tree. |
    | Description | Optional | A brief description of the custom actions. This information is visible in the asset library, when the custom actions group is selected. |
    | Select file | Required | Select the signed .cab file containing the custom actions group developed with the custom actions SDK, and any dependent .dll files if applicable. |

    :::image type="content" source="media/custom-actions/upload-custom-actions/blade.png" alt-text="Screenshot of Upload custom actions blade" border="true":::

1. Select **Upload**.

    The newly uploaded custom actions group appears in the list.

    :::image type="content" source="media/custom-actions/upload-custom-actions/entry.png" alt-text="Screenshot of custom actions entry" border="true":::

By selecting the uploaded custom actions group, you can go into its details page.

:::image type="content" source="media/custom-actions/upload-custom-actions/details.png" alt-text="Screenshot of Upload custom actions group detailed view" border="true":::

From here, you can perform the following actions.

### Edit custom actions

Edit the uploaded custom actions, modifying its name and/or description.

:::image type="content" source="media/custom-actions/upload-custom-actions/edit.png" alt-text="Screenshot of Edit custom actions group blade" border="true":::

### Share custom actions

Share custom actions to allow managing who has access to the custom actions uploaded and view the given type of access.

There are three types of access a maker can have regarding custom actions.

- **User** - can only use the respective custom actions in desktop flows.
-	**User + Share** – can use and share the custom actions.
- **Co-owner** – can also update/delete the custom actions.

>[!IMPORTANT]
> To be a co-owner, you have to be assigned the **Desktop Flow Module Developer** role in the environment.

:::image type="content" source="media/custom-actions/upload-custom-actions/share.png" alt-text="Screenshot of Manage access to custom actions group" border="true":::

### Update file

Only co-owners can update a file. Update files when you want to update existing custom actions by uploading a .cab file.

Update file (Co-owners only) for when you want to update the existing custom actions etc. by uploading a .cab file.

:::image type="content" source="media/custom-actions/upload-custom-actions/upload.png" alt-text="Screenshot of Update custom actions group" border="true":::

### Delete file

Only co-owners can delete custom actions. Deleting a custom actions group causes all dependent desktop flows to fail.

:::image type="content" source="media/custom-actions/upload-custom-actions/delete.png" alt-text="Screenshot of Delete a custom actions group" border="true":::

## Next steps

[Use custom actions](use-custom-actions.md)

## Related information

- [Assets library](assets-library.md)
- [Create custom actions](create-custom-actions.md)
- [Custom actions](custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
