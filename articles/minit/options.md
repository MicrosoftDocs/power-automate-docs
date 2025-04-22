---
title: Application settings
description: Learn how to change application settings such as user interface language or set where the exported files are stored in Power Automate Process Mining.
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 12/17/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType:
- flowmaker
- enduser
---

# Application settings

You can change the application settings in the **Options** tab.

- **Change general settings:** In the **General** tab, change general settings such as the user interface language or set where the exported files are stored. You can also define the default duration format used for newly created processes and views. Learn more in [View settings](view-settings.md).

- **Change viewing preferences:** In the **Process explorer** tab, change the default settings for view creation processes. These settings are used whenever you create a new process view.

- **Change process map and social chart settings:** In the **Process map** tab, change the default settings for displaying the process map and social graphs, such as spacing between nodes, displaying the start and end nodes, or chart alignment. These settings are used whenever you create a new process view.

- **Change process animation settings:** In the **Animation** tab, change settings for process animation. These settings are used as default, whenever you create a new process view.

## Keep and analyze process model in cloud (preview)

[!INCLUDE[cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

You can decide if the desktop application downloads the process model to your client computer and analyzes it locally, or keeps and analyzes it in the cloud. The second option allows you to eliminate limitations on your local hardware resources. It also allows you to analyze process models that are beyond your local computer capacity.

[!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

To choose this option, follow these steps:

1. In the checkbox next to **Keep process model in the cloud (preview)**, place a checkmark.
1. Select **Save**.
1. Restart the application as prompted.

:::image type="content" source="media/options/options-download-checkmarked.png" alt-text="Screenshot of the 'Options' screen with 'Keep process model in cloud option' checked.":::

When you check the option, the following sections are made hidden and not relevant after the application restart:

- Data storage location
- Automatic download process data

## Related information

[Settings overview](settings.md)

