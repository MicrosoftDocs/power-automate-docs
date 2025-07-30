---
title: Use scopes to organize actions in cloud flows
ms.service: power-automate
description: Learn how to use scope control actions to group related actions together in Power Automate cloud flows for better organization and error handling.
author: sbasi19
ms.author: ralinga
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 07/31/2025
ms.custom: bap-template
---

# Use scopes to organize actions in cloud flows

Scopes are a unique type of control action in Power Automate. You can think of a scope as a container that groups related actions together. When you run a scope, all the actions inside it execute as one single block. This makes it easier to manage, organize, and keep track of your flow, especially as it gets more complicated.

## Benefits of using scopes

Scopes provide many advantages for organizing and managing your cloud flows, including the following:

- **Organization and clarity**: Scopes help you organize complex flows by grouping related actions together. For example, you might create separate scopes for data validation, main processing, and error handling.
- **Error management**: Scopes can work with run-after conditions to create try/catch/finally patterns. For example, you might set the *Error Handling* scope to run only if the *Main Processing* scope encounters a failure.
- **Bulk actions**: You can quickly collapse or expand scopes in the designer, making it simpler to focus on a specific section of your flow.
- **Status monitoring**: Each scope provides a status (like *Succeeded*, *Failed*, *Skipped*, and others), which can guide what your flow does next based on the outcome.

## When to use scopes

Consider using scopes when you need to group similar steps, especially in longer, or more intricate flows. The following list includes some common situations:

- Divide business logic, error management, data transformation, or notification processes.
- Implement try/catch structures for better error control.

## Prerequisites

Before you can use complete the procedures in [Add a scope to your flow](#add-a-scope-to-your-flow), ensure you have the following:

- A valid Power Automate account
- Access to Microsoft Outlook
- Access to SharePoint

If you want to use actions other than the ones in the procedures (Outlook and SharePoint), ensure you have the necessary permissions to use those actions in your flow.

## Add a scope to your flow

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

The examples in the following instructions use actions to create an email and update a file in SharePoint in the new scope you create. You can replace these actions with any other actions that you want to group.

# [New designer](#tab/new-designer)

1. Sign in to [Power Automate](https://powerautomate.microsoft.com).
1. [Create](get-started-with-cloud-flows.md#create-a-cloud-flow) or open a cloud flow.

   To open a cloud flow:
     1. On the navigation menu to the left, select **My flows**, and then select a flow.
     1. On the command bar, select **Edit**.

1. In the designer, select the plus sign (**+**) below the trigger or action where you want to add a scope.
1. In the **Add an action** search field, enter **scope**.
1. Under the **Control** heading, select **Scope**.
1. To add the first action you want to include in the scope, select the plus sign (**+**) inside the scope in the designer.
1. In the configuration pane, type *send an email*, and then select the **Send an email notification (V3)** action under the **Mail** heading.
1. To add another action to the scope, select the plus sign (**+**) below the **Send an email notification (V3)** card inside the scope in the designer.
1. In the configuration pane, type **update file**, and then select **Update file** under the **SharePoint** heading.

    :::image type="content" source="media/scopes/scope-new.png" alt-text="<Screenshot of a scope in the new designer with two actions inside it: Send an email and Update file.>":::

# [Classic designer](#tab/classic-designer)

1. Sign in to [Power Automate](https://powerautomate.microsoft.com).
1. [Create](get-started-with-cloud-flows.md#create-a-cloud-flow) or open a cloud flow.

   To open a cloud flow:
     1. On the navigation menu to the left, select **My flows**, and then select a flow.
     1. On the command bar, select **Edit**.

1. In the designer, hover over the down arrow below the trigger or action where you want to add a scope. When a plus sign (**+**) appears, select it, and then select **Add an action**.
1. In the **Choose an operation** dialog, search for **scope**.
1. In the **Actions** tab, select **Scope - Control**.
1. To add the first action you want to include in the scope, select **Add an action** inside the scope in the designer.
1. In the **Choose an operation** search field, type *send an email*, and then select **Send an email notification (V3)** in the **Actions** list.
1. To add another action to the scope, select **Add an action** below the **Send an email notification (V3)** card inside the scope in the designer.
1. In the **Choose an operation** search field, type **update file**, and then select **Update file - SharePoint** in the **Actions** list.

    :::image type="content" source="media/scopes/scope-classic.png" alt-text="<Screenshot of a scope in the classic designer with two actions inside it: Send an email and Update file.>":::

---



