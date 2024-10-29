---
title: Work queues actions
description: Use work queue actions in Power Automate desktop flows.
ms.topic: conceptual
ms.date: 10/15/2024
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

:::image type="content" source="media\workqueues\work-queue-pad-procwqiaction-new.png" alt-text="Screenshot of the Process Work Queue Item action." lightbox="media\workqueues\work-queue-pad-procwqiaction-new.png":::

The **work queue** referenced in the previous action is used by the queue orchestrator to determine the next available items in that work queue that are in **Queued** state. As the desktop flow steps through the actions within the Process work queue items loop that this action renders, you can call on the value by utilizing the variable you have designated for the action along with the property `.Value`.  In this case, you could call the value of the work queue item using the variable %WorkQueueItem.Value% 

> [!IMPORTANT]
> By supplying a [FetchXML](#what-are-fetchxml-queries) expression in the "Filter rows" field, you bypass the default work queue orchestrator's FIFO logic for queued items. This allows you to set a custom dequeue order and ignore item expiration dates and other settings that are automatically applied when no filter expression is provided.

### `Processworkqueueitemaction`

The **Process work queue item action** action requires the following arguments.

#### Input parameters

  | Argument       | Optional | Accepts | Default Value | Description     |
  |-----|-----|-----|---------------|-----------------|
  | **Work queue** |No    |Text |               |The work queue ID of the work queue that contains items to process.|
  | **Filter rows** | Yes    |Text |              | The [FetchXML](#example-fetchxml-query) query expression used to retrieve items from the work queue. |
  | **Overwrite work queue auto-retry configuration** | Yes | Boolean| False | When enabled, a field appears allowing you to set or overwrite the maximum number of retries for `IT Exceptions`. |
  | **Max retry count** |No    |Text value, Numeric value|  When not overwritten, it uses the default max-retry count defined on the work queue record.  | The maximum allowed number of retries for `IT Exceptions`. This parameter lets you adjust the retry count to a higher or lower value, or even disable the retry mechanism by setting the count to 0. |

#### Variables produced

  | Argument       | Type | Description     |
  |----------      |------|-----------------|
  | **WorkQueueItem** |No   |Information stored in the work queue item being processed |

#### Exceptions

  | Exception       | Description     |
  |----------      |-----------------|
  | **Work queue not found** |The value entered into the work queue parameter is invalid.|
  |**Work queue paused or stopped**| The work queue is either paused or stopped, which isn't a valid state when processing items. |
  |**Invalid FetchXML**| An invalid FetchXML expression was provided. |
  |**Failed to process work queue**| Bad request - error in query syntax. |

### What are FetchXML queries?

Microsoft Dataverse [FetchXML](/power-apps/developer/data-platform/use-fetchxml-construct-query) is a language used for retrieving data from a Dataverse database. It's designed to be easy to create, use, and understand. For example, you might want to ask the orchestrator to process items in a different order than first-in-first-out (FIFO) and within a specific expiration timeframe.

To limit FetchXML query support to processing work queue items, a limited set of FetchXML terms and expressions are supported. These terms include filters, conditions, and ordering expressions, all restricted to the work queue item table (workqueueitem). Only items that are in a `Queued` state are returned.

### Example FetchXML query

The following is an example query expression for how to filter on the `name` and order the results by the records expiring first (FEFO).

```xml
<filter type="and">
  <condition attribute="expirydate" operator="on-or-before" value="2024-10-18" />
  <condition attribute="name" operator="eq" value="MyNonUniqueNameString" />
</filter>
<order attribute="expirydate" descending="false" />
```

### Query support details and reference data

- List of [query operators](/power-apps/developer/data-platform/fetchxml/reference/operators) available for use, including operators such as on-or-before, between, and last-month.
- List of attributes available in the [work queue item](/power-apps/developer/data-platform/reference/entities/workqueueitem#writable-columnsattributes) table.

## Update work queue item

The **Update work queue item** action allows users to change the status and processing results of the selected work queue item.

:::image type="content" source="media\workqueues\UpdateWorkQueueItem.png" alt-text="Screenshot of the Update Work Queue Item action." lightbox="media\workqueues\UpdateWorkQueueItem.png":::

### `Updateworkqueueitemaction`

The **Update work queue item action** action requires the following arguments.

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Text |               |Work queue item variable that has been previously returned by the queue orchestrator|
| **Status** |No    |Processed, Generic Exception| Processed |Update the work queue item being processed using a status from the list of options.|
| **Processing notes** | Yes | Text| | Custom processing notes or value to append to the queue item being processed. |
| **Clear processing notes** | Yes | Boolean| False | When enabled, hides and clears the processing notes field on this screen and removes any processing notes from the database that have been previously captured for this item. |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue item not found** | The work queue item being processed has either been deleted or  no longer belongs to the queue that it was called from.
| **Work queue item on hold** | The work queue item being processed contains a status of `on hold` in the queue orchestrator and can no longer be updated.
| **Failed to update work queue item** | The work queue item being updated has encountered an unexpected error. Check the error message for more details.

## Add work queue item

The **Add work queue item** action allows users to populate work queue items into a work queue, which has been set up in the flow portal.

:::image type="content" source="media\workqueues\AddWorkQueueItem.png" alt-text="Screenshot of the add work queue item action." lightbox="media\workqueues\AddWorkQueueItem.png":::

### `Enqueueworkqueueitemaction`

The **Add work queue item** action requires the following arguments.

#### Input parameters

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue** |No    |Text value |               |The work queue item to add the item into|
| **Priority** |No    |High, Normal, Low| Normal |The priority to set the work queue item to|
| **Name** | No | Text value, Numeric value| | Custom name or ID for the new work queue item|
| **Input** | No | Text value, Numeric value| | The data, which belongs to the value column to be processed|
| **Expires** | Yes | Datetime| | The datetime value set to expire the queue item, otherwise adopts the default value if one is set for the queue|
| **Processing notes** | Yes | Text value, Numeric value| | Custom processing notes to be added to the new queue item|
| **Has unique id or reference** | Yes | Text value, Numeric value| | When enabled, a value should be provided that is unique within this queue. If left empty, a unique value in the format of `system-<GUID>` is automatically provided by the system |

#### Variables produced

  | Argument       | Type | Description     |
  |----------      |------|-----------------|
  | **WorkQueueItem** |No   |Information stored for the work queue item being added |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The value entered into the work queue parameter is invalid|
| **Failed to add item into work queue** | The work queue item couldn't be added into the work queue. Bad request - error in query syntax |

## Add multiple work queue items

The **Add multiple work queue items** action allows users to add one or more work queue items to a work queue based on the data provided as work queue item data table.

:::image type="content" source="media\workqueues\AddMultipleWorkQueueItems.png" alt-text="Screenshot of the add multiple work queue items action." lightbox="media\workqueues\AddMultipleWorkQueueItems.png":::

This action requires a custom data table that holds one or more work queue items. The data table must have eight columns and conform to the following schema:

| Column Name         | Description                                            | Required | Allowed Values                               |
|---------------------|--------------------------------------------------------|----------|----------------------------------------------|
| Name                | The name of the item.                                  | No       | Any alphanumeric string                                   |
| Input               | Input details or data of the item.                     | Yes      | Any alphanumeric string                                   |
| Expires in          | Specifies the duration until the item expires.         | No       | Date and time value |
| Processing notes    | Processing notes related to the item.                  | No       | Any alphanumeric string                                   |
| Priority            | The priority level of the item.                        | Yes      | Numeric value of either 100 (High), 200 (Normal), 300 (Low) |
| Unique reference    | A unique identifier or reference value for the item.   | No       | Any unique alphanumeric string or reference                  |
| Status              | Status of the item on ingestion.                       | Yes      | Numeric value of either zero (Queued), one (On Hold).     |
| Delay until         | Specifies a date and time until the work queue items should be ignored for processing.    | No      | Date and time value|

#### Robin code snippet for creating the data table

The following example is a robin code (used in traditional flows) snippet that you can copy and paste directly into the Power Automate desktop designer window. This snippet adds a [Create new data table](variables.md#createnewdatatable) action with the expected set of fields to your flow.

```json
Variables.CreateNewDatatable InputTable: { ^['Name', 'Input', 'Expires in', 'Processing notes', 'Priority', 'Unique reference', 'Status', 'Delay until'], [$'''''', $'''''', $'''''', $'''''', $'''''', $'''''', $'''''', $''''''] } DataTable=> DataTable
```

#### PowerFx code snippet for creating the data table

The following example is a PowerFx code snippet you can copy and paste directly into the Power Automate desktop designer window. This snippet adds a [Create new data table](variables.md#createnewdatatable) action with the expected set of fields to your flow.

```json
Variables.CreateNewDatatable InputTable: { ^['Name', 'Input', 'Expires in', 'Processing notes', 'Priority', 'Unique reference', 'Status', 'Delay until'], [$fx'', $fx'', $fx'', $fx'', $fx'', $fx'', $fx'', $fx''] } DataTable=> DataTable
```

### `Batchenqueueworkqueueitemsaction`

The **Add multiple work queue items** action requires the following arguments.

#### Input parameters

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue** |No    |Text value |               |The work queue item to add the item into|
| **Work queue item data** | Yes | Datatable | | The custom data table holding work queue items to be added to the work queue |

#### Variables produced

  | Argument       | Type | Default Value | Description     |
  |----------      |------|------|-----------------|
  | **FailedWorkQueueItems** |No   | Enabled | If there are failures, this object holds the index of the item that failed to be inserted together with an error code. The index returned is the position (index) of the item in the provided work queue data table of the **Add multiple work queue items** action. |
  | **HasFailedItems** |No   | Enabled | An indicator for whether the actions encountered ingestion errors because of work queue item data issues. |
  | **SuccessfulWorkQueueItems** | Disabled | No   | A custom object holding the index and work queue items that were successfully added to the work queue. |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The value entered into the work queue parameter is invalid|
| **Work queue paused or stopped** | The work queue item couldn't be added into the work queue because the work queue is either paused or stopped. |
| **Failed to batch enqueue a list of work queue items** | The work queue items couldn't be added into the work queue because of a request or communication error. |

## Requeue item with delay

The **Requeue item with delay** action allows users to readd a queue item being processed in the desktop flow, back into its originating queue. In addition, the queued item can be held and released until a defined time.

:::image type="content" source="media\workqueues\RequeueWorkQueueItemWithDelay.png" alt-text="Screenshot of the requeue work queue item action." lightbox="media\workqueues\RequeueWorkQueueItemWithDelay.png":::

### `Requeueworkqueueitemaction`

The **Requeue item with delay** action requires the following arguments.

#### Input parameters

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Work queue item |               |The work queue item to add the item into|
| **Delay until** |No    |Datetime value| Normal |The datetime value applied to delay the queue item until|
| **Expires** | Yes | Datetime value| | Custom expiration time for the item being requeued|
| **Processing notes** | Yes | Text value, Numeric value| | Custom processing notes to be added to the new queue item|
| **Clear processing notes** | Yes | Boolean| False | When enabled, hides and clears the processing notes field on this screen and removes any processing notes from the database that have been previously captured for this item |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The value entered into the work queue parameter is invalid|
| **Work queue item not found** | The queue item value is invalid|
| **Failed to requeue work queue item** | The work queue item couldn't be added into the work queue. Bad request - error in query syntax |

## Update work queue item processing notes

The **Update work queue item processing notes** action allows users to update or clear processing notes of the selected work queue item without changing its state or any other property.

:::image type="content" source="media\workqueues\UpdateWorkQueueItemProcessingNotes.png" alt-text="Screenshot of the Update Work Queue Item Processing Notes action." lightbox="media\workqueues\UpdateWorkQueueItemProcessingNotes.png":::

### `updateprocessingnotesaction`

The **Update work queue item processing notes action** action requires the following arguments.

| Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue item** |No    |Text | |Work queue item variable that's been previously returned by the queue orchestrator|
| **Processing notes** | Yes | Text| | Custom processing result or value to append to the queue item processed |
| **Clear processing notes** | Yes | Boolean| False | When enabled, hides and clears the processing notes field on this screen and removes any processing notes from the database that were previously captured for this item |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue not found** | The work queue associated with the item has either been deleted or is no longer accessible |
| **Work queue item not found** | The work queue item is invalid|
| **Failed to append the processing results** | The work queue item being updated has encountered an unexpected error. Check the error message for more details. |

## Get work queue items by filter

The **Get work queue items by filter** action allows users to retrieve one or more work queue items based on a [FetchXML](#what-are-fetchxml-queries) filter expression.

:::image type="content" source="media\workqueues\GetWorkQueueItemsByFilter.png" alt-text="Screenshot of the Get work queue items by filter action." lightbox="media\workqueues\GetWorkQueueItemsByFilter.png":::

### `Getworkqueueitemsaction`

The **Get work queue items by filter** action requires the following arguments.

#### Input parameters

  | Argument       | Optional | Accepts | Default Value | Description     |
  |----------      |----------|---------|---------------|-----------------|
  | **Work queue** |No    |Text | |Work queue to retrieve items from |
  | **Filter rows** | No | Text| | [FetchXML](#example-fetchxml-query) query expression used to retrieve items from the work queue |
  | **Rows to return** | No | Number | 5000 | The maximum number of work queue items returned by the orchestrator |

#### Variables produced

  | Argument       | Type | Default Value | Description     |
  |----------      |------|------|-----------------|
  | **WorkQueueItems** |No   | Enabled | List of work queue items matching the filter expression. |

#### Exceptions

| Argument       | Description |
|----------------|----------|
| **Work queue** | The work queue to retrieve items from. |
| **Filter rows** | The [FetchXML](#example-fetchxml-query) query expression used to retrieve items from the work queue. |
| **Rows to return** | The maximum number of work queue items returned by the orchestrator (default is 5000). |

### What are FetchXML queries?

Microsoft Dataverse [FetchXML](/power-apps/developer/data-platform/use-fetchxml-construct-query) is a language used for retrieving data from a Dataverse database. It's designed to be easy to create, use, and understand. For example, you might want to ask Dataverse to give you a list of all work queue items that are in `IT Exception` state.

To limit the FetchXml query support to retrieving work queue items, we only support a limited set of FetchXml terms and expressions. These terms and expressions include attributes, filters, conditions, and ordering expressions, all limited to the work queue item table (workqueueitem). You must explicitly specify which properties to return from the work queue item table and the desired sort order.

### Example FetchXML query

The following example is a query expression for how to fetch several properties, filter out erroneous items marked as `IT Exceptions`, and order the results by those records expiring first (FEFO).

```xml
<attribute name="statecode" />
<attribute name="uniqueidbyqueue" />
<attribute name="createdon" />
<attribute name="completedon" />
<attribute name="workqueueitemid" />
<attribute name="executioncontext" />
<attribute name="name" />
<attribute name="expirydate" />
<attribute name="processingresult" />
<attribute name="priority" />
<attribute name="statuscode" />
<attribute name="modifiedon" />
<attribute name="processingstarttime" />
<attribute name="retrycount" />
<attribute name="requeuecount" />
<attribute name="input" />
<attribute name="delayuntil" />
<filter type="and">
    <condition attribute="statecode" operator="eq" value="4" />
    <condition attribute="statuscode" operator="eq" value="5" />
    <condition attribute="expirydate" operator="on-or-before" value="2024-10-18" />
</filter>
<order attribute="expirydate" descending="false" />
```

### Query support details and reference data

- List of [query operators](/power-apps/developer/data-platform/fetchxml/reference/operators) available for use, including operators such as on-or-before, between, and last-month.
- List of attributes available in the [work queue item](/power-apps/developer/data-platform/reference/entities/workqueueitem#writable-columnsattributes) table.

#### Status (statecode)

| Status    | Code | Description       |
|-----------|------|-------------------|
| Queued    | 0    | Item is queued    |
| Processing| 1    | Item is being processed |
| Processed | 2    | Item was processed |
| OnHold    | 3    | Item is on hold   |
| Error     | 4    | Item encountered an error |

#### Status Reason (statuscode)

| Status Reason          | Code | Description                    |
|------------------------|------|--------------------------------|
| Queued                 | 0    | Item is queued                 |
| Processing             | 1    | Item is being processed        |
| Processed              | 2    | Item was processed        |
| OnHold (Paused)        | 3    | Item is on hold (paused)       |
| GenericException       | 4    | Item encountered a generic exception |
| ITException            | 5    | Item encountered an IT exception |
| BusinessException      | 6    | Item encountered a business exception |
| DeadLetter             | 7    | Item is in on-hold   |
| ProcessingTimeout      | 8    | Item processing timed out      |

## Related information

- [Work queue overview](../work-queues.md)
- [Manage work queues](../work-queues-manage.md)
- [Bulk-import work queue data](../work-queues-bulk-import.md)
- [Trigger work queues](../work-queues-trigger.md)
- [Process work queues](../work-queues-process.md)
