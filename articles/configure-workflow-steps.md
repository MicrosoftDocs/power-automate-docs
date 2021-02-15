---
title: "Configure background workflow stages and steps in Power Apps | MicrosoftDocs"
description: "Learn how to configure background workflow steps"
ms.custom: ""
ms.date: 07/27/2020
ms.reviewer: ""
ms.service: flow
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
author: "Mattp123"
ms.assetid: 0b47dfd5-76db-464f-90c0-c64a0173dcdd
caps.latest.revision: 18
ms.author: "matp"
manager: "kvivek"
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Configure background workflow stages and steps


When you design workflows you have the option to contain the logic you want to perform in **stages** and **steps**.  
  
**Stages** make the workflow logic easier to read, and explain the workflow logic. However, stages do not affect the logic or behavior of workflows. If a process has stages, all the steps within the process must be contained with a stage.  
  
**Steps** are a unit of business logic within a workflow. Steps can include conditions, actions, other steps, or a combination of these elements.  
  
<a name="BKMK_ActionsWorkflowProcessesCanPerform"></a>  
 
## Actions that background workflow processes can perform  

Background workflow processes can perform the actions listed in the following table.  
  
|Action|Description|  
|------------|-----------------|  
|**Create Record**|Creates a new record for an entity and assigns values you choose to attributes.|  
|**Update Record**|You can update the record that the background workflow is running on, any of the records linked to that record in an N:1 relationships, or any records created by earlier steps.|  
|**Assign Record**|You can assign the record that the background workflow is running on, any of the records linked to that record with an N:1 relationship, or any records created by earlier steps.|  
|**Send Email**|Sends an email. You can choose to create a new email message or use an email template configured for the entity of the record that the background workflow is running on or any entities that have an N:1 relationship with the entity, or the entity for any records created by earlier steps.|  
|**Start Child Workflow**|Starts a background workflow process that has been configured as a child workflow.|  
|**Change Status**|Changes the status of the record that the process is running on, any of the records linked to that record with an N:1 relationship, or any records created by earlier steps.|  
|**Stop Workflow**|Stops the current workflow. You can set a status of either **Succeeded** or **Canceled** and specify a status message.|  
|**Custom Step**|Developers can create custom background workflow steps that define actions. There are no custom steps available by default.|  
  
### Setting record values  

When you create a record you can set values for the record. When you update a record you can set, append, increment, decrement, multiply, or clear values.  
  
When you select **Set Properties**, a dialog box opens showing you the default form for the entity.  
  
At the bottom of the dialog box you can see a list of additional fields not present in the form.  
  
For any field, you can set a static value and that will be set by the workflow.  
  
On the right side of the dialog box, the **Form Assistant** gives you the ability to set or append dynamic values from the context of the current record. This includes values from related records that can be accessed from the N:1 (many-to-one) relationships for the entity.  
  
The options available in the **Form Assistant** depend on the field you have selected in the form. When you set a dynamic value, you will see a yellow placeholder known as a ‘slug’ that shows where the dynamic data will be included. If you want to remove the value, just select the slug and delete it. For text fields, you can use a combination of static and dynamic data.  
  
With dynamic values, you don’t know for certain that a field or related entity has the value you want to set. You can actually set a number of fields to try to set the value and sort them in order using the green arrows. If the first field doesn’t have data, the second field will be tried and so on. If none of the fields has data, you can specify a default value to be used.  
  
<a name="BKMK_SettingConditionsForWorkflowActions"></a>   

## Setting conditions for background workflow actions  

The actions that you will apply often depend on conditions. Background workflow processes provide several ways to set conditions and create branching logic to get the results you want. You can check values of the record that the background workflow process is running against, any of the records linked to that record with an N:1 relationship, or values within the process itself.  
  
|Condition Type|Description|  
|--------------------|-----------------|  
|**Check Condition**|A logical "if \<condition> then" statement.<br /><br /> You can check the current values for the record that the background workflow is running on, any of the records linked to that record in an N:1 relationships, or any records created by earlier steps. Based on these values you can define additional steps when the condition is true.<br /><br /> In the "if \<condition> then" statement, you can use the following operators: **Equals**, **Does Not Equal**, **Contains Data**, **Does Not Contain Data**, **Under** and **Not Under**. <br /><br />**Note:**  The **Under** and **Not Under** are hierarchical operators. They can only be used on the entities that have a hierarchical relationship defined. If you’re trying to use these operators on the entities that don’t have the hierarchical relationship defined, you’ll see the error message: “You’re using a hierarchical operator on an entity that doesn’t have a hierarchical relationship defined. Either make the entity hierarchical (by marking a relationship as hierarchical) or use a different operator.”<br /><br />For more information about hierarchical relationships, see [Define and query hierarchically related data](/powerapps/maker/common-data-service/define-query-hierarchical-data). A screenshot that follows the table is an example of the definition of the background workflow process that uses the **Under** and **Not Under** hierarchical operators.|  
|**Conditional Branch**|A logical "else-if-then" statement. The editor uses the text “Otherwise, if \<condition> then:”<br /><br /> Select a check condition you have previously defined and you can add a conditional branch to define additional steps when the check condition returns false.|  
|**Default Action**|A logical "else" statement. The editor uses the text “Otherwise:”<br /><br /> Select a check condition, conditional branch, wait condition, or parallel wait branch that you have previously defined and you can use a default action to define steps for all cases that do not match the criteria defined in condition or branch elements.|  
|**Wait Condition**|Enables a background workflow to pause itself until the criteria defined by the condition have been met. The background workflow starts again automatically when the criteria in the wait condition have been met.|  
|**Parallel Wait Branch**|Defines an alternative wait condition for a background workflow with a corresponding set of additional steps that are performed only when the initial criterion is met. You can use parallel wait branches to create time limits in your background workflow logic. They help prevent the background workflow from waiting indefinitely until the criteria defined in a wait condition have been met.|  
|**Custom Step**|Developers can create custom background workflow steps that define conditions. There are no custom steps available by default.|  
  
The following screenshot contains an example of the background workflow process definition with the **Under** and **Not Under** hierarchical operators. In our example, we apply two different discounts to two groups of accounts. In **Add Step**, we selected the **Check Condition** to specify the **if-then** condition containing the **Under** or **Not Under** operators. The first **if-then** condition applies to all accounts that are **Under** the Alpine Ski House account. These accounts receive a 10 percent discount on purchased goods and services. The second **if-then** condition applies to all accounts that are **Not Under** the Alpine Ski House account and they receive a 5 percent discount. Then, we selected **Update Record** to define the action to be performed based on the condition.  
  
![Workflow process with Under&#47;Not Under operators](media/wfp-under-not-under.PNG "Workflow process with Under/Not Under operators")  
  
  
## Next steps  
[Create custom business logic through processes](./guide-staff-through-common-tasks-processes.md)  <br /> 
[Workflow processes overview](workflow-processes.md) <br />
[Monitor and manage background workflow processes](monitor-manage-processes.md)   <br />
[Best practices for background workflow processes](best-practices-workflow-processes.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]