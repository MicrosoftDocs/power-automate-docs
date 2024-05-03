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

This page provides configuration guidance on the new desktop flow logs configuration feature within the [Power Platform admin center](https://admin.powerplatform.microsoft.com). This feature offers admins the ability to configure  desktop flow action logging, providing options to store logs in either existing storage or the newly introduced [Dataverse Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables) storage format.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality.
> - This feature isn't available yet for local attended runs from Power Automate desktop.
> - These features are available before an official release so that customers can get early access and provide feedback.

## Desktop flow action logs V1 (preview)

With desktop flow action logs **V1**, you can configure when desktop flow run action logs should be captured or turn them off completely, using the **Activation status of the run action logs** environment feature setting in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png" alt-text="Screenshot and environment-level setting allowing you to configure desktop flow logs V1." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v1.png":::

| Log-level | Details |
|---|---|
| **Enabled (default)**| This is the default option for both existing and new environments where logs are captured as usual. |
| **On run failure**| This option **only** captures desktop flow actions logs in the event of a runtime error. This means that logs won't be available for every single run, but only when an error occurs. However, if an error does occur, all logs for that particular run are available, including both successful and failed actions. |
| **Disabled** | This option effectively **disables** desktop flow run action logs **completely**. |

## Desktop flow action logs V2 (preview)

Desktop flow action logs **V2** offers significant enhancements over the previous version, V1. It uses Microsoft's [Dataverse Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables) technology, which can handle large amounts of data, such as action logs, and comes with built-in data retention features (time-to-live or TTL), making it an ideal choice for organizations dealing with significant data that needs to be accessed for reporting and integrations. The choice between V1 or V2 and the setting the retention period for V2 logs are controlled by two distinct settings available in the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

### Key differences of desktop flow logs V1 and V2

| Feature | Logs V1 | Logs V2 | Details |  
|---|---|---|---|  
| Automatic Data Retention | Not Available | Available | V2 uses [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables) which is powered by Azure Cosmos DB and comes with a built-in time-to-live feature for automatic data retention. |  
| Support for large log sizes | Up to 32 MB | Initially 64 MB | V2 has a theoretical limit of 20 GB per desktop flow run to which we could potentially scale up to in future. |  
| Support for advanced reporting and governance | Not Available | Available | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, making it challenging to parse for reporting and governance controls. Logs are much more accessible in V2. |  
| Support for Azure Synapse Link for Dataverse integration | Not Available | Available | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, which isn't supported for synchronization to Azure Synapse. Logs V2 can be synced to Azure Synapse. |  
| Support for Dataverse auditing | Not Available | Available | In V1, the attribute 'additionalcontext' is a file type, stored as a blob in Dataverse, which isn't supported in Dataverse auditing. Logs V2 supports Dataverse auditing. |  
| Based on Dataverse Role-Based Access Control (RBAC) | Available | Available | Both versions use Dataverse RBAC, inheriting action log permissions from their parent 'flowsession' record. |  

:::image type="content" source="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png" alt-text="Screenshot and environment-level setting allowing you to configure desktop flow logs V2." lightbox="media/desktop-flow-logs/configure-desktop-flow-logs-v2.png":::

## Configuring desktop flow logs version

| Configuration Value | Explanation |  
|---|---|  
| **V1 - Stored in the AdditionalContext field of the FlowSession entity**| Logs are stored in the 'AdditionalContext' field of the 'Flow Session' entity, which is a file attribute and stored as a blob in Dataverse. Logs V1 consumes Dataverse file capacity. |  
| **V2 - Stored in the FlowLogs entity (Preview)** | Logs are stored in the 'FlowLogs' entity, which is backed by [Elastic Tables](/power-apps/maker/data-platform/create-edit-elastic-tables). Logs V2 consumes Dataverse Database capacity that is much more performant and accessible but also significantly more expensive than file based capacity. |  
| **Both (Preview)** | This setting allows logs to be stored in both the traditional 'AdditionalContext' field of the 'FlowSession' entity and the 'FlowLogs' entity. This feature is also in preview and will consume both, Dataverse file and database capacity. |  

> [!CAUTION]
> Changing these settings can have a significant impact on features such as run failure troubleshooting and auditing. Consider the implications of changing these settings before proceeding.

### Sample Dataverse capacity demand calculations for logs V2  

The following table shows sample storage consumption estimates per desktop flow run when using Logs V2. It outlines the approximate storage demand for different numbers of actions, assuming an average of 3-KB storage per action.

| Number of actions | Storage demand per Action (KB) | Total storage consumption (MB) |  
|---|---|---|  
| 1,000 | 3 | 2.93 |  
| 10,000 | 3 | 29.3 |  
| 30,000 | 3 | 87.9 |  
| 60,000 | 3 | 175.8 |  
| 100,000 | 3 | 293 |  

> [!IMPORTANT]
> The figures shown in the table above are just estimates and the actual storage consumption can vary significantly. The exact storage demand will depend on the specific details and complexity of each action log. Therefore, these numbers should be used as a rough guide for understanding the potential storage demand and planning your storage requirements accordingly. Always monitor your actual storage consumption to ensure it aligns with your capacity planning, entitlement and adjust as necessary.

### Querying logs V2 data

Accessing desktop flow action logs data can be achieved by making an API call to Microsoft's Dataverse backend, either using the traditional API call syntax or using the new [ExecuteCosmosSqlQuery](/power-apps/developer/data-platform/webapi/reference/executecosmossqlquery) method. This method allows you to execute a SQL query against the Dataverse, enabling the retrieval, filtering, and manipulation of data.

The data model of logs V2 is based on a parent-child relationship between the 'Flowsession' and 'FlowLogs' table. Every record inherits permissions from its parent 'Flowsession' record. In order to query action logs of a specific desktop flow run, you can use the following query syntax.

#### Traditional Dataverse API call syntax

The following API call retrieves a specific flow session by its ID (9d51aa1f-315e-43ab-894f-bc445dfb049b), and then accesses the associated action logs using the *flowsession_flowlog_parentobjectid* relationship.

```http
https://[my org].api.crm[my region].dynamics.com/api/data/v9.0/flowsessions(9d51aa1f-315e-43ab-894f-bc445dfb049b)/flowsession_flowlog_parentobjectid  
```

#### New ExecuteCosmosSqlQuery API call syntax using FlowLogs table

```http
    https://[my org].api.crm[my region].dynamics.com/api/data/v9.2/ExecuteCosmosSqlQuery(QueryText=@p1,EntityLogicalName=@p2,PartitionId=@p3,QueryParameters=@p4,PageSize=@p5)?@p1='SELECT+c.props.flowlogid+as+flowlogid,+c.props.createdon+as+createdon,+c.props.data+as+data,+c.props.level+as+level,+c.props.type+as+type,+c.ttl+as+ttlinseconds,+c.props.cloudflowid+as+cloudflowid,+c.props.cloudflowrunid+as+cloudflowrunid,+c.props.desktopflowid+as+desktopflowid,+c.props.flowmachineid+as+flowmachineid,+c.props.flowmachinegroupid+as+flowmachinegroupid,+c.props.flowsessionid+as+flowsessionid,+c.props.workqueueid+as+workqueueid,+c.props.workqueueitemid+as+workqueueitemid+FROM+c+WHERE+c.props.type+IN+(100000001)+ORDER+BY+c.props.data.startTime+DESC'&@p2='flowlog'&@p3='flowsession_9d51aa1f-315e-43ab-894f-bc445dfb049b'&@p4={"Keys":["@referencingParentId"],"Values":[{"Type":"System.Guid","Value":"9d51aa1f-315e-43ab-894f-bc445dfb049b"}]}&@p5=50  
```

##### Breaking down the call into individual pieces

- The base URL (https://[my org].api.crm[my region].dynamics.com/api/data/v9.2/) is the endpoint for the Dataverse's Web API.
- ExecuteCosmosSqlQuery is the method being called. This method allows the execution of a SQL query against Dataverse.
- The parameters for the ExecuteCosmosSqlQuery method are provided in parentheses following the method name. These are:
  - QueryText=@p1: The SQL query to be executed. In this case, the query is selecting various properties from a table where the 'type' is 100000001 and ordering the results by the 'startTime' property in descending order.
  - EntityLogicalName=@p2: This is the logical name of the entity you're querying. Here, it's set to 'flowlog'.
  - PartitionId=@p3: This parameter is used to identify the partition within the Cosmos DB where the query is to be executed. It's set to 'flowsession_9d51aa1f-315e-43ab-894f-bc445dfb049b'.
  - QueryParameters=@p4: This is a JSON object specifying parameters for the query. Here, it's specifying a key-value pair where the key is '@referencingParentId' and the value is a GUID.

## Known limitations  
  
- Cascade delete isn't yet supported. Therefore, it's recommended to avoid removing TTL.

### See also

- [Create Power Automate desktop flows](create-flow.md).
- [Run desktop flows](run-desktop-flow.md).
- [Manage desktop flows](manage.md).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
