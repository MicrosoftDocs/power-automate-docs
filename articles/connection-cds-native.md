---
title: Create an automated flow with Common Data Service (current environment) connector| Microsoft Docs
description: Create workflows by using the Common Data Service (current environment) connector and Power Automate
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/26/2020
ms.author: Deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create an automated flow by using Common Data Service (current environment) connector

[!INCLUDE[cc-data-platform-banner](./includes/cc-data-platform-banner.md)]

>[!IMPORTANT]
>There are three connectors available to connect to Dataverse. This article covers the recommended [Common Data Service (current environment)](./connection-cds.md) for connecting to Dataverse. The [Common Data Service connector](./connection-cds.md) and the [Dynamics 365 connector](https://docs.microsoft.com/connectors/dynamicscrmonline/) are also available for use if you cannot use the recommended connector.


The flows you create can trigger when a Dataverse record is created, updated, or deleted.

Additionally, you can perform create, update, retrieve, and delete actions on records within Dataverse.

## Initiate a cloud flow with Common Data Service (current environment) connector

Use the **When a record is created, updated or deleted** trigger to initiate your flow:

   ![A screenshot that displays a trigger](./media/cds-connector-native/native-trigger.png)

After you select a trigger, you'll need to configure:

- A condition for the trigger.
- The name of the entity.
- The scope for the trigger.

### Trigger condition

You can add any of these conditions to determine precisely when your flow is triggered.

   ![A screenshot that displays the trigger conditions](./media/cds-connector-native/trigger-conditions.png)

### The entity name

Select any of the numerous entities that are available to indicate the entity on which your trigger operates.

   ![A screenshot that displays the entity names](./media/cds-connector-native/entity-names.png)

### Scope

Use scopes to determine if your flow runs when you, someone in your business unit, or any user in your organization creates a record.

![Choose scope](./media/cds-connector-native/scopes.png)

Here are the details on each scope.

|Scope|Trigger timing|
| --- | --- |
|Business Unit|Action is taken on a record owned by your business unit|
|Organization|Action is taken by anyone within the organization or database|
|Parent: Child business unit|Action is taken on a record owned by your business unit or a child business unit|
|User|Action is taken on a record owned by you|


Triggers that run when a record is updated can also use filtering attributes. This ensures that the flow only runs when any of the defined attributes are updated.

> [!IMPORTANT]
> Use filter attributes to prevent your flow from unnecessarily running.

This flow triggers any time the first or last name of contact that the flow user owns is updated.

![A screenshot that displays the tilter attributes](./media/cds-connector-native/filtering-attributes.png)

## Trigger privileges

To create a cloud flow that triggers based on create, update, or delete on a record, the user needs to have user level permissions for create, read, write, and delete on the **Callback Registration** entity. Additionally, depending on the scopes defined, the user might need at least that level of read on the same entity.  [Learn more](https://docs.microsoft.com/power-platform/admin/database-security) about environment security.

## Write data into Dataverse

Use any of the following actions to write data into Dataverse:

![A screenshot that displays the actions](./media/cds-connector-native/actions.png)

Here's an example of a cloud flow that sends a notification with the name and the annual revenue each time an **account** is **created** by anyone in the business unit **scope**.

> ![Followup task](./media/cds-connector-native/example-flow.png)

## Advanced concepts

### Write data into customer, owner, and regarding fields

To write data into customer, owner, and regarding fields, two fields must be populated.

| Field category | Example settings |
| --- | --- |
| Regarding | Regarding = ID of the record (for example, account ID) and Regarding Type as selected from the list. |
| Customer | Represents the ID of the record and the customer type as selected from the list. |
| Owner | Represents the ID of the system user or team, and owner type as selected from the list. |

### Enable upsert behavior

You can leverage the **update a record** action to provide upsert actions, which updates the record if it already exists, or creates a new record. To invoke upsert, provide the entity and a GUID key. If the record with the specified type and key exists, an update occurs. Otherwise, a record with the specified key is created.

### Trigger behavior

If you have a trigger registered on the update of a record, the flow runs for every *committed* update to the given record. The service invokes your flow asynchronously, and with the payload that it captures at the time the invocation occurs.

> [!NOTE]
> If you have two updates that happen within seconds of each other, the flow may be triggered more than once with the latest versioned content.

Flow runs may be delayed if there is a backlog of system jobs in your environment. If this delay occurs, your flow is triggered when the system job to start the flow runs.





[!INCLUDE[footer-include](includes/footer-banner.md)]