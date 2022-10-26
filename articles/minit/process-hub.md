---
title: Process hub overview (preview)
description: Learn how to launch the process hub, choose an environment, and understand view tiles in the Minit desktop application for Microsoft Power Automate process advisor. 
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/26/2022
ms.author: tatn
ms.reviewer: angieandrews
ms.custom: bap-template
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Process hub overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The process hub is Minit's home page. It's where you'll find an overview of your processes and process views. It's also where you can analyze your processes.

## Open the process hub

Open the Minit desktop app and sign in with your Azure DevOps account. The **Process hub** page opens.

The process hub displays each open process and any views associated with them as tiles.

:::image type="content" alt-text="Screenshot of the process hub, with two Create a new view tiles highlighted." source="media/minit-create-new-view.png":::

## Select an environment

If the process hub doesn't show the processes you expect, you may need to select a different environment.

1. Select **Environments** in the upper-right corner to open the list of environments you have access to.

1. Select an environment, or search for and select an environment.

   :::image type="content" alt-text="Screenshot of the environments dropdown menu." source="media/image-5.png":::

## Explore view tiles

A view is a representation of a single process. It stores all your settings for analyzing the process. To analyze a process from several viewpoints, create multiple views. You can work with a view by yourself or with your colleagues.

A view tile contains the following information:

- The name of the view
- The view's save state
- The date and time the view was last modified
- An indicator of whether the view is private or public
- The number of comments in the view discussion

A circular icon to the left of the name indicates the view's save state. The following table shows the possible states and their corresponding colors.

| Color | State |
|---------|---------|
| Red |  There are unsaved changes in the view. |
| Blue | The view is saved. |
| Orange | There are unsaved changes in the view, and the view isn't updated to the process version. |
| Violet | The view isn't updated to the process version. |

### Open or create a view

To open a view, select its tile. If the view isn't updated to the process version, the app displays a warning.

To create a view, select the **Create new view** tile to the right of the process tile. The process opens in a default form, and the app creates a view automatically.

## Organize the process hub

The process hub displays tiles by default, but you can list your processes and views in a way that works better for you. Select one of the icons in the upper-right corner of the page.

:::image type="content" alt-text="Screenshot of processes and process views." source="media/image-1.png":::

Legend:

1. Sort the list of processes and views in ascending or descending order. The sorting criterion depends on the display form you selected.
1. Search for a process or view by name.
1. Reset the display to the default.
1. **Processes**: Group processes by name, with views displayed below their associated process. Select the icon next to the process name to expand or collapse a group.
1. **Views**: Display processes and views as tiles. This view is the default.
1. **List**: Similar to **Processes** but without the tiles. Views are listed with their associated processes, but with more details.

## Manage your processes

Select (**...**) next to a process name to open a menu of actions.

:::image type="content" alt-text="Screenshot of actions for managing a process in the process hub." source="media/image-3.png":::

- **Create new view**: Open the process in its original state so that you can change its view settings and save them as a new view.

- **Process configuration**: Display information about the process.

- **Process context**: Define settings that are available in all process views.

## Next steps

[Explore process context (preview)](process-context.md)
