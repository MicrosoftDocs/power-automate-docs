---
title: What’s in the Approvals Kit | Microsoft Docs
description: What’s in the Approvals Kit
documentationcenter: na
author: author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# What’s in the Approvals Kit

## Custom Connector

The Approvals Kit includes a custom connector to help the process of starting a new business approval process.

![Example custom connector to start a business approval](./media/custom-connector-example.png)

The custom connector provided as part of the kit uses [Custom code support](/connectors/custom-connectors/write-code) to query the defined workflow processes and application data (variables) required by the workflow.

### Dynamic Parameters

The custom connector makes use of multiple code actions to provide the ability to get published workflows, get data fields and start a business approval process.

#### Get Published Workflows

The get published workflow action queries Dataverse to return currently active and published workflows so that the maker can define which approvals workflow should be started.

#### Get Approval Data Fields

To get the data fields for a workflow the custom connector makes user of the [Use dynamic schema](/connectors/custom-connectors/openapi-extensions#use-dynamic-schema) so that **x-ms-dynamic-schema** calls the custom code action.

The custom code actions include the C# code to query the data fields so that the maker can provide the required fields.

#### Create Workflow Instance

The create workflow instance action saves the business approval workflow data as a JSON serialized string so that the approvals process is started.

## Cloud Flows

The table represents a list of flows and processes related to a Business Approval Process. Each row describes a specific flow or process and its purpose. The flows and processes include handling timeout counters, assigning delegates, creating overrides, evaluating node conditions, logging data, and starting and updating workflow instances. There are also flows for initializing workflow queues, starting nodes and stages, and updating approval and stage instances. The table also includes flows for copying and publishing process definitions, as well as syncing approver out-of-office states. Finally, there is a flow for updating active published workflows.

|Name                                             | Description |
|-------------------------------------------------|-------------|
|BACore \| Approval Time-out                      | Handles timeout counter reaching zero by using a Dataverse trigger that retrieves a list of business approvers. It then checks if the delegate is out of office and assigns the backup delegate if necessary. If there is no delegate or backup delegate, it retrieves the default approver. Finally, it creates an override for the delegate if one exists.|
|BACore \| Approver OOF                           | This flow subscribes to a Dataverse trigger on Business Approvers and listens for changes in a specific entity. When a change occurs, it retrieves a list of delegates and their out-of-office status. It then selects an available delegate and creates an override for any running approval instances assigned to the original approver who is out of office. The override sets the delegate as the new approver and provides a reason for the override.|
|BACore \| Cascade Process Status                 | Cascade Process status from Business Approval Process handling Application Data, Stage Status, Node Status and Conditions|
|BACore \| Cascade Publishing Activation          | Update the associated Runtime Data status. When triggered, it retrieves all associated runtime data records for a specific process version and updates their statecode to match the trigger's statecode |
|BACore \| Child \| Activate Published Workflow   | Copy Business Approval Runtime Data to create Business Approvals Published Workflows and Business Approval Published Published Runtime Data|
|BACore \| Child \| Evaluate Rule                 | Evaluate a Business Approval Node condition |
|BACore \| Child \| Get Default Settings          | Get the Business Approval settings or default values if none set |
|BACore \| Child \| Get Dynamic Approver          | Lookup user or manager and from the office graph to add approvers to Business Approvals |
|BACore \| Child \| Get Dynamic Data Instance     | Get Approver or Business Approval Data Instance data |
|BACore \| Child \| Log Runs                      | Log data to Business Approval Instance Logs |
|BACore \| Copy Process                           | This flow is triggered by a request from a Power App V2. It then retrieves a list of records from an entity named Business Approvers from Dataverse.
|BACore \| Daily \| Calculate Approval Timeouts   | This flow decrements the timeout counter of business approval instances with delegation rules by 1 if the timeout counter is greater than 0. The counter is decremented by 1 business day if the timeout mode is set to business days and it is a workday with no holidays. Otherwise, the counter is decremented by 1 actual day.
|BACore \| Publish Process                        | Copy the process definition, stages, conditions and nodes |
|BACore \| Runtime \-\- Initialize Workflow Queue | This flow subscribes to a Dataverse trigger on Business Approval Workflow Queues and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance
|BACore \| Runtime \-\- Start Approval            | This flow subscribes to a Dataverse trigger on Business Approval Instance and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance
|BACore \| Runtime \-\- Start Node                | This flow subscribes to a Dataverse trigger on Business Runtime Node Approval Instance that creates a Approvale, stage, conditions. It includes the ability to move to new stage based on conditions. A node may complete a Business Approval workflow or a defined stage
|BACore \| Runtime \-\- Start Stage               | This flow subscribes to a Dataverse trigger on Business Approval Runtime Stage Instance. It sets the first node to process in the workflow if nodes defined or complete the stage if no nodes defined.
|BACore \| Runtime \-\- Start Workflow            | This flow subscribes to a Dataverse trigger on Business Approval Workflow. It initalize the first stage or saves and error is not stages defined
|BACore \| Runtime \-\- Update Approval           | This flow subscribes to a Dataverse trigger on Business Approval Instance. When a change occurs, it checks the status of the instance and performs different actions based on the outcome. If the outcome is "Approve", it cancels other running instances and updates the node instance status. If the outcome is "Reject", it cancels other running instances and updates the node instance status to "Cancelled".
|BACore \| Runtime \-\- Update Node Instance      | This flow subscribes to a Dataverse trigger on Business Approval Runtime Node Instance. When a change occurs, it checks the instance status field and performs different actions based on its value. It either creates a new node instance or completes the runtime stage instance status or it cancels the runtime stage instance status.
|BACore \| Runtime \-\- Update Stage Instance     |  This flow subscribes to a Dataverse trigger on Business Approval Runtime Stage Instance. Depending on the status it either creates a new stage instance or updates the workflow instance to complete.
|BACore \| Sync Approver OOF                      | Runs a daily task to set or clear the out of office state
|BACore \| Update Active Published Workflow       | This flow subscribes to a Dataverse trigger on Business Approval Version and calls child flow Activate Published Workflow

## Tables

There are mainly two types of tables used in approval templates.

- Process Definition Tables - Define the approval processes. This is used to lookup and configures approval processes to your business needs
- Version Tables - Define the versions of published processes
- Reference Tables - Define approvers, work profile and calendar dates
- Runtime Tables - Store the results/status of the approvals

### Process Definition Tables

The following tables are used for definition

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approvals Process|One record per approval scenarios that the Approvals Kit manages|Invoice Approval
|Business Approval Data|One record per data item used to define the input fields of what will be used within the approval process|"Request Amount", "Transportation Method" and "Department"
|Business Approval Stage |On record per stage within the approval process|"Manager Approval" or "Line Manager Approval"
|Business Approval Condition|Define optional condition for a stage|None, If, Switch
|Business Approval Node|Defines each step of the approval including the type of approval of that step and the approver|

### Reference Tables

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approver|Defines for associated to approver(s) for each node within the approval process|
|Business Approval Work Profile|Set up for each approver to define settings|Out of office
|Business Approval Holiday Calendar|Define the company holidays|Non work days and weekend such as Saturdays
|Business Approval Public Holidays|Define the holidays separate from the organization holiday

### Version Tables

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approval Version|A saved version of a business approval process|
|Business Approval Published Workflow|Defined a published approval process version|
|Business Approval Published Runtime Data|Defined data for a published approval process version|
|Business Approval Published Runtime Stage|Defined stage or stages for a published approval process version|
|Business Approval Published Runtime Node|Defined node or nodes for a published approval process stage|

### Runtime Tables

Each time a new approval request is made, data is stored into runtime instance tables based on the configuration of the definition version tables.

|Name|Description|Notes|
|----|----------|-------|
|Business Approval Workflow|Used to manage all incoming approval requests and the related tables used for the request|Created approval generated from data in your source triggered system. Created for a version of a published business approval process
|Business Approval Runtime Data Instance|Is used to store the metadata of what is defined in approval data|For example, if you have defined "Request Amount" in Approval Data table, the Instance Data would store the actual request amount for the request
|Business Approval Runtime Stage Instance|creates a working copy of Business Approval Stage version. It's used to hold each transactional stage of the approval|Any changes made during runtime are saved here
|Business Approval Runtime Node Instance|creates a working copy of Nodes transactional reference to the approval request. It's used to hold each transactional step of the approval including the type of approval of that step and the approver|Any changes made during runtime are saved here
|Business Approval Instance|Stores a transactional reference of Approval for a specific node instance|
|Business Approval Instance Log|Stores a transactional reference of Approval reference and outcome|
|Business Approval Instance Override|Stores a transactional a new approver that overrides the original approval instance|

### Data Model

Entity Relationship diagram that shows the relationships between key tables.

Notes:

- Tables in green are the current working version of a Business Approval Process
- Tables in blue are the related tables that save information about a version of a process
- Tables in black are the related tables that save transactional information for a specific approval process

![Entity Relationship diagram that shows the relationships between key tables](./media/datamodel.png)
