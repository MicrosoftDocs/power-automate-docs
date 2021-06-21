---
title: Trigger flows when a row is added, modified, or deleted | Microsoft Docs
description: "Learn how to trigger flows by using the When a row is added, modified, or deleted trigger."
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/15/2021
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

   ![Dataverse triggers](../media/create-update-delete-trigger/triggers.png "Dataverse triggers")

The following information is required to use the **When a row is added, modified or deleted** trigger.

- Trigger condition

- Table name

- Scope

### Trigger condition

The trigger condition, **Change type**, precisely defines which combination of changes to a row would run the flow.

   ![Trigger conditions](../media/create-update-delete-trigger/2.png "Trigger conditions")

When the flow is triggered by the creation, update, or deletion of a row, the value of `triggerOutputs()['body/SdkMessage']` will be `Create`, `Update`, or `Delete`, respectively.

### Table name

The **Table name** list filters the rows to indicate precisely which kind of rows should change before the flow triggers. See [Tables in Dataverse](/powerapps/maker/common-data-service/entity-overview).

   ![Select a table name](../media/create-update-delete-trigger/created-modified-deleted.png "Select a table name")

### Scope

The **Scope** list indicates whose rows should be monitored to determine if the flow should be run.

   ![Select scope for triggering flow](../media/create-update-delete-trigger/scope.png "Select scope for triggering flow")

Here’s what each scope means:

| **Scope**| **Row ownership level** |
| ---------| --------------------------------- |
| Business Unit               | Actions are taken on rows owned by anyone in your [business unit](/power-platform/admin/wp-security-cds#business-units).|                          |
| Organization                | Actions are taken by anyone within the [environment](/power-platform/admin/environments-overview).|                                                    |
| Parent: Child business unit | Actions are taken on rows that are owned by anyone in your [business unit or a child business unit](/power-platform/admin/wp-security-cds#business-units). |
| User                        | Actions are taken on rows owned by you. |

### Advanced options

You can set additional properties to define more granularly when the flow runs and the user profile under which it runs.

## Filter conditions

Use filter conditions to set conditions for when to trigger flows.

   ![Filter condition](../media/create-update-delete-trigger/filter-conditions.png "Filter condition")

## Filtering columns

Use the **Column filter** box to define a set of comma-separated, unique names for the table, as shown in the following image. The flow runs only when these columns change on the specific rows.

   ![Filter columns by firstname.lastname](../media/create-update-delete-trigger/filter-columns.png "Filter columns by firstname.lastname")

>[!NOTE]
>This property applies to the **Update** condition only. **Create** and **Delete** apply to all columns of a row.

### Filter expression

The filter expression provides a way for you to define an OData style filter expression to help you to define the trigger conditions even more precisely. The flow runs only when the expression evaluates to *true* after the change is saved in Dataverse. In the following example, the flow triggers when `firstname` is updated to "John".

See the following examples, [standard filter operators](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-filter-operators),
and [query functions](/powerapps/developer/common-data-service/webapi/query-data-web-api#standard-query-functions) to learn how to construct these filter expressions.

>[!NOTE]
>Unlike the examples in the reference links, your expression must not contain the string **$filter=**. This string applies only when you use the APIs directly.

   ![Row filter equal](../media/create-update-delete-trigger/row-filter.png)

   ![Row filter contains](../media/create-update-delete-trigger/row-filter-contains.png)

### Wait condition using Postpone until

Use an OData-style time stamp in the **Postpone until** property to delay the flow trigger until a specific UTC time. The key benefit of using this property instead of the standard **Delay until** action is that **Postpone Until** never expires, allowing the flow run to wait for long periods of time.

   ![Delay until](../media/create-update-delete-trigger/delay-until.png "Delay until")

### User impersonation using Run As

>[!IMPORTANT]
>The flow owner must have the Microsoft Dataverse privilege **Act on Behalf of Another User** (prvActOnBehalfOfAnotherUser). The **Delegate** security role includes this privilege by default. You can enable it on any security role. For more details, go to [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user).

When you create flows with the **When a row is added, modified or deleted** trigger, you can set each Microsoft Dataverse action in the flow to be performed using the context of a user, other than the flow owner.

Follow these steps to impersonate a user:

1. In the Power Automate flow definition, select **Show advanced options** in the **When a row is added, modified or deleted** trigger.

1. Select a value for **Run as** to tell Microsoft Dataverse which user’s context you intend to use for subsequent Dataverse actions.

1. For each Dataverse action that you want to run as a different user, select the menu in the upper-right corner (...), as shown in the following image, and select the **Use invoker’s connection** setting. For the steps in which it is not selected, the default user is assumed. This would call the underlying APIs as per the selected user, and not as the flow owner.

   ![Run as the modifying user](../media/create-update-delete-trigger/run-as.png "Run as the modifying user")

If nothing is specified, it defaults to the flow owner that created the flow&mdash;essentially, the author. Here are the other options:

- **Flow owner**: The user who created the flow.

- **Row owner**: The user who owns the Microsoft Dataverse row that underwent a change, causing the flow to be triggered. If a row is owned by a team, then this option falls back to run as the flow owner.

- **Modifying user**: The user that took the action on the Microsoft Dataverse row, causing the flow to get triggered or modified.

    ![Run as options](../media/create-update-delete-trigger/11.png "Run as options")

Additionally, instant flows allow running the steps of any other [connector](/connectors/) (such as [Microsoft Teams](/connectors/teams/), [Microsoft 365
Outlook](/connectors/office365/), or [SharePoint](/connectors/sharepointonline/) in the same flow using the invoker’s connection. To do so, follow these steps:

1. Go to the flow overview page.

1. Select **Edit** on the **Run only users** settings.

1. In the **Manage run-only permissions** pane, go to the **User and groups** tab, and then select **Provided by run-only user** under the **Connections Used** list.
