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

## Tables

There are mainly two types of tables used in approval templates.

- Process Definition Tables - Define the approval processes. This is used to lookup and configure approval processes to your business needs
- Version Tables - Define the versions of published processes
- Reference Tables - Define approvers, work profile and calendar dates
- Runtime Tables - Store the results/status of the approvals

### Process Definition Tables

The following tables are used for definition

|Name|Description|Example(s)|
|----|----------|-------|
|Business Approvals Process|One record per approval scenarios that the Approvals Kit will manage|Invoice Approval
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

Each time a new approval requests are made, data is stored into runtime instance tables based on the configuration of the definition version tables.

|Name|Description|Notes|
|----|----------|-------|
|Business Approval Workflow|Used to manage all incoming approval requests and the related tables used for the request|Created approval generated from data in your source triggered system. Created for a version of a published business approval process
|Business Approval Runtime Data Instance|Is used to store the metadata of what is defined in approval data|For example, if you have defined "Request Amount" in Approval Data table, the Instance Data would store the actual request amount for the request
|Business Approval Runtime Stage Instance|creates a working copy of Business Approval Stage version. It is used to hold each transactional stage of the approval|Any changes made during runtime is saved here
|Business Approval Runtime Node Instance|creates a working copy of Nodes transactional reference to the approval request. It is used to hold each transactional step of the approval including the type of approval of that step and the approver|Any changes made during runtime is saved here
|Business Approval Instance|Stores a transactional reference of Approval for a specific node instance|
|Business Approval Instance Log|Stores a transactional reference of Approval reference and outcome|
|Business Approval Instance Override|Stores a transactional a new approver that overrides the original approval instance|

### Data Model

Entity Relationship diagram that shows the relationships between key tables.

Notes:

- Tables in green are the current working version of a Business Approval Process
- Tables in blue are the related tables that save information about a version of a process
- Tables in black are the related tables that save transactional information a specific approval process

![Entity Relationship diagram that shows the relationships between key tables](./media/datamodel.png)
