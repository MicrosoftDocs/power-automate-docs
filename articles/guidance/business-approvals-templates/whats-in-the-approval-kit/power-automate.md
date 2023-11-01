---
title: What’s in the Approvals Kit - Power Automate | Microsoft Docs
description: What’s in the Approvals Kit - Power Automate
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# What’s in the Approvals Kit - Power Automate

This page summarizes the Power Automate components that make up the Approvals Kit

## Cloud Flows

The table represents a list of flows and processes related to a Business Approval Process. Each row describes a specific flow or process and its purpose.

|Name                                             | Description |
|-------------------------------------------------|-------------|
|BACore \| Approval Time-out                      | Handles timeout counter reaching zero by using a Dataverse trigger that retrieves a list of business approvers. It then checks if the delegate is out of office and assigns the backup delegate if necessary. If there's no delegate or backup delegate, it retrieves the default approver. Finally, it creates an override for the delegate if one exists.|
|BACore \| Approver OOF                           | This flow subscribes to a Dataverse trigger on Business Approvers and listens for changes in a specific entity. When a change occurs, it retrieves a list of delegates and their out-of-office status. It then selects an available delegate and creates an override for any running approval instances assigned to the original approver who is out of office. The override sets the delegate as the new approver and provides a reason for the override.|
|BACore \| Cascade Process Status                 | Cascade Process status from Business Approval Process handling Application Data, Stage Status, Node Status and Conditions|
|BACore \| Cascade Publishing Activation          | Update the associated Runtime Data status. When triggered, it retrieves all associated runtime data records for a specific process version and updates their state code to match the trigger's state code |
|BACore \| Child \| Activate Published Workflow   | Copy Business Approval Runtime Data to create Business Approvals Published Workflows and Business Approval Published Runtime Data|
|BACore \| Child \| Evaluate Rule                 | Evaluate a Business Approval Node condition |
|BACore \| Child \| Get Default Settings          | Get the Business Approval settings or default values if none set |
|BACore \| Child \| Get Dynamic Approver          | Lookup user or manager and from the office graph to add approvers to Business Approvals |
|BACore \| Child \| Get Dynamic Data Instance     | Get Approver or Business Approval Data Instance data |
|BACore \| Child \| Log Runs                      | Log data to Business Approval Instance Logs |
|BACore \| Copy Process                           | Triggered with requests from a Power App V2. It then retrieves a list of records from an entity named Business Approvers from Dataverse.
|BACore \| Daily \| Calculate Approval Timeouts   | This flow decrements the timeout counter of business approval instances. The counter is decrements down one day for each business if the timeout mode is set to business days and it's a workday with no holidays. Otherwise, the counter decremented by one actual day.
|BACore \| Publish Process                        | Copy the process definition, stages, conditions and nodes |
|BACore \| Runtime \-\- Initialize Workflow Queue | This flow subscribes to a Dataverse trigger on Business Approval Workflow Queues and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance
|BACore \| Runtime \-\- Start Approval            | This flow subscribes to a Dataverse trigger on Business Approval Instance and creates a new workflow instance for a business approval process. It retrieves data from a runtime data instance and creates a new record for each item in the data instance. The flow also retrieves the active version of the business approval process and creates a new record for the workflow instance
|BACore \| Runtime \-\- Start Node                | This flow subscribes to a Dataverse trigger on Business Runtime Node Approval Instance that creates approvals, stage, conditions. It includes the ability to move to new stage based on conditions. A node may complete a Business Approval workflow or a defined stage
|BACore \| Runtime \-\- Start Stage               | This flow subscribes to a Dataverse trigger on Business Approval Runtime Stage Instance. It sets the first node to process in the workflow if nodes defined or complete the stage if no nodes defined.
|BACore \| Runtime \-\- Start Workflow            | This flow subscribes to a Dataverse trigger on Business Approval Workflow. It initializes the first stage or saves and error isn't stages defined
|BACore \| Runtime \-\- Update Approval           | This flow subscribes to a Dataverse trigger on Business Approval Instance. When a change occurs, it checks the status of the instance and performs different actions based on the outcome. If the outcome is "Approve", it cancels other running instances and updates the node instance status. If the outcome is "Reject", it cancels other running instances and updates the node instance status to "Canceled".
|BACore \| Runtime \-\- Update Node Instance      | This flow subscribes to a Dataverse trigger on Business Approval Runtime Node Instance. When a change occurs, it checks the instance status field and performs different actions based on its value. It either creates a new node instance or completes the runtime stage instance status or it cancels the runtime stage instance status.
|BACore \| Runtime \-\- Update Stage Instance     |  This flow subscribes to a Dataverse trigger on Business Approval Runtime Stage Instance. Depending on the status it either creates a new stage instance or updates the workflow instance to complete.
|BACore \| Sync Approver OOF                      | Runs a daily task to set or clear the out of office state
|BACore \| Update Active Published Workflow       | This flow subscribes to a Dataverse trigger on Business Approval Version and calls child flow Activate Published Workflow
