---
title: Trigger flows when a row is added, modified, or deleted
description: Learn how to trigger flows by using the When a row is added, modified, or deleted trigger.
suite: flow
author: radioblazer
contributors:
  - HeatherOrt
  - radioblazer
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
ms.topic: how-to
ms.date: 04/18/2025
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

- Depending on the scopes defined in the flow, you might need at least that level of read on the same table. Learn more in [Environment security](/power-platform/admin/database-security).

## Set parameters for your trigger

The following information is required to use the **When a row is added, modified or deleted** trigger.

- Trigger condition
- Table name
- Scope

[!INCLUDE[copilot-designer-note](../includes/copilot-designer-note.md)]

# [New designer](#tab/new-designer)

In your flow, select the card for the **When a row is added, modified or deleted** trigger. A pane opens on the left with the **Parameters** tab selected.

:::image type="content" source="../media/create-update-delete-trigger/trigger-ai-new-designer-old.png" alt-text="Screenshot of the 'Parameters' tab.":::

## Trigger condition

The trigger condition, **Change type**, defines the combination of changes to a row that runs the flow.

When the flow triggers the creation, update, or deletion of a row, the value of `triggerOutputs()['body/SdkMessage']` is `Create`, `Update`, or `Delete`, respectively.

When multiple updates occur to a single row in a table, Power Automate evaluates the trigger for each update, even if the updated values are the same as the previous ones. These updates can result in multiple flow runs.

## Table name

The **Table name** list filters rows which rows change before the flow triggers. Learn more in [Tables in Dataverse](/powerapps/maker/common-data-service/entity-overview).

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

## Filter conditions

Use filter conditions to set conditions for when to trigger flows.

### Filter columns

Use the **Select columns** box to define the specific columns of the row that should cause the flow to run when included in the request, as a comma-separated list of unique column names. Only include columns with changed values in update requests. The flow runs when the values included are the same as existing values.

This property applies to the **Update** condition only. **Create** and **Delete** apply to all columns of a row.

This property isn't supported on virtual tables.

### Filter expression

The filter expression provides a way for you to define an OData style filter expression to help you to define the trigger conditions even more precisely. The flow runs only when the expression evaluates to *true* after the change is saved in Dataverse. In the following examples, the flow triggers when `firstname` is updated to *John*.

Examples for **Filter rows**:

`firstname eq 'John'`

`contains(firstname,'John')`

Learn more in [standard filter operators](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-filter-operators)
and [query functions](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-query-functions).

# [Classic designer](#tab/classic-designer)

Set the parameters directly on the card for the **When a row is added, modified or deleted** trigger.

:::image type="content" source="../media/create-update-delete-trigger/trigger-current.png" alt-text="Screenshot of parameters.":::

## Trigger condition

The trigger condition, **Change type**, defines the combination of changes to a row that runs the flow.

When the flow triggers the creation, update, or deletion of a row, the value of `triggerOutputs()['body/SdkMessage']` is `Create`, `Update`, or `Delete`, respectively.

When multiple updates occur to a single row in a table, Power Automate evaluates the trigger for each update, even if the updated values are the same as the previous ones. These updates can result in multiple flow runs.

## Table name

The **Table name** list filters rows which rows change before the flow triggers. Learn more in [Tables in Dataverse](/powerapps/maker/common-data-service/entity-overview).

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

---

## Advanced options

You can set additional properties to define more precisely when the flow runs and the user profile it uses.

# [New designer](#tab/new-designer)

To access the advanced parameters, select **Show all** in the **Advanced parameters** field.

:::image type="content" source="../media/create-update-delete-trigger/advanced-ai-new-designer.png" alt-text="Screenshot of the advanced parameters.":::

### Wait condition using delay until

Use an OData-style time stamp in the **Delay until** property to delay the flow trigger until a specific UTC time.

The key benefit of using the Dataverse **Delay until** property instead of the standard **Delay until** *action* is the Dataverse **Delay until** property never expires, allowing the flow run to wait for long periods of time.

### User impersonation using Run As

The flow owner must have the Microsoft Dataverse privilege **Act on Behalf of Another User** (prvActOnBehalfOfAnotherUser). The **Delegate** security role includes this privilege by default. You can enable it on any security role. Learn more in [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user).

When you create flows with the **When a row is added, modified or deleted** trigger, you can set each Microsoft Dataverse action in the flow to be performed using the context of a user, other than the flow owner.

To impersonate a user, follow these steps. For each Dataverse action you want to run as a different user, select an option in the **Run as** dropdown menu.

For the steps where it isn't selected, the default user is assumed. This calls the underlying APIs based on the selected user, not the flow owner. If nothing is specified, it defaults to the flow owner who created the flow&mdash;essentially, the author.

Here are the other options:

- **Flow owner**: The user who created the flow.

- **Row owner**: The user who owns the Microsoft Dataverse row that changes, triggering the flow. If a team owns a row, this option defaults to running as the flow owner.

- **Modifying user**: The user who acted on the Microsoft Dataverse row, triggering or modifying the flow.

# [Classic designer](#tab/classic-designer)

To access the advanced options, select **Show advanced options**.

:::image type="content" source="../media/create-update-delete-trigger/advanced-current.png" alt-text="Screenshot of the advanced options.":::

## Filter conditions

Use filter conditions to set conditions for when to trigger flows.

### Filter columns

Use the **Select columns** box to define the specific columns of the row that should cause the flow to run when included in the request, as a comma-separated list of unique column names. Only include columns with changed values in update requests. The flow runs when the values included are the same as existing values.

This property applies to the **Update** condition only. **Create** and **Delete** apply to all columns of a row.

This property isn't supported on virtual tables.

> [!NOTE]
> In Dynamics 365 environments—especially when working with standard tables like `account`, `contact`, or other entities part of managed solutions—the **Select columns** property may not behave as expected. 
> 
> Even if only non-specified columns are modified, the trigger may still fire under certain conditions. This can happen when:
> 
> - Server-side components (such as plugins, workflows, or business rules) update or touch the monitored columns in the background.
> - The platform includes the monitored columns in the update payload even if their values have not changed.
> - Model-driven app forms resubmit additional fields automatically on save, including those listed in **Select columns**.

For example, if **Select columns** is set to `mobilephone`, but a user modifies only `emailaddress1`, the flow may still run if a plugin or background process also updates `mobilephone`, or if the system includes `mobilephone` in the update request automatically.

As a result, **the trigger may execute even if only unrelated columns were explicitly changed by the user**. This can lead to unnecessary flow runs, increased API consumption, and incorrect logic branching. To mitigate this, it's recommended to include condition checks within the flow to confirm that meaningful changes have occurred before proceeding.

### Filter expression

The filter expression provides a way for you to define an OData style filter expression to help you to define the trigger conditions even more precisely. The flow runs only when the expression evaluates to *true* after the change is saved in Dataverse. In the following examples, the flow triggers when `firstname` is updated to *John*.

Examples for **Filter rows**:

`firstname eq 'John'`

`contains(firstname,'John')`

Learn more in [standard filter operators](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-filter-operators)
and [query functions](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-query-functions).

Unlike the examples in the reference links, your expression must not contain the string **$filter=**. This string applies only when you use the APIs directly.

### Wait condition using delay until

Use an OData-style time stamp in the **Delay until** property to delay the flow trigger until a specific UTC time.

The key benefit of using the Dataverse **Delay until** property instead of the standard **Delay until** *action* is the Dataverse **Delay until** property never expires, allowing the flow run to wait for long periods of time.

### User impersonation using Run As

The flow owner must have the Microsoft Dataverse privilege **Act on Behalf of Another User** (prvActOnBehalfOfAnotherUser). The **Delegate** security role includes this privilege by default. You can enable it on any security role. Learn more in [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user).

When you create flows with the **When a row is added, modified or deleted** trigger, you can set each Microsoft Dataverse action in the flow to be performed using the context of a user, other than the flow owner.

To impersonate a user, follow these steps:

1. In the designer, select a value for **Run as** to specify which user's context Microsoft Dataverse uses for subsequent Dataverse actions.
1. For each Dataverse action you want to run as a different user, select the ellipses (**...**) in the upper-right corner, and then select **Use invoker’s connection**.

For the steps where it isn't selected, the default user is assumed. This calls the underlying APIs based on the selected user, not the flow owner. If nothing is specified, it defaults to the flow owner who created the flow&mdash;essentially, the author.

Here are the other options:

- **Flow owner**: The user who created the flow.

- **Row owner**: The user who owns the Microsoft Dataverse row that changes, triggering the flow. If a team owns a row, this option defaults to running as the flow owner.

- **Modifying user**: The user who acted on the Microsoft Dataverse row, triggering or modifying the flow.

---

Additionally, instant flows allow running the steps of any other [connector](/connectors/) such as [Microsoft Teams](/connectors/teams/), [Microsoft 365 Outlook](/connectors/office365/), or [SharePoint](/connectors/sharepointonline/) in the same flow using the invoker’s connection. To do so, follow these steps:

1. Go to the flow overview page.

1. Select **Edit** on the **Run only users** settings.

1. In the **Manage run-only permissions** pane, go to the **User and groups** tab, and then select **Provided by run-only user** under the **Connections Used** list.
