---
title: "Create custom business logic through processes with Power Apps | MicrosoftDocs"
description: "Learn about the different types of business logic you can use in your app"
ms.custom: ""
ms.date: 07/29/2020
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "Power Apps"
ms.assetid: 0b4e6602-5701-4859-81cc-6f6fe50901b2
caps.latest.revision: 44
author: "Mattp123"
ms.author: "angieandrews"
search.audienceType: 
  - flowmaker
  - enduser
---
# Create custom business logic through processes


Defining and enforcing consistent business processes is one of the main reasons people use model-driven apps. Consistent processes help make sure people using the system can focus on their work and not on remembering to perform a set of manual steps. Processes can be simple or complex and can change over time.  
  
Power Apps includes several types of processes, each designed for a different purpose:  
  
-   Business process flows  
  
-   Mobile task flows  
  
-   Workflows  
  
-   Actions  
  
Similar to processes, you can also create business rules and recommendations. More information: [Create business rules and recommendations to apply logic in a form](/powerapps/maker/model-driven-apps/create-business-rules-recommendations-apply-logic-form)  

> [!NOTE]
> Using processes can impact the license requirements for Power Apps and flows. More information: [Table license requirements](/powerapps/maker/common-data-service/data-platform-entity-licenses) 


<a name="BKMK_BP"></a>   
## When to use business process flows  
Use a business process flow when you want staff to move through the same stages and follow the same steps to interact with a customer. For example, use a business process flow if you want everyone to handle customer service requests the same way, or to require staff to gain approval for an invoice before submitting an order.  
  
Your environment includes several ready-to-use business process flows for common sales, service, and marketing tasks that you can use with little or no changes required. Or, you can create your own. More information: [Create a business process flow](create-business-process-flow.md)  
  
<a name="BKMK_WF"></a>   
## When to use workflows

Use workflows to automate business processes behind the scenes. Workflows are typically initiated by system events so the user doesn't need to be aware that they are running. Workflows that operate in the background are "asynchronous." Workflows can also be configured for people to manually initiate them when you want to automate common tasks, such as automatically sending a confirmation email to a customer when an order ships. Workflows that operate in real time are "synchronous." More information: [Workflow processes](workflow-processes.md)  
 
  
<a name="useMSFlow"></a>   
## When to use Power Automate


Use Power Automate when you need to create automated workflows that perform actions between your environment and favorite app or service, such as Dynamics 365, Twitter, Dropbox, Google services, Microsoft 365, or SharePoint. You can trigger a cloud flow based on a specific action, or invoke from within your app. More information: [Use Power Automate to automate processes across services](/dynamics365/customer-engagement/basics/use-flow-automate-processes-across-services)  
  
<a name="BKMK_Where"></a>   
## Where do I go to create processes?  
There are two paths to navigate to processes:  
  
- Open [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation#solution-explorer) and go to **Components** > **Processes**. This path provides convenient access when you are doing other customization work in the customization tools.  

- **[Settings](/powerapps/maker/model-driven-apps/advanced-navigation#settings)** > **Processes**. This path allows you to use views defined for the Process table, including any custom views.  
  
Individual business process flows can also be edited using the **Edit Process** button in the command bar for the form where the business process flow is active.  
  
<a name="BKMK_WhoCreate"></a>   
## Who can create processes?  
Only people with the System Administrator, System Customizer, or CEO-Business Manager security role can create processes that apply to the whole environment. People with other roles can create processes with limited access level. For example, people with the User access level can create workflows for their own use with records they own.  
  
The following table shows the access level of processes based on default security roles.  
  

|Security role|Access level| 
|---|---|   
|CEO-Business Manager|Organization|  
|System Administrator|Organization|  
|System Customizer|Organization|  
|Vice President of Marketing|Parent: Child Business Units|  
|Vice President of Sales|Parent: Child Business Units|  
|Service Manager|Business Unit|  
|Marketing Manager|Business Unit|  
|Sales Manager|Business Unit|  
|Schedule Manager|Business Unit|  
|Customer Service Representative|User|  
|Marketing Professional|User|  
|Salesperson|User|  
|Scheduler|User|  
  
> [!NOTE]
> While people may be able to create business process flow, real-time workflow, or action processes, they’ll need to have the **Activate Business Process Flows** or **Activate Real-time Processes** privileges to activate them.  
  
<a name="BKMK_WhatCanProcessesDo"></a>   
## More about workflows and actions  
Processes can check conditions, apply branching logic, and perform actions. They perform these actions in a series of steps. The following table describes the available steps in workflow and action processes. For more details, see the topics for each type of process.  
  
|Step|Process type|Description|  
|----------|------------------|-----------------|  
|**Stage**|Workflow, Action|Stages make the workflow logic easier to read, and explain the workflow logic. However, stages don’t affect the logic or behavior of workflows. If a process has stages, all the steps in the process must be contained with a stage.|  
|**Check Condition**|Workflow, Action|A logical "if \<condition> then" statement.<br /><br /> You can check values for the row that the workflow is running on, any of the rows linked to that row in an N:1 relationship, or any rows created by earlier steps. Based on these values you can define additional steps when the condition is `true`.|  
|**Conditional Branch**|Workflow, Action|A logical "else-if-then" statement. The editor uses the text “Otherwise, if \<condition> then:”<br /><br /> Select a check condition you have previously defined and you can add a conditional branch to define additional steps when the check condition returns `false`.|  
|**Default Action**|Workflow, Action|A logical "else" statement. The editor uses the text “Otherwise:”<br /><br /> Select a check condition, conditional branch, wait condition, or parallel wait branch that you have previously defined and you can use a default action to define steps for all cases that don’t match the criteria defined in condition or branch elements.|  
|**Wait Condition**|Background Workflow Only|Enables a background workflow to pause itself until the criteria defined by the condition have been met. The workflow starts again automatically when the criteria in the wait condition have been met.|  
|**Parallel Wait Branch**|Background Workflow Only|Defines an alternative wait condition for a background workflow with a corresponding set of additional steps that are performed only when the initial criterion is met. You can use parallel wait branches to create time limits in your workflow logic. They help prevent the workflow from waiting indefinitely until the criteria defined in a wait condition have been met.|  
|**Assign Value**|Action|Sets a value to a variable or output parameter in the process.|  
|**Create row**|Workflow, Action|Creates a new row for a table and assigns values to columns.|  
|**Update row**|Workflow, Action|You can update the row that the workflow is running on, any of the rows linked to that row in an N:1 relationship, or any rows created by earlier steps.|  
|**Assign row**|Workflow, Action|You can assign the row that the workflow is running on, any of the rows linked to that row with an N:1 relationship, or any rows created by earlier steps.|  
|**Send Email**|Workflow, Action|Sends an email. You can choose to create a new email message or use an email template configured for the table of the row that the workflow is running on or any tables that have an N:1 relationship with the table, or the table for any rows created by earlier steps.|  
|**Start Child Workflow**|Workflow, Action|Starts a workflow process that has been configured as a child workflow.|  
|**Change Status**|Workflow, Action|Changes the status of the row that the process is running on, any of the rows linked to that row with an N:1 relationship, or any rows created by earlier steps.|  
|**Stop Workflow**|Workflow, Action|Stops the current workflow or action. You can set a status of either **Succeeded** or **Canceled** and specify a status message.|  
|**Custom Step**|Workflow, Action|Provides extensions to the logical elements available by default. Steps can include conditions, actions, other steps, or a combination of these elements. Developers can create custom workflow steps. By default, there are no custom steps available.|

  



[!INCLUDE[footer-include](includes/footer-banner.md)]
