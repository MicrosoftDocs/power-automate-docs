---
title: Assets library 
description: Learn about Assets library in Power Automate for desktop.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/15/2024
ms.author: dipapa
ms.reviewer: tapanm-msft
contributors:
  - jpapadimitriou
  - tapanm-msft
  - yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Assets library

> [!IMPORTANT]
> - This feature requires Power Automate for desktop v2.32 or later.

Assets library allows you to include more functionality in desktop flows. For example, you can make certain cloud connectors available in your flow, upload custom actions to the assets library when required, or you can search for available UI elements collections.

To access the assets library, select the Assets library button at the top-right of the designer.

:::image type="content" source="media/assets-library/assets-library-button.png" alt-text="Screenshot of the Assets library button" border="false":::

Alternatively, use the **Tools** bar.

:::image type="content" source="media/assets-library/assets-library-tools.png" alt-text="Screenshot of the Assets library button under tools" border="false":::

## Custom actions tab

[Custom actions](custom-actions.md) tab shows you the custom actions uploaded in the environment you selected.

> [!NOTE]
> You can only see custom actions shared with you.

:::image type="content" source="media/assets-library/assets-library-custom-actions.png" alt-text="Screenshot of the Custom actions tab in the Assets library" border="false":::

## UI elements collections (preview) tab

The UI elements collections (preview) tab shows you the UI elements collections that are published in the environment you selected.

> [!NOTE]
> You can only see UI elements collections that you have created or are shared with you.

:::image type="content" source="media/ui-elements-collections/two-tabs-in-assets-library.png" alt-text="Screenshot of the UI elements collections (preview) tab in the Assets library" border="false":::

## Connectors (preview) tab

The Connectors (preview) tab shows you all the cloud connectors that are available to be included in your desktop flow, offering out-of-the-box integration with the corresponding operations.

:::image type="content" source="media/assets-library/connectors-tab-in-assets-library.png" alt-text="Screenshot of the connectors (preview) tab in the Assets library" border="false":::

Adding a connector makes it appear in the actions pane of your flow designer, giving you access to its operations. The connectors that are already available in your flow are also shown in the list and appear marked with the label *Added*.

### Known limitations

- When you manually add a new connector to the flow, there's currently no option to remove it through the Assets library. If you reopen the flow designer and don't use any action belonging to that connector in the flow, the connector is automatically removed. This isn't the case for the cloud connectors that were introduced before the Connectors tab in the Assets library, as those connectors are permanently visible in the actions pane of the designer.

## Related information

- [Cloud connectors](actions-reference/cloudconnectors.md)
- [Custom actions](custom-actions.md)
- [Create custom actions](create-custom-actions.md)
- [Upload custom actions](upload-custom-actions.md)
- [Use custom actions](use-custom-actions.md)
- [UI elements collections](ui-elements-collections.md)
- [Create and publish UI elements collections](create-ui-elements-collections.md)
- [Manage UI elements collections](manage-ui-elements-collections.md)
- [Use and update UI elements collections](use-update-ui-elements-collections.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
