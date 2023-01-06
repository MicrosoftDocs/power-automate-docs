---
title: Understand prebuilt solution available for integrating SAP with Power Platform (preview)
description: Learn about the prebuilt SAP Integration solution available to import into Power Apps
author: jongilman88
contributors: 
- EllenWehrle
- galitskyd
- microsoft-dustin
- ryanb58
- scottwoodallmsft
- Wrighttyler
ms.author: jongilman
ms.reviewer: ellenwehrle
ms.subservice: power-automate-connections
ms.topic: conceptual
ms.date: 11/01/2022


---

# Understand prebuilt solution available for integrating SAP with Power Platform (preview)

[This article is prerelease documentation and is subject to change.]

Connecting your SAP system to Microsoft Power Platform will extend its functionality and allow you to get more value out of your investment.

The preview version of the prebuilt SAP integration solution is [available for download](https://github.com/jongilman88/PowerPlatformSAPIntegration). It incorporates Power Apps, Power Automate flows, and additional new functionalities that facilitate communication between your organization's SAP system with Power Platform.

The canvas app runs in your browser and streamlines SAP screens and data attributes onto one simple screen that helps users complete tasks faster. Behind the scenes, Power Automate flows automate the business rules ensuring better data accuracy.

## What does the user interface look like?

On the surface, you'll see a canvas app that runs in your browser.

Here is the Purchase Orders template in the Purchasing module:

:::image type="content" source="media/prebuilt-solution/purchase-orders.png" alt-text="Power App display of purchase order page that is part of the purchasing module.":::

## How is it organized?

All of the screens and data attributes from SAP are streamlined onto one screen in the app.

Four key business processes in SAP ERP are organized into modules that contain accessible Power Apps templates. The templates enable users to perform standard workflow functions such as Search, Create, Change, or Display.

> [!IMPORTANT]
> In preview, the focus is on testing the Order to Cash and Procure to Pay business processes.

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

### Procure to Pay

| Module     | Power Apps templates |
|------------|----------------------|
| Purchasing |                      |
|            | Requisitions         |
|            | Purchase Orders      |
|            | Goods Receipts       |
|            | Vendor Invoices      |
|            | Vendor Payments      |

### Record to Report

| Module  | Power Apps templates   |
|---------|------------------------|
| Finance |                        |
|         | Cash Application       |
|         | GL Accounts            |
|         | Cost Centers           |
|         | Profit Centers         |
|         | Upload Journal Entries |

### Make to Stock/Make to Order

| Module     | Power Apps templates |
|------------|----------------------|
| Production |                      |
|            | Materials            |
|            | Goods Movement       |
|            | Equipment            |
|            | Work Orders          |
|            | Shipments            |

## What does the solution contain?

When you look the app behind the scenes, you see that the prebuilt solution is made up of sets of components that include:

- Apps
- Cloud flows
- Connection references
- Environment variables
- Tables
- Technical features

These sets of components work together to communicate with your SAP system, automate your processes, and offer an accessible, streamlined view of your data.

After importing the prebuilt solution into Power Apps, look to the left-side navigation panel to view all of its different components.

  :::image type="content" source="media/prebuilt-solution/powerapps-nav.png" alt-text="Power App navigation where one can select Apps, Flows, and Solutions.":::

- Select **Flows** to view the list of included flows.
- Select **Apps** to view the list of included apps.
- Select **Solutions** > **SAP Integration** to view its complete objects list.

The following apps and flows are listed with short descriptions for your reference.  

### Apps in Power Apps

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

## How do I access the user interface?

After the systems are configured to communicate with one another and you explore the internal components of the imported solution, you are ready to open an app that acts as a user interface and test it.

1. Select **Apps**.
1. Select **Purchase Orders** or **Sales Orders**.
1. Select the **more options** icon.
1. Select **Play**.

    :::image type="content" source="media/prebuilt-solution/play-app-2.png" alt-text="Power App display of the Play button that opens the application to the user experience.":::

    Now, you should see the user's view. If the initial setup is complete, you are ready to test the communication between your SAP system and Power Platform.

    :::image type="content" source="media/prebuilt-solution/order-to-cash.png" alt-text="Power App Order to Cash screen.":::

### See also

- [Create an environment variable with SAP connection parameters (preview)](env-variables-connection-refs.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
