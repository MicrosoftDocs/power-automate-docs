---
title: Process hub overview (preview)
description: Learn how to open the process hub, choose an environment, and understand view tiles in the Minit desktop application for Microsoft Power Automate process advisor. 
author: maslejka
contributors:
  - maslejka
  - v-aangie
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/27/2022
ms.author: mmaslejova
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

The process hub is Minit's home page. It's where you'll find an overview of your processes and views. It's also where you can dig deeper into your processes by creating different views, or ways of analyzing your processes.

## Open the process hub

Open the Minit desktop app and sign in with your work account. The **Process hub** page opens.

Although Minit is a desktop application, it's connected to Power Automate through your work account. The process hub lists all the processes you created in process advisor, and displays any views associated with them as tiles.

:::image type="content" alt-text="Screenshot of the process hub in the Minit desktop app." source="media/image-27.png":::

## Select an environment

If the process hub doesn't show the processes you expect, you may need to select a different environment.

1. Select **Environments** in the upper-right corner to open the list of environments you have access to.

1. Select an environment, or search for and select an environment.

## Organize the process hub

By default, the process hub lists your processes and displays their associated views under them as tiles. You can organize your processes and views in a way that works better for you. Select one of the icons in the upper-right corner of the page.

:::image type="content" alt-text="Screenshot of processes and process views." source="media/image-1.png":::

Legend:

1. Sort views in ascending or descending order. You can sort by name, modification date, or by the most recently opened.
1. Search for a process or view by name.
1. Refresh the list of processes from the process advisor. For instance, if you create a process in process advisor, select the refresh icon to update the list in the process hub.
1. **Processes**: List processes by name, with their associated views displayed as tiles below them. Select the caret to the left of the process name to show or hide the views. This view is the default when you open Minit.
1. **Views**: Display views as tiles, independent of their associated process.
1. **List**: List views under their associated process in a table format. Columns display details such as status, last modification date, the person who modified it, the view's privacy status, and a menu with more actions.

## Explore view tiles

A view represents an analysis of a single process model. It stores all your settings for analyzing the process. To analyze a process from several viewpoints, create multiple views. You can work with a view by yourself or with your colleagues.

The first time you open Minit, if you haven't created any views of your processes, the process hub shows a default view for each process. The **Default** tile is blank until after the first time you select it. After you've opened a view, the tile displays a miniature version of the process map, as in the following example:

:::image type="content" source="media/image-27-a.png" alt-text="Screenshot of a view tile in process hub after it's been opened.":::

A view tile contains the following information:

- The name of the view
- The view's save state
- The date and time the view was last modified
- A key icon if the view is private to you only; no key indicates the view is public
- The number of comments in the view discussion, if any

A circular icon to the left of the name indicates the view's save state. The following table shows the possible states and their corresponding colors.

| Color | State |
|---------|---------|
| Red |  There are unsaved changes in the view. |
| Blue | The view is saved. |
| Orange | There are unsaved changes in the view, and the view isn't updated to the process version. |
| Violet | The view isn't updated to the process version. |

## Manage views

To open a view, select its tile. If the view isn't updated to the process version, the app displays a warning.

To delete, rename, or change the privacy of a view, in the **Processes** or **Views** view, select (**...**) in a view tile to open a menu of actions.

:::image type="content" source="media/image-3-b.png" alt-text="Screenshot of actions for managing a view in the process hub.":::

- **Make private** or **Make public**: Make a public view private or make a private view public.
- **Rename**: Change the name of a view.
- **Delete**: Delete a view you no longer need.

## Manage processes

In the **Processes** view, select (**...**) next to a process name to open a menu of actions. The menu items **Process information** and **Process context** correspond to the icons below the process name, as shown in the following screenshot:

:::image type="content" alt-text="Screenshot of actions for managing a process in the process hub." source="media/image-3.png":::

- **Create new view**: Corresponds to the **create new view** tile. Open the process in its original state so that you can change the view settings and save them as a new view.

- **Process information**: Display information about the attributes of the process model data and its refresh history.

    :::image type="content" source="media/image-3-a.png" alt-text="Screenshot of process information in the Minit process hub.":::

- **Process context**: Display, create, and change custom metrics, map hierarchies, and other view settings.

## Next steps

[Explore process context (preview)](process-context.md)
