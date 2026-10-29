---
title: Trigger flows with actions
description: Learn how to trigger flows when a Dataverse action is executed.  
suite: flow
author: radioblazer
ms.author: Matow
ms.reviewer: cyanderson
ms.topic: article
ms.date: 10/28/2026
search.audienceType: 
  - maker
---

# Trigger flows with actions

You can create flows that trigger based on a Dataverse action that's included in both a [Catalog and a Category](/powerapps/developer/data-platform/catalog-catalogassignment). This trigger enables integrations using [Microsoft Dataverse business events](/powerapps/developer/data-platform/business-events).

Additionally, your role needs [permissions](/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database) to read it, which might require read access to the *sdkmessage*, *customapi*, or *workflows* tables in Dataverse.

:::image type="content" source="../media/dataverse-action-trigger/action-trigger-search-result.png" alt-text="'When an action is performed' trigger search result in the Power Automate designer'":::

As the name suggests, this trigger runs the flow whenever a specific Dataverse action is performed. A Dataverse action is distinct from a Power Automate action. In Dataverse custom actions are a way of extending out-of-the-box operations on data. You can use them to define reusable custom business logic. Custom API is the recommended Dataverse capability to create custom actions. Learn more in [Create and use custom APIs](/power-apps/developer/data-platform/custom-api).

Learn more about how to run Dataverse actions from Power Automate in [Perform bound or unbound actions](./bound-unbound.md).

Here are the input fields for the trigger.

| Input field | Description |
| --- | --- |
| **Catalog** | Used to organize and manage Dataverse actions, similar to the way you use folders to organize files. |
| **Category** | Used as a subclassification within a catalog. |
| **Table name** | Used to filter the available actions by their associated table (bound actions), or to filter global actions (unbound actions). For unbound actions, select *(none)*. |
| **Action name** | Used to identify the action that triggers the flow each time it runs successfully. The list of available actions is filtered by the catalog, category, and table name. |

:::image type="content" source="../media/dataverse-action-trigger/action-trigger-table-selection.png" alt-text="Screenshot of the When an action is performed trigger in the Power Automate cloud flow designer.":::

## Using dynamic content and action inputs and outputs

A Dataverse custom action is meant for custom business logic. It accepts input parameters and returns output parameters. When this trigger runs, the flow makes these parameters available as dynamic content, and you can use them in subsequent steps.

:::image type="content" source="../media/dataverse-action-trigger/action-trigger-email-parameters.png" alt-text="Screenshot of using outputs from the When an action is performed trigger in the Power Automate cloud flow designer":::

Here's the naming scheme for the parameters:

- The prefixes *ActionInputs* and *ActionOutputs* specify whether the parameter is an input or output parameter.

- The next literal is the name of the parameter.

- For complex data types such as an entity object, the last literal is the column name, for example, *donotfax*.

:::image type="content" source="../media/dataverse-action-trigger/action-trigger-dynamic-content.png" alt-text="Screenshot of the dynamic content picker in the Power Automate designer showing output from the When an action is performed trigger":::

## Related information

- [Training: Use Dataverse triggers and actions in Power Automate (module)](/training/modules/use-dataverse-triggers-actions/)
- [Training: Integrate Power Automate with SharePoint HTTP actions (module)](/training/modules/integration-http-connector/)
