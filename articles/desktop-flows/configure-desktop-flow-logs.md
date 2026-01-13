---
title: Configure desktop flow logs behavior
description: Configure desktop flow log verbosity and storage destination in Power Platform Admin Center.
ms.topic: how-to
ms.date: 01/13/2026
ms.author: appapaio
ms.reviewer: ellenwehrle
contributors:
  - DanaMartens
  - QuentinSele
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
---

# Desktop flow action logs configuration

This article provides configuration guidance for desktop flow logs, located under the environment's feature section in the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and in Power Automate for verbosity configuration of specific flows.

> [!IMPORTANT]
>
> - This feature only applies to desktop flows that are launched from a cloud flow. It's not available yet for local attended runs from Power Automate desktop.

The **Activation status of run action logs** setting defines when desktop flow run action logs should be captured and even allows you to turn them off completely.

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png" alt-text="Screenshot and environment-level setting allowing you to configure when desktop flow logs should be captured." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png":::

| Activation status | Details |
|---|---|
| **Enabled (default)** | This option is the default for both existing and new environments where the system captures logs as usual. |
| **On run failure** | This option only captures desktop flow actions logs when there's a runtime error. This setting means that logs aren't available for every single run, but only when an error occurs. However, if an error does occur, all logs for that particular run are available, including both successful and failed actions. |
| **Disabled** | This option disables desktop flow run action logs. |

> [!CAUTION]
> Changing any of these settings can significantly affect features such as run failure troubleshooting and auditing. Consider the implications of changing these settings before proceeding.

## Prerequisites

- Premium Power Automate license and administrative privileges to configure log settings
- Power Automate URL and IP address configurations
  - [Public cloud](/power-automate/ip-address-configuration#required-services)
  - [Government cloud](/power-automate/us-govt#power-automate-us-government-service-urls)
  
## Configure desktop flow action log version

Use the **Action logs version** setting to choose V1, V2, or both.

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png" alt-text="Screenshot and environment-level setting allowing you to configure desktop flow logs V2." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png":::

| Logs version | Explanation |  
|---|---|  
| **V1 - Stored in the AdditionalContext field of the FlowSession entity**| This option is the default. Logs are stored in the AdditionalContext field of the Flow Session table, which is a file attribute stored as a blob in Microsoft Dataverse. Logs V1 consumes [Dataverse file capacity](/power-platform/admin/capacity-storage). |  
| **V2 - Stored in the FlowLogs entity** | This option allows you to store logs in the Flow Logs table, which is stored in [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables). Logs V2 consumes [Dataverse log capacity](/power-platform/admin/capacity-storage).  |  
| **Both** | This setting allows logs to be stored in both the traditional AdditionalContext field of the Flow Session table and the Flow Logs table. This feature consumes both Dataverse file and log capacity. This setting is intended for debugging or testing purposes because it consumes both [Dataverse log and file capacity](/power-platform/admin/capacity-storage).  |    

The **FlowLogs entity time to live in minutes** value determines how long action logs are retained in the Flow Logs elastic table. Dataverse automatically deletes records that are older than the specified time frame. Here are some example values for your convenience.

| Days   | Minutes     |
|--------|-------------|
| One day  | 1,440 minutes |
| Three days | 4,320 minutes |
| Seven days | 10,080 minutes |
| 14 days | 20,160 minutes |
| 28 days | 40,320 minutes |
| 60 days | 86,400 minutes |
| 90 days | 129,600 minutes |
| 180 days | 259,200 minutes |
| 365 days | 525,600 minutes |
| Forever | 0 (zero) minutes |

> [!NOTE]
> Before enabling logs V2, make sure you have sufficient Dataverse log capacity that supports the data retention settings and aligns with your capacity planning and entitlement. Adjust as necessary. See the [Sample Dataverse capacity demand calculations for logs V2](#dataverse-capacity-demand-calculations-for-logs-v2) section for sizing examples.

## Key differences between desktop flow logs V1 and V2

The following table describes the differences between desktop flow logs V1 and V2:

| Feature | Logs V1 | Logs V2 | Details |  
|---|---|---|---|  
| Automatic data retention | Not available | Available | V2 uses [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables), which Azure Cosmos DB powers and comes with a built-in time-to-live feature for automatic data retention. |  
| Support for large log sizes | Roughly up to 50,000 to 80,000 action logs (maximum) | Minimum 100,000 actions, can go up to 10 million actions depending on the actions generated and the duration of execution | V2 can theoretically scale up to gigabytes worth of action logs per run in the future, whereas V1 can only scale to the volume specified in this table. |
| Support for advanced reporting and governance | Not available | Available | In V1, the AdditionalContext attribute is a file type, stored as a blob in Dataverse, making it challenging to parse for reporting and governance controls. Logs are much more accessible in V2. |
| Support for Azure Synapse Link for Dataverse integration | Not available | Available | In V1, the AdditionalContext attribute is a file type, stored as a blob in Dataverse, which isn't supported for synchronization to Azure Synapse. |
| Support for Dataverse auditing | Not available | Available | In V1, the AdditionalContext attribute is a file type, stored as a blob in Dataverse, which isn't supported in Dataverse auditing. |
| Support for Dataverse long-term retention | Not available | Planned | In V1, the AdditionalContext attribute is a file type, stored as a blob in Dataverse, which isn't supported in Dataverse long-term retention. |
| Based on Dataverse Role-Based Access Control (RBAC) | Available | Available | Both versions use Dataverse RBAC, inheriting action log permissions from their parent flow session record. |

Logs V2 offers significant enhancements over the previous version, V1. V2 uses the [elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables) feature, which is great for handling large data volumes, like action log scenarios, and has built-in data retention (TTL). It's ideal for organizations needing to access significant amounts of data for reporting, governance, and integration with automatic data retention control.

## Dataverse capacity demand calculations for logs V2

The following table shows sample Dataverse log storage consumption estimates per desktop flow run when using logs V2. It outlines the approximate storage demand for different numbers of actions, assuming an average of 3 KB of storage per action.

| Number of actions | Storage demand per action (KB) | Total storage consumption (MB) |  
|---|---|---|  
| 1,000 | 3 | 2.93 |  
| 10,000 | 3 | 29.3 |  
| 30,000 | 3 | 87.9 |  
| 60,000 | 3 | 175.8 |  
| 100,000 | 3 | 293 |  
| 160,000 | 3 | 480 |  

> [!IMPORTANT]
> The Dataverse log storage consumption figures are just estimates. Actual storage consumption can vary significantly. The exact storage demand depends on the specific details and complexity of each action log. Use these numbers as a rough guide for understanding the potential storage demand and planning your storage requirements.

## Action logs verbosity

Desktop Flow Logs V2 lets you set verbosity levels to balance observability and storage efficiency. Each level controls how much detail logs show during flow execution.
This section describes the available verbosity levels for desktop flow action logs, how  to configure them at the environment level in Power Platform Admin Center (admins only), and how to configure them for individual desktop flows.

### Verbosity levels in desktop flow action logs

| **Verbosity Level** | **Description**                                                                                     | **Includes**                                                                                   | **Notes**                                                                                      |
|---------------------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Full                | Captures all logs, including built-in system actions.                                               | Condition, loop, and all other system-generated logs.                                         | Default setting. It's the most comprehensive, but can use more storage.                        |
| Debug               | Focuses on action results.                                                                           | Outputs and results of each action executed in the flow.                                      | Useful for detailed troubleshooting without full system noise.                                |
| Custom              | Logs user-defined messages and all warnings and errors.                                                 | Explicit `Log Message` actions by the user, plus all warnings and errors.                    | Allows users to control what gets logged. Can be used to fine-tune verbosity.                 |
| Warning             | Captures only warning and error messages.                                                           | Any runtime warnings or errors during flow execution.                            | Helps reduce noise while still surfacing potential issues.                                    |
| Error               | Logs only error messages.                                                                            | Critical failures that stop flow execution or cause incorrect behavior.                   | Minimal logging for performance-sensitive environments.                                       |

### Configure action log verbosity in the Power Platform Admin Center (Admin only)

Admins can set the **default verbosity level** for an entire environment. This setting applies to all desktop flows unless overridden at the flow level.

1. Sign in to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the Manage section, select **Environments** and then select the environment where your desktop flows run.
1. Select **Settings**.
1. Expand **Product** and select **Features**.
1. Locate the **Action logs verbosity** setting in the **Desktop flow run action logs configuration** section.
1. Choose your default level: Error, Warning, Custom, Debug, or Full.
1. Select **Save** to apply the configuration.

    :::image type="content" source="media/configure-desktop-flow-logs/desktop-flows-verbosity-setting.png" alt-text="Locate the action logs verbosity setting in the environment's feature setting page.":::    
> [!NOTE]
>
> This setting acts as the default for the whole environment.
>
> Makers can override the setting for specific flows (see [next section](#configure-action-log-verbosity-for-a-specific-desktop-flow)).
>
> Allow a few minutes for setting changes to take effect.

### Configure action log verbosity for a specific desktop flow

Makers can configure verbosity for each desktop flow from the Power Automate portal. This local setting overrides the admin default.

Override the environment setting when you need to: 
- Debug a specific desktop flow without increasing logs for the entire environment.
- Temporarily increase verbosity during testing or troubleshooting.

Follow these steps to configure action log verbosity for a specific desktop flow:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Open the flow details page of the desktop flow you want to configure.
1. Select **Edit** and locate the Action logs verbosity section.
1. Select the desired verbosity level for this specific flow.

  > [!IMPORTANT]
  > When a maker changes the verbosity level for an individual desktop flow, they can only select a verbosity level that is equal to or higher than the environment's default value. For example, if the environment is configured at Debug, the maker can't choose Custom, Warning, or Error levels.
  >
  > If administrators later change the environment's verbosity level after a flow is configured individually, the logs generated always follow the highest value between the environment setting and the desktop flow's own configuration.

1. Save your changes.

> [!NOTE]
> You can also configure verbosity level from Power Automate desktop app (PAD).

## Query data logs V2

You can access desktop flow action logs data by making an API call to the Dataverse backend. You can use the traditional API call syntax or the new [ExecuteCosmosSqlQuery](/power-apps/developer/data-platform/webapi/reference/executecosmossqlquery) method. By using this method, you can execute a SQL query against Dataverse, which enables you to retrieve and filter data.

The data logs model V2 is based on a parent-child relationship between the flow session and flow log tables. Every record inherits permissions from its parent flow session record. To query action logs of a specific desktop flow run, use the following query syntax.

### Traditional Dataverse API call syntax

The following API call retrieves a specific flow session by its ID (aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb) and then accesses the associated action logs through the `flowsession_flowlog_parentobjectid` relationship.

```http
[Organization URI]/api/data/v9.0/flowsessions(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)/flowsession_flowlog_parentobjectid  
```

### New ExecuteCosmosSqlQuery API call syntax using FlowLogs table

```http
    [Organization URI]/api/data/v9.2/ExecuteCosmosSqlQuery(
    QueryText=@p1,EntityLogicalName=@p2,QueryParameters=@p3,PageSize=@p4)?
    @p1: 'SELECT c.props.flowlogid as flowlogid, c.props.createdon as createdon, c.props.data as data, c.props.level as level, c.props.type as type, c.ttl as ttlinseconds, c.props.cloudflowid as cloudflowid, c.props.cloudflowrunid as cloudflowrunid, c.props.desktopflowid as desktopflowid, c.props.flowmachineid as flowmachineid, c.props.flowmachinegroupid as flowmachinegroupid, c.props.flowsessionid as flowsessionid, c.props.workqueueid as workqueueid, c.props.workqueueitemid as workqueueitemid FROM c WHERE c.props.type IN (100000001) ORDER BY c.props.data.startTime DESC'
    @p2: 'flowlog'
    @p3: {"Keys":["@referencingParentId","@referencingParentLogicalName"],"Values":[{"Type":"System.Guid","Value":"40590757-a9c0-4f4c-abfc-e2f389049d90"},{"Type":"System.String","Value":"flowsession"}]}
    @p4: 50
```

Learn more about [querying JSON columns in elastic tables](/power-apps/developer/data-platform/query-json-columns-elastic-tables).

### Breaking down the call into individual pieces

- The base URL (https://[my org].api.crm[my region].dynamics.com/api/data/v9.2/) is the endpoint for the Dataverse Web API.
- `ExecuteCosmosSqlQuery` is the method you're calling. This method runs a SQL query against Dataverse.
- The parameters for the `ExecuteCosmosSqlQuery` method are provided in parentheses following the method name:
  - `QueryText=@p1`: The SQL query to run. This query selects various properties from a table where the *type* is 100000001 (desktop flow action log type) and orders the results by the `startTime` property in descending order.
  - `EntityLogicalName=@p2`: The logical name of the table (`flowlog`) that stores the action logs.
  - `QueryParameters=@p3`: A JSON object specifying parameters for the query. In the previous example, it specifies a key-value pair where the keys are `@referencingParentId` and `@referencingParentLogicalName` with values of `flowsessionid` (GUID) and type of the table `flowsession`.
  - `PageSize=p4`: The query page size.

## Known limitations  
  
- Logs V2 are only available for desktop flow runs that the user starts from a cloud flow through the desktop flow connector action.
- Bulk-delete jobs aren't currently supported for the **Flow Log** table.
- You can't view flow log records yet in the *Table* section of the [Power Apps maker portal](make.powerapps.com).
- Changing action log version doesn't migrate previous desktop flow action logs to the new log storage type.
- Don't use the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) and [FlowLog](/power-apps/developer/data-platform/reference/entities/flowlog) entities as targets for the *When a row is added, modified or deleted* flow trigger. Using these entities as targets might cause an infinite loop because the system creates records in these tables every time a flow runs.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
