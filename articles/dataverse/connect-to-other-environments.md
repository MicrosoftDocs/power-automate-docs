---
title: Connect to other environments using the Microsoft Dataverse connector (preview)
description: Learn how to use the Microsoft Dataverse connector for actions and triggers across Power Platform environments.
suite: flow
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 10/23/2023
search.audienceType: 
  - maker
---

# Connect to other environments using the Microsoft Dataverse connector (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can automate apps, data, and processes across Power Platform environments through supported actions and triggers in the Microsoft Dataverse connector.

> [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

Previously, the Microsoft Dataverse connector supported the flow's current environment. The Dynamic 365 (deprecated) and Microsoft Dataverse (legacy) connectors were the available ways to connect to Dataverse in other environments from cloud flows. With the addition of the **Environment** parameter, the Microsoft Dataverse connector's triggers and action have the same flexibility of connecting to either the flow's current environment or choosing another.

During the preview of this capability, separate actions and triggers with names ending in **selected environment (preview)** are available to add to both new and existing flows. After the preview, Dataverse connector actions in existing flows will be automatically updated to include the **Environment** parameter. There's no action needed from flow owners or changes to existing flow behavior as part of this update.

> [!IMPORTANT]
> The updated actions with the **Environment** parameter are rolling out as a public preview to all [Power Platform regions](/power-automate/regions-overview) by the end of October 2023.

The following diagram shows a Power Automate cloud flow being triggered when a row changes in the Contoso Support environment. It takes actions in other Contoso Services and Contoso Field Service environments to list rows, add a row, and perform an action in the example Contoso Corporation's Microsoft Entra tenant.

:::image type="content" source="media/connect-to-other-environments/diagram-connect-to-other-environments.png" alt-text="Screenshot of a diagram of a Power Automate cloud flow being triggered and taking actions.":::

## Add actions that connect to other environments

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Create a new cloud flow such as an instant flow with the **Manually trigger a flow** trigger.

    Alternatively, you can open an existing flow.

1. In the flow designer, select the plus sign (**+**) to add a new action.
1. Search for **dataverse**, and then select **See more** on the **Microsoft Dataverse** connector to see all available actions.

    :::image type="content" source="media/connect-to-other-environments/cross-env-add-a-preview-action.png" alt-text="Screenshot of the Microsoft Dataverse connector actions including the new actions for Add a new row to the selected environment (preview) and Delete a row from the selected environment (preview).":::

1. Add one of actions that ends in **selected environment (preview)**, such as **List rows from selected environment (preview)**.
1. Use the **Environment** parameter in the action card to choose the environment to connect to. The connection you use for the action must have permissions to perform the operation in the other environment.

    :::image type="content" source="media/connect-to-other-environments/list-flows.png" alt-text="Screenshot of the List rows from selected environment (preview) action in the Microsoft Dataverse connector with the Environment parameter being used to select either the current environment, another environment, or enter a custom value for the environment.":::

1. To connect to Dataverse in the same environment as the flow, select **(Current)** in the Environment parameter.

## Actions and triggers that can connect to other environments

The following Microsoft Dataverse connector actions support connecting to other environments. In the flow designer, the preview actions with the environment parameter have names ending in **selected environment (preview)** for each of the following actions.

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

The actions to [search rows](/power-automate/dataverse/search) and [perform a changeset request](/power-automate/dataverse/change-set) don't have preview actions with the Environment parameter yet.

The following triggers support connecting to other environments but haven't been released yet:

- [When a row is added, modified or deleted](/power-automate/dataverse/create-update-delete-trigger)
- [When an action is performed](/power-automate/dataverse/action-trigger)

The following triggers won't support the Environment parameter since they're only applicable to the same environment the flow is located in.
- When a flow step is run from a business process flow
- [When a row is selected](/power-automate/connection-cds#initiate-a-cloud-flow-from-dataverse)

## Features supported by the Environment parameter in the preview actions and triggers

- Connect to other environments in the same tenant as the connection used with the action or trigger.
- Connect to environments in other tenants when using a connection to another tenant.
  - To restrict connections to other tenants from the Microsoft Dataverse connector and other connectors, you can configure Power Platform tenant isolation policies. To learn more, go to [Cross-tenant inbound and outbound restrictions](/power-platform/admin/cross-tenant-restrictions).
- [Specify the environment dynamically](#add-actions-that-connect-to-other-environments-dynamically).
- Service principal connections can be used to connect to other environments.

## Add actions that connect to other environments dynamically

To set the Environment parameter dynamically instead of selecting a specific environment, select **Enter custom value** at the end of the Environment parameter selector and provide the root URL of a Power Platform environment in the format `https://<yourenvironmentid>.crm.dynamics.com/`. The URL can be provided as a string, expression, environment variable, or as dynamic content from the trigger or other actions in the flow.

To get the root URL of an environment, you can open the details page of the environment from the [Power Platform admin center](https://admin.powerplatform.com), or use the output of the **List user environments** action in the [Power Automate Management](/connectors/flowmanagement/) connector.

For actions like **Add a row** that depend on the specific table schema from one environment, the schema won't be automatically retrieved when specifying the environment dynamically. The request must be manually created using the `LogicalCollectionName` of the table and the body for the request in JSON format, similar to a [Dataverse Web API request](/power-apps/developer/data-platform/webapi/create-entity-web-api). For example, **accounts** and  **{ "name": "Contoso Marketing" }**.

## Best practices

- For best performance, deploy flows using the Microsoft Dataverse connector to the same Power Platform environment as the data and apps they are connecting to.
  - The Microsoft Dataverse connector in Power Automate is optimized to directly connect to Dataverse through a native integration when the Environment parameter is set to `(Current)`.
  - When connecting to other environments, it connects through the [Power Platform connectors platform](/connectors/connectors).
- Review recommended admin and governance practices around your [Power Platform environment strategy](/power-platform/guidance/adoption/environment-strategy) when planning solutions that connect to other environments, including staging flows in separate development, test, and production environments for specific business groups and applications.

## Limitations

- Using instant flows with the Dataverse connection set to **Provided by run-only user** isn't supported yet.
- The triggers **When a row is added, modified or deleted** and **When an action is performed** don't support the Environment parameter yet.
- The actions to **Search rows** and **Perform a changeset** request don't have preview actions with the Environment parameter yet.

