---
title: Process work queues (preview)
description: Work queue processing options.

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

# Process work queues (preview)

[This article is prerelease documentation and is subject to change.]

Work queue processing refers to the management of a list of work items that need to be completed in a particular order. This list contains information about each item, such as its name, priority, expiration date, status and the actual value to be processed.

Ways to process work queues:

> [!div class="checklist"]
>
> * [Pure cloud flow and connector-based processing](#pure-cloud-flow-and-connector-based-processing).
> * [Cloud flow-based processing with desktop flow support](#cloud-flow-based-processing-with-desktop-flow-support).
> * **Coming soon**: [Desktop flow-based processing](#coming-soon-desktop-flow-based-processing) with new actions using cloud-based work queue orchestration.
> * Using Dataverse pro-developer features (for advanced integration scenarios only):
>
>   * [Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)
>   * [Dataverse SDK for .NET](/power-apps/developer/data-platform/developer-tools#dataverse-sdk-for-net)

> [!NOTE]
> Pro-developer-based work queue processing is out of scope for this article. If you want to learn more about Dataverse's pro-code tooling, you can visit and check the [**Dataverse developer documentation**](/power-apps/developer/data-platform).

## Processing walkthroughs

To showcase some of the available processing options, we're walking through three different processing scenarios.

### Pure cloud flow and connector-based processing

The simplest way to dequeue a work queue item and process it is as follows:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select **My flows**.
3. In the toolbar, select **+ New flow** and select **Instant cloud flow**.
4. Provide a **Flow name** let's say *My first work queue flow* and then select **Manually trigger a flow** option.
5. Select **Create**.
6. Once the flow designer opened, select **+ New step** and select the Microsoft Dataverse connector.
7. In the list of actions, select **Perform a bound action**.

  | Parameter | Value | Description                    |
  | --------- | ----- | ------------------------------ |
  | **Table name** | Work Queues | The name of the work queue table. |
  | **Action Name** | Dequeue | The action, which gets the next available item from the queue.|
  | **Row ID** | *[Work Queue ID]* | The work queue ID (Guid) of the queue you'd like to dequeue from. You can get to this value by navigating to the work queue details page of your queue and copying the guid from your browser URL. |
  
  :::image type="content" source="media/work-queues/work-queue-get-guid.png" alt-text="Screenshot of a work queue details page with the work queue ID highlighted in the browser URL bar." lightbox="media/work-queues/work-queue-get-guid.png":::

  > [!NOTE]
  > A bound action is a Dataverse action that is defined on a specific table (Work Queues in our example) and can only be executed on records of that table. Bound actions are used by the platform to perform custom business logic or operations on a specific record.

8. Your flow should look similar to this now.
  :::image type="content" source="media/work-queues/work-queue-dequeue-101.png" alt-text="Screenshot of a flow action that shows parameters for the dequeue action." lightbox="media/work-queues/work-queue-dequeue-101.png":::
9. Select **Save** and then **Test** your flow.
10. In the testing side-pane select **Manually**, **Test**, **Run flow** and then **Done**.
11. If the flow ran successfully, you should get a similar result (but with different IDs).
  :::image type="content" source="media/work-queues/work-queue-dequeue-return-101.png" alt-text="Screenshot of a cloud flow designer with an active and successful run including the results of a dequeue action." lightbox="media/work-queues/work-queue-dequeue-return-101.png":::
12.  Next, copy the whole JSON content from the **body** field and then select **Edit** in the upper right corner of the flow.

  > [!TIP]
  > After dequeuing a work queue item, we can use the JSON content of the item as a schema example for parsing the item's JSON properties. This allows us to easily access any property of the item returned by the work queue orchestrator in subsequent flow actions.

13.  Add a new step by selecting **+ New step** and search for an action called **Parse JSON** and select it.
  :::image type="content" source="media/work-queues/work-queue-dequeue-parsejson.png" alt-text="Screenshot of a cloud flow designer that shows the parse json action selected." lightbox="media/work-queues/work-queue-dequeue-parsejson.png":::
14.  Position your mouse in the **Content** field and select the **body** property from the previous action.
  :::image type="content" source="media/work-queues/work-queue-dequeue-jsonschema.png" alt-text="Screenshot of a cloud flow designer that shows the parse json action with a content value set to body." lightbox="media/work-queues/work-queue-dequeue-jsonschema.png":::
15.  Next, select the **Generate from sample** button and paste the previously copied JSON string into the dialog and select **Done**.
16.  Select **+ New step** and then select the **Microsoft Dataverse** connector.
17.  From the list of actions, select **Update a row**.
18.  In the Table name field, select the **Work Queue Items** table and position your cursor in the **Row ID** field.
19.  In the Dynamic content list, you'll now have all fields that are available in the work queue item table.
20.  Select **Show advanced options** and set the **RowID**, **Processing Result**, **Status** and **Status Reason** fields to the following values.
  :::image type="content" source="media/work-queues/work-queue-dequeue-update.png" alt-text="Screenshot of a cloud flow designer that shows update a row action of the Dataverse connector with work queue item values." lightbox="media/work-queues/work-queue-dequeue-update.png":::
21.  Select **Save** and **Test** the flow once more.
22. If the flow ran successfully, you should get a similar result than the following.  
  :::image type="content" source="media/work-queues/work-queue-dequeue-flow-done.png" alt-text="Screenshot of a cloud flow run that completed successfully." lightbox="media/work-queues/work-queue-dequeue-flow-done.png":::
22.  Now, navigate to the work queue details page and in the work queue item list section select **See all**.
23.  Filter the **Status** field to only show **Processing** and **Processed** items to confirm that our dequeue and update actions worked as expected.
  :::image type="content" source="media/work-queues/work-queue-dequeue-filter.png" alt-text="Screenshot of work queue items See all experience that is about to be filtered by status." lightbox="media/work-queues/work-queue-dequeue-filter.png":::
  :::image type="content" source="media/work-queues/work-queue-dequeue-filter-active.png" alt-text="Screenshot of work queue items filter experience where processing and processed filter options have been selected." lightbox="media/work-queues/work-queue-dequeue-filter-active.png":::
  :::image type="content" source="media/work-queues/work-queue-dequeue-filter-complete.png" alt-text="Screenshot of the filter results, showing two records that matched the previously set filter criteria." lightbox="media/work-queues/work-queue-dequeue-filter-complete.png":::  
24.  **Congratulations**, you just completed your first work queue processing scenario!

### Cloud flow-based processing with desktop flow support

For this scenario we'll extend the previous one by adding a desktop flow processing step as well.

1. Go back and edit the *My first work queue flow*.
2. Add a new action right after the Parse JSON action and search for **Desktop flows** connector and the **Run a flow built with Power Automate for desktop**.
3. In the Desktop flow dropdown, either choose and edit an existing desktop flow or select **+ Create a new desktop flow** and follow the instruction on screen to create the desktop flow and launch Power Automate desktop. If you're new to Desktop flows, you can learn more [here](create-flow.md).
4. Once the Power Automate desktop designer opens, create two **input** variables called **WorkQueueItemValue** and **WorkQueueItemName** and then add two **output** variables called **ProcessingNotes** and **ProcessingStatus** respectively, all of which should have **Text** as their data type.  
5. Next, let's provide a default value for the WorkQueueItem variable so that we can later test the script locally. In case you've followed the bulk-import tutorial you should have work queue items in the Vendor invoice queue that have their values in JSON format. Here's an example of one of the values we've used.

   ```json
   {
    "InvoiceId": "I-1006",
    "InvoiceDate": "06/04/2023",
    "AccountName": "Fabrikam",
    "ContactEmail": "invoicing@fabrikam.com",
    "Amount": 1253.78,
    "Status": "Paid",
    "WorkQueueKey": "Vendor Invoices",
    "ComponentState": 0,
    "OverwriteTime": "1900-01-01T00:00:00"
   }
   ```
  
   :::image type="content" source="media/work-queues/work-queue-hybrid-pad-variables.png" alt-text="Screenshot of a desktop flow designer that shows input and output actions." lightbox="media/work-queues/work-queue-hybrid-pad-variables.png":::
6. Now, save the flow.
7. In the action panel, open the **Variables** action group and double-click on the **Convert JSON to custom object** action to add it to the design canvas which will open its property window.
8. Select the variable icon in the JSON field and choose the WorkQueueItemValue variable.
9. Rename the produced output variable from **JsonAsCustomObject** to **VendorInvoice** and select **Save**.
10. Next, add an **If** from the **Conditionals** group and and configure its properties as follows:
  
    | First operand  | Operator | Second operand  |
    |----------------|----------|-----------------|
    | %VendorInvoice['Amount']% | Greater than (>) | 5000 |
11. Select **Save**.
12. Add another action from the **Conditionals** group called **Else** and add it between the **If** and **End** action.
13. Now, add another two actions from the **Variables** group called **Set variable** and add them within the **If** and **Else** actions and set the **ProcessingNotes** and **ProcessingStatus** variables to the following values:
  
    | Variable           | Value                         |
    |--------------------|-------------------------------|
    | %ProcessingNotes%  | The invoice has been processed |
    | %ProcessingStatus% | Processed |

14. Copy the two Set variable action and paste them between the Else and the End action and change their values to match these:
  
    | Variable           | Value                         |
    |--------------------|-------------------------------|
    | %ProcessingNotes%  | Business exception: The invoice amount if greate than $5000 which requires manager approval. |
    | %ProcessingStatus% | Exception |

15. Your flow should look similar to this now.
   :::image type="content" source="media/work-queues/work-queue-pad-flow-skeleton.png" alt-text="Screenshot of a desktop flow designer that shows an end-2-end flow with conditions." lightbox="media/work-queues/work-queue-pad-flow-skeleton.png":::
16. Save the flow and run it to confirm that the flow logic works as expected.
17. Next, go back to edit the *My first work queue flow*.
18. Select the newly created (or edited) desktop flow from the list and select **Attended** as its **Run Mode**.
19. Fill in the **Work Queue Item Value** and **Work Queue Item Name** parameters as shown here:
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-action.png" alt-text="Screenshot of a cloud flow designer that shows a desktop flow action pointing to the flow that has just been created or updated" lightbox="media/work-queues/work-queue-cloud-pad-action.png":::
20. Select **Save** and **Test** to tes the overall automation and observe the output from the desktop flow action.


### Coming soon. Desktop flow-based processing

> [!TIP]
> **Coming soon!**
>
> Power Automate desktop support for work queue processing is currently planned for late Q2 or early Q3 CY23. Make sure to follow our blog post for latest announcements [here](https://powerautomate.microsoft.com/blog/).

## Next steps

> [!div class="nextstepaction"]
> [Learn how to trigger work queues](work-queues-trigger.md)

## Learn more

* [Work queue overview](work-queues.md)
* [Manage work queues](work-queues-manage.md)
* [Bulk-import work queue data](work-queues-bulk-import.md)
* [Trigger work queues](work-queues-trigger.md)
* [Known issues and limitations](work-queues-known-limitations.md)
