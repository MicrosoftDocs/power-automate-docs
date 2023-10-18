---
title: Connect to other environments using the Microsoft Dataverse connector | Microsoft Docs
description: Learn how to use the Microsoft Dataverse connector for actions and triggers across Power Platform environments.
services: ''
suite: flow
documentationcenter: na
author: matow
ms.author: matow
ms.reviewer: angieandrews
editor: ''
tags: ''

ms.devlang: na
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/06/2023
search.audienceType: 
  - maker
---

# Connect to other environments using the Microsoft Dataverse connector

You can use the Microsoft Dataverse connector to automate and respond to activity from apps and data in other Power Platform environments through the actions and triggers that support the Environment parameter.

[!IMPORTANT]
The updated actions and triggers with the Environment parameter are rolling out as a public preview to all [Power Platform regions](/power-automate/regions-overview) by the end of October 2023.

### Add an action that connects to another environment

1. Sign in to Power Automate at https://make.powerautomate.com 
2. Create a new cloud flow such as an instant flow with the **Manually trigger a flow** trigger, or open an existing flow.
3. In the flow designer, click the plus sign to add a new action.
4. Search for **Dataverse** and click **See more** on the Microsoft Dataverse connector to see all available actions. 
   * If the Microsoft Dataverse connector is not shown, switch to another environment that has Dataverse as a data store using the Environments selector at the top right of the page.
5. Add one of actions that end in **selected environment (preview)**, such as **List rows from selected environment (preview)**.
6. Use the Environment parameter in the action card to choose the environment to connect to. 
   * The connection you use for the action must have permissions to perform the operation in the other environment. 
   * To connect to Dataverse in the same environment as the flow, select **(Current)** in the Environment parameter.

### Which actions and triggers can connect to other environments?
The following actions support connecting to other environments.

* Add a new row to selected environment (preview)
* Update a row from selected environment (preview)
* Delete a row from selected environment (preview)
* List rows from selected environment (preview)
* Get a row by ID from selected environment (preview)
* Perform a bound action in selected environment (preview)
* Perform an unbound action in selected environment (preview)
* Relate rows in selected environment (preview)
* Unrelate rows in selected environment (preview)
* Upload a file or image to selected environment (preview)
* Download a file or image from selected environment (preview)

The actions to **Search rows** and **Perform a changeset** request do not yet have preview actions with the Environment parameter.

The following triggers will support connecting connecting to other environments but have not yet been released: 

* When a row is added, modified or deleted
* When an action is performed

The following triggers will not support the Environment parameter since they are only applicable to the same environment the flow is located in. 
* When a flow step is run from a business process flow
* When a row is selected

### What is supported by the Environment parameter in the preview actions and triggers?
* Connect to other environments in the same tenant as the connection used with the action or trigger.
* Connect to environments in other tenants when using a connection to another tenant.
  * To restrict connections to other tenants from the Microsoft Dataverse connector and other connectors, you can configure [Power Platform tenant isolation policies](/power-platform/admin/cross-tenant-restrictions).
* Specify the environment dynamically 
  * To set the Environment parameter manually, select **Enter custom value** at the end of the Environment parameter selector and provide the root URL of a Power Platform environment in the format **https://\<yourenvironmentid\>.crm.dynamics.com/**. 
  * The environment can be provided as a string, expression, environment variable, or as dynamic content from other actions or triggers in the flow.
  * To get the root URL of an environment, you can open the details page of the environment from the [Power Platform Admin Center](https://admin.powerplatform.com), or use the output of the **List user environments** action in the [Power Automate Management] connector](/connectors/flowmanagement/).
  * For actions like **Add a row** that depend on the table schema from a specific environment, the schema will not be automatically retrieved when using an expression, dynamic content, or environment variable. The request must be manually created using the LogicalCollectionName of the table and the body for the request in JSON format similar to a [Dataverse Web API request](/power-apps/developer/data-platform/webapi/create-entity-web-api). For example, **accounts** and  **{ "name": "Contoso Marketing" }**.
  * Service principal connections can be used to connect to other environments. 

### Limitations
* The triggers **When a row is added, modified or deleted** and **When an action is performed** do not yet support the Environment parameter. 
* The actions to **Search rows** and **Perform a changeset** request do not yet have preview actions with the Environment parameter. 
* Using instant flows with the Dataverse connection set to **Provided by run-only user** is not yet supported.