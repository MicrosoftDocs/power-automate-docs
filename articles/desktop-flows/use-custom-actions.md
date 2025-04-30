---
title: Use custom actions 
description: How to use custom actions in desktop flows
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/19/2023
ms.author: dipapa
ms.reviewer: tapanm-msft
contributors:
  - jpapadimitriou
  - tapanm-msft
search.audienceType: 
  - flowmaker
  - enduser
---

# Using custom actions in desktop flows

> [!NOTE]
> An Attended RPA license is required to include and use custom actions in desktop flows.

> [!IMPORTANT]
> - Ensure the .dll files describing Custom actions, their dependency .dll files, and the .cab files are properly signed with a digital certificate trusted by your organization. The certificate should also be installed on the device under the trusted root certificate authority where the desktop flow with custom action dependencies is modified and/or executed.

You can include custom actions in desktop flows through the [Assets library](assets-library.md) using Power Automate for desktop's designer.

To use Assets library, select **Assets library** in the designer.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-button.png" alt-text="Screenshot of the Assets library button" border="false":::

Alternatively, use the **Tools** bar.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-tools.png" alt-text="Screenshot of the Assets library button under tools" border="false":::

> [!IMPORTANT]
> This feature requires Power Automate for desktop v2.32 or later.

## Custom actions tab

[Custom actions](custom-actions.md) tab shows you the custom actions uploaded in the environment you've selected.

> [!NOTE]
> You can only see custom actions shared with you.

:::image type="content" source="media/custom-actions/use-custom-actions/assets-library-custom-actions.png" alt-text="Screenshot of custom actions" border="false":::

After you complete the custom action inclusion and close the asset library, the custom actions will be listed at the bottom of the **Actions** tree under the **Custom Actions** section.

:::image type="content" source="media/custom-actions/use-custom-actions/tree.png" alt-text="Screenshot of Custom Actions in the actions tree" border="false":::

To include a custom action in a desktop flow, drag and drop or double-click on it.

## Related information

- [Assets library ](assets-library.md)
- [Upload custom actions](upload-custom-actions.md)
- [Create custom actions](create-custom-actions.md)
- [Custom actions](custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]