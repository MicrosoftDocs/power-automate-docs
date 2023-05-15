---
title: Bulk-import work queue data
description: Create work queue data in bulk with Power Platform tools.

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
# Bulk-import work queue data

[This article is prerelease documentation and is subject to change.]

With Power Automate and work queues being an integral part of the Power Platform, you can easily streamline your data management processes. The suite of tools available is comprehensive, ranging from highly end-user optimized wizards to powerful cloud-based ETL services and even pro-code options. Whether you're a business user, an IT professional or a developer, you can find the right tool to create or bulk upload data with ease and efficiency.

## Comprehensive bulk-import options

Here's a comprehensive list of data management and bulk-import options you can choose from.

> [!div class="checklist"]
>
> * Using a cloud flow with the Dataverse connector action - [Add a row new action](../dataverse/create.md) to add one or more rows to the **Work Queues** and **Work Queue Items** tables.
> * Using Dataverse bulk-import options
>
>   * [Import using a connector](/power-apps/maker/data-platform/data-platform-import-export#import-using-a-connector) - Supporting data transformation with Power Query and connecting to many different sources, such as Excel, Azure, SQL Server, CSV, JSON, XML, Text, OData, and more.
>   * [Import from Excel or CSV](/power-apps/maker/data-platform/data-platform-import-export#import-from-an-excel-or-csv-file) - Supporting Excel and CSV files with data validation and visual mapping experience.
> * Using Power Platform Dataflows with its powerful cloud-based ETL services

## Adding work queue items with cloud flow and Dataverse connector

1. Go to [Power Automate](https://make.powerautomate.com/) and sign in with your credentials.
2. On the left menu, select **My flows**.
3. In the toolbar, select **+ New flow** and select **Instant cloud flow**.
4. Provide a **Flow name** and then select **Manually trigger a flow** option.
5. Select **Create**.
6. Once the flow designer opened, select **+ New step** and select the Microsoft Dataverse connector.
7. In the list of actions, select **Add a new row**.
8. The following highlighted fields, represent the minimum fields required to add items to a work queue.
  :::image type="content" source="media/work-queues/work-queue-add-item-with-connector.png" alt-text="Screenshot of a Dataverse connector action to create work queue items." lightbox="media/work-queues/work-queue-add-item-with-connector.png":::

   When using the Dataverse connector for add or update actions, it expects a certain pattern to be followed when referencing a parent record. An example of this pattern can be seen in the 'Work Queue ID (work Queues)' field, which uses the work queue ID (Guid) to reference the parent work queue for example, ```/workqueues(44e44ea8-1af2-ed11-8848-000d3ae86f97)```.

9. Select **Save** and **Test** the flow.
10. Navigate to the work queue details page of the work queue you have specific in the action and confirm that the newly created item has been added.

## Tutorial: Import a work queue and items from CSV

This tutorial showcases both mentioned [Dataverse bulk-import options](/power-apps/maker/data-platform/data-platform-import-export) for importing a work queue along with its associated work queue items, which in this example is vendor invoices.

> [!NOTE]
> While the easiest and most straight forward way to create work queues is through maker portal in Power Automate as described [**here**](work-queues-manage.md#create-a-work-queue), we've included  the work queue import steps just to demonstrate the [import from Excel or CSV](/power-apps/maker/data-platform/data-platform-import-export#import-from-an-excel-or-csv-file) approach as well.

> [!IMPORTANT]
> The CSV data in this tutorial contains internal platform columns and values for **componentstate** and **overwritetime**. These fields are mandatory platform fields and should always be included in the import mapping. Typically, these fields have default values, with the componentstate being **0** (zero) and the overwritetime having a minimum date of **01/01/1900 00:00**. These fields are part of the work queue record, which you can review in the [Power Apps maker portal](https://make.powerapps.com) under **Tables** and then search for **Work Queue**.

### Prerequisites

* Power Automate or Power Apps premium license
* Some parts of this tutorial require OneDrive for Business access

#### Phase 1/3: Create sample files

1. Create a local file called **vendor-invoice-queue.csv** and paste the following text into it:

   ```json
   defaultitemtimetoliveinminutes,description,name,prioritytype,overwritetime,componentstate,workqueuekey,workqueuetype
   1440,Vendor invoice queue with a 14 day SLA.,Vendor invoice processing,Fifo,01/01/1900 00:00,0,Vendor Invoices,Work Queue
   ```

2. Save the file.
3. Create another file called **vendor-invoice-items.csv** and paste the following rows into it:

    ```json
    InvoiceId,InvoiceDate,AccountName,ContactEmail,Amount,Status,WorkQueueKey,ComponentState,OverwriteTime
    I-1001,01/04/2023,Fabrikam,invoicing@fabrikam.com,4232.16,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1002,02/04/2023,Litware Inc.,adixon@litware.com,2455.00,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1003,03/04/2023,Proseware Inc.,lrobbins@proseware.com,7458.98,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1004,04/04/2023,Tailspin Toys,p.gupta@tailspintoys.com,5237.26,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1005,05/04/2023,WingTip Toys,b.friday@wingtiptoys.com,2230.99,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1006,06/04/2023,Fabrikam,invoicing@fabrikam.com,1253.78,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1007,07/04/2023,Proseware Inc.,lrobbins@proseware.com,3345.87,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1008,08/04/2023,Tailspin Toys,p.gupta@tailspintoys.com, 967.45 ,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1009,09/04/2023,WingTip Toys,b.friday@wingtiptoys.com,1437.75,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1010,10/04/2023,Fabrikam,invoicing@fabrikam.com,1687.43,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1011,11/04/2023,WingTip Toys,b.friday@wingtiptoys.com,2854.67,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1012,12/04/2023,Litware Inc.,adixon@litware.com,6743.12,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1013,13/04/2023,Fabrikam,invoicing@fabrikam.com,2997.12,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1014,14/04/2023,Proseware Inc.,lrobbins@proseware.com, 843.76 ,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1015,15/04/2023,Fabrikam,invoicing@fabrikam.com,1349.24,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1016,16/04/2023,Tailspin Toys,p.gupta@tailspintoys.com, 367.13 ,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1017,17/04/2023,Litware Inc.,adixon@litware.com,3984.54,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1018,18/04/2023,Fabrikam,invoicing@fabrikam.com,1943.89,Uninvoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1019,19/04/2023,Proseware Inc.,lrobbins@proseware.com,2853.39,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1020,20/04/2023,Fabrikam,invoicing@fabrikam.com,8764.14,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1021,21/04/2023,Litware Inc.,adixon@litware.com, 643.68 ,Paid,Vendor Invoices,0,01/01/1900 00:00
    I-1022,22/04/2023,Proseware Inc.,lrobbins@proseware.com,4232.16,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1023,23/04/2023,Tailspin Toys,p.gupta@tailspintoys.com,3345.87,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1024,24/04/2023,WingTip Toys,b.friday@wingtiptoys.com,3345.87,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1025,25/04/2023,Fabrikam,invoicing@fabrikam.com,3345.87,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1026,26/04/2023,Proseware Inc.,lrobbins@proseware.com,6743.12,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1027,27/04/2023,Tailspin Toys,p.gupta@tailspintoys.com,4232.16,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1028,28/04/2023,WingTip Toys,b.friday@wingtiptoys.com,6743.12,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1029,29/04/2023,Fabrikam,invoicing@fabrikam.com,4232.16,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    I-1030,30/04/2023,WingTip Toys,b.friday@wingtiptoys.com,3345.87,Invoiced,Vendor Invoices,0,01/01/1900 00:00
    ```

4. Save the file.

#### Phase 2/3: Import work queue

1. Next, navigate to <https://make.powerapps.com> and sign-in with your credentials.
2. Confirm that you're in the correct environment and select **Tables** in the side-menu.
3. Select the **All** tab.
   :::image type="content" source="media/work-queues/work-queue-import-table.png" alt-text="Screenshot of Power Apps portal showing Tables and the all tab area selected." lightbox="media/work-queues/work-queue-import-table.png":::
4. Search for **Work Queue** table and open its details page.
5. In the toolbar, select **Import** and then **Import data from Excel**.
    :::image type="content" source="media/work-queues/work-queue-import-csv.png" alt-text="Screenshot of the Work Queue table details and a selected menu entry called 'Import data from Excel'." lightbox="media/work-queues/work-queue-import-csv.png":::
6. Select **Upload** and choose the **vendor-invoice-queue.csv** file.
    :::image type="content" source="media/work-queues/work-queue-import-csv-confirm.png" alt-text="Screenshot of Excel import dialog with an upload and mapping validation option." lightbox="media/work-queues/work-queue-import-csv-confirm.png":::
7. Confirm that the automapping was successful, or if needed adjust it by selecting **Map columns**.
    :::image type="content" source="media/work-queues/work-queue-import-csv-mapping.png" alt-text="Screenshot of a field mapping dialog as part of the data import experience." lightbox="media/work-queues/work-queue-import-csv-mapping.png":::
8. Select **Import**.
9. Depending on your data volume, this might take some time to complete.
10. Once complete, navigate to the work queue list page and confirm that vendor invoice queue has been added.
    :::image type="content" source="media/work-queues/work-queue-list-page.png" alt-text="Screenshot of the work queue list page, confirming that the work queue record has been imported" lightbox="media/work-queues/work-queue-list-page.png":::

#### Phase 3/3: Import work queue items

1. Next, navigate to <https://make.powerapps.com> and sign-in with your credentials.
2. Confirm that you're still in the correct environment and select **Tables** in the side-menu.
3. Select the **All** tab.
4. Search for **Work Queue Item** table and open its details page.
5. In the toolbar, select **Import** and then **Import data**.
6. In the **Power Query** dialog that opens, select the **Text/CSV** option.
   :::image type="content" source="media/work-queues/work-queue-import-powerquery.png" alt-text="Screenshot of Power Apps portal showing Power Query dialog." lightbox="media/work-queues/work-queue-import-powerquery.png":::
7. Next, select **Upload file (Preview)** and then **Browse...** for the **vendor-invoice-items.csv** file.
    :::image type="content" source="media/work-queues/work-queue-import-powerquery-connect-csv.png" alt-text="Screenshot of Power Apps portal showing Power Query dialog to upload a text or csv file." lightbox="media/work-queues/work-queue-import-powerquery-connect-csv.png":::
8. If needed, establish a connection to your OneDrive for Business folder.
    :::image type="content" source="media/work-queues/work-queue-import-workqueue-file.png" alt-text="Screenshot of Power Query dialog with an upload confirmation for the vendor invoice work queue csv file." lightbox="media/work-queues/work-queue-import-workqueue-file.png":::
9. Select **Next** and confirm that you see the work queue item records and that **Comma** is selected as delimiter.
    :::image type="content" source="media/work-queues/work-queue-import-workqueue-file-preview.png" alt-text="Screenshot of Power Query preview file data dialog showing the list of work queue items included in the source file." lightbox="media/work-queues/work-queue-import-workqueue-file-preview.png":::
10. Select **Next**.

  > [!NOTE]
  > The next few steps are not required if all you want to do is import basic, already formatted values into the work queue items table. However, if you're looking to reshape the source data before you import it, then the following Power Query transformations might come in handy for your future use-cases.

11. In the Power Query transformation window, select the **Add column** tab on the ribbon toolbar and then select **Custom column**.
    :::image type="content" source="media/work-queues/work-queue-powerquery-transformation.png" alt-text="Screenshot of Power Query transformation window with instruction on how to add a new column to a table." lightbox="media/work-queues/work-queue-powerquery-transformation.png":::
12. In the Custom column dialog box, enter **Input** as the new column name and **Text.FromBinary(Json.FromValue(_))** in the custom column formula field.
    :::image type="content" source="media/work-queues/work-queue-powerquery-formula.png" alt-text="Screenshot of a custom column dialog expecting name and the following formula input: Text.FromBinary(Json.FromValue(_))." lightbox="media/work-queues/work-queue-powerquery-formula.png":::

    Here's what the formula does:
    * **Json.FromValue(_)**: This part of the expression takes the input value (that is, a row of the table) and converts it into a JSON-formatted text.
    * **Text.FromBinary()**: This part of the expression takes the JSON-formatted text and converts it into binary format. This step is primarily used  for optimizing data storage or transmission.
  
    By using both of these functions together, the expression can turn each row of the table into a JSON object and store the resulting JSON object in a new column called "Input". This process is repeated for each row of the table.

13. Select **Ok**.
14. Select **Next**.
15. Select **Next** and then **Publish**.
16. Navigate to <https://make.powerapps.com> and select Dataflows from the left-menu (you might have to select **More** first to get to the Dataflows menu).
17. Confirm that you see a new dataflow entry and that both icons show green once the import is complete.
    :::image type="content" source="media/work-queues/work-queue-import-inprogress.png" alt-text="Screenshot of the Dataflows list showing dataflows that are complete and still refreshing." lightbox="media/work-queues/work-queue-import-inprogress.png":::
18. Once complete, navigate to the work queue details page of the vendor invoice queue and confirm that the work queue items have been added.
    :::image type="content" source="media/work-queues/work-queue-details-after-import.png" alt-text="Screenshot of the work queue list page showing the newly created work queue record." lightbox="media/work-queues/work-queue-details-after-import.png":::

## Next steps

> [!div class="nextstepaction"]
> [Learn how to process work queues](work-queues-process.md)

## Learn more

* [Work queue overview](work-queues.md)
* [Manage work queues](work-queues-manage.md)
* [Trigger work queues](work-queues-trigger.md)
* [Process work queues](work-queues-process.md)
* [Known issues and limitations](work-queues-known-limitations.md)
