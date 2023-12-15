---
title: Manage cloud flow run metadata in Dataverse (preview)
description: Learn how to leverage the extensibility of Dataverse to track the results of your cloud flow executions at scale.
author: rakrish84
contributors:
  - rakrish84
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 12/15/2023
ms.author: rakrish
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage cloud flow run metadata in Dataverse (preview)

[!INCLUDE[cc-preview-features-definition](../includes/cc-preview-features-top-note.md)]

With cloud flow run metadata in Dataverse, you can leverage the extensibility of dataverse to track the results of your cloud flow executions at scale. With this feature, you can leverage the power of Dataverse’s common data architecture, including enterprise grade security and compliance, including Role-Based Access Control (RBAC) to manage the flow run metadata. Only cloud flows backed in dataverse solution flows have their run metadata stored in Dataverse.

As part of this feature, every cloud flow execution has an entry in the table, **Flow Run**. We are leveraging Dataverse’s non-relational database, [elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables), to store the cloud flow run metadata.

> [!IMPORTANT]
>- This is a preview feature.
>- Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
>- This feature is in the process of rolling out, and might not be available in your region yet.

## Cloud flow run elements

This table contains key elements of a cloud flow run, including the following:

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

The details can be viewed and updated through standard Dataverse APIs, a Dataverse connector, or directly from the **Tables** view in the maker portal.

Since this feature is built on elastic tables, we store the cloud run metadata in specific logical partitions for optimized performance. The run data is partitioned based on users. This means each user within an organization has a dedicated partition to store the flow run metadata.

By default, flow run metadata is stored for 28 days (2,419,200 seconds). If you want to modify the duration of how long the executions can be stored, you can update the **Time to live** (in seconds) for the flow run in the **Organization** table within environment backed with Dataverse. Depending on your environment’s storage capacity, you can adjust the length of storage for these run records.

## Known limitations

- We currently don't support shared flows. All run records are written under the owner context to the **Flow Run** table.
- Flow owners need at least read access to the **Flow Run** table to store their run records in Dataverse.
- Currently, there's a limit of 20 GB per partition within elastic tables. Further run record insertions, only for that specific user, would fail once the limit is reached.

> [!NOTE]
> The underlying data stream used for powering the cloud flow run record insertions isn't transactional, and hence isn't 100 percent lossless. Small data losses on this data might happen due to temporary, non-repeating service issues. Flow execution history within flow details in the Power Automate portal is transactional, and therefore provides a lossless view of runs.
