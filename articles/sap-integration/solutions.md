---
title: Understand prebuilt solution available for integrating SAP with Power Platform (preview)
description: Learn about the SAP Integration solution available to import into Power Apps.
services: 
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - skakeholder
  - enduser
---

# Understand prebuilt solution available for integrating SAP with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

Connecting your SAP system to the Power Platform will extend its functionality and allow you to get more value out of your investment.

The public preview prebuilt SAP Integration solution is available for download. It incorporates Power Apps, Power Automate flows, and additional new functionalities that facilitate communication between your organization's SAP system with the Power Platform.

The Power Apps custom, model-driven app runs in your browser and streamline SAP screens and data attributes onto one simple screen. In the template apps, users will be able complete tasks faster. Behind the scenes, Power Automate flows automate the business rules ensuring better data accuracy.

## What does the user interface look like?

On the surface, you will see a custom, model-driven app that runs in your browser.

Here is the Purchase Orders template in the Purchasing module
    :::image type="content" source="media/prebuilt-solution/purchase-orders.png" alt-text="Power App display of sales order page that is part of the sales module.":::

## How is it organized?

All of the screens and data attributes from SAP are streamlined onto one screen in Power Apps.

The four key business processes in SAP ERP, Order to Cash, Procure to Pay, Record to Report, and Make to Stock/Order, are organized into modules that contain accessible Power Apps templates. The templates enable users to perform standard workflow functions such as Search, Create, Change, or Display.

For public preview, the main focus will be testing the Order to Cash and Procure to Pay business processes.

### Order to Cash

|Module | Power Apps templates |
|--------|----------------------|
| Sales  |                      |
|        | Quotes               |
|        | Sales Orders         |
|        | Deliveries           |
|        | Customer Invoices    |
|        | Customer Payments    |
|        | Mass Update Pricing  |
||

### Procure to Pay

| Module     | Power Apps templates |
|------------|----------------------|
| Purchasing |                      |
|            | Requisitions         |
|            | Purchase Orders      |
|            | Goods Receipts       |
|            | Vendor Invoices      |
|            | Vendor Payments      |
||

### Record to Report

| Module  | Power Apps templates   |
|---------|------------------------|
| Finance |                        |
|         | Cash Application       |
|         | GL Accounts            |
|         | Cost Centers           |
|         | Profit Centers         |
|         | Upload Journal Entries |
||

### Make to Stock/Make to Order

| Module     | Power Apps templates |
|------------|----------------------|
| Production |                      |
|            | Materials            |
|            | Goods Movement       |
|            | Equipment            |
|            | Work Orders          |
|            | Shipments            |
||

## What is it comprised of?

When you look the app behind the scenes, you see that the prebuilt solution is made up of sets of components, which include apps, cloud flows, connection references, environment variables, tables and other technical features that work together to communicate with your SAP system, automate your processes, and offer an accessible, streamlined view of your data.

  :::image type="content" source="media/prebuilt-solution/powerapps-nav.png" alt-text="Power App navigation where one can select Apps, Flows, and Solutions.":::
 After importing the solution into Power Apps, look to the left navigational panel to view all of its different components.

- Select **Flows** to view the list of included flows.
- Select **Apps** to view the list of included apps.
- Select **Solutions** > **SAP Integration** to view its complete objects list.

The following Power Apps and Power Automate flows are listed with short descriptions for your reference.  

### Power Apps

| App name | Description |
|------------------|---------------------|
| Sales Orders | Documents issued by a business to customers; SO data uploaded and retained in SAP contributes to the order-to-cash process |
| Purchase Orders | Documents sent from purchasers to vendors to confirm specific purchases of goods or services; PO data uploaded and retained in SAP contributes to the procurement process  
| Sales Order Search | Enables search through SAP sales order master to find a specific sales order or to filter for specific set of sales orders that meet defined criteria |
| Vendor Search | Enables search through SAP vendor master to find a specific vendor or to filter for a specific set of vendors that meet defined criteria |
| Profit Center Search | Enables search through SAP profit center master to find a specific activity, group, document, or other profit center object or to filter for a specific set of profit center objects that meet defined criteria |
| Materials Search  | Enables search through SAP materials master to find a specific sales order or to filter for specific set of materials that meet defined criteria|
| SAP User Search| Enables the search for SAP users and their IDs |
| GL Account Search | Enables the search through SAP general ledger master data |
| Cost Center Search | Enables search through SAP cost center master to find a specific activity, group, document, or other cost center object or to filter for a specific set of cost center objects that meet defined criteria |
| Purchase Order Search | Enables search through SAP purchase order master to find a specific purchase order or to filter for specific set of purchase orders that meet defined criteria |
| Customer Search | Enables search through SAP customer master to find a specific customer or to filter for a specific set of customers that meet defined criteria|
| Header and Menu Components | Reusable UI component used to construct dropdown lists |
| Common Components | Components that construct common tables and fields for the organization of specific types of data |
| Attachments Component | Reusable UI component used to attach more files to Purchase Orders and Sales Orders |
||

### Power Automate flows

| Cloud flow name | Description |
|-----------|-------------------|
| CreateAttachment | Attaches file to sales order or purchase order |
| CreatePurchaseOrder | Captures and processes purchase order data |
| CreateSalesOrder | Captures and processes sales order data |
| DeleteAttachment | Removes file from sales order or purchase order |
| ReadAttachmentList| Reads data from an attachment list |
| ReadCostCenterList| Reads data from a cost center list |
| ReadCustomer| Reads customer data |
| ReadCustomerList | Reads data from a customer list |
| ReadGLAccountList | Reads data from a GL account list |
| ReadMaterial | Reads material data |
| ReadMaterialList | Reads data from a material list |
| ReadProfitCenterList | Reads data from a profit center list |
| ReadPurchaseOrder | Reads purchase order data|
| ReadPurchaseOrderList | Reads data from a purchase order list |
| ReadSalesOrder | Reads sales order data |
| ReadSalesOrderList | Reads data from a sales order list|
| ReadSAPUserList | Reads data from a SAP user list |
| ReadVendor | Reads vendor data |
| ReadVendorList | Reads data from a vendor list |
| UpdatePurchaseOrder | Updates purchase order data|
| UpdateSalesOrder | Updates sales order data |
||

## How do I access the user interface?

After ensuring that the systems are configured to communicate with one another and you have taken a short tour of the imported solution, you are ready to open an app that acts as a user interface and test it.

- Select **Apps**
- Select **Purchase Orders** or **Sales Orders** 
- Click the ***more options*** icon
- Select **Play**

:::image type="content" source="media/prebuilt-solution/play-app-2.png" alt-text="Power App display of the Play button that opens up the application to the user experience.":::

Now, you should see the user's view. If the initial set up is complete, you are ready to test out the communication between your SAP system and the Power Platform.
:::image type="content" source="media/prebuilt-solution/order-to-cash.png" alt-text="Power App Order to Cash screen.":::

## Next steps

[Set up SAP integration with Power Platform (preview)](set-up-prepare.md)

### See also

- [Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
