---
title: Work queues actions
description: Use work queue actions in Power Automate desktop flows.
ms.topic: conceptual
ms.date: 08/23/2023
ms.author: dbekirop
ms.reviewer: 
contributors:
 - DBEKI
 - tapanm-msft
 - rpapostolis
author: DBEKI
---
# Work queues actions

[Work Queues](../work-queues.md) in Power Automate can be used to store process-relevant data and provide a way to decouple complex processes and automations, allowing them to communicate asynchronously. 

Work queues can play a crucial role in improving the efficiency, scalability, and resiliency of automations and help prioritize work. Work queues allow you to complete highest-priority items first, regardless of whether they're processed by digital workers, human workers, or through integrations.

> [!NOTE]
>
> - Production-level support for the first set of work queue-related actions requires Power Automate desktop version **2.37** or later.
> - Work queue actions in Power Automate for desktop is a premium feature, which requires a [Power Automate subscription](https://powerautomate.microsoft.com/pricing/).
> - Currently only *Process work queue items* and *Update work queue item* actions can be classified and allowed or restricted through data loss prevention (DLP) policies, with other actions following soon. Note that cloud flow-based usage of work queues can't be restricted by DLP policies.

## Process work queue items

The **Process work queue items** action indicates to the queue orchestrator that the machine is ready to process one or more work queue items. The user context requesting a new item needs to have sufficient privileges on the work queue and work queue items table in order to process work queues. 

:::image type="content" source="media\workqueues\ProcessWorkQueueItems.png" alt-text="Screenshot of the Process Work Queue Item action." lightbox="media\workqueues\ProcessWorkQueueItems.png":::

The **work queue** referenced in the above action is used by the queue orchestrator to determine the next available items in that work queue that are in **Queued** state. As the desktop flow steps through the actions within the Process work queue items loop that this action renders, you can call on the value by utilizing the variable you have designated for the action along with the property `.Value`.  In this case, you could call the value of the work queue item using the variable %WorkQueueItem.Value% 

### processworkqueueitemaction

The **Process work queue item action** action requires the following arguments.

#### Input Parameters 

  | Argument       | Optional | Accepts | Default Value | Description     |
  |-----|-----|-----|---------------|-----------------|
  | **Work queue** |No    |Text |               |The work queue ID of the work queue that contains items to process|

#### Variables produced

  | Argument       | Type | Description     |
  |----------      |------|-----------------|
  | **WorkQueueItem** |No   |Information stored in the work queue item being processed |

#### Exceptions

  | Exception       | Description     |
  |----------      |-----------------|
  | **Work queue not found** |The value entered into the work queue parameter is invalid|
|**Failed to process work queue**| Bad request - error in query syntax |

## Update work queue item

The **Update work queue item** action allows users to change the status and processing results of the selected work queue item.

:::image type="content" source="media\workqueues\UpdateWorkQueueItem.png" alt-text="Screenshot of the Update Work Queue Item action." lightbox="media\workqueues\UpdateWorkQueueItem.png":::

### updateworkqueueitemaction

The **Update work queue item action** action requires the following arguments.

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Text |               |Work queue item variable that has been previously returned by the queue orchestrator|
| **Status** |No    |Processed, Generic Exception| Processed |Update the work queue item being processed using a status from the list of options.|
| **Processing result** | Yes | Text| | Custom processing result or value to set append  to the queue item being processed |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue item not found** | The work queue item being processed has either been deleted or  no longer belongs to the queue that it was called from.
| **Work queue item on hold** | The work queue item being processed contains a status of `on hold` in the queue orchestrator and can no longer be updated.
| **Failed to update work queue item** | The work queue item being updated has encountered an unexpected error, check the error message for more details.

## Add work queue item

The **Add work queue item** action allows users to populate work queue items into a work queue, which has been set up in the flow portal.

:::image type="content" source="media\workqueues\AddWorkQueueItem.png" alt-text="Screenshot of the add work queue item action." lightbox="media\workqueues\AddWorkQueueItem.png":::

### addworkqueueitem action

The **Add work queue item** action requires the following arguments.

#### Input Parameters

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue** |No    |Text value |               |The work queue item to add the item into|
| **Priority** |No    |High, Normal, Low| Normal |The priority to set the work queue item to|
| **Name** | No | Text value, Numeric value| | Custom name or ID for the new work queue item|
| **Input** | No | Text value, Numeric value| | The data which belongs to the value column to be processed|
| **Expires** | Yes | Datetime| | The datetime value set to expire the queue item, otherwise adopts the default value if one is set for the queue|
| **Processing notes** | Yes | Text value, Numeric value| | Custom processing notes to be added to the new queue item|

#### Variables produced

  | Argument       | Type | Description     |
  |----------      |------|-----------------|
  | **WorkQueueItem** |No   |Information stored for the work queue item being added |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The value entered into the work queue parameter is invalid|
| **Failed to add item into work queue** | The work queue item couldn't be added into the work queue.  Bad request - error in query syntax |

## Requeue item with delay

The **Requeue item with delay** action allows users to to re-add a queue item being processed in the desktop flow, back into it's originating queue.  In addition, the queued item can be held and released until a defined time.

:::image type="content" source="media\workqueues\RequeueWorkQueueItemWithDelay.png" alt-text="Screenshot of the requeue work queue item action." lightbox="media\workqueues\RequeueWorkQueueItemWithDelay.png":::

### requeueworkqueueitemaction

The **Requeue item with delay** action requires the following arguments.

#### Input Parameters

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Work queue item |               |The work queue item to add the item into|
| **Delay until** |No    |Datetime value| Normal |The datetime value applied to delay the queue item until|
| **Expires** | Yes | Datetime value| | Custom expiration time for the item being requeued|
| **Processing result** | Yes | Text value, Numeric value| | Custom processing result to be added to the new queue item|

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The value entered into the work queue parameter is invalid|
| **Work queue item not found** | The queue item value is invalid|
| **Failed to requeue work queue item** | The work queue item couldn't be added into the work queue.  Bad request - error in query syntax |

### See also

- [Work queue overview](../work-queues.md)
- [Manage work queues](../work-queues-manage.md)
- [Bulk-import work queue data](../work-queues-bulk-import.md)
- [Trigger work queues](../work-queues-trigger.md)
- [Process work queues](../work-queues-process.md)
