---
title: "Create a business process flow in Power Apps | MicrosoftDocs"
description: "Learn how to create a business process flow"
ms.custom: ""
ms.date: 09/24/2020
ms.reviewer: "dean-haas"
ms.service: power-automate
ms.suite: ""
ms.tgt_pltfrm: ""
ms.subservice: cloud-flow
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "Power Apps"
ms.assetid: efe86ab3-430f-485a-b924-6ed82cfbb449
caps.latest.revision: 39
author: "vashr"
ms.author: "vashr"
ms.manager: KVIVEK
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Tutorial: Create a business process flow

[!INCLUDE[cc-data-platform-banner](./includes/cc-data-platform-banner.md)]

This tutorial shows you how to create a business process flow with Power Apps. To learn more about why you use business process flows, see [Business process flows overview](business-process-flows-overview.md). For information on creating a mobile task flow, see [Create a mobile task flow](/dynamics365/customer-engagement/customize/create-mobile-task-flow).  
  
 When a user starts a business process flow, the stages and steps of the process are displayed in the process bar at the top of a form:  
  
 ![Business process with stages](media/business-process-stages.png "Business process with stages")  
  
 > [!TIP]
 >  After you create a business process flow definition, you can provide control over who can create, read, update, or delete the business process flow instance. For example, for service-related processes, you could provide full access for customer service reps to change the business process flow instance, but provide read-only access to the instance for sales reps so they can monitor post-sales activities for their customers. To set security for a business process flow definition you create, select **Enable Security Roles** on the action bar.  
  
<a name="BKMK_Createbusinessprocessflows"></a>

## Prerequisites

You need a [per user plan](https://preview.flow.microsoft.com/pricing/) in order to create business process flows. Some Dynamics 365 license plans include the per user plan.

## Create a business process flow  
  
1. Open [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation#solution-explorer).
1. On the left navigation pane, select **Processes**. 
1. On the **Actions** toolbar, select **New**.  
1. In the **Create Process**  dialog box, complete the required columns:  
  
    - Enter a process name. The name of the process doesn’t need to be unique, but it should be meaningful for people who need to choose a process. You can change this later.  
  
    - In the **Category** list, select **Business Process Flow**.  
  
         You cannot change the category after you create the process.  
  
    - In the **Table** list, select the table on which you want to base the process.  
  
         The table you select affects the columns available for steps that can be added to the first stage of the process flow. If you don’t find the table you want, make sure the table has the business process flows (columns will be created) choice in the table definition. You cannot change this after you save the process.  
1. Select **OK**.  
  
     The new process is created, and the business process flow designer opens with a single stage created for you.  
     ![Business process flow window showing main elements](media/business-process-flow-window-showing-main-elements.png "Business process flow window showing main elements")  
1. **Add stages.** If your users will progress from one business stage to another in the  process:
  
    1. Drag a **Stage** component from the **Components** tab and drop it on a + sign in the designer.  
  
        ![Drag a business process stage](media/drag-business-process-stage.png "Drag a business process stage")  
    1. To set the properties for a stage, select the stage, and then set the properties in the **Properties** tab on the right side of the screen:  
  
        - Enter a display name.  
        - If desired, select a category for the stage.  The category  (such as **Qualify** or **Develop**), appears as a chevron in the process bar.  
  
            ![Business process bar chevron](media/business-process-bar-chevron.png "Business process bar chevron")  
        - When you're done changing properties, select the **Apply** button.  
1. **Add steps to a stage.** To see the steps in a stage, select **Details** in the lower-right corner of the stage. To add more steps:  
  
    1. Drag the **Step** component to the stage from the **Components** tab.  
  
        ![Add step to a stage in a business process](media/add-step-stage-business-process.png "Add step to a stage in a business process")  
  
    1. Select the step, and then set properties in the **Properties** tab:  
  
        1. Enter a display name for the step.  
        1. If you want users to enter data to complete a step, select the appropriate column from the drop-down list.  
        1. Select **Required** if people must fill in the column to complete the step before moving to the next stage of the process.  
        1. Select **Apply** when you're done.  

     > [!NOTE]
     >
     > - If you set a two-option boolean column as **Required**, users can't continue unless the column value is **Yes**. The user is required to mark the column as completed before moving to the next stage.
     > - If either **Yes** or **No** are acceptable column values, then you should make the column a choice instead of a two-option boolean column.
  
1. **Add a branch (condition) to the process.** To add a branching condition:  
  
     1. Drag the **Condition** component from the **Components** tab to a + sign between two stages.
     
        ![Add a Condition to a business process flow](media/add-condition-business-process-flow.png "Add a Condition to a business process flow")
     1. Select the condition, and then set properties in the **Properties** tab. For more information on branching properties, see [Enhance business process flows with branching](enhance-business-process-flows-branching.md). When you're finished setting properties for the condition, select **Apply**.  
1. **Add a workflow.** To invoke a workflow:  
  
    1. Drag a **Workflow** component from the **Components** tab to a stage or to the **Global Workflow** item in the designer.   Which one you add it to depends on the following:  
  
        - **Drag it to a stage** when you want to trigger the workflow on entry or exit of the stage. The workflow component must be based on the same primary table as the stage.  
        - **Drag it to the Global Workflow item** when you want to trigger the workflow when the process is activated or when the process is archived (when the status changes to **Completed** or **Abandoned**). The workflow component must be based on the same primary table as the process.  
    1.  Select the workflow, and then set properties in the **Properties** tab:  

        1. Enter a display name.  
        1. Select when the workflow should be triggered.  
        1. Search for an existing on-demand active workflow that matches the stage table or create a new workflow by selecting **New**.  
        1. Select **Apply** when you're done.  
  
    For more information on workflows, see [Workflow processes](/common-data-service/workflow-processes.md).  
  
1. To validate the business process flow, select **Validate** on the action bar.  
1. To save the process as a draft while you continue to work on it, select **Save** in the action bar.  
  
    > [!IMPORTANT]
    >  As long as a process is a draft, people won’t be able to use it.  
  
12. To activate the process and make it available to your team, select **Activate** on the action bar.  

13. To provide control over who can create, read, update, or delete the business process flow instance, select **Edit Security Roles** on the command bar of the designer. For example, for service-related processes, you could provide full access for customer service reps to change the business process flow instance, but provide read-only access to the instance for sales reps so they can monitor post-sales activities for their customers.

  In the **Security Roles** screen, select the name of a role to open the security role information page. Select the Business Process Flows tab, and then assign appropriate privileges on the business process flow for a security role.

  > [!NOTE]
  > The System Administrator and System Customizer security roles have access to new business process flows by default.

   ![Assign privileges to a business process flow](media/bpf-assign-privileges.png)

  Specify privileges by selecting the appropriate radio buttons, and click Save. For more information about privileges, see [Business process flow privileges](business-process-flows-overview.md#BKMK_MultipleBPF).

  Next, don't forget to assign the security role to appropriate users in your organization.

> [!TIP] 
>  Here are a few tips to keep in mind as you work on your task flow in the designer window:  
>   
> - To take a snapshot of everything in the business process flow window, select **Snapshot** on the action bar. This is useful, for example, if you want to share and get comments on the process from a team member.  
> - Use the mini-map to navigate quickly to different parts of the process. This is useful when you have a complicated process that scrolls off the screen.  
> - To add a description for the business process, select **Details** under the process name in the left corner of the business process flow window. You can use up to 2000 characters.  
  
<a name="BKMK_Editbusinessprocessflows"></a>   
## Edit a business process flow  
 To edit business process flows, open solution explorer, select **Processes**, and then select the **Business Process Flow** from the list of processes that you want to edit.  
  
 When you select the name  of the business process flow you want to edit from the list of processes, it opens in the designer, where you can make any updates you want. Expand **Details** under the name of the process to rename it or add a description, and view additional information.  
  
 ![Expanded details section of a business process flow](media/business-process-flow-details.png "Expanded details section of a business process flow")  
  
  
## Other things to know about business process flows
 **Edit Stages**  
Business process flows can have up to 30 stages.    
  
You can add or change the following properties of a stage:  
  
- **Stage Name**  
  
- **Table**. You can change the table for any stage except the first one.  
  
- **Stage Category**. A category lets you group stages by a type of action. It is useful for reports that will group rows by the stage they are in. The options for the stage category come from the Stage Category global choice. You can add additional options to this global choice and change the labels of existing options if you want. You can also delete these options if you wish, but we recommend that you keep the existing options. You won’t be able to add the exact same option back if you delete it. If you don’t want them to be used, change the label to ”Do not use”.  
  
- **Relationship**. Enter a relationship when the preceding stage in the process is based on a different table. For the stage currently being defined, choose **Select relationships** to identify a relationship to use when moving between the two stages. It is recommended you select a relationship for the following benefits:  
  
    -   Relationships often have column maps defined that automatically carry over data between rows, minimizing data entry.  
  
    -   When you select **Next Stage** on the process bar for a row, any rows that use the relationship will be listed in the process flow, thereby promoting reuse of rows in the process. In addition, you can use workflows to automate creation of rows so that the user simply selects it instead of creating one to further streamline the process.  
  
**Edit Steps**  
 Each stage can have up to 30 steps.    
  
**Add branch**  
To learn about adding a branch to a stage, see [Enhance business process flows with branching](enhance-business-process-flows-branching.md).  
  
To make a business process flow available for people to use, you must order the process flow, enable security roles, and activate it.  
  
**Set Process Flow Order**  
 When you have more than one business process flow for a table (row type), you’ll need to set which process is automatically assigned to new rows.. In the command bar, select **Order Process Flow**. For new rows or rows that do not already have a process flow associated with them, the first business process flow that a user has access to is the one that will be used.  
  
**Enable Security Roles**  
Users have access to a business process flow depending on the privilege defined on the business process flow in the security role assigned to the user. 

By default, only the **System Administrator** and **System Customizer** security roles can view a new business process flow. 

To specify privileges on a business process flow, open the business process flow for edit, and then select **Edit Security Roles** on the command bar of the business process flow designer. See step 13 under [Create a business process flow](#create-a-business-process-flow) listed earlier in this topic.
  
**Activate**  
Before anyone can use the business process flow, you must activate it. In the command bar, select **Activate**. After you confirm the activation, the business process flow is ready to use. If a business process flow has errors, you will not be able to activate it until the errors are corrected.  

## Add an on-demand action to a business process flow
The Dynamics 365 (online), version 9.0 update introduces a business process flow feature: business process flow automation with Action Steps. You can add a button to a business process flow that will trigger an action or workflow.

### Add on-demand workflows or actions using an Action Step
Suppose that, as part of the opportunity qualification process, the Contoso organization requires all opportunities to be reviewed by a designated reviewer. Subsequently, the Contoso organization created an action that: 

- Creates a task row that is assigned to the opportunity reviewer. 
- Appends “Ready for review” to the opportunity topic. 

Additionally, Contoso needs to be able to run these actions on demand. To integrate these tasks into the opportunity qualification process, the actions must appear on the opportunity business process flow. To enable this functionality, select **As a Business Process Flow action step**.
![Available to run as a business process flow.](media/action-available-to-run.png)

Next, the Action Step is added to Contoso’s opportunity business process flow. Then the process flow is validated and updated.

![Action added to the opportunity Business Process Flow.](media/add-action-to-bpf.png)

Now, members of Contoso’s salesforce can kick-off the action from the **Opportunity Qualify** business process step, on demand, by selecting **Execute**.

![Execute action.](media/action-execute.png)

> [!IMPORTANT]
> - To be able to execute an action or workflow on demand, the business process flow must include an Action Step. If the Action Step runs a workflow, the workflow must be configured to run on demand.
> - The table associated with the action or workflow must be the same as the table associated with the business process flow.

### Limitation of using Action Steps in a business process flow

- Actions are not available as Action Steps if the input or output parameters are Table, EntityCollection, or OptionSet (Choice) types. Actions with more than one EntityReference output parameter or any number of EntityReference input parameters are not available as Action Steps. Actions not associated with a primary table (global action) are not available as Action Steps.

## The action center

When you need to see the list of business process flows in which you're involved, check out the unified action center. 

![Business process flows view of the unified action center](media/approvals-center.png "Business process flows vie of the unified action center")

![Approval flows view of the unified action center](media/action-center-bpf.png "Approval flows view of the unified action center")

In the unified action center, you will see all business processes in which you're assigned at least one Microsoft Dataverse table row that the process uses. For example, if a business process uses the **Lead** and **Opportunity** tables in Dataverse, you will see all instances of this process where either the Lead or the Opportunity row is assigned to you.

View all instances that are currently being worked under the **Active** tab. From this tab, you can view the following details:

- The name of the process.
- The current stage for each process.
- The owner of the Dataverse row associated with the active stage.
- The time since the instance was created.

To see the

Select an instance to open it in a new tab, or select it to copy a link, share a link via email, abandon, or delete the instance.
  
## Next steps

 - [Business process flows overview](business-process-flows-overview.md)  
 - [Enhance business process flows with branching ](enhance-business-process-flows-branching.md)
 - [Overview of approvals](sequential-modern-approvals.md)
 - [Detailed steps for adding an instant flow to a business process flow](/business-applications-release-notes/april19/microsoft-flow/instant-steps-business-process-flows)




[!INCLUDE[footer-include](includes/footer-banner.md)]