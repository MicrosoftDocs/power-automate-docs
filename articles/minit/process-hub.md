---
title: Process hub overview (preview)
description: Learn how to launch the process hub, choose an environment, and learn about view tiles in minit desktop application in process advisor. 
author: nijemcevic
ms.subservice: process-advisor
ms.topic: overview
ms.date: 10/15/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app:
- Flow
search.audienceType:
- flowmaker
- enduser
---

# Process hub overview (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

*Process hub* is the main and starting screen of minit. It gives you an overview of created processes and process views, and it allows you to analyze them.

## Launch Process hub

1. sign in with your Azure DevOps account.

   :::image type="content" alt-text="Screenshot of minit sign-in screen." source="./media/minit-sign-in.png":::

    The **Process hub** screen opens. 

   The center of the screen shows you the currently open process, indicates the user, and project views associated with the respective processes. 

1. To open a view, select its tile.

1. To create a new process view from the process, select the **Create new view** tile.

   The process will open in a default form and a view will be automatically created.

   :::image type="content" alt-text="Screenshot of Create a new view tiles under Demo and New process test headings." source="media/minit-create-new-view.png":::

## Select an environment

In the Create a new view screen, you can select an environment.

1. Select the **Menu** icon in the white collapsible panel on the right. A panel will show a list of existing environments.

1. In the **Environments** dropdown menu, select an environment name.

   :::image type="content" alt-text="Screenshot of the environments dropdown menu." source="media/image-5.png":::

## Understand view tiles

A view is the representation of a single process you can work with on your own or with your colleagues. View stores all your settings for the analysis of the process. If you want to analyze one process from several viewpoints, create multiple views.

The view tile contains the following information:

- View name.
- View state preview.
- Date and time of the last modification.
- Indicators of whether it is private or public view.
- The overall number of comments in the view discussion.

The view tile also contains a circular icon to the left of the view name. Its color identifies the save status.

|Color  | Description  |
|---------|---------|
|Red     |  There are unsaved changes in the view.       |
|Blue     | The view is saved.        |
|Orange     | There are unsaved changes in the view, and view is not updated to the actual process version.        |
|Violet   | The view is not updated to the actual process version.        |

### Open a view

To open a view, select its tile. If the view is not updated to the actual process version, you'll be notified.

### Process and view organization

The center of the screen lists the processes and process views. It's possible to organize the list in three ways, selecting the icons on the right side of the screen.

:::image type="content" alt-text="Screenshot of processes and process views." source="media/image-1.png":::

- **Processes** – grouped view in which a process is indicated by the name and all corresponding views are located below the process. The structure is collapsible/expandable by selecting the circle icon next to the process name.

- **Views** – plain list of view tiles from all processes.

- **List** – a view similar to Processes but without the view tiles. Views have a form of an item in a list with more details.

You can sort the selected display form by selecting the **sort indicator** icon on the top of the list. Availability of sorting criteria depends on the selected display form.

## Choose how to manage your process

Use the process hub to manage your processes. Access the management menu by selecting (**...**) next to the process name.



:::image type="content" alt-text="Screenshot of options for how to manage your process." source="media/image-3.png":::

- **Create new view:** Open the original state of the process with the possibility to apply changes and save it as a new view.

- **Process configuration:** Display the available information about the process.

- **Process context:** Define settings that are available in all process views.

