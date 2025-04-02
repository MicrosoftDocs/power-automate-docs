---
title: Trigger flows when a row is added, modified, or deleted
description: Learn how to trigger flows by using the When a row is added, modified, or deleted trigger.
suite: flow
author: radioblazer
contributors:
  - radioblazer
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 04/01/2025
ms.collection: bap-ai-copilot
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---

# Trigger flows when a row is added, modified, or deleted

The **When a row is added, modified or deleted** trigger runs a flow whenever a row of a selected table and scope changes or is created.

## Prerequisites

- To create a flow that triggers when you create, modify, or delete a row, you must have user-level permissions for create, read, write, and delete on the **Callback Registration** table.

- Additionally, depending on the scopes defined in the flow, you might need at least that level of read on the same table. You can get more information about [Environment security](/power-platform/admin/database-security).

The following information is required to use the **When a row is added, modified or deleted** trigger.

- Trigger condition
- Table name
- Scope

[!INCLUDE[copilot-designer-note](../includes/copilot-designer-note.md)]

# [New designer](#tab/new-designer)

In your flow, select the card for the **When a row is added, modified or deleted** trigger. A pane opens on the left with the **Parameters** tab selected.

:::image type="content" source="../media/create-update-delete-trigger/trigger-ai.png" alt-text="Screenshot of the Parameters tab.":::

# [Classic designer](#tab/classic-designer)

Set the parameters directly on the card for the **When a row is added, modified or deleted** trigger.

:::image type="content" source="../media/create-update-delete-trigger/trigger-current.png" alt-text="Screenshot of parameters.":::

---

## Trigger condition

The trigger condition, **Change type**, precisely defines which combination of changes to a row would run the flow.

When the flow is triggered by the creation, update, or deletion of a row, the value of `triggerOutputs()['body/SdkMessage']` will be `Create`, `Update`, or `Delete`, respectively.

If there are multiple updates to a single row in a table, Power Automate evaluates the trigger for each update, even if the values that are being updated on the row are the same as the previous value. These updates could lead to multiple flow runs.

## Table name

The **Table name** list filters the rows to indicate precisely which kind of rows should change before the flow triggers. See [Tables in Dataverse](/powerapps/maker/common-data-service/entity-overview).

The **When a row is added, modified or deleted** trigger doesn't support triggering flows on relationships of type 1:N or N:N.

## Scope

The **Scope** list indicates those rows should be monitored to determine if the flow should be run.

Here’s what each scope means:

|**Scope**| **Row ownership level** |
|---------| ----------------------- |
|Business Unit               | Actions are taken on rows owned by anyone in your [business unit](/power-platform/admin/wp-security-cds#business-units). |
| Organization       | Actions are taken by anyone within the [environment](/power-platform/admin/environments-overview).  |
| Parent: Child business unit | Actions are taken on rows that are owned by anyone in your [business unit or a child business unit](/power-platform/admin/wp-security-cds#business-units). |
| User                        | Actions are taken on rows owned by you. |

## Advanced options

You can set additional properties to define more granularly when the flow runs and the user profile under which it runs.

# [New designer](#tab/new-designer)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

1. To access the advanced options, select the **List rows** card.
1. In the **Parameters** tab, select **Add new parameters** from the dropdown menu.

    :::image type="content" source="../media/create-update-delete-trigger/advanced-ai.png" alt-text="Screenshot of the advanced options in the Add new parameters field.":::

# [Classic designer](#tab/classic-designer)

To access the advanced options, select **Show advanced options**.

:::image type="content" source="../media/create-update-delete-trigger/advanced-current.png" alt-text="Screenshot of the advanced options.":::

---

## Filter conditions

Use filter conditions to set conditions for when to trigger flows.

### Filter columns

Use the **Select columns** box to define the specific columns of the row that should cause the flow to run when included in the request, as a comma-separated list of unique column names. Only include columns with changed values in update requests. The flow will run when the values included are the same as existing values.

This property applies to the **Update** condition only. **Create** and **Delete** apply to all columns of a row.

This property isn't supported on virtual tables.

### Filter expression

The filter expression provides a way for you to define an OData style filter expression to help you to define the trigger conditions even more precisely. The flow runs only when the expression evaluates to *true* after the change is saved in Dataverse. In the following examples, the flow triggers when `firstname` is updated to "John".

Examples for **Filter rows**:

`firstname eq 'John'`

`contains(firstname,'John')`

To learn how to construct these filter expressions, go to the examples in [standard filter operators](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-filter-operators)
and [query functions](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-query-functions).

Unlike the examples in the reference links, your expression must not contain the string **$filter=**. This string applies only when you use the APIs directly.

### Wait condition using delay until

Use an OData-style time stamp in the **Delay until** property to delay the flow trigger until a specific UTC time.

The key benefit of using the Dataverse **Delay until** property instead of the standard **Delay until** *action* is the Dataverse **Delay until** property never expires, allowing the flow run to wait for long periods of time.

### User impersonation using Run As

The flow owner must have the Microsoft Dataverse privilege **Act on Behalf of Another User** (prvActOnBehalfOfAnotherUser). The **Delegate** security role includes this privilege by default. You can enable it on any security role. For more details, go to [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user).

When you create flows with the **When a row is added, modified or deleted** trigger, you can set each Microsoft Dataverse action in the flow to be performed using the context of a user, other than the flow owner.

Follow these steps to impersonate a user.

# [New designer](#tab/new-designer)

For each Dataverse action that you want to run as a different user, select an option in the **Run as** dropdown menu.

For the steps in which it isn't selected, the default user is assumed. This calls the underlying APIs as per the selected user, and not as the flow owner. If nothing is specified, it defaults to the flow owner who created the flow&mdash;essentially, the author.

# [Classic designer](#tab/classic-designer)

1. In the designer, select a value for **Run as** to tell Microsoft Dataverse which user’s context you intend to use for subsequent Dataverse actions.
1. For each Dataverse action that you want to run as a different user, select the ellipses (**...**) in the upper-right corner and then select the **Use invoker’s connection** setting.

For the steps in which it isn't selected, the default user is assumed. This calls the underlying APIs as per the selected user, and not as the flow owner. If nothing is specified, it defaults to the flow owner who created the flow&mdash;essentially, the author.

---

Here are the other options:

- **Flow owner**: The user who created the flow.

- **Row owner**: The user who owns the Microsoft Dataverse row that underwent a change, causing the flow to be triggered. If a row is owned by a team, then this option falls back to run as the flow owner.

- **Modifying user**: The user that took the action on the Microsoft Dataverse row, causing the flow to get triggered or modified.

Additionally, instant flows allow running the steps of any other [connector](/connectors/) such as [Microsoft Teams](/connectors/teams/), [Microsoft 365 Outlook](/connectors/office365/), or [SharePoint](/connectors/sharepointonline/) in the same flow using the invoker’s connection. To do so, follow these steps:

1. Go to the flow overview page.

1. Select **Edit** on the **Run only users** settings.

1. In the **Manage run-only permissions** pane, go to the **User and groups** tab, and then select **Provided by run-only user** under the **Connections Used** list.
