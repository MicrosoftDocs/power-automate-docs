---
title: Create a cloud flow with Microsoft Dataverse (legacy)
description: Learn how to create workflows by using a Microsoft Dataverse (legacy) connection and Power Automate.

suite: flow
documentationcenter: na
author: Radioblazer
contributors:
  - russrimm
  - Radioblazer
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/24/2024
ms.author: matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a cloud flow with Microsoft Dataverse (legacy)

With the Microsoft Dataverse connector, you can create flows that are initiated by create and update events within Dataverse. You can also perform create, update, retrieve, and delete actions on rows in Dataverse.

> [!IMPORTANT]
> Flows that are created with the Dataverse (legacy) connector will no longer work after a date that is announced during 2024. To automatically migrate from the Dataverse (legacy) connector to the Microsoft Dataverse connector, use the migration tool in Power Automate.

## Initiate a cloud flow from Dataverse

You can use any of the following triggers to initiate your flow.

- When a flow step is run from a business process flow.
- When a row is added, modified, or deleted.
- When an action is performed.

:::image type="content" source="./media/cds-connector/triggers.png" alt-text="Screenshot of selecting a trigger.":::

If the selected trigger requires an environment to be selected, then you can choose `(Current)`, which always uses the database in the environment in which Power Automate runs. If you want your flow to always trigger based on an event in a specific environment, select that environment.

:::image type="content" source="./media/cds-connector/Environments.png" alt-text="Screenshot of choosing an environment.":::

You can use scopes to determine if your flow runs in any of the following scenarios:

- If you add row.
- If a user within your business unit adds a new row.
- If any user in your organization adds a new row.

:::image type="content" source="./media/cds-connector/Scopes.png" alt-text="Screenshot of choosing a scope.":::

|Scope|Trigger timing|
| --- | --- |
|Business Unit|Action is taken on a row owned by your business unit|
|Organization|Action is taken by anyone within the organization or database|
|Parent: Child business unit|Action is taken on a row owned by your business unit or a child business unit|
|User|Action is taken on a row owned by you|

Triggers that run when a row is modified can also use filtering columns. This ensures that the flow only runs when any of the defined columns are modified.

> [!IMPORTANT]
> To prevent your flow from unnecessarily running, use filter columns.

This flow triggers anytime the first or last name of a contact that the flow user owns is modified.

:::image type="content" source="./media/cds-connector/FilterAttributes.png" alt-text="Screenshot of Filter columns.":::

## Trigger privileges

To create a cloud flow that triggers based on create, update, or delete on a row, the user needs to have user level permissions for create, read, write, and delete on the Callback Registration table. Additionally, depending on the scopes defined, the user might need at least that level of read on the same table.  [Learn more](/power-platform/admin/database-security) about environment security.

## Write data into Dataverse

Use any of the following actions to write data into Dataverse:

- Create a new row
- Update a row

Here's an example of creating a follow-up task when the given user creates a new account row.  

:::image type="content" source="./media/cds-connector/Regarding.png" alt-text="Screenshot of Follow-up task.":::

## Advanced concepts

### Write data into customer, owner, and regarding columns

To write data into customer, owner, and regarding columns, two columns must be populated.

| Column category | Example settings |
| --- | --- |
| Regarding | Regarding = ID of the row (for example, account ID) and Regarding Type as selected from the list. |
| Customer | Represents the ID of the row and the customer type as selected from the list. |
| Owner | Represents the ID of the system user or team, and owner type as selected from the list. |

### Enable upsert behavior

You can use the **update a row** command to provide upsert actions. This command updates the row if it already exists, or creates a new row. To invoke upsert, provide the table and a GUID key. If the row with the specified type and key exists, an update occurs. Otherwise, a row with the specified key is created.

### Trigger behavior

If you have a trigger registered on the update of a row, the flow runs for every *committed* update to the given row. The service invokes your flow asynchronously, and with the payload that it captures at the time the invocation occurs.

Flow runs might be delayed if there's a backlog of system jobs in your environment.  If this delay occurs, your flow is triggered when the system job to invoke the flow runs.

## Related information

[Add canvas apps and cloud flows to a solution by default](/power-apps/maker/canvas-apps/add-app-solution-default)

[!INCLUDE[footer-include](includes/footer-banner.md)]
