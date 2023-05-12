---
title: Manage work queues (preview)
description: Manage work queues in Power Automate.

ms.topic: conceptual
ms.date: 04/28/2023
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage work queues (preview)

[This article is pre-release documentation and is subject to change.]

Power Automate provides rich user experiences and features that will allow you to efficiently and centrally manage work queues within your environments.

## View work queues

To view the list of work queues you have either created or that have been shared with you:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the Monitor section.
3. Select Work queue (preview).

If you have already created work queues or if any work queue has been shared with you, you will see a list similar to this.

:::image type="content" source="media/work-queues/work-queue-list.png" alt-text="Screenshot of a list of work queues in Power Automate portal." lightbox="media/work-queues/work-queue-list.png":::

## Create a work queue

To view the list of work queues you have either created or that have been shared with you:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue (preview)** and click the **+ New work queue** button.
4. In the **New work queue** side-panel, enter a **name** for the work queue.
5. (Optional) Enter a **description** for the work queue.
6. (Optional) Enter a default lifespan for work queue items in the **Item default time to live (in minutes)**.
   > [!NOTE]
   > The *item default time to live* value determines the default lifespan for items entering a work queue and can. For example, if you enter a value of 1440 minutes (1 day), this would set the expiration date of an item entering the queue to now + 1 day. However, if the item being added already has an expiration date assigned, this default value is ignored. You can adjust this value later, but please note that it will not retroactively assign expiration dates to items that already exist in the work queue.
7. Click the Create button to create the new work queue.

## Edit a work queue

To edit a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue (preview)**.
4. In the work queue list select the work queue you would like to edit.
5. Click **Edit work queue** in the toolbar and update the values in the update pane.
6. Select **Save**.

## Share a work queue

To share a work queue with one ore more users with co-ownership:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue (preview)**.
4. In the work queue list select the work queue you would like to share.
5. Click **Manage access** in the toolbar.
6. In the **Share** pane, enter the email or name of the person you want to share with.
7. Add the user to the list and select the user under the **New** section to confirm the access level.

## Delete a work queue

   > [!CAUTION]
   > When you delete a work queue, all related records, including work queue items and their processing history, are permanently deleted.

To delete a work queue:

1. In the work queue list select the work queue you would like to delete.
2. Click **Delete work queue** in the toolbar and update the values in the update pane.
3. On the delete confirmation dialog, select Delete.
4. Select **Save**.

## Create work queue items

To create a new work queue item through the Power Automate portal:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select the work queue you would like to create items for and click the **See details** button.
4. In the **New work queue** side-panel, enter a **name** for the work queue.

Looking for more ways to create work queue data? 

> [!div class="nextstepaction"]
> [Learn how to bulk-load work queue data](work-queues-create-bulk.md)

## Next steps

> [!div class="nextstepaction"]
> [Learn how to process work queues](work-queues-process.md)

## Learn more

- [Bulk-load work queue items](work-queues-create-bulk.md)
- [Trigger work queues](work-queues-trigger.md)
- [Known issues and limitations](work-queues-known-limitations.md)
