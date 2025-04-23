---
title: Create a business process flow in Power Apps
description: Learn how to create a business process flow
ms.date: 01/15/2025
ms.subservice: cloud-flow
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "Power Apps"
ms.assetid: efe86ab3-430f-485a-b924-6ed82cfbb449
caps.latest.revision: 39
author: HeatherOrt
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Tutorial: Create a business process flow

>[!IMPORTANT]
> As of August 2022, you can no longer create or manage business process flows from Power Automate outside of the solution explorer. Business process flows and instances continue to be supported through the solution explorer, Power Apps, and Dataverse table views.

This article shows you how to create a business process flow with [Power Apps](/power-apps/powerapps-overview). To learn more about the benefits of using business process flows, go to [Business process flows overview](business-process-flows-overview.md). For information on how to create mobile task flows, go to [Create a mobile task flow](/dynamics365/customer-engagement/customize/create-mobile-task-flow).  
  
 When a user starts a business process flow, the stages and steps of the process display in the process bar at the top of a form.

 ![Business process with stages.](media/business-process-stages.png "Business process with stages")  
  
 >[!TIP]
 >After you create a business process flow definition, you can control who can create, read, update, or delete the business process flow instance. For example, for service-related processes, provide full access for customer service reps to change the business process flow instance, but provide read-only access for sales reps to monitor post-sales activities for their customers. To set security for a business process flow definition that you create, select **Enable Security Roles** on the action bar.  
  
<a name="BKMK_Createbusinessprocessflows"></a>

## Prerequisites

* To create business process flows, you need a Power Apps or Power Automate **per user** license, or a [Dynamics 365 license plan](https://go.microsoft.com/fwlink/?linkid=2085130) that includes business process flow use rights.
* A table with which the business process flow is associated. If the business process flow isn't related to an existing table, [create a new table](/power-apps/maker/data-platform/create-edit-entities-portal) before you create the flow.

## Create a business process flow
  
1. In [Power Apps](https://make.powerapps.com) or [Power Automate](https://make.powerautomate.com), select **Solutions** from the navigation bar on the left.
1. Select or create a [solution](/power-apps/maker/data-platform/solutions-overview) to use for the business process flow.
1. Within the solution, select **New** > **Automation** > **Process** > **Business process flow**.
   1. Give your flow a **Display name** and **Name** ([LogicalName](/power-apps/developer/data-platform/entity-metadata)).
   1. Select the table to use for the flow.
   1. Select **Create**.
  
     The new business process flow is created. You can now edit it with a first single stage created for you.  
     ![Business process flow window showing main elements.](media/business-process-flow-window-showing-main-elements.png "Business process flow window showing main elements")  
1. **Add stages.** If your users progress from one business stage to another in the process:
  
    1. Drag a **Stage** component from the **Components** tab and drop it on a + sign in the designer.  
  
        ![Drag a business process stage.](media/drag-business-process-stage.png "Drag a business process stage")  
    1. To set the properties for a stage, select the stage, and then set the properties in the **Properties** tab on the right side of the screen:  
  
        * Enter a display name.  
        * If desired, select a category for the stage. The category (such as **Qualify** or **Develop**), appears as a chevron in the process bar.  
  
            ![Business process bar chevron.](media/business-process-bar-chevron.png "Business process bar chevron")  
        * When you're done changing properties, select the **Apply** button.  
1. **Add steps to a stage.** To see the steps in a stage, select **Details** in the lower-right corner of the stage. To add more steps:  
  
    1. Drag the **Step** component to the stage from the **Components** tab.  
  
        ![Add step to a stage in a business process.](media/add-step-stage-business-process.png "Add step to a stage in a business process")  
  
    1. Select the step, and then set properties in the **Properties** tab:  
  
        1. Enter a display name for the step.  
        1. If you want users to enter data to complete a step, select the appropriate column from the drop-down list.  
        1. Select **Required** if people must fill in the column to complete the step before moving to the next stage of the process.  
        1. Select **Apply** when you're done.  

     > [!NOTE]
     >
     > * If you set a two-option boolean column as **Required**, users can't continue unless the column value is **Yes**. The user is required to mark the column as completed before moving to the next stage.
     > * If either **Yes** or **No** are acceptable column values, then you should make the column a choice instead of a two-option boolean column.
  
1. **Add a branch (condition) to the process.** To add a branching condition:  
  
     1. Drag the **Condition** component from the **Components** tab to a + sign between two stages.

        ![Add a Condition to a business process flow.](media/add-condition-business-process-flow.png "Add a Condition to a business process flow")
     1. Select the condition, and then set properties in the **Properties** tab. For more information on branching properties, go to [Enhance business process flows with branching](enhance-business-process-flows-branching.md). When you're finished setting properties for the condition, select **Apply**.  

1. **Add a workflow.** To invoke a workflow:  
  
    1. Drag a **Workflow** component from the **Components** tab to a stage or the **Global Workflow** item in the designer. Where you add it depends on these conditions:

        * **Drag it to a stage** to trigger the workflow on entry or exit of the stage. The workflow component must be based on the same primary table as the stage.
        * **Drag it to the Global Workflow item** to trigger the workflow when the process is activated or archived (when the status changes to **Completed** or **Abandoned**). The workflow component must be based on the same primary table as the process.
    1. Select the workflow, and then set properties in the **Properties** tab:  

        1. Enter a display name.  
        1. Select when the workflow should be triggered.  
        1. Search for an existing on-demand active workflow that matches the stage table or create a new workflow by selecting **New**.  
        1. Select **Apply** when you're done.  
  
    For more information on workflows, go to [Workflow processes](/power-automate/workflow-processes).  
  
1. To validate the business process flow, select **Validate** on the action bar.  
1. To save the process as a draft while you continue to work on it, select **Save** in the action bar.  
  
    > [!IMPORTANT]
    > As long as a process is a draft, people aren't able to use it.  
  
1. To activate the process and make it available to your team, select **Activate** on the action bar.  

1. To provide control over who can create, read, update, or delete the business process flow instance, select **Edit Security Roles** on the command bar of the designer. For example, for service-related processes, provide full access for customer service reps to change the business process flow instance, and read-only access for sales reps to monitor post-sales activities for their customers.

  In the **Security Roles** screen, select the name of a role to open the security role information page. Select the Business Process Flows tab, and then assign appropriate privileges on the business process flow for a security role.

  > [!NOTE]
  > The System Administrator and System Customizer security roles have access to new business process flows by default.

   ![Assign privileges to a business process flow.](media/bpf-assign-privileges.png)

  Specify privileges by selecting the appropriate radio buttons, and select **Save**. For more information about privileges, go to [Business process flow privileges](business-process-flows-overview.md).

  Next, don't forget to assign the security role to appropriate users in your organization.

> [!TIP]
>Here are a few tips to keep in mind as you work on your task flow in the designer window:  
>
> * To take a snapshot of everything in the business process flow window, select **Snapshot** on the action bar. This option is useful if you want to share and get comments on the process from a team member.
> * Use the mini-map to navigate quickly to different parts of the process. This feature is useful when you have a complicated process that scrolls off the screen.  
> * To add a description for the business process, select **Details** under the process name in the left corner of the business process flow window. You can use up to 2,000 characters.

### Design business process flows with branches

Consider these points when designing business process flows with branches:
  
* A process can span a maximum of five unique tables.  
* Use a maximum of 30 stages per process and 30 steps per stage.
* Each branch can be no more than 10 levels deep.  
* Branching rules must be based on the steps in the preceding stage.
* You can combine multiple conditions in a rule by using the `AND` operator or the `OR` operator, but not both operators.  
* When defining a process flow, optionally select a table relationship. This relationship must be a 1:N (One-to-Many) relationship.
* Multiple active processes can run concurrently on the same record.
* Rearrange tiles (stages, steps, conditions) on the process flow by dragging and dropping.
* When merging branches using the connector command, all peer branches must merge to a single stage. Peer branches must merge to a single stage or end the process. A peer branch can't merge with other branches and end the process at the same time.
* You can revisit a table used in the process multiple times (multiple closed entity loops).
* A process can return to the previous stage regardless of the table type.

    For example, if the active stage is **Deliver Quote** on a quote record, users can move the active stage back to the **Propose** stage on an opportunity record. 

    In another example, suppose a process is in the **Present Proposal** stage in your process flow: **Qualify Lead** > **Identify Needs** > **Create Proposal** > **Present Proposal** > **Close**. If the proposal requires more research to identify customer needs, users can select the **Identify Needs** stage of your process and choose **Set Active**.  

<a name="BKMK_Editbusinessprocessflows"></a>
## Edit a business process flow  
 To edit a business process flow, open the solution explorer, select **Processes**, and then select the **Business Process Flow** from the list of processes that you want to edit.  
  
 Select the business process flow you want to edit from the list of processes. It opens in the designer, where you can make updates. Expand **Details** under the name of the process to rename it or add a description, and view additional information.  
  
 ![Expanded details section of a business process flow.](media/business-process-flow-details.png "Expanded details section of a business process flow")  
  
## Other things to know about business process flows

 **Edit Stages**  
Business process flows can have up to 30 stages.
  
You can add or change the following properties of a stage:  
  
* **Stage Name**  
  
* **Table**. You can change the table for any stage except the first one.  
  
* **Stage Category**. A category lets you group stages by a type of action. It's useful for reports that group rows by the stage they are in. The options for the stage category come from the Stage Category global choice. You can add more options to this global choice and change the labels of existing options if you want. You can also delete these options if you wish, but we recommend that you keep the existing options. You can't add the exact same option back if you delete it. If you don’t want them to be used, change the label to ”Do not use”.  
  
* **Relationship**. Enter a relationship when the preceding stage in the process is based on a different table. For the stage currently being defined, choose **Select relationships** to identify a relationship to use when moving between the two stages. Select a relationship for the following benefits:  
  
  * Relationships often have column maps defined that automatically carry over data between rows, minimizing data entry.  
  
  * When you select **Next stage** on the process bar for a row, any rows that use the relationship are listed in the process flow, promoting reuse of rows in the process. In addition, you can use workflows to automate creation of rows so that the user simply selects it instead of creating one to further streamline the process.  
  
**Edit Steps**  
 Each stage can have up to 30 steps.
  
**Add branch**  
To learn about adding a branch to a stage, go to [Enhance business process flows with branching](enhance-business-process-flows-branching.md).  
  
To make a business process flow available for people to use, you must order the process flow, enable security roles, and activate it.  
  
**Set Process Flow Order**  
 When you have more than one business process flow for a table (row type), you need to set which process is automatically assigned to new rows. In the command bar, select **Order Process Flow**. For new rows or rows that don't already have a process flow associated with them, the first business process flow that a user has access to is used.  
  
**Enable Security Roles**  
Users have access to a business process flow depending on the privilege defined on the business process flow in the security role assigned to the user.

By default, only the **System Administrator** and **System Customizer** security roles can view a new business process flow.

To specify privileges on a business process flow, open the business process flow for edit, and then select **Edit Security Roles** on the command bar of the business process flow designer. See step 13 under [Create a business process flow](#create-a-business-process-flow) listed earlier in this article.
  
**Activate**  
Before anyone can use the business process flow, you must activate it. In the command bar, select **Activate**. After you confirm the activation, the business process flow is ready to use. If a business process flow has errors, you can't activate it until the errors are corrected.  

## Add an on-demand action to a business process flow

The Dynamics 365 (online), version 9.0 update introduces a business process flow feature: business process flow automation with Action Steps. You can add a button to a business process flow that triggers an action or workflow.

### Add on-demand workflows or actions using an Action Step

As part of the opportunity qualification process, Contoso requires a designated reviewer to review all opportunities. Later Contoso created an action that:

* Creates a task row that is assigned to the opportunity reviewer.
* Appends “Ready for review” to the opportunity topic.

Additionally, Contoso needs to be able to run these actions on demand. To integrate these tasks into the opportunity qualification process, the actions must appear on the opportunity business process flow. To enable this functionality, select **As a Business Process Flow action step**.
![Available to run as a business process flow.](media/action-available-to-run.png)

Next, the Action Step is added to Contoso’s opportunity business process flow. Then the process flow is validated and updated.

![Action added to the opportunity Business Process Flow.](media/add-action-to-bpf.png)

Now, members of Contoso’s salesforce can kick off the action from the **Opportunity Qualify** business process step, on demand, by selecting **Execute**.

![Execute action.](media/action-execute.png)

> [!IMPORTANT]
> * To be able to execute an action or workflow on demand, the business process flow must include an Action Step. If the Action Step runs a workflow, the workflow must be configured to run on demand.
> * The table associated with the action or workflow must be the same as the table associated with the business process flow.

### Limitation of using Action Steps in a business process flow

* Actions aren't available as Action Steps if the input or output parameters are Table, EntityCollection, or OptionSet (Choice) types. Actions with more than one EntityReference output parameter or any number of EntityReference input parameters aren't available as Action Steps. Actions not associated with a primary table (global action) aren't available as Action Steps.

## The action center

When you need to see the list of business process flows in which you're involved, check out the unified action center.

![Business process flows view of the unified action center.](media/approvals-center.png "Business process flows vie of the unified action center")

![Approval flows view of the unified action center.](media/action-center-bpf.png "Approval flows view of the unified action center")

In the unified action center, you see all business processes in which you're assigned at least one Microsoft Dataverse table row that the process uses. For example, if a business process uses the **Lead** and **Opportunity** tables in Dataverse, you see all instances of this process where either the Lead or the Opportunity row is assigned to you.

View all instances that are currently being worked under the **Active** tab. From this tab, you can view the following details:

* The name of the process.
* The current stage for each process.
* The owner of the Dataverse row associated with the active stage.
* The time since the instance was created.

Select an instance to open it in a new tab, or select it to copy a link, share a link via email, abandon, or delete the instance.
  
## Next steps

* [Business process flows overview](business-process-flows-overview.md)  
* [Enhance business process flows with branching](enhance-business-process-flows-branching.md)
* [Overview of approvals](sequential-modern-approvals.md)
* [Detailed steps for adding an instant flow to a business process flow](/business-applications-release-notes/april19/microsoft-flow/instant-steps-business-process-flows)

[!INCLUDE[footer-include](includes/footer-banner.md)]
