---
title: Connect to other environments using the Microsoft Dataverse connector | Microsoft Docs
description: "Learn how to use the Microsoft Dataverse connector for actions adn triggers across Power Platform environments."
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

The Microsoft Dataverse connector is being updated to support connecting to other environments.

During the preview of this capability, additional preview actions and triggers will be added with a new Environment field in the connector's actions and triggers. The preview actions and triggers will replace the current Microsoft Dataverse connector actions and triggers once they are generally available, with no additional action required from flow owners or administrators.

The preview actions and triggers are supported in solution flows and flows outside of solutions.

[!IMPORTANT]
This capability is in progress of rolling out as a public preview. The below actions will be available in all [Power Platform regions](/power-automate/regions-overview) by the end of September 2023. Trigger support and lifting of preview limitations will be available by the end of October 2023.

### How does it work? 
* Select (Current) environment to use the actions and triggers in the same environment as the flow. This setting is unrelated to the default environment.
* Select another environment in the same tenant

### Which actions support connecting to other environments?

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

### What is supported by the preview actions and triggers?

| Capability | Status |
| --- | --- |
|Connect to other environments in different Power Platform regions| Supported|
|Connect to other environments in other Power Platform tenants| Supported. To limit connections to other tenants, configure [Tenant Isolation](/power-platform/admin/cross-tenant-restrictions). |
|Service principal connections|Supported|

### What capabilities are not yet supported?
| Capability | Status |
| --- | --- |
|Specify environment dynamically using variables, environment variables, dynamic content | Arriving soon |
| Use connections provided by run-only users|Arriving soon|
|Use the trigger  **When a row is selected**||
|Use Run as with the **When a row is added, modified, or deleted** trigger| Not yet supported|
|Use the trigger  **When a row is selected**|Out of scope|
|Use the trigger ** When a flow step is run from a business process flow**|Out of scope|
|Use the action **Search rows** ||
|Use the action **Perform a changeset** ||