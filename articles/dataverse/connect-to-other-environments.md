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

You can automate apps, data, and processes across Power Platform environments through supported actions and triggers in the Microsoft Dataverse connector. 


Previously, the Microsoft Dataverse connector supported the flow's current environment, and the Dynamic 365 (deprecated) and Microsoft Dataverse (legacy) connectors were the available ways to connect to Dataverse in other environments from cloud flows. With the addition of the Environment parameter, the Microsoft Dataverse connector's triggers and action have the same flexibility of connecting to either the flow's current environment or choosing another. 

During the preview of this capability, separate actions and triggers with names ending in **selected environment (preview)** will be available to add to both new and existing flows. After the preview, Dataverse connector actions in existing flows will be automatically updated to include the Environment parameters. There's no action needed from flow owners or changes to existing flow behavior as part of this update.

[!IMPORTANT] The updated actions and triggers with the Environment parameter are rolling out as a public preview to all [Power Platform regions](/power-automate/regions-overview) by the end of October 2023.

![A diagram of a Power Automate cloud flow being triggered when a row changes in the Contoso Support environment, and taking actions in other Contoso Services and Contoso Field Service environments to List rows, Add a row, and Perform an action in the example Contoso Corporation Microsoft Entra tenant.. ](<Connecting to other environments-1.png>)

### How to add actions that connect to other environments

1. Sign in to Power Automate at https://make.powerautomate.com 
2. Create a new cloud flow such as an instant flow with the **Manually trigger a flow** trigger, or open an existing flow.
3. In the flow designer, click the plus sign to add a new action.
4. Search for **Dataverse** and click **See more** on the Microsoft Dataverse connector to see all available actions.
![A screenshot of the Microsoft Dataverse connector actions including the new actions for Add a new row to selected environment (preview) and Delete a row from selected environment (preview).](<Cross env - add a preview action.png>)
1. Add one of actions that end in **selected environment (preview)**, such as **List rows from selected environment (preview)**.
2. Use the Environment parameter in the action card to choose the environment to connect to. The connection you use for the action must have permissions to perform the operation in the other environment. 
3. To connect to Dataverse in the same environment as the flow, select **(Current)** in the Environment parameter.
![A screenshot showing the Environment parameter set to "(Current)" to connect to the current environment.](<Cross environment - current environment-1.png>)


### Which actions and triggers can connect to other environments?
The below Microsoft Dataverse connector actions support connecting to other environments. In the flow designer, the preview actions with the environment parameter have names ending in **selected environment (preview)** for each of the below actions.

* [Add a new row](/power-automate/dataverse/create)
* [Update a row](/power-automate/dataverse/update)
* [Delete a row](/power-automate/dataverse/delete-row)
* [List rows](/power-automate/dataverse/list-rows)
* [Get a row by ID](/power-automate/dataverse/get-row-id)
* [Perform a bound action](/power-automate/dataverse/bound-unbound)
* [Perform an unbound action](/power-automate/dataverse/bound-unbound)
* [Relate rows](/power-automate/dataverse/relate-unrelate-rows)
* [Unrelate rows](/power-automate/dataverse/relate-unrelate-rows)
* [Upload a file or image](/power-automate/dataverse/upload-download-file)
* [Download a file or image](/power-automate/dataverse/upload-download-file)

The actions to [Search rows](/power-automate/dataverse/search) and [Perform a changeset request](/power-automate/dataverse/change-set) don't yet have preview actions with the Environment parameter.

The following triggers will support connecting to other environments but have not yet been released: 

* [When a row is added, modified or deleted](/power-automate/dataverse/create-update-delete-trigger)
* [When an action is performed](/power-automate/dataverse/action-trigger)

The following triggers will not support the Environment parameter since they're only applicable to the same environment the flow is located in. 
* When a flow step is run from a business process flow
* [When a row is selected](/power-automate/connection-cds#initiate-a-cloud-flow-from-dataverse)

### What is supported by the Environment parameter in the preview actions and triggers?
* Connect to other environments in the same tenant as the connection used with the action or trigger.
* Connect to environments in other tenants when using a connection to another tenant.
  * To restrict connections to other tenants from the Microsoft Dataverse connector and other connectors, you can configure [Power Platform tenant isolation policies](/power-platform/admin/cross-tenant-restrictions).
* Specify the environment dynamically 
  * To set the Environment parameter manually, select **Enter custom value** at the end of the Environment parameter selector and provide the root URL of a Power Platform environment in the format **https://\<yourenvironmentid\>.crm.dynamics.com/**. 
  * The environment can be provided as a string, expression, environment variable, or as dynamic content from other actions or triggers in the flow.
  * To get the root URL of an environment, you can open the details page of the environment from the [Power Platform Admin Center](https://admin.powerplatform.com), or use the output of the **List user environments** action in the [Power Automate Management connector](/connectors/flowmanagement/).
  * For actions like **Add a row** that depend on the table schema from a specific environment, the schema won't be automatically retrieved when using an expression, dynamic content, or environment variable to specify the environment. The request must be manually created using the LogicalCollectionName of the table and the body for the request in JSON format similar to a [Dataverse Web API request](/power-apps/developer/data-platform/webapi/create-entity-web-api). For example, **accounts** and  **{ "name": "Contoso Marketing" }**.
* Service principal connections can be used to connect to other environments.

### Limitations
* Using instant flows with the Dataverse connection set to **Provided by run-only user** isn't supported yet.
* The triggers **When a row is added, modified or deleted** and **When an action is performed** don't yet support the Environment parameter. Support is planned for November 2023. 
* The actions to **Search rows** and **Perform a changeset** request don't yet have preview actions with the Environment parameter.