---
title: Trigger flows with actions
description: Learn how to trigger flows when a Dataverse action is executed.  
suite: flow
author: v-aangie
ms.author: Matow
ms.reviewer: angieandrews
ms.topic: article
ms.date: 10/09/2024
search.audienceType: 
  - maker
---

# Trigger flows with actions

You can create flows that trigger based on a Dataverse action that's included in both a [Catalog and a Category](/powerapps/developer/data-platform/catalog-catalogassignment). 

Additionally, your role needs [permissions](/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database) to read it, which may require read access to the *sdkmessage*, *customapi*, or *workflows* tables in Dataverse.

!["When an action is performed" trigger search result in the Power Automate designer"](../media/dataverse-action-trigger/fda27fcf4067248e47b7efd3daed4511.png)

As the name suggests, this trigger runs the flow whenever a specific Dataverse action is performed. A Dataverse action is distinct from a Power Automate action. In Dataverse, custom process actions, or simply actions, are a way of extending out of the box operations on data. You can use them to define reusable custom business logic. To learn more, see [Work with actions](/powerapps/maker/data-platform/actions) and [Use Custom Process Actions with code](/powerapps/developer/data-platform/workflow-custom-actions).
To learn how to run Dataverse actions from Power Automate, see [Perform bound or unbound actions](./bound-unbound.md).

Here are the input fields for the trigger.

- **Catalog** – used to organize and manage Dataverse actions, similar to the way you use folders to organize files.

- **Category** – used as a sub-classification within a catalog.

- **Table name** – used to filter the available actions by their associated table (bound actions), or to filter global actions (unbound actions). For unbound actions, select *(none)*.

- **Action name** – used to identify the action that triggers the flow each time it runs successfully. The list of available actions is filtered by the catalog, category, and table name.

    ![Screenshot of the "When an action is performed" trigger in the Power Automate cloud flow designer](../media/dataverse-action-trigger/7373b607775f2b462f951a8df96e5625.png )

## Using dynamic content and action inputs / outputs

A Dataverse custom action is meant for custom business logic, it accepts input parameters and returns output parameters. When this trigger runs, these parameters are available as dynamic content in the flow and can be used in subsequent steps.

![Screenshot of using outputs from the "When an action is performed" trigger in the Power Automate cloud flow designer](../media/dataverse-action-trigger/fc29283af115f6b447aba24655ee2747.png)

Here's the naming scheme for the parameters.

- The prefixes *ActionInputs* and *ActionOutputs* specify whether it is an input or output parameter.

- The next literal is the name of the parameter.

- For complex data types such as an entity object, the last literal is the column name, for example, *donotfax*.

![Screenshot of the dynamic content picker in the Power Automate designer showing output from the "When an action is performed" trigger](../media/dataverse-action-trigger/2570885e7cba9c63b45ccaefc6b55056.png)

## Related information

- [Training: Use Dataverse triggers and actions in Power Automate (module)](/training/modules/use-dataverse-triggers-actions/)
- [Training: Integrate Power Automate with SharePoint HTTP actions (module)](/training/modules/integration-http-connector/)
