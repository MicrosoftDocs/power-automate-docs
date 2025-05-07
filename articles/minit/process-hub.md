---
title: Explore the home page in Power Automate Process Mining
description: Learn how to use the home page so that you can get started using Power Automate Process Mining. 
author: rosikm
contributors:
  - rosikm
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 07/18/2023
ms.author: michalrosik
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
- flowmaker
- enduser
---

# Explore the home page

The **Processes** screen is the Power Automate Process Mining desktop app home page. It's where you'll find an overview of your processes and views. It's also where you can dig deeper into your processes by creating different views, or ways of analyzing your processes.

## Launch the application

Although Power Automate Process Mining is a desktop app, it's connected to Power Automate through your work account. The first screen you'll see is **Processes**. It lists the processes you created in process mining, and displays the views associated with them as tiles.

Open the Process Mining desktop app and sign in with your work account.

:::image type="content" alt-text="Screenshot of the the home page in the Process Mining desktop app." source="media/processes-screen.png":::

## Select an environment

If the **Process** screen doesn't show the processes you expect, you might need to select a different environment.

1. Select **Environments** in the title bar to open the list of environments you have access to.

1. Select an environment, or search for and select an environment.

## Organize your processes

You can organize your processes and views in a way that works best for you.

- **My processes** > **Process name:** List processes by name, with their associated views displayed as tiles below them. Select the caret to the left of the process name to show or hide the views. This view is the default when you open the Process Mining desktop app.

- **Shared with me** > **Process name:**

- **Sort by:** Select an option in this dropdown menu to sort views in ascending or descending order by name, or by most recent or oldest.

- **Refresh:** Refresh the list of processes from process mining in Power Automate. For example, if you create a process in the process mining portal of Power Automate, select **Refresh** to update the list in the **Processes** screen.

- **Search in processes and views:** Search for a process or view by name.

## Explore view tiles

A view represents an analysis of a single process model. It stores all your settings for analyzing the process. To analyze a process from several viewpoints, create multiple views. You can work with a view by yourself or with your colleagues.

The first time you open the Process Mining desktop app, if you haven't created any views of your processes, you'll see a default view for each process. The **Default** tile is blank until after the first time you select it. After you've opened a view, the tile displays a miniature version of the process map, as in the following example:

:::image type="content" source="media/contoso-tile.png" alt-text="Screenshot of a view tile after it's been opened.":::

A view tile contains the following information:

- The name of the view.

- The view's save state.

- The date and time the view was last modified.

- A lock icon if the view is private to you only, No lock indicates the view is public.

## Manage views

To open a view, select its tile. If the view isn't updated to the process version, the app displays a warning.

To delete, rename, or change the privacy of a view, in the **Processes** or **Views** view, select (**...**) in a view tile to open a menu of actions.

- **Make private** or **Make public**: Make a public view private or make a private view public.

- **Rename**: Change the name of a view.

- **Delete**: Delete a view you no longer need.

## Manage processes

In the **My processes** view, you'll see icons and a tile that allow you to manage your processes.

- **Icons**

    - **Publish to Power BI:** Publish changes to the view settings and filters back into Power BI report. This will trigger re-analysis of the process.

    - [**Process context:**](process-context.md) Display, create, and change custom metrics, map hierarchies, and other process settings.

    - **Process info:** Display information about the attributes of the process model data and its refresh history.

- **Tile**

    - **Create new view:** Open the process in its default state so that you can change the view settings, apply filters and save them as a new view.

