---
title: Manage work queues
description: Manage work queues in Power Automate.
ms.topic: conceptual
ms.date: 04/28/2023
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
---
# Manage work queues

Power Automate provides rich user experiences and features that allow you to efficiently and centrally manage work queues within your environments.

## View work queues

To view the list of work queues:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue**.

If you have already created work queues or if any work queue has been shared with you, you see a list similar to the below.

:::image type="content" source="media/work-queues/work-queue-list.png" alt-text="Screenshot of a list of work queues in Power Automate portal." lightbox="media/work-queues/work-queue-list.png":::

## Create a work queue

To create a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue** and then select **+ New work queue**.
4. In the **New work queue** side-panel, enter a **work queue name** for the queue.
5. (Optional) Enter a **description** for the work queue.
6. (Optional) Enter a **work queue key** for the work queue. When provided, the value must be unique within this queue. If left empty, a unique value is automatically provided by the system.
7. (Optional) Activate this section and select a default lifespan value for work queue items in the **Items expire after** fields.
   > [!NOTE]
   > If you set an *Items expire after* value for a work queue, any item added without an explicit expiration date will expire after the entered *Items expire value* has elapsed. So if you set the *Items expire after* to 30 minutes, an item added at 2:00 PM will expire at 2:30 PM.
8. (Optional) Select either JSON or XSD as schema type for work queue item input validation to ensure that input data conforms to the defined schema. Next, select **Add schema** to enter or paste the desired schema.
   > [!NOTE]
   > - Once a schema is added to a work queue, it cannot be changed to avoid data inconsistencies and processing failures.
   > - Currently supported JSON schema version is draft 3.

## Edit a work queue

To edit a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue**.
4. In the work queue list, select the work queue you would like to edit.
5. Select **Edit work queue** on the toolbar and update the values in the update pane.
6. (Optional) Enter a **description** for the work queue.
7. (Optional) Enter a **work queue key** for the work queue. When provided, the value must be unique within this queue. If left empty, a unique value is automatically provided by the system.
8. (Optional) Activate this section and select a default lifespan value for work queue items in the **Items expire after** fields.
9. Select **Save**.

## Share a work queue

To share a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue**.
4. In the work queue list, select the work queue you would like to share.
5. Select **Manage access** on the toolbar.
6. In the **Share** pane, enter the email or name of the person you want to share with.
7. Add the user to the list and select the user under the **New** section to confirm the access level.

## View advanced fields of a work queue

If you're ingesting or programmatically interacting with work queue data through the Dataverse connector or APIs, it's helpful to quickly identify internal field values that might be required for your use-case.

To view advanced work queue details:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select **Work queue**.
4. In the work queue list, select the work queue you would like to share.
5. Select **Advanced details** on the work queue details card.
6. In the **Advanced details** pane, you can use the 'Copy' icons to copy each of its values.

## Delete a work queue

To delete a work queue:

1. In the work queue list, select the work queue you would like to delete.
2. Select **Delete work queue** on the toolbar.
3. In the delete confirmation dialog, select **Delete**.

> [!CAUTION]
> When you delete a work queue, all related records, including work queue items and their processing history, are permanently deleted.

## Create work queue items

To create a new work queue item through the Power Automate portal:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select the **Monitor** section.
3. Select the work queue you would like to create items for and then select **See details**.
4. Select **+ New work queue item** on the toolbar.
5. In the **New work queue item** side-panel, enter a **Name** for the work queue item.
   > [!NOTE]
   > If you don't provide a value for the work queue item name, the internal work queue id is displayed instead in the work queue item list pages.

6. (Optional) Set the **status** to `On-hold` if the created item requires review or other preprocessing work before they can be queued.
7. (Optional) Select a different **priority** for the work queue item if you wish to influence processing priority.
8. (Optional) Enter a **unique Id or reference** if you wish to provide a custom unique value within this queue. If left empty, a unique value in the format of `system-<GUID>` will be automatically provided by the system |
9. (Optional) Activate this section and select a custom **expiration date** value for the work queue item.
10. Enter the actual alphanumeric value of the work queue item.
11. (Optional) Enter any processing notes relevant to this work queue item.

Looking for more ways to create work queue data?

> [!div class="nextstepaction"]
> [Learn how to bulk-import work queue data](work-queues-bulk-import.md)

## Edit a work queue item

> [!IMPORTANT]
> To help protect data integrity during processing, work queue item names or values aren't allowed to be changed for items that are in the **Processing** state.

To edit a work queue item:

1. Select the work queue item you would like to edit and then select  **Edit work queue item** .
2. In the **Edi work queue item** side-panel, you can update all values as long as the item isn't in the **Processing** state.

  > [!NOTE]
  > If you don't provide a value for the work queue item name, the internal work queue id is displayed instead in the work queue item list pages.

### Allowed status transitions

Status transitions rules have been established in order to optimize the lifecycle management of work queue items. As a result, certain work queue item statuses might be unavailable for selection either interactively or during runtime processing if they don't fall under the allowed transition path. More information about these paths is in the following table.

| Status      | Details                                                                                           | Allowed transitions |
|-------------|--------------------------------------------------------------------------------------------------|--------------------|
| **Queued**      | This is the default state when items enter the work queue, and the only state under which work queue item dequeuing is allowed. | Processing          |
| **Processing**  | Indicating that the item is currently being processed.                                       | Processed, Exception|
| **Processed**   | Indicating that the item is currently processing.                                             | Queued, On hold     |
| **Exception**   | An exception has been raised during work item processing. Depending on your exception scenarios, you have the option to choose between **Generic**, **IT** and **Business** **exceptions**.                                 | Queued, On hold     |
| **On hold**    | A business or IT user has picked an item to review, assess, and potentially remediate issues.     | Queued              |

## Next steps

> [!div class="nextstepaction"]
> [Learn how to process work queues](work-queues-process.md)

## See also

- [Work queue overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
- [Known issues and limitations](work-queues-known-limitations.md)
