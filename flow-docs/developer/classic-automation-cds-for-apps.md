---
title: "Automate your business processes in Customer Engagement (Developer Guide for Dynamics 365 Customer Engagement)| MicrosoftDocs"
description: "Learn about automating your business processes. A business process can be of two types: automated processes that rely solely on communication among applications based on a set of rules, and interactive processes that also rely on people to initiate and run the process, and to make the appropriate decisions during the running of the process."
ms.custom: ""
ms.date: 10/31/2017
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
helpviewer_keywords: 
  - "process"
  - "workflow"
ms.assetid: 3ef415ed-d815-45de-8a7c-398b80d23cbd
caps.latest.revision: 51
author: "JimDaly"
ms.author: "jdaly"
manager: "amyla"
---
# Classic automation in CDS for Apps

Business processes are an integral part of any enterprise software application. A business process can be of two types: *automated* processes that rely solely on 
communication among applications based on a set of rules, and *interactive* processes that also rely on people to initiate and run the process, and to make the 
appropriate decisions during the running of the process.  

A process enables you to create and manage your automated and 
interactive business processes. The entity that’s used to implement a process in Common Data Service (CDS) for Apps is called 
*workflow*. A process provides many out-of-the-box components that business users and administrators 
can use to model their business processes. Developers can extend and customize 
the standard behavior of processes to achieve the functionality that their business applications require by allowing them to develop custom components.  
  
 A process is based on the 
[Windows Workflow Foundation](/dotnet/framework/windows-workflow-foundation) programming model, which provides a runtime engine, a framework, a base library of activities, 
and default implementations of the runtime services. The Windows Workflow Foundation runtime engine 
manages process execution, and supports processes that can remain active for extended periods of time. It preserves the state of process execution during computer 
shutdown and restart.  
  
## Next steps  

[Process Architecture](process-architecture.md) 

[Choose a Process (Workflow) tpe for your automation](process-categories.md)  
  
[Workflow and Process Entities](workflow-process-entities.md)  
  
[Supported Types, Triggers, and Entities for Process](supported-types-triggers-entities-actions-processes.md)  
  
[Sample Code for CDS for Apps Workflow](workflow-samples.md)  
  
## Related topics

[Create a workflow extension](/powerapps/developer/common-data-service/apply-business-logic-with-code#create-a-workflow-extension)  
  
[Create a plug-in](/powerapps/developer/common-data-service/apply-business-logic-with-code#create-a-plug-in)  
  

