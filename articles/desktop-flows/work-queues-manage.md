---
title: Manage work queues
description: Manage work queues in Power Automate.
ms.topic: how-to
ms.date: 09/08/2025
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
1. On the left menu, select the **Monitor** section.
1. Select **Work queue** and then select **+ New work queue**.
1. In the **New work queue** side panel, enter a **work queue name** for the queue.
1. (Optional) Enter a **description** for the work queue.
1. (Optional) Enter a **work queue key** for the work queue. When provided, the value must be unique within this queue. If left empty, a unique value is automatically provided by the system.
1. (Optional) Turn on the SLA strategy to enable [Work queues SLA](#work-queues-sla). Select the default time-to-live (TTL), and set the default SLA violation in the **SLA violated after** field. Then, set the **SLA considered at risk after (preview)** value. The slider value is a percentage based on the **SLA violation after** setting.
   > [!NOTE]
   > - When you set an *SLA violated after* value for a work queue, any item added without an explicit expiration date expires when the entered *SLA violated after* elapses. For exmaple, if you set the *SLA violated after* to 5 hours, an item added at 2:00 PM will be considered in violation and expire at 7:00 PM.
   >  - When you set an *SLA considered at risk after (preview)* value for a work queue, any item added to the work queue will have *SLA considered at risk after (preview)* calculated based on percentage that you have configured that is applied on the *SLA violated after* configuration. For example, if you set the *SLA considered at risk after (preview)* to 80% and *SLA violated after* value to 5 hours, an item added at 2:00 PM will reach SLA at risk 6:00 PM, and in volation and expire at 7:00 PM.
1. (Optional) Select either JSON or XSD as the schema type for work queue item input validation to ensure that input data conforms to the defined schema. Next, select **Add schema** to enter or paste the desired schema.
   > [!NOTE]
   > - Once a schema is added to a work queue, it can't be changed to avoid data inconsistencies and processing failures.
   > - Currently supported JSON schema version is draft 3.
1. (Optional) Determine if you want to enable **Auto-retry on IT exception**. When enabled, this feature activates the auto-retry pattern for desktop flow based work queue item processing. It enables the machine to retain the currently processing item and allows makers to perform controlled retries without requeuing the item.
1. (Optional) Determine if you want to **Allow update item input while in processing**. When enabled, this feature allows updates to the input field of work queue items during processing.

## Edit a work queue

To edit a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
1. On the left menu, select the **Monitor** section.
1. Select **Work queues**.
1. In the work queue list, select the work queue you would like to edit.
1. Select **Edit work queue** on the toolbar and update the values in the update pane.
1. (Optional) Enter a **Description** for the work queue.
1. (Optional) Enter a **Work queue key** for the work queue. When provided, the value must be unique within this queue. If left empty, a unique value is automatically provided by the system.
1. (Optional) Activate SLA strategy to enable [Work queues SLA](#work-queues-sla). Select the default time-to-live (TTL), and set the default SLA violation in the **SLA violated after** field. Then, set the **SLA considered at risk after (preview)** configuration.
1. (Optional) Check if you want to enable **Auto-retry on IT exception**.
1. (Optional) Check if you want to **Allow update item input while in processing**.
1. Select **Save**.

## Share a work queue

To share a work queue:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
1. On the left menu, select the **Monitor** section.
1. Select **Work queue**.
1. In the work queue list, select the work queue you would like to share.
1. Select **Manage access** on the toolbar.
1. In the **Share** pane, enter the email or name of the person you want to share with.
1. Add the user to the list and select the user under the **New** section to confirm the access level.

## View advanced fields of a work queue

If you're ingesting or programmatically interacting with work queue data through the Dataverse connector or APIs, it's helpful to quickly identify internal field values that might be required for your use-case.

To view advanced work queue details:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
1. On the left menu, select the **Work queue**.
1. In the work queue list, select the work queue.
1. Select **Advanced details** on the work queue details card.
1. In the **Advanced details** pane, you can use the 'Copy' icons to copy each of its values.

## Delete a work queue

To delete a work queue:

1. In the work queue list, select the work queue you would like to delete.
1. Select **Delete work queue** on the toolbar.
1. In the delete confirmation dialog, select **Delete**.

> [!CAUTION]
> When you delete a work queue, all related records, including work queue items and their processing history, are permanently deleted.

## Create work queue items

To create a new work queue item through the Power Automate portal:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
1. On the left menu, select the **Monitor** section.
1. Select the work queue you would like to create items for and then select **See details**.
1. Select **+ New work queue item** on the toolbar.
1. In the **New work queue item** side panel, enter a **Name** for the work queue item.
   > [!NOTE]
   > If you don't provide a value for the work queue item name, the internal work queue ID is displayed instead in the work queue item list pages.

1. (Optional) Set the **Status** to **On hold** if the created item requires review or other preprocessing work before they can be queued.
1. (Optional) Select a different **Priority** for the work queue item if you wish to influence processing priority.
1. (Optional) Enter a **Unique Id or reference** if you wish to provide a custom unique value within this queue. If left empty, a unique value in the format of `system-<GUID>` is automatically provided. |
1. (Optional) Activate the **Expiration date** section and select a custom **Expiration date** value for the work queue item.
1. Enter the actual alphanumeric **Input** value of the work queue item.
1. (Optional) Enter **Processing notes** relevant to this work queue item.

Looking for more ways to create work queue data?

> [!div class="nextstepaction"]
> [Learn how to bulk-import work queue data](work-queues-bulk-import.md)

## Edit a work queue item

> [!IMPORTANT]
> To help protect data integrity during processing, work queue item names or values aren't allowed to be changed for items that are in the **Processing** state.

To edit a work queue item:

1. Select the work queue item you would like to edit and then select  **Edit work queue item** .
1. In the **Edit work queue item** side-panel, you can update all values as long as the item isn't in the Processing state.

  > [!NOTE]
  > If you don't provide a value for the work queue item name, the internal work queue id is displayed instead in the work queue item list pages.

### Work queue item statuses

| Status             | Purpose                                                                           | When to Use                                                                                  | Example                                                      |
|--------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| Queued             | The item is waiting to be picked up for processing.                               | When the item is ready to be processed. This status is the default when adding items to a work queue. | An invoice was received and added to the processing queue.   |
| Processing         | A system or a human is currently processing the item.                             | When the item is actively being worked on.                                                   | A customer service representative is working on resolving a customer complaint. |
| On hold            | The item is temporarily paused and isn't available for processing.                | When additional information is required or a dependent task needs to be completed.           | An order is on hold because the payment confirmation is pending from the customer. |
| Processed          | The item is successfully processed and completed.                                 | Use this status to indicate that the work on the item finished successfully.                 | A customer refund was processed and confirmed.               |
| Generic exception  | The item encountered an unspecified, unexpected error or issue during processing. | When an unexpected error occurs that doesn't fit into other more specific exception statuses. | An unexpected system error caused an order processing to fail. |
| IT exception       | The item encountered a technical error or IT-related issue during processing.     | When processing is interrupted by a technical failure, such as a server error or connectivity issue. | An order processing failed due to a network or database server outage. |
| Business exception | The item encountered a business rule-related issue during processing.             | When processing fails due to a business logic error or violation, such as incorrect data input. | A vendor invoice is rejected because the vendor sending the invoice is blocked. |
| Processing timeout | The item failed to complete processing within the allocated time limit.           | When processing takes longer than the predefined time frame for the work queue.              | A data extraction process from a remote application is taking longer than the set timeout limit. |

### Allowed status transitions

Status transitions rules have been established in order to optimize the lifecycle management of work queue items. As a result, certain work queue item statuses might be unavailable for selection either interactively or during runtime processing if they don't fall under the allowed transition path. More information about these paths is in the following table.

| Status      | Details                                                                                           | Allowed transitions |
|-------------|--------------------------------------------------------------------------------------------------|--------------------|
| **Queued**      | This is the default state when items enter the work queue, and the only state under which work queue item dequeuing is allowed. | Processing          |
| **Processing**  | Indicating that the item is currently being processed.                                       | Processed, Exception|
| **Processed**   | Indicating that the item is currently processing.                                             | Queued, On hold     |
| **Exception**   | An exception has been raised during work item processing. Depending on your exception scenarios, you have the option to choose between **Generic**, **IT**, and **Business** **exceptions**.                                 | Queued, On hold     |
| **On hold**    | A business or IT user has picked an item to review, assess, and potentially remediate issues.     | Queued              |

## Work queues SLA

Work Queues SLA lets organizations define, monitor, and manage service level expectations for items processed through work queues. By setting time-to-live (TTL), SLA violation, and at-risk thresholds, you ensure timely handling of queued work and proactively address delays. This capability improves operational efficiency, helps you stay compliant with business policies, and gives you better visibility into automation adherence to SLA requirements.

Work Queues SLA is configured when [creating](#create-a-work-queue) or [editing](#edit-a-work-queue) your work queue, and can be managed on the work queue list page, work queue details page, and [automation center](../automation-center-overview.md#work-queues-tab).

### Example of a work queue SLA use case

As part of a supply chain process, you process thousands of transactions every day.

You need to finish each transaction within 5 hours because each uses a unique token that expires after that period.

Here’s an example of how to use Work Queues SLA:

1. Set up a work queue for transaction processing with an SLA violation threshold set to 5 hours and an SLA at-risk threshold set to 80% (4 hours).
1. Create a Dataverse trigger for when work queue items enter the "At-risk" status. This triggers more processing and sends an email notification to the operations team, alerting them that the SLA is at risk.
1. Set up another Dataverse trigger for when work queue items reach SLA violation (for example, expire), notifying the operations team so the transaction can be manually reprocessed.

With this setup, you can address at-risk work queue items proactively to avoid SLA violations, and items that violate the SLA are flagged for manual intervention.

## Next steps

> [!div class="nextstepaction"]
> [Learn how to process work queues](work-queues-process.md)

## Related information

- [Work queue overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)
- [Known issues and limitations](work-queues-known-limitations.md)
