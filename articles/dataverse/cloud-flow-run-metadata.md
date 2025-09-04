---
title: Manage cloud flow run history in Dataverse
description: Learn how to apply the extensibility of Dataverse to track the results of your cloud flow executions at scale.
author: chrisgarty
contributors:
  - rpapostolis
  - rakrish84
  - chrisgarty
  - v-aangie
  - quentinsele
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 03/28/2025
ms.author: cgarty
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType:
  - flowmaker
  - enduser
---

# Manage cloud flow run history in Dataverse

With cloud flow run history in Dataverse, you can apply the extensibility of [Dataverse](/power-apps/maker/data-platform/) to track the results of your cloud flow executions at scale. With this feature, you can use the power of Dataverse’s common data architecture, including [Role-Based Access Control (RBAC)](/power-platform/admin/wp-security-cds#role-based-security), to manage the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data. Only solution cloud flows, with their definitions in Dataverse, can have their run history stored in Dataverse.

As part of this feature, each cloud flow execution has an entry in the table [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun). This feature is using Dataverse’s nonrelational database, [elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables), to store the cloud flow run history.

Cloud flow run history in Dataverse is used by the [automation center](/power-automate/automation-center-overview) to provide comprehensive monitoring and troubleshooting experiences for automation processes across Power Automate.

## Cloud flow run elements

The [**FlowRun**](/power-apps/developer/data-platform/reference/entities/flowrun) table contains key elements of a cloud flow run, including the following:

|Element  |Description  |
|---------|---------|
|Name     |Primary key and the logic app Id of the flow run. |
|Start time   | When the cloud flow execution was triggered. |
|End time     | When the cloud execution was finished. |
|Run duration | Time, in seconds, for the cloud flow to finish the run. |
|Status | End result of the flow execution (**Success**, **Failed**, or **Cancelled**). |
|Trigger type | The trigger type of this flow run (**Automated**, **Scheduled**, or **Manual**). |
|Error code | Error code returned from the flow execution.|
|Error message | Detailed error message, if applicable, returned from the flow execution. |
|Owner | Owner of the flow. |
|Workflow name | Display name of the cloud flow. |
|Workflow Id | WorkflowID of the specific cloud flow, |
|IsPrimary | Binary value to denote whether this flow run has any parent cloud flow triggering it. |
|Parent Run Id | Name of the parent cloud flow run instance, if this record is for a child flow. |
|Partition Id | Partition Id of this user in the elastic table instance. |
|Time to live | Time in seconds of when this run record is automatically deleted. |

You can view and update the details through [standard Dataverse APIs](/power-apps/developer/data-platform/webapi/query-data-web-api), the [Dataverse connector](/connectors/commondataserviceforapps/), or directly from the **Tables** view in the maker portal.

Since this feature is built on elastic tables, we store the cloud run history data in specific logical partitions for optimized performance. The run history data is partitioned based on users, so each user in an organization has a dedicated partition.

[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data uses [Dataverse database storage capacity](/power-platform/admin/capacity-storage#dataverse-tab). Storage use across environments [can be monitored in the Power Platform admin center](/power-platform/admin/capacity-storage#verifying-your-new-storage-model).

## Storage use for FlowRun records

By default, flow run data is stored for 28 days (2,419,200 seconds). If you want to modify the duration of how long the executions can be stored, you can update the [**Time to live (in seconds) for the flow run** in the **Organization** table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) in an environment backed with Dataverse. Depending on your environment’s storage capacity, you can adjust the length of storage for these run records.

The [FlowRunTimeToLiveInSeconds value on the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) can be changed in the [PowerApps table browser](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel#view-tables) or using the [Dataverse Web API](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/13593424/25bd0eda-0dde-4378-9793-7090fbca5916).

## Turn on or reduce storage of cloud flow run history

If the [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) is changed, then the lifetime of any new **[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun)** records is retained for that length of time. Lowering the value can reduce the number of [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records, and storage used, over time.

### Set FlowRun time to live in Dataverse

Setting the [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) to zero stops all ingestion of new [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records.

### Set FlowRun time to live in Power Platform admin center

The [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) can be set in the [Power Platform admin center environments experience](/power-platform/admin/environments-overview#manage-environments-in-the-power-platform-admin-center).
To choose the [FlowRun entity](/power-apps/developer/data-platform/reference/entities/flowrun) time to live that's used in an environment:

1. Sign in to [Power Platform admin center](/power-platform/admin/environments-overview#manage-environments-in-the-power-platform-admin-center).
2. Navigate to **Environments**.
3. For the desired environment, open the **Settings** page.
4. Select **Product** > **Features**.
5. Under **Cloud flow run history in Dataverse**, set the **FlowRun entity time to live** retention value to 28 days (the default), 14 days, 7 days, or Disabled.

### Set custom TTL values to store a longer or more specific amount of cloud flow run history

If you want a specific Time To Live (TTL) value that isn't available through the [Power Platform admin center](/power-platform/admin/environments-overview#manage-environments-in-the-power-platform-admin-center) experience, then you can set that value directly as the [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds).

## Reduce number of FlowRun records immediately

If the environment is running short on storage, then customers can choose to clean up database space by setting the [TTLInSeconds](/power-apps/developer/data-platform/reference/entities/flowrun#BKMK_TTLInSeconds) value for a set of [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records. The records are then automatically cleaned up and permanently deleted within a minute or two. Ensure that the records are no longer needed, because they can't be recovered once deleted.

## Time To Live (TTL) value calculations

Time to live (TTL) values for [Organization.FlowRunTimeToLiveInSeconds](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) and [FlowRun.TTLInSeconds](/power-apps/developer/data-platform/reference/entities/flowrun#BKMK_TTLInSeconds) are specified in seconds. The following table contains common values that can be used in the Organization and FlowRun tables.

|Days  |Seconds  |
|---------|---------|
|1 day |86,400 seconds|
|3 days |259,200 seconds|
|7 day |604,800 seconds|
|14 days |1,209,600 seconds|
|28 days |2,419,200 seconds|
|60 days |5,184,000 seconds|

## Use FlowEvent data to get visibility into FlowRun data completeness

[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records might be incomplete for many reasons. The [FlowEvent](/power-apps/developer/data-platform/reference/entities/flowevent) table is used to provide signals that runs were skipped and the data set is incomplete. The lack of signals doesn't mean that the data set is complete.

You can view the [FlowEvent](/power-apps/developer/data-platform/reference/entities/flowevent) records in the [PowerApps table browser](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel#view-tables) or using the [Dataverse Web API](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/13593424/25bd0eda-0dde-4378-9793-7090fbca5916). All of the relevant records have a [FlowEvent.EventType](/power-apps/developer/data-platform/reference/entities/flowevent#BKMK_eventtype) value of "FlowRunIngestion" and then the [FlowEvent.EventCode](/power-apps/developer/data-platform/reference/entities/flowevent#BKMK_eventcode) value explains the event.

The following table contains a list of [FlowEvent.EventCode](/power-apps/developer/data-platform/reference/entities/flowevent#BKMK_eventcode) values that might be used to signal that [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data isn't complete:

|EventCode |Reason |
|---------|---------|
|isFlowRunIngestionECSDisabled|Cloud flow run history isn't being saved in Dataverse due to service configuration, so no cloud flow data can be shown. The ECS service configuration is set automatically and there's no way for an admin to change the ingestion behavior in this state.|
|TtlSettingEqual0|Your current environment's TTL (time-to-live) configuration for cloud flow runs is set to not retain data. As a result, some cloud flow run history might be missing. This state occurs when [Organization.FlowRunTimeToLiveInSeconds](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) is set to zero.|
|IngestionDisabledByOrgSettings|Cloud flow run history isn't being saved in Dataverse due to environments settings, so some of the run history for cloud flows might be missing. This occurrence happens when [Organization.FlowRunTimeToLiveInSeconds](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) was set to zero in the past.|
|ElasticTableStorageCapacityReached|You reached your Dataverse storage capacity limit, causing a pause in cloud flow run data synchronization.|
|ElasticTablePartitionLimitReached|You reached your Dataverse storage partition limit, causing a pause in cloud flow run data synchronization.|
|IngestionRateDataLoss|Some of the run history for cloud flows might be missing due to high volume of runs in this environment.|
|FlowRunsEventLoadingFailed|Unable to load the events for cloud flow runs in your current environment. As a result, some historical cloud flow run data might not be available.|
|FlowRunsTTlSettingFailedMessage|Unable to retrieve your environment's TTL (time-to-live) setting for cloud flow runs. As a result, some historical cloud flow run data might not be available.|
|ElasticTableNoRoleForUser|A user who owns one or more flows doesn't have read permissions to the FlowRun table in Dataverse, so some cloud flow run history isn't saved in Dataverse. The reason is because that user can't be set as the owner.|

## Known limitations

- [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records are assigned to a specific owner when they're written into the table, so the concept of shared [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records for shared flows currently isn't supported.
- Flow owners need at least read access to the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) table to store their run records in Dataverse. The system writes [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records into the table and then ownership is assigned to the primary owner of the flow. If the primary owner of the flow doesn't have read permission to the FlowRun table then the FlowRun record isn't stored and a [FlowEvent.EventCode](/power-apps/developer/data-platform/reference/entities/flowevent#BKMK_eventcode) of *ElasticTableNoRoleForUser* is seen in the [FlowEvent](/power-apps/developer/data-platform/reference/entities/flowevent) table. To fix this situation, ensure that flow owners have FlowRun table read permission.
- Currently, there's a limit of 20 GB per partition within elastic tables. Further run record insertions, only for that specific user, would fail once the limit is reached.
- [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records might be throttled and skipped if a user has many flows with high run rates. When throttling occurs, an entry is created in the [FlowEvent](/power-apps/developer/data-platform/reference/entities/flowevent) table to signal that runs were skipped and the data set is incomplete.
- It is not recommended to use the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) and [FlowLog](/power-apps/developer/data-platform/reference/entities/flowlog) entities as targets of the "When a row is added, modified or deleted" Flow trigger. This would cause an infinite loop, as records are created in these tables every time a flow is run.

> [!NOTE]
> The underlying data stream used for powering the cloud flow run record insertions isn't transactional, and hence isn't 100 percent lossless. Small data losses on this data stream might happen due to temporary, non-repeating service issues. Those missing records aren't represented by FlowEvent. Flow execution history within flow details in the Power Automate portal is transactional, and therefore provides a lossless view of runs.

## FAQ

### Why do all of my environments have a FlowRunTimeToLiveInSeconds value of zero?

If all of your environments have a [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) of zero, then it could be one of these situations:
1. If [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data isn't available, then your environments might not be automatically enabled for [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) ingestion because there wasn't enough [Dataverse database storage capacity](/power-platform/admin/capacity-storage#dataverse-tab) available.
1. If [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data was previously available, then an administrator might have turned off ingestion of new records.


### Does writing cloud flow run history into Dataverse use Power Platform request quota?

Writing cloud flow run history into Dataverse as [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data doesn't count towards the [Power Platform Request limits](/power-platform/admin/api-request-limits-allocations). APIs executed to read that [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data do count towards [Power Platform Request limits](/power-platform/admin/api-request-limits-allocations).

### How does this data compare to the data available in Application Insights?

Admins can [set up Application Insights](/power-platform/admin/app-insights-cloud-flow) to provide monitoring data from Power Automate flow executions. 
The Application Insights data is:
- More complete because of data pipeline issues obtaining the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data.
- Deeper because it has information about triggers and actions executed.
- Able to be correlated with [Power Apps and Dataverse Application Insights data](/power-platform/admin/analyze-telemetry) through correlation identifiers.

## Related information

[Automation center](/power-automate/automation-center-overview)

