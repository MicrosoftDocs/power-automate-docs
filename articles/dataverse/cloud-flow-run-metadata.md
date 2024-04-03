---
title: Manage cloud flow run history metadata in Dataverse (preview)
description: Learn how to leverage the extensibility of Dataverse to track the results of your cloud flow executions at scale.
author: chrisgarty
contributors:
  - rakrish84
  - chrisgarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 12/15/2023
ms.author: chrisgarty
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage cloud flow run history in Dataverse (preview)

[!INCLUDE[cc-preview-features-definition](../includes/cc-preview-features-top-note.md)]

With cloud flow run history in Dataverse, you can leverage the extensibility of [Dataverse](/power-apps/maker/data-platform/) to track the results of your cloud flow executions at scale. With this feature, you can leverage the power of Dataverse’s common data architecture, including  Role-Based Access Control (RBAC), to manage the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data. Only solution cloud flows, with their definitions in Dataverse, can have their run history stored in Dataverse.

As part of this feature, each cloud flow execution has an entry in the table [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun). This is leveraging Dataverse’s non-relational database, [elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables), to store the cloud flow run history.

> [!IMPORTANT]
>- This is a preview feature.
>- Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
>- This feature is in the process of rolling out, and might not be available in your region yet.

## Cloud flow run elements

The **[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun)** table contains key elements of a cloud flow run, including the following:

|Element  |Description  |
|---------|---------|
|Name     |Primary key and the logic app id of the flow run. |
|Start time   | When the cloud flow execution was triggered. |
|End time     | When the cloud execution was finished. |
|Run duration | Time, in seconds, for the cloud flow to finish the run. |
|Status | End result of the flow execution (**Success**, **Failed**, or **Cancelled**) |
|Trigger type | The trigger type of this flow run (**Automated**, **Scheduled**, or **Manual**) |
|Error code | Error code returned from the flow execution.|
|Error message | Detailed error message, if applicable, returned from the flow exceution. |
|Owner | Owner of the flow. |
|Workflow name | Display name of the cloud flow. |
|Workflow Id | WorkflowID of the specific cloud flow, |
|IsPrimary | Binary value to denote whether this flow run has any parent cloud flow triggering it. |
|Parent Run Id | Name of the parent cloud flow run instance, if this record is for a child flow. |
|Partition Id | Partition id of this user in the elastic table instance. |
|Time to live | Time in seconds of when this run record will be automatically deleted. |

The details can be viewed and updated through [standard Dataverse APIs](/power-apps/developer/data-platform/webapi/query-data-web-api), the [Dataverse connector](/connectors/commondataserviceforapps/), or directly from the **Tables** view in the maker portal.

Since this feature is built on elastic tables, we store the cloud run history data in specific logical partitions for optimized performance. The run history data is partitioned based on users. This means each user within an organization has a dedicated partition.

[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data uses [Dataverse database storage capacity](/power-platform/admin/capacity-storage#dataverse-tab). Storage use across environments [can be monitored in the Power Platform Admin Center](https://learn.microsoft.com/en-us/power-platform/admin/capacity-storage#verifying-your-new-storage-model).

## Storage use for FlowRun records

By default, flow run data is stored for 28 days (2,419,200 seconds). If you want to modify the duration of how long the executions can be stored, you can update the [**Time to live (in seconds) for the flow run** in the **Organization** table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) within an environment backed with Dataverse. Depending on your environment’s storage capacity, you can adjust the length of storage for these run records.

The [FlowRunTimeToLiveInSeconds value on the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) can be changed in the [PowerApps table browser](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel#view-tables) or using the [Dataverse Web API](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/13593424/25bd0eda-0dde-4378-9793-7090fbca5916)

## Reduce amount of FlowRun records over time

If the [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) is changed, then the lifetime of any new **[FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun)** records will be retained for that length of time. This can be used to reduce the amount of [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records, and storage used, over time. 

Setting the [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) to zero will stop all ingestion of new [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records.

## Reduce amount of FlowRun records immediately 

If the environment is running short on storage, then customers can choose to clean up database space by setting the [TTLInSeconds](/power-apps/developer/data-platform/reference/entities/flowrun#BKMK_TTLInSeconds) value for a set of [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records. The records will be automatically cleaned up and permanently deleted within a minute or two. Ensure that the records are no longer needed, because they cannot be recovered once deleted.

## Time To Live (TTL) value calculations

Time to live (TTL) values for [Organization.FlowRunTimeToLiveInSeconds](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) and [FlowRun.TTLInSeconds](/power-apps/developer/data-platform/reference/entities/flowrun#BKMK_TTLInSeconds) are specified in seconds. Below is a table with common values that can be used in the Organization and FlowRun tables.

|Days  |Seconds  |
|---------|---------|
|1 day |86,400 seconds|
|3 days |259,200 seconds|
|7 day |604,800 seconds|
|14 days |1,209,600 seconds|
|28 days |2,419,200 seconds|
|60 days |5,184,000 seconds|

## Known limitations

- We currently don't support shared flows. All run records are written under the owner context to the **Flow Run** table.
- Flow owners need at least read access to the [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) table to store their run records in Dataverse.
- Currently, there's a limit of 20 GB per partition within elastic tables. Further run record insertions, only for that specific user, would fail once the limit is reached.
- [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) records may be throttled and skipped if a user has a lot of flows with high run rates. When throttling occurs, an entry is created in the [FlowEvent](/power-apps/developer/data-platform/reference/entities/flowevent) table to signal that runs were skipped and the data set is incomplete.

> [!NOTE]
> The underlying data stream used for powering the cloud flow run record insertions isn't transactional, and hence isn't 100 percent lossless. Small data losses on this data might happen due to temporary, non-repeating service issues. Flow execution history within flow details in the Power Automate portal is transactional, and therefore provides a lossless view of runs.

## FAQ

### Why do all of my environments have a FlowRunTimeToLiveInSeconds value of zero?

If all of your environments have a [FlowRunTimeToLiveInSeconds value in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowRunTimeToLiveInSeconds) of zero, then it could be one of these situations:
1. If [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data has never been available, then your environments may not have been automatically enabled for [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) ingestion because there wasn't enough [Dataverse database storage capacity](/power-platform/admin/capacity-storage#dataverse-tab) available.
2. If [FlowRun](/power-apps/developer/data-platform/reference/entities/flowrun) data was previously available, then an administrator might have turned off ingestion of new records.
