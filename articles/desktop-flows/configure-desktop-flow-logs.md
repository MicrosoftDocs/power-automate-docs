---
title: Configure desktop flow logs behavior (preview)
description: Configure desktop flow log verbosity and storage destination in Power Platform Admin Center.
ms.topic: conceptual
ms.date: 05/01/2024
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
---

# Desktop flow action logs configuration (preview)

This page provides configuration guidance for desktop flow logs within the feature section of an individual environment in [Power Platform admin center](https://admin.powerplatform.microsoft.com).

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality.
> - This feature isn't available yet for local attended runs from Power Automate desktop.
> - These features are available before an official release so that customers can get early access and provide feedback.

The **Activation status of the run action logs** setting defines when desktop flow run action logs should be captured and even allows you to turn them off completely.

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png" alt-text="Screenshot and environment-level setting allowing you to configure when desktop flow logs should be captured." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png":::

| Activation status | Details |
|---|---|
| **Enabled (default)** | This is the default option for both existing and new environments where logs are captured as usual. |
| **On run failure** | This option **only** captures desktop flow actions logs in the event of a runtime error. This means that logs won't be available for every single run, but only when an error occurs. However, if an error does occur, all logs for that particular run are available, including both successful and failed actions. |
| **Disabled** | This option effectively **disables** desktop flow run action logs **completely**. |

> [!CAUTION]
> Changing any of these settings can have a significant impact on features such as run failure troubleshooting and auditing. Consider the implications of changing these settings before proceeding.

## Configure desktop flow action log version (preview)

The **Action log version** allows you to choose between logs V1, V2, or using both.

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png" alt-text="Screenshot and environment-level setting allowing you to configure desktop flow logs V2." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png":::

| Logs version | Explanation |  
|---|---|  
| **V1 - Stored in the AdditionalContext field of the FlowSession entity**| This is the default value, where logs are stored as before in the 'AdditionalContext' field of the 'Flow Session' entity, which is a file attribute and stored as a blob in Dataverse. Logs V1 consumes Dataverse file capacity. Learn more about [Dataverse capacity](/power-platform/admin/capacity-storage) |  
| **V2 - Stored in the FlowLogs entity (Preview)** | This is a new option, allowing you to store logs in the 'FlowLogs' entity, which is backed by [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables). Logs V2 consumes Dataverse database capacity. Learn more about [Dataverse capacity](/power-platform/admin/capacity-storage) |  
| **Both (Preview)** | This setting allows logs to be stored in both the traditional 'AdditionalContext' field of the 'FlowSession' entity and the 'FlowLogs' entity. This feature is also in preview and will consume both, Dataverse file and database capacity. This is targeted for debugging or testing purposes as it will consume both, Dataverse database and file capacity. Learn more about [Dataverse capacity](/power-platform/admin/capacity-storage) |  

The **FlowLogs entity time to live in minutes (Preview)** value determines the time that action logs should be retained in the 'FlowLogs' elastic table. Records that are older that the specified time-frame will be automatically deleted by Dataverse. Here are some example values for your convenience.

| Days   | Minutes     |
|--------|-------------|
| 1 day  | 1,440 minutes |
| 3 days | 4,320 minutes |
| 7 days | 10,080 minutes |
| 14 days | 20,160 minutes |
| 28 days | 40,320 minutes |
| 60 days | 86,400 minutes |
| 90 days | 129,600 minutes |
| 180 days | 259,200 minutes |
| 365 days | 525,600 minutes |
| Forever | Less than or equal to 0 (zero) minutes |

> [!NOTE]
> Before enabling logs V2, make sure you have sufficient Dataverse capacity that would support the data retention settings and aligns with your capacity planning, entitlement and adjust as necessary. See the [Sample Dataverse capacity demand calculations for logs V2](#sample-dataverse-capacity-demand-calculations-for-logs-v2) section below for some sizing examples.

### Key differences of desktop flow logs V1 and V2

| Feature | Logs V1 | Logs V2 | Details |  
|---|---|---|---|  
| Automatic Data Retention | Not Available | Available | V2 uses [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables) which is powered by Azure Cosmos DB and comes with a built-in time-to-live feature for automatic data retention. |  
| Support for large log sizes | Roughly up to 50,000 to 80,000 action logs (maximum) | Roughly twice the number of V1 action logs (initially) | V2 could theoretically scale up to gigabytes worth of action logs per run in future, whereas V1 can only scale to the volume specified in this table. |
| Support for advanced reporting and governance | Not Available | Available | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, making it challenging to parse for reporting and governance controls. Logs are much more accessible in V2. |
| Support for Azure Synapse Link for Dataverse integration | Not Available | Planned | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, which isn't supported for synchronization to Azure Synapse. Logs V2 can be synced to Azure Synapse. |
| Support for Dataverse auditing | Not Available | Planned | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, which isn't supported in Dataverse auditing. |
| Support for Dataverse long-term retention | Not Available | Planned | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, which isn't supported in Dataverse auditing. |
| Based on Dataverse Role-Based Access Control (RBAC) | Available | Available | Both versions use Dataverse RBAC, inheriting action log permissions from their parent 'flowsession' record. |

Logs **V2** offers significant enhancements over the previous version, V1. V2 uses the [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables) feature, which is great for handling large data volumes, like action log scenarios, and has built-in data retention (TTL). Ideal for organizations needing to access significant amount of data for reporting, governance, and integration with automatic data retention control.

## Sample Dataverse capacity demand calculations for logs V2  

The following table shows sample Dataverse database storage consumption estimates per desktop flow run when using Logs V2. It outlines the approximate storage demand for different numbers of actions, assuming an average of 3-KB storage per action.

| Number of actions | Storage demand per action (KB) | Total storage consumption (MB) |  
|---|---|---|  
| 1,000 | 3 | 2.93 |  
| 10,000 | 3 | 29.3 |  
| 30,000 | 3 | 87.9 |  
| 60,000 | 3 | 175.8 |  
| 100,000 | 3 | 293 |  
| 160,000 | 3 | 480 |  

> [!IMPORTANT]
> The figures shown in the table above are just estimates and the actual storage consumption can vary significantly. The exact storage demand will depend on the specific details and complexity of each action log. Therefore, these numbers should be used as a rough guide for understanding the potential storage demand and planning your storage requirements accordingly.

### Querying logs V2 data

Accessing desktop flow action logs data can be achieved by making an API call to Microsoft's Dataverse backend, either using the traditional API call syntax or using the new [ExecuteCosmosSqlQuery](/power-apps/developer/data-platform/webapi/reference/executecosmossqlquery) method. This method allows you to execute a SQL query against the Dataverse, enabling the retrieval, filtering, and manipulation of data.

The data model of logs V2 is based on a parent-child relationship between the 'Flowsession' and 'FlowLogs' table. Every record inherits permissions from its parent 'Flowsession' record. In order to query action logs of a specific desktop flow run, you can use the following query syntax.

#### Traditional Dataverse API call syntax

The following API call retrieves a specific flow session by its ID (9d51aa1f-315e-43ab-894f-bc445dfb049b), and then accesses the associated action logs using the *flowsession_flowlog_parentobjectid* relationship.

```http
[Organization URI]/api/data/v9.0/flowsessions(9d51aa1f-315e-43ab-894f-bc445dfb049b)/flowsession_flowlog_parentobjectid  
```

#### New ExecuteCosmosSqlQuery API call syntax using FlowLogs table

```http
    [Organization URI]/api/data/v9.2/ExecuteCosmosSqlQuery(
    QueryText=@p1,EntityLogicalName=@p2,PartitionId=@p3,QueryParameters=@p4,PageSize=@p5)?
    @p1='SELECT+c.props.flowlogid+as+flowlogid,+c.props.createdon+as+createdon,+c.props.data+as+data,+c.props.level+as+level,+c.props.type+as+type,+c.ttl+as+ttlinseconds,+c.props.cloudflowid+as+cloudflowid,+c.props.cloudflowrunid+as+cloudflowrunid,+c.props.desktopflowid+as+desktopflowid,+c.props.flowmachineid+as+flowmachineid,+c.props.flowmachinegroupid+as+flowmachinegroupid,+c.props.flowsessionid+as+flowsessionid,+c.props.workqueueid+as+workqueueid,+c.props.workqueueitemid+as+workqueueitemid+FROM+c+WHERE+c.props.type+IN+(100000001)+ORDER+BY+c.props.data.startTime+DESC'&
    @p2='flowlog'&
    @p3='flowsession_9d51aa1f-315e-43ab-894f-bc445dfb049b'&
    @p4={"Keys":["@referencingParentId"],"Values":[{"Type":"System.Guid","Value":"9d51aa1f-315e-43ab-894f-bc445dfb049b"}]}&@p5=50  
```

Learn more about [querying JSON columns in elastic tables](/powerapps/developer/data-platform/query-json-columns-elastic-tables.md).

#### Breaking down the call into individual pieces

- The base URL (https://[my org].api.crm[my region].dynamics.com/api/data/v9.2/) is the endpoint for the Dataverse's Web API.
- ExecuteCosmosSqlQuery is the method being called. This method allows the execution of a SQL query against Dataverse.
- The parameters for the ExecuteCosmosSqlQuery method are provided in parentheses following the method name. These are:
  - QueryText=@p1: The SQL query to be executed. In this case, the query is selecting various properties from a table where the 'type' is 100000001 (desktop flow action log type) and ordering the results by the 'startTime' property in descending order.
  - EntityLogicalName=@p2: This is the logical name of the entity ('flowlog') that stores the action logs.
  - PartitionId=@p3: This parameter is used to identify the partition within Azure Cosmos DB where the query is to be executed. It's set to 'flowsession_[FlowSessionId]'.
  - QueryParameters=@p4: This is a JSON object specifying parameters for the query. Here, it's specifying a key-value pair where the key is '@referencingParentId' and the value is the flowsessionId (GUID).

## Known limitations  
  
- Cascade delete isn't yet supported. Therefore, it's recommended to avoid removing TTL.
- Logs V2 are only available for desktop flow runs that have been launched from a cloud flow through the desktop flow connector action.
- Changing action log version doesn't migrate previous desktop flow action logs to the new log storage type.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
