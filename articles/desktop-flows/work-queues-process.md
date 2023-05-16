---
title: Process work queues
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

Work queue processing refers to the management of a list of work items that need to be completed in a particular order. This list contains information about each item, such as its name, priority, expiration date, status, and the actual value to be processed.

> [!IMPORTANT]
> This is a preview feature.

Ways to process work queues:

> [!div class="checklist"]
>
> * [Pure cloud flow and connector-based processing](#pure-cloud-flow-and-connector-based-processing).
> * [Cloud flow-based processing with desktop flow support](#cloud-flow-based-processing-with-desktop-flow-support).
> * Using Dataverse pro-developer features (for advanced integration scenarios only):
>
>   * [Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)
>   * [Dataverse SDK for .NET](/power-apps/developer/data-platform/developer-tools#dataverse-sdk-for-net)

Learn more about Dataverse's pro-code tooling: [**Dataverse developer documentation**](/power-apps/developer/data-platform).

## Processing walkthroughs

To showcase some of the available processing options, here are three different processing scenarios.

### Pure cloud flow and connector-based processing

The simplest way to dequeue a work queue item and process it is as follows:

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select **My flows**.
3. On the toolbar, select **+ New flow** and then select **Instant cloud flow**.
4. Provide a **Flow name**, such as *My first work queue flow*, and then select **Manually trigger a flow**.
5. Select **Create**.
6. Once the flow designer opens, select **+ New step** and then select the Microsoft Dataverse connector.
7. In the list of actions, select **Perform a bound action**.

  | Parameter | Value | Description                    |
  | --------- | ----- | ------------------------------ |
  | **Table name** | Work Queues | The name of the work queue table. |
  | **Action name** | Dequeue | The action, which gets the next available item from the queue.|
  | **Row ID** | *[Work Queue ID]* | The work queue ID (GUID) of the queue you'd like to dequeue from. You can get to this value by navigating to the work queue details page of your queue and copying the GUID from your browser URL. |
  
  :::image type="content" source="media/work-queues/work-queue-get-guid.png" alt-text="Screenshot of a work queue details page with the work queue ID highlighted in the browser URL bar." lightbox="media/work-queues/work-queue-get-guid.png":::

  > [!NOTE]
  > A bound action is a Dataverse action that is defined on a specific table (work queues in our example) and can only be executed on records of that table. Bound actions are used by the platform to perform custom business logic or operations on a specific record.

8. Your flow should look similar to this now.
  :::image type="content" source="media/work-queues/work-queue-dequeue-101.png" alt-text="Screenshot of a flow action that shows parameters for the dequeue action." lightbox="media/work-queues/work-queue-dequeue-101.png":::
9. Select **Save** and then **Test** your flow.
10. In the testing side-pane select **Manually**, **Test**, **Run flow** and then **Done**.
11. If the flow ran successfully, you should get a similar result (but with different IDs).
  :::image type="content" source="media/work-queues/work-queue-dequeue-return-101.png" alt-text="Screenshot of a cloud flow designer with an active and successful run including the results of a dequeue action." lightbox="media/work-queues/work-queue-dequeue-return-101.png":::
12.  Next, copy the whole JSON content from the **body** field and then select **Edit** in the upper right corner of the flow.

  > [!TIP]
  > After dequeuing a work queue item, use the JSON content of the item as a schema example for parsing the item's JSON properties. This allows you to easily access any property of the item returned by the work queue orchestrator in subsequent flow actions.

13.  Add a new step by selecting **+ New step** and search for an action called **Parse JSON** and select it.
  :::image type="content" source="media/work-queues/work-queue-dequeue-parsejson.png" alt-text="Screenshot of a cloud flow designer that shows the parse json action selected." lightbox="media/work-queues/work-queue-dequeue-parsejson.png":::
14.  Position your mouse in the **Content** field and select the **body** property from the previous action.
  :::image type="content" source="media/work-queues/work-queue-dequeue-jsonschema.png" alt-text="Screenshot of a cloud flow designer that shows the parse json action with a content value set to body." lightbox="media/work-queues/work-queue-dequeue-jsonschema.png":::
15.  Next, select the **Generate from sample** button and paste the previously copied JSON string into the dialog and select **Done**.
16.  Select **+ New step** and then select the **Microsoft Dataverse** connector.
17.  From the list of actions, select **Update a row**.
18.  In the **Table name** field, select the **Work Queue Items** table and position your cursor in the **Row ID** field.
19.  In the **Dynamic content** list, you'll now have all fields that are available in the work queue item table.
20.  Select **Show advanced options** and then set the **RowID**, **Processing Result**, **Status**, and **Status Reason** fields to the following values.
  
  | Field | Value | Details                    |
  | --------- | ----- | ------------------------------ |
  | **Row ID** | workqueueitemid | This values can be selected in the dynamic content list dialog. |
  | **Processing Result** | The item has been successfully processed. | |
  | **Status** | Processed | |
  | **Status Reason** | Processed | |
  
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

For this scenario, we extend the previous one by adding a desktop flow processing step as well.

1. Go back and edit the *My first work queue flow*.
2. Add a new action right after the **Parse JSON** action and search for **Desktop flows** connector and the **Run a flow built with Power Automate for desktop**.
3. In the Desktop flow dropdown, either choose and edit an existing desktop flow or select **+ Create a new desktop flow** and follow the instruction on screen to create the desktop flow and launch Power Automate desktop. If you're new to Desktop flows, you can learn more [here](create-flow.md).
4. Once the Power Automate desktop designer opens, create two **input** variables called **WorkQueueItemValue** and **WorkQueueItemName** and then add two **output** variables called **ProcessingNotes** and **ProcessingStatus** respectively, all of which should have **Text** as their data type.  
5. Let's also provide a default value for the **WorkQueueItem** variable so that we can later test the script locally. In case you've followed the [bulk-import tutorial](work-queues-bulk-import.md#tutorial-import-a-work-queue-and-items-from-csv) you should have work queue items in the Vendor invoice queue that have their values in JSON format. Here's an example of one of the values we've used.

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
6. Now, **Save** the flow.
7. In the action panel, open the **Variables** action group and double-click on the **Convert JSON to custom object** action to add it to the design canvas, which will open its property window.
8. Select the variable icon in the JSON field and choose the WorkQueueItemValue variable.
9. Rename the produced output variable from **JsonAsCustomObject** to **VendorInvoice** and select **Save**.
10. Next, add an **If** action from the **Conditionals** group and configure its properties as follows:
  
    | First operand  | Operator | Second operand  |
    |----------------|----------|-----------------|
    | %VendorInvoice['Amount']% | Less than (<) | 5000 |
11. Select **Save**.
12. Add another action from the **Conditionals** group called **Else** and add it between the **If** and **End** action.
13. Now, add another two actions from the **Variables** group called **Set variable** and add them within the **If** and **Else** actions and set the **ProcessingNotes** and **ProcessingStatus** variables to the following values:
  
    | Variable           | Value                         |
    |--------------------|-------------------------------|
    | %ProcessingNotes%  | The invoice has been processed |
    | %ProcessingStatus% | Processed |

14. Copy the two **Set variable** action and paste them between the **Else** and the **End** action and change their values to match these:
  
    | Variable           | Value                         |
    |--------------------|-------------------------------|
    | %ProcessingNotes%  | Business exception: The invoice amount is greater than $5000, which requires manager approval. |
    | %ProcessingStatus% | Exception |

15. Your flow should look similar to this now.
   :::image type="content" source="media/work-queues/work-queue-pad-flow-skeleton.png" alt-text="Screenshot of a desktop flow designer that shows an end-2-end flow with conditions." lightbox="media/work-queues/work-queue-pad-flow-skeleton.png":::
16. **Save** the flow and run it to confirm that the flow logic works as expected.
17. Next, go back to edit the *My first work queue flow*.
18. Select the newly created (or edited) desktop flow from the list and select **Attended** as its **Run Mode**.
19. Fill in the **Work Queue Item Value** and **Work Queue Item Name** parameters as shown here:
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-action.png" alt-text="Screenshot of a cloud flow designer that shows a desktop flow action pointing to the flow that has just been created or updated" lightbox="media/work-queues/work-queue-cloud-pad-action.png":::
20. Great, let's add a **Condition** action before the **Update a row** action.
21. Position your mouse in the **Choose a value** field and select **Processing Status** from the dynamic content list dialog.
22. Now, position your mouse in the other **Choose a value** field and enter **Processed** as the text value.
23. Next, drag & drop the **Update a row** action into the green **If yes** section of the condition action.
24. Open the Update a row action details and replace the values to match the following:
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-processed.png" alt-text="Screenshot of a cloud flow designer that shows an update a row action with values." lightbox="media/work-queues/work-queue-cloud-pad-processed.png":::
26. In the red **If no** box, add another **Update a row** action and select **Work Queue Items** as the **Table name**.
27. Next, select **workqueueitemid** as **Row ID** and open **Show advanced options** section select **Processing Notes** as the **Processing Results** value.
28. Select **Error** as **Status** and **GenericException** for **Status Reason**.  
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-error.png" alt-text="Screenshot of a cloud flow designer that shows a successful run." lightbox="media/work-queues/work-queue-cloud-pad-error.png":::
29. Select **Save** and **Test** to test the overall automation and observe the output from the desktop flow action.
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-error.png" alt-text="Screenshot of a cloud flow designer that shows a successful run." lightbox="media/work-queues/work-queue-cloud-pad-action-final.png":::
30. To confirm that the work queue item has been processed you can go to the work queue details page, select **See all** in the work queue items section and filter the items by **Processed** status.
   :::image type="content" source="media/work-queues/work-queue-cloud-pad-action-confirm.png" alt-text="Screenshot of a work queue item list page that is filtered to only show processed items." lightbox="media/work-queues/work-queue-cloud-pad-action-confirm.png":::

**Well done**, you just completed a more advanced scenario that included hybrid work queue processing!

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
