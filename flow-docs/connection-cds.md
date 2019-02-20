---
title: Create an automated flow with Common Data Service for Apps| Microsoft Docs
description: Create useful workflows by using a Common Data Service connection and Microsoft Flow
services: ''
suite: flow
documentationcenter: na
author: brandonsimons
manager: ryjones
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/06/2019
ms.author: brandonsimons
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create an automated flow by using Common Data Service for Apps
With the Common Data Service for Apps connector, you can create flows that are initiated by create and update  events within your Common Data Service database.  Additionally, you can perform create, update, retrieve and delete actions on records within the Common Data Service database.

###Prerequisites
* Familiar with the previous documentation (Common-data-model-intro.md)

# Initiating a Flow from the Common Data Service:
You will find a set of triggers that can initiate your flow.
- When a record is selected
- When a record is created
- When a record is updated
- When a record is deleted

![Select a Trigger](./media/cds-connector/Triggers.png)

If the selected trigger requires an environment to be selected, then you can choose `(Current)` which will always use the database within the environment that Flow is running.  If you want your flow to always trigger based on an event in a specific environment, then you can select that environment specifically.

![Choose Environment](.media/cds-connector/Environments.png)

By using scopes you can determine if your flow should run if you create a new record, if a new record is created by a user within your business unit, or if a new record is created by any user in your organization.

![Choose Scope](.media/cds-connector/Scopes.png)

|Scope|Trigger runs when:|
|Business Unit|action is taken on a record owned by your business unit|
|Organization|action is taken by anyone within the organization or database|
|Parent: Child business unit|action is taken on a record owned by your business unit or a respective child business unit|
|User|action is taken on a record owned by you|

Triggers that run on the update of a record can additionally use filtering attributes.  This ensure that the Flow only runs when any one or more attributes defined have been updated.  It is highly suggested that you define your attributes to prevent your flow from unnecessarily running.

This Flow will trigger any time a contact that is owned by the Flow user has their first or last name is updated.

![Filter Attributes](.media/cds-connector/FilterAttributes.png)

## Trigger Privileges
To create a Flow that triggers based on create, update, or delete of a record, the user needs to have user level permissions for create, read, write, and delete on the Callback Registration entity.  Additionally, depending on the scopes defined, the user will need at least that level of read on the same entity.  Learn more about environment security here: https://docs.microsoft.com/en-us/power-platform/admin/database-security.


# Writing data into the Common Data Service
Writing data to the Common Data Service can be performed using the following actions:
- Create a new record
- Update a record

Here is an example of creating a follow up task when the given user creates a new account record.  
![Follow up task](.media/cds-connector/Regarding.png)

## Advanced Concepts 

### Writing data into Customer, Owner and Regarding Fields
To write data into customer, owner and regarding fields, two fields need to be populated.  

Here are some examples:
|Field Category|Example Settings|
|Regarding| Regarding = Id of the record (for example account id) and Regarding Type as selected from the drop down.|
|Customer| Customer = Id of the record and the customer type as selected from the drop down.|
|Owner|Owner = Id of the system user or team, and owner type as selected from the drop down.|

### Enabling "Upsert" behavior
You can leverage the "update a record" command to provide upsert actions, which will update the record if it already exists, otherwise it will create a new record.  To invoke "upsert" you will need to specify the entity and a guid key.  If the record with the specified type and key exist then an update will occur, otherwise a new record with the specified key will be created.

### Trigger Behavior
Triggers will be initiate your Flow based on every invocation of the action.  If you have a trigger registered on the update of a record, the Flow will execute for every committed update to the given record.  The service will invoke your Flow asynchronously, and with the payload that is captured at the time of invoking the flow.  If you have two updates that happen within a second of each other, then the flow may be triggered more than once with the same latest versioned content.