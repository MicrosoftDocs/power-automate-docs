---
title: Connect to other environments using the Microsoft Dataverse connector
description: Learn how to use the Microsoft Dataverse connector for actions and triggers across Power Platform environments.
suite: flow
author: radioblazer
ms.author: samathur
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 02/10/2025
search.audienceType: 
  - maker
---

# Connect to other environments using the Microsoft Dataverse connector

You can automate apps, data, and processes across Dataverse databases in different Power Platform environments through supported actions in the Microsoft Dataverse connector.

Dataverse connector operations with the **Environment** parameter allow you to choose between using the current environment where the flow is located or selecting another environment.

Actions with names ending in **selected environment** are now generally available to use in cloud flows, with an **Environment** parameter that allows you to choose between the current environment where the flow is located or another environment. Support for triggering flows based on Dataverse changes from other environments is not yet available.
<!-- All connections visible -->

The following diagram shows a Power Automate cloud flow being triggered when a row changes in the Contoso Support environment. It takes actions in other Contoso Services and Contoso Field Service environments to list rows, add a row, and perform an action in the example Contoso Corporation's Microsoft Entra tenant.

:::image type="content" source="media/connect-to-other-environments/diagram-connect-to-other-environments.png" alt-text="Screenshot of a diagram of a Power Automate cloud flow being triggered and taking actions.":::

## Add actions that connect to other environments

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Create a new cloud flow such as an instant flow with the **Manually trigger a flow** trigger.

    Alternatively, you can open an existing flow.

1. In the flow designer, select the plus sign (**+**) to add a new action.
1. Search for **dataverse**, and then select **See more** on the **Microsoft Dataverse** connector to see all available actions.

    :::image type="content" source="media/connect-to-other-environments/cross-env-add-a-preview-action.png" alt-text="Screenshot of the Microsoft Dataverse connector actions including the new actions for Add a new row to the selected environment (preview) and Delete a row from the selected environment (preview).":::

1. Add one of actions that ends in **selected environment**, such as **List rows from selected environment**.
1. Use the **Environment** parameter in the action card to choose the environment to connect to. The connection you use for the action must have permissions to perform the operation in the other environment.

    :::image type="content" source="media/connect-to-other-environments/list-flows.png" alt-text="Screenshot of the List rows from selected environment (preview) action in the Microsoft Dataverse connector with the Environment parameter being used to select either the current environment, another environment, or enter a custom value for the environment.":::

1. To connect to Dataverse in the same environment as the flow, select **(Current)** in the Environment parameter.

## Actions and triggers that can connect to other environments

The following actions now support connecting to other environments, and appear in the flow designer with names ending in **selected environment**:

- [Add a new row](/power-automate/dataverse/create)
- [Update a row](/power-automate/dataverse/update)
- [Delete a row](/power-automate/dataverse/delete-row)
- [List rows](/power-automate/dataverse/list-rows)
- [Get a row by ID](/power-automate/dataverse/get-row-id)
- [Perform a bound action](/power-automate/dataverse/bound-unbound)
- [Perform an unbound action](/power-automate/dataverse/bound-unbound)
- [Relate rows](/power-automate/dataverse/relate-unrelate-rows)
- [Unrelate rows](/power-automate/dataverse/relate-unrelate-rows)
- [Upload a file or image](/power-automate/dataverse/upload-download-file)
- [Download a file or image](/power-automate/dataverse/upload-download-file)

The actions to [search rows](/power-automate/dataverse/search) and [perform a changeset request](/power-automate/dataverse/change-set) don't support the Environment parameter yet.

Support for the following triggers is coming soon: 

- [When a row is added, modified or deleted](/power-automate/dataverse/create-update-delete-trigger)
- [When an action is performed](/power-automate/dataverse/action-trigger)

The [When a row is selected](/power-automate/connection-cds#initiate-a-cloud-flow-from-dataverse) trigger doesn't have the **Environment** parameter because it's only supported within the same environment as the related Dataverse table.


## Features supported by operations with the Environment parameter

- Connect to the same environment the flow is located when **(Current)** is selected as the environment.
- Connect to other environments in the same tenant or other tenants based on the connection used. The connection must have permissions.
  - To restrict connections to other tenants from the Microsoft Dataverse connector and other connectors, Power Platform administrators can enable [tenant isolation policies](/power-platform/admin/cross-tenant-restrictions).
- [Connect to an environment specified dynamically](#add-actions-that-connect-to-other-environments-dynamically).
- Use of user and service principal connections.

## Add actions that connect to other environments dynamically

To set the Environment parameter dynamically, select **Enter custom value** at the end of the Environment parameter selector and provide the base URL of a Power Platform environment. The URL should be in the format `https://<yourenvironmentid>.crm.dynamics.com/` and can be provided as a string, expression, environment variable, or dynamic content.

To get the base URL of an environment, open the details page of the environment from the [Power Platform admin center](https://admin.powerplatform.com), or use the output of the **List user environments** action in the [Power Automate Management](/connectors/flowmanagement/) connector.

For actions like **Add a row** that depend on the specific table schema from one environment, the schema isn't automatically retrieved when specifying the environment dynamically, and the request payload needs to be manually constructed. To use these actions, set the **Table** parameter to the `LogicalCollectionName` of the table, and the **Body** parameter to the contents of the equivalent [Dataverse Web API request](/power-apps/developer/data-platform/webapi/create-entity-web-api) in JSON format. For example, to create a new account, enter the table name as **accounts** and the body as **{"name": "Contoso Marketing"}**.

## Best practices

- For best performance, deploy flows using the Microsoft Dataverse connector to the same Power Platform environment as the data and apps they're connecting to.
  - The Microsoft Dataverse connector in Power Automate is optimized to directly connect to Dataverse through a native integration when the Environment parameter is set to `(Current)`. 
  - When connecting to other environments, it connects through the [Power Platform connectors platform](/connectors/connectors).
- Review recommended admin and governance practices around your [Power Platform environment strategy](/power-platform/guidance/adoption/environment-strategy) when planning solutions that connect to other environments, including staging flows in separate development, test, and production environments for specific business groups and applications.

## Limitations

- Dataverse connector operations connecting to other environments require the connection to remain active and the related user to have sufficient permissions in Dataverse. Actions and triggers in the current environment can continue to run as long as the related user is still active and has sufficient permissions in Dataverse, even if the connection has expired. Learn more about [maintaining Dataverse connector connections](manage-dataverse-connections.md).
- Using instant flows with the Dataverse connection set to **Provided by run-only user** isn't supported outside of the current environment yet.
- The triggers **When a row is added, modified or deleted** and **When an action is performed** don't support the Environment parameter yet.
- The `Environment` parameter isn't supported for the actions **Search rows (preview)** and **Perform a changeset**. 
