---
title: Work queues actions (Preview)
description: Manage work queues in Power Automate.
ms.topic: conceptual
ms.date: 5/1/2023
ms.author: dbekirop
ms.reviewer: 
contributors:
author: DBEKI
---
# Work queues actions (Preview)

[This article is prerelease documentation and is subject to change.]

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../../articles/includes/cc-preview-features-definition.md)]

[Work Queues](https://learn.microsoft.com/power-automate/desktop-flows/work-queues) in Power Automate can be used to store process-relevant data and provide a way to decouple complex processes and automations, allowing them to communicate asynchronously. 

Work queues can play a crucial role in improving the efficiency, scalability and resiliency of automations and help prioritize work, with the highest-priority items being completed first, regardless of whether they have been processed by digital workers, human workers, or through integrations.

> [!NOTE]
> Work queue actions in Power Automate for desktop is a premium feature which requires a [Power Automate subscription](https://powerautomate.microsoft.com/pricing/).

## Process work queue items (Preview)

The **Process work queue items (Preview)** action indicates to the queue orchestrator that the machine is ready to process one or more work queue items. The user context requesting a new item needs to have sufficient privileges on the work queue and work queue items table in order to process work queues. 

:::image type="content" source="media\workqueues\ProcessWorkQueueItems.png" alt-text="Screenshot of the Process Work Queue Item action." lightbox="media\workqueues\ProcessWorkQueueItems.png":::

The **work queue** referenced in the above action is used by the queue orchestrator to determine the next available items in that work queue that are in **Queued** state. As the desktop flow steps through the actions within the Process work queue items loop which this action renders, you can call on the value by utilizing the variable you have designated for the action along with the property ‘.Value’.  In this case, you could call the value of the work queue item using the variable %WorkQueueItem.Value% 

### Inputs Parameters 

  | Argument       | Optional | Accepts | Default Value | Description     |
  |-----|-----|-----|---------------|-----------------|
  | **Work queue** |No    |Text |               |The work queue ID of the work queue which contains items to process|

### Variables produced

  | Argument       | Type | Description     |
  |----------      |------|-----------------|
  | **Work queue** |No   |Information stored in the work queue item being processed |

### Exceptions

  | Exception       | Description     |
  |----------      |-----------------|
  | **Work queue not found** |The value entered into the work queue parameter is invalid|
|**Failed to process work queue**| Bad request - error in query syntax |

## Update work queue item (Preview)

The **Update work queue item (Preview)** action allows users to change the status and processing results of the selected work queue item.

:::image type="content" source="media\workqueues\UpdateWorkQueueItem.png" alt-text="Screenshot of the Process Work Queue Item action." lightbox="media\workqueues\UpdateWorkQueueItem.png":::

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Text |               |Work queue item variable that has been previously returned by the queue orchestrator|
| **Status** |No    |Processed, Generic Exception| Processed |Update the work queue item being processed using a status from the list of options.|
| **Processing result** | Yes | Text| | Custom processing notes or value to set append  to the queue item being processed |

### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue item not found** | The work queue item being processed has either been deleted or  no longer belongs to the queue which it was called from
| **Work queue item on hold** | The work queue item being processed contains a status of ‘on hold’ in the queue orchestrator and can no longer be updated
| **Failed to update work queue item** | The work queue item being updated has encountered an unexpected error, please check the error message for more details

### See also

- [Work queue overview](work-queues.md)
- [Manage work queues](work-queues-manage.md)
- [Bulk-import work queue data](work-queues-bulk-import.md)
- [Trigger work queues](work-queues-trigger.md)
- [Process work queues](work-queues-process.md)