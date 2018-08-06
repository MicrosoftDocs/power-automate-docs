---
title: "Workflow and process entities (Developer Guide for Dynamics 365 Customer Engagement) | MicrosoftDocs"
description: "The Dynamics 365 Customer Engagement workflow object model is a set of classes that uses the Windows Workflow Foundation object model and exposes Dynamics 365 workflow activities. These classes are found in the Microsoft.Xrm.Sdk.Workflow assembly."
ms.custom: ""
ms.date: 10/31/2017
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 1b40f46a-31f1-4c2a-8e50-f3641b8d8973
caps.latest.revision: 20
author: "JimDaly"
ms.author: "jdaly"
manager: "amyla"
---
# Workflow and process entities


The Common Data Service (CDS) for Apps workflow object model is a set of classes that uses the Windows Workflow Foundation object model and exposes CDS for Apps workflow activities. These classes are found in the `Microsoft.Xrm.Sdk.Workflow` assembly. For more information, see <xref:Microsoft.Xrm.Sdk.Workflow>.

 Workflow activities are the elemental units of a workflow (process). They are added to a workflow (process) to form a hierarchical tree structure. When all activities in a given path are finished running, the workflow (process) instance is completed.

 The workflow entity stores the definition of a workflow (process). This definition contains the XAML string that describes the workflow activity, and also the rules used in the process.

 The validity of a workflow definition may depend on external data. There are several types of dependencies that are supported:

 |Dependency |Description|
 |-----------|-----------|
 |SDK operation|If a process is triggered on a specific SDK operation, it cannot be deleted.|
 |Input entity|A process depends on a snapshot of a record passed in to the workflow.|
 |Local parameter|A formal description of a .NET property to be defined by the process type.|

The workflow log entity contains detailed information about logical steps completed during the execution of a workflow. Similarly, the process session entity contains information about the running of a dialog.

If a workflow was created in the web application and the workflow definition has the `Workflow.AsyncAutoDelete` attribute set to true, and the workflow has a single step in it that is not a Stage/Wait/Condition step,  no `WorkflowLog` records will be created. This is an platform optimization  to improve performance and save disk space.  

There are two messages you can use to work with processes. <xref:Microsoft.Crm.Sdk.Messages.SetStateRequest> is used to set the state of the process: draft or activated. <xref:Microsoft.Crm.Sdk.Messages.CreateWorkflowFromTemplateRequest> is used to create a process from a process template.

### See also

 [WorkFlow Entity](/powerapps/developer/common-data-service/reference/entities/workflow)<br />
 [WorkFlowLog Entity](/powerapps/developer/common-data-service/reference/entities/workflowlog)<br />

