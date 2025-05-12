---
title: Approvals kit content
description: Learn about the components of the approvals kit.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: concept-article
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Approvals kit content overview

The approvals kit is built on the out of the box [approvals connector](/connectors/approvals/) using a Power Platform solution. The solution includes a set of Power Apps, Power Automate and Dataverse components to make creating business approvals processed easier to author and trigger.

The kit enables you to rapidly make changes without the need to update or deploy a Power Platform solution. You can create variations for one approval without impacting other approval processes. Additionally, Dataverse provides auditing features to record approvals processes.

:::image type="content" source="media/approvals-kit-high-level-architecture.png" alt-text="A diagram of the high-level architecture for the approvals kit.":::

Key components of the kit:

- **Process designer**: A Power App that allows business users to create and version approval workflows with input application data, stages and conditions. Data used by the process designer is stored in Dataverse design time tables.
- **Custom connector**: Provides a simple way for makers to use a Power Automate trigger to start the process of a business approval based on the Power Platform connectors and actions.
- **Dataverse**: A set of custom tables that allow workflows to be defined and monitored.
- **Power Automate cloud flows**: A set of cloud flows that react to changes in the Dataverse tables to manage the end to end approval process.
- **Consuming apps / flows**: Power Platform solutions can create a connection reference to the approvals Kit connector to begin a business approval workflow.

## Power Automate

This section summarizes the Power Automate components that make up the approvals kit.

### Cloud flows

The table represents a list of flows and processes related to a business approval process. Each row describes a specific flow or process and its purpose.

|Name                                             | Description |
|-------------------------------------------------|-------------|
|BACore \| Approval Time-out                      | Handles timeout counter reaching zero by using a Dataverse trigger that retrieves a list of business approvers. It then checks if the delegate is out of office and assigns the backup delegate if necessary. If there's no delegate or backup delegate, it retrieves the default approver. Finally, it creates an override for the delegate if one exists.|
|BACore \| Approver OOF                           | This flow subscribes to a Dataverse trigger on business approvers and listens for changes in a specific entity. When a change occurs, it retrieves a list of delegates and their out-of-office status. It then selects an available delegate and creates an override for any running approval instances assigned to the original approver who is out of office. The override sets the delegate as the new approver and provides a reason for the override.|
|BACore \| Cascade Process Status                 | Cascades process status from business approval process handling application data, stage status, node status and conditions.|
|BACore \| Cascade Publishing Activation          | Updates the associated runtime data status. When triggered, it retrieves all associated runtime data records for a specific process version and updates their state code to match the trigger's state code. |
|BACore \| Child \| Activate Published Workflow   | Copies business approval runtime data to create business approval published workflows and business approval published runtime data.|
|BACore \| Child \| Evaluate Rule                 | Evaluates a business approval node condition. |
|BACore \| Child \| Get Default Settings          | Gets the business approval settings or default values if none is set. |
|BACore \| Child \| Get Dynamic Approver          | Looks up user or manager from the office graph to add approvers to business approvals. |
|BACore \| Child \| Get Dynamic Data Instance     | Get Approver or business approval data instance data. |
|BACore \| Child \| Log Runs                      | Log data to business approval instance logs. |
|BACore \| Copy Process                           | Triggered with requests from a Power App V2. It retrieves a list of records from an entity named business approvers from Dataverse.
|BACore \| Daily \| Calculate Approval Timeouts   | This flow decrements the timeout counter of business approval instances. The counter is decrements down one day for each business if the timeout mode is set to business days and it's a workday with no holidays. Otherwise, the counter decremented by one actual day.
|BACore \| Publish Process                        | Copies the process definition, stages, conditions and nodes. |
|BACore \| Runtime \-\- Initialize Workflow Queue | Subscribes to a Dataverse trigger on business approval workflow queues and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance.
|BACore \| Runtime \-\- Start Approval            | Subscribes to a Dataverse trigger on business approval instance and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance.
|BACore \| Runtime \-\- Start Node                | Subscribes to a Dataverse trigger on business runtime node approval instance that creates approvals, stage, conditions. It includes the ability to move to new stage based on conditions. A node can complete a business approval workflow or a defined stage.
|BACore \| Runtime \-\- Start Stage               | Subscribes to a Dataverse trigger on business approval runtime stage instance. It sets the first node to process in the workflow if nodes defined or complete the stage if no nodes defined.
|BACore \| Runtime \-\- Start Workflow            | Subscribes to a Dataverse trigger on business approval workflow. It initializes the first stage or saves and error isn't stages defined.
|BACore \| Runtime \-\- Update Approval           | Subscribes to a Dataverse trigger on business approval instance. When a change occurs, it checks the status of the instance and performs different actions based on the outcome. If the outcome is **Approve**, it cancels other running instances and updates the node instance status. If the outcome is **Reject**, it cancels other running instances and updates the node instance status to **Canceled**.
|BACore \| Runtime \-\- Update Node Instance      | Subscribes to a Dataverse trigger on business approval runtime node instance. When a change occurs, it checks the instance status field and performs different actions based on its value. It either creates a new node instance or completes the runtime stage instance status or it cancels the runtime stage instance status.
|BACore \| Runtime \-\- Update Stage Instance     |  Subscribes to a Dataverse trigger on business approval runtime stage instance. Depending on the status, it either creates a new stage instance or updates the workflow instance to complete.
|BACore \| Sync Approver OOF                      | Runs a daily task to set or clear the out of office state.
|BACore \| Update Active Published Workflow       | Subscribes to a Dataverse trigger on business approval version and calls child flow activate published workflow.

## Dataverse
This section summarizes the Dataverse components that make up the approvals kit.

### Tables

There are several types of tables available:

- Process Definition Tables - Define the approval processes. These tables are used to look up and configures approval processes to your business needs.
- Version Tables - Define the versions of published processes.
- Reference Tables - Define approvers, work profile and calendar dates.
- Runtime Tables - Store the results/status of the approvals.

#### Process definition tables

The following tables are used for definition.

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approvals Process|One record per approval scenarios that the approvals kit manages.|Invoice Approval
|Business Approval Data|One record per data item used to define the input fields of that are used within the approval process|For example request amount, transportation method and department.
|Business Approval Stage |One record per stage within the approval process.|Manager Approval or Line Manager Approval
|Business Approval Condition|Define optional condition for a stage.|None, If, Switch
|Business Approval Node|Defines each step of the approval including the type of approval of that step and the approver.|n/a*|

*n/a = not applicable.

#### Reference tables

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approver|Defines for associated to approver(s) for each node within the approval process.|n/a*|
|Business Approval Work Profile|Set up for each approver to define settings.|Out of office|
|Business Approval Holiday Calendar|Define the company holidays.|Non work days and weekend such as Saturdays|
|Business Approval Public Holidays|Define the holidays separate from the organization holiday.|n/a*|
|Business Approver OOF|Defines the user out of office settings.|n/a*|

*n/a = not applicable.

#### Version tables

|Name|Description|
|----|----------|
|Business Approval Version|A saved version of a business approval process.|
|Business Approval Published Workflow|Defined a published approval process version.|
|Business Approval Published Runtime Data|Defined data for a published approval process version.|
|Business Approval Published Runtime Stage|Defined stage or stages for a published approval process version.|
|Business Approval Published Runtime Node|Defined node or nodes for a published approval process stage.|

#### Runtime tables

For each approval request that is made, data is stored into runtime instance tables. These entries are based on the configuration of the definition version tables.

|Name|Description|Notes|
|----|----------|-------|
|Business Approval Workflow|Used to manage all incoming approval requests and the related tables used for the request|Created approval generated from data in your source triggered system. Created for a version of a published business approval process
|Business Approval Runtime Data Instance|Is used to store the metadata of what is defined in approval data|For example, if you define "Request Amount" in Approval Data table, the Instance Data would store the actual request amount for the request
|Business Approval Runtime Stage Instance|Creates a working copy of Business Approval Stage version. The record is used to hold each transactional stage of the approval|Any changes made during runtime are saved here
|Business Approval Runtime Node Instance|creates a working copy of Nodes transactional reference to the approval request. Used to hold each transactional step of the approval including the type of approval of that step and the approver|Any changes made during runtime are saved here
|Business Approval Instance|Stores a transactional reference of Approval for a specific node instance| n/a*|
|Business Approval Instance Log|Stores a transactional reference of Approval reference and outcome|n/a*|
|Business Approval Instance Override|Stores a transactional a new approver that overrides the original approval instance|n/a*|

*n/a = not applicable.

#### Data model

Entity Relationship diagram that shows the relationships between key tables.

Notes:

- Tables in green are the current working version of a Business Approval Process
- Tables in blue are the related tables that save information about a version of a process
- Tables in black are the related tables that save transactional information for a specific approval process

:::image type="content" source="media/datamodel.png" alt-text="An entity relationship diagram that shows the relationships between key tables.":::

## Custom connector

The Approvals Kit includes a custom connector to help the process of starting a new business approval process.

:::image type="content" source="media/custom-connector-example.png" alt-text="An example of a custom connector to start a business approval.":::

The custom connector provided as part of the kit uses [Custom code support](/connectors/custom-connectors/write-code) to query the defined workflow processes and application data (variables) required by the workflow.

### Dynamic parameters

The custom connector makes use of multiple OpenAPI actions to get published workflows, get data fields and start a business approval process.

#### Get published workflows

The get published workflow action queries Dataverse to return currently active and published workflows so that the maker can define which approvals workflow should be started.

#### Get approval data fields

To get the data fields for a workflow the custom connector makes user of the [Use dynamic schema](/connectors/custom-connectors/openapi-extensions#use-dynamic-schema) so that **x-ms-dynamic-schema** calls the custom code action.

The custom code actions include the C# code to query the data fields so that the maker can provide the required fields.

#### Create workflow instance

The create workflow instance action saves the business approval workflow data as a JSON serialized string so that the approvals process is started.

### Operations

This connector depends on three operations:

* GetPublishedWorkflows
* GetApprovalDataFields
* CreateWorkflowInstance

#### GetPublishedWorkflows

This operation helps in listing all the published business approval templates by calling the native API and reading the table **Business Approval Published Workflows**.

`/api/data/v9.2/cat_businessapprovalpublishedworkflows`

:::image type="content" source="media/start-business-approval.png" alt-text="A depiction of the start business approval connector.":::

#### GetApprovalDataFields

This operation helps in fetching the list of dynamic schemas applicable for the selected workflow. Under the hood, it calls a Custom API (`GetDynamicParameters`) which returns the schema definition based on the workflow ID provided/selected.

`/api/data/v9.2/cat_GetDynamicParameters(ProcessID={processID})`

> [!NOTE]
> The return values of the API, which are of type Entity, are further modified using custom code for custom connector to support and align with the Open API schema. For more information, see the **ModifySchema()** method in the Script.csx file.

:::image type="content" source="media/start-business-approval-with-parameters.png" alt-text="A depiction of the start business approval connector with schema parameters read from Dataverse.":::

#### CreateWorkflowInstance

This operation helps in creating a record in `businessapprovalworkflowqueues` by making a POST operation to the native API.

`/api/data/v9.2/cat_businessapprovalworkflowqueues`

Here we use a `CreateWorkflowQueue()` method using custom code for the custom connector to prepare and parse JSON, which holds all the parameter values and the Workflow ID (also known as ProcessID). 

> [!NOTE]
> This operation performs the final POST call to create the record.

Here are the two values, which are updated during the post call:

```json
     "cat_runtimedata": "[{"id":"9a664958-c656-ee11-be6f-0022482a97de","value":"True"},{"id":"7ddc1057-c656-ee11-be6f-0022482a91f4","value":"123"},{"id":"49dc1057-c656-ee11-be6f-0022482a91f4","value":""},{"id":"9b664958-c656-ee11-be6f-0022482a97de","value":"10/11/2023 8:49:51 AM"},{"id":"7cdc1057-c656-ee11-be6f-0022482a91f4","value":"Another title"}]",
     "cat_processid": "57b2ee16-ea51-ee11-be6f-0022482a97de"
```
