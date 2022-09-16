---
title: Understand prebuilt solution available for integrating SAP with Power Platform (preview)
description: Learn about the different solutions available for SAP integration with Power Platform.
services: ''
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

SAP ERP is a complex business system that maintains data and manages business processes. It is relied upon by many businesses around the world and requires specialized knowledge—not just to design and implement—but to use. Integrating with such a complex business system has posed many challenges for business that want to integrate its data with other systems to extend its capabilities.

The prebuilt SAP Integration solution establishes an easier way to connect your SAP system to the Power Platform and its prebuilt Power Apps and Power Automate flows can work immediately with the core SAP ERP workflows that most businesses utilize.

## What's included

The public preview prebuilt solution is comprised of a set of components, which includes apps, cloud flows, connection references, environment variables, tables and other technical features that work together to communicate with your SAP system, automate your processes, and offer an accessible, streamlined view of your data.

 After importing the solution into Power Apps, look to the left navigational panel to view all of the different components.

- Click on **Apps** to view the list of included apps
- Click on **flows** to view the list of included flows.
- Click on **Solutions** > **SAP Integration** to view its complete objects list.

Lists of the apps and cloud flows with short descriptions are provided here for reference.

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
| Attachments Component | Reusable UI component used to attach additional files to Purchase Orders and Sales Orders |
||

## Power Automate flows

| Cloud flow name | Description |
|-----------|-------------------|
| CreateAttachment | Action attaches file to sales order or purchase order |
| CreatePurchaseOrder | Action captures and processes purchase order data |
| CreateSalesOrder | Action captures and processes sales order data |
| DeleteAttachment | Action removes file from sales order or purchase order |
| ReadAttachmentList| Action reads data from an attachment list |
| ReadCostCenterList| Action reads data from a cost center list |
| ReadCustomer| Action reads customer data |
| ReadCustomerList | Action reads data from a customer list |
| ReadGLAccountList | Action reads data from a GL account list |
| ReadMaterial | Action reads material data |
| ReadMaterialList | Action reads data from a material list |
| ReadProfitCenterList | Action reads data from a profit center list |
| ReadPurchaseOrder | Action reads purchase order data|
| ReadPurchaseOrderList | Action reads data from a purchase order list |
| ReadSalesOrder | Action reads sales order data |
| ReadSalesOrderList | Action reads data from a sales order list|
| ReadSAPUserList | Action reads data from a SAP user list |
| ReadVendor | Action reads vendor data |
| ReadVendorList | Action reads data from a vendor list |
| UpdatePurchaseOrder | Action updates purchase order data|
| UpdateSalesOrder | Action updates sales order data |
| |

## What does the SAP Integration look like?

Select either the **Sales Orders** or **Purchase Orders** app to open.

## Next steps

- [Prepare and set up SAP integration with Power Platform (preview)](set-up-prepare.md)

### See also

- [Configure action screens and verify the SAP integration (preview)](action-screen.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
