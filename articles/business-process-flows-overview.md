---
title: "Business process flows overview | MicrosoftDocs"
description: "An overview of business process flows in Power Automate."
ms.date: 01/14/2022
ms.reviewer: ""
ms.service: power-automate
author: MSFTMAN
ms.suite: ""
ms.tgt_pltfrm: ""
ms.subservice: cloud-flow
ms.topic: overview

applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "Power Apps"
ms.assetid: 4469877e-bb95-481a-bc52-c9746f937ce5
caps.latest.revision: 16
ms.author: "DEONHE"
manager: "kvivek"
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Business process flows overview


You can help ensure that people enter data consistently and follow the same steps every time they work with a customer by creating a business process flow. For example, you might want to create a business process flow to have everyone handle customer service requests the same way, or to require that people get approval for an invoice before submitting an order. Business process flows use the same underlying technology as other processes, but the capabilities that they provide are very different from other features that use processes. To learn how to create or edit a business process flow, see [Create a business process flow](create-business-process-flow.md).  
  
 [Watch a short video (4:49) about business process flows.](https://go.microsoft.com/fwlink/p/?linkid=842226)  
  
<a name="BKMK_Why"></a>   
## Why use business process flows?  
Business process flows provide a guide for people to get work done. They provide a streamlined user experience that leads people through the processes their organization has defined for interactions that need to be advanced to a conclusion of some kind. This user experience can be tailored so that people with different security roles can have an experience that best suits the work they do.  
  
 Use business process flows to define a set of steps for people to follow to take them to a desired outcome. These steps provide a visual indicator that tells people where they are in the business process. Business process flows reduce the need for training because new users don’t have to focus on which table they should be using. They can let the process guide them. You can configure business process flows to support common sales methodologies that can help your sales groups achieve better results. For service groups, business process flows can help new staff get up-to-speed more quickly and avoid mistakes that could result in unsatisfied customers.  
  
<a name="BKMK_What"></a>   
## What can business process flows do?  
 With business process flows, you define a set of *stages* and *steps* that are then displayed in a control at the top of the form.  
  
 ![Business process with stages.](media/business-process-stages.png "Business process with stages")  
  
 Each stage contains a group of steps. Each step represents a column where data can be entered. You can advance to the next stage by using the **Next Stage** button. In the unified interface, you can work with a business process flow stage inside the stage flyout or you can pin it to the side pane. Business process flows doesn't support expanding the stage flyout to the side pane on mobile devices. 
 
 You can make a step *required* so that people must enter data for a corresponding column before they can proceed to the next stage. This is commonly called ”stage-gating”. If you are adding a business-required or system-required column to a business process flow stage, we recommend that you add this column to your form as well. 
  
 Business process flows appear relatively simple compared to other types of processes because they do not provide any conditional business logic or automation beyond providing the streamlined experience for data entry and controlling entry into stages. However, when you combine them with other processes and customizations, they can play an important role in saving people time, reducing training costs, and increasing user adoption.  
 
> [!NOTE]
> If any stage, including the current stage, has required columns (except hidden columns), you must fill in the columns on those stages *before* you save the form or move to a new stage. Disabled columns will still block stage navigation if they are empty and required.

<a name="BKMK_BPFwithOtherCustomizations"></a>   
### Business process flows integrated with other customizations  
 When you or your user enters data using business process flows, the data changes are also applied to form columns so that any automation provided by business rules or form scripts can be applied immediately. Steps can be added that set values for columns that are not present in the form and these columns will be added to the `Xrm.Page` object model used for form scripts. Any workflows that are initiated by changes to columns included in a business process flow will be applied when the data in the form is saved. If the automation is applied by a real-time workflow, the changes will be immediately visible to the user when the data in the form is refreshed after the row is saved.  
  
 Although the business process flow control in the form does not provide any direct client-side programmability, changes applied by business rules or form scripts are automatically applied to business process flow controls. If you hide a column in a form, that column will also be hidden in the business process flow control. If you set a value by using business rules or form scripts, that value will be set within the business process flow.  
  
### Concurrent process flows  
 Concurrent business process flows let customizers configure multiple business processes and associate them with the same starting row. Users can switch between multiple business processes running concurrently, and resume their work at the stage in the process that they were on.  
  
<a name="BKMK_SystemBPF"></a>   
### System business process flows  
 The following business process flows are included. To understand how business process flows work, review these system business process flows:  
  
-   Lead to Opportunity Sales Process  
  
-   Opportunity Sales Process  
  
-   Phone to Case Process  
  
<a name="BKMK_multipleEntities"></a>   
## Multiple tables in business process flows  
 You can use a business process flow for a single table or span multiple tables. For example, you may have a process that begins with an opportunity, then continues to a quote, an order, and then an invoice, before finally returning to close the opportunity.  
  
 You can design business process flows that tie together the rows for up to five different tables into a single process so that people using the app can focus on the flow of their process rather than on which table they are working in. They can more easily navigate between related table rows.  
  
<a name="BKMK_MultipleBPF"></a>   
## Multiple business process flows are available per table  
 Not every user in an organization may follow the same process and different conditions may require that a different process be applied. You can have up to 10 active business process flows per table to provide appropriate processes for different situations.  
  
<a name="BPF_controlsWhichBPF"></a>   
### Control which business process flow will be applied  
 You can associate business process flows with security roles so that only people with those security roles can see or use them. You can also set the order of the business process flows so that you can control which business process flow will be set by default. This works in the same way that multiple forms for a table are defined.  
  
 When someone creates a new table row, the list of available active business process definition is filtered by the user’s security role. The first activated business process definition available for the user’s security role according to the process order list is the one applied by default. If more than one active business process definitions is available, users can load another from the Switch Process dialog. Whenever processes are switched, the one currently rendered goes to the background and is replaced by the selected one, but it maintains its state and can be switched back. Each row can have multiple process instances associated (each for a different business process flow definition, up to a total of 10). On form load, only one business process flow is rendered. When any user applies a different process, that process may only load by default for that particular user.  
  
 To make sure a business process is loaded by default for all user (behavior equivalent to “pinning” the process), a custom Client API script (web resource) can be added on form load that specifically loads an existing business process instance based on the business process definition ID. 
 
  
<a name="BKMK_Considerations"></a>   
## Business process flow considerations  
 You can define business process flows only for those tables that support them. You also need to be aware of the limits for the number of processes, stages, and steps that can be added.  
  
### Business process flows that call a workflow  
 You can call on-demand workflows from inside a business process flow. You can configure this from the new business process flow designer by dragging a workflow component to a process stage or to the Global Workflows section. For more information about using workflows in business process flows, see [Blog: Business process flow automation in Dynamics 365](https://blogs.msdn.microsoft.com/crm/2017/03/28/business-process-flow-automation-in-dynamics-365/).  
  
 When you include a workflow that you want to trigger on Stage Exit of a stage in your business process flow, and that stage is  the last stage in the flow, the designer gives the impression that the workflow will be triggered when that stage is completed. However, the workflow will not be triggered because a stage transition does not take place. You will not receive a warning or error preventing you from including the workflow on the stage. When a user interacts with the business process flow, finishing or abandoning the process does not result in a stage transition, and therefore the workflow is not triggered. Consider the following examples:  
  
-   You create a business process flow with two stages, S1 connects to  S2, with a workflow on stage S2 and set the trigger to **Stage Exit**.  
  
-   You create a business process flow with three stages, S1 connect to S2, then S2 branches to S3. You include a workflow on S2 and set the trigger to **Stage Exit**.  
  
 The workflow will not trigger in either case. To work around this issue, you can add a Global Workflow and add the workflow you want to trigger to it so that the workflow is triggered for the business process rather than a stage of the process. You can set the trigger for a Global workflow to Process Abandoned or Process Completed to cause the workflow to trigger when a user abandons or completes the business process.  
  
<a name="BKMK_Entities"></a>   
### Tables that can use business process flows  
 All custom tables can use business process flows. The following standard tables can also use business process flows:  
  
-   Account  
-   Appointment  
-   Campaign  
-   Campaign Activity  
-   Campaign Response  
-   Competitor  
-   Contact  
-   Email  
-   Entitlement  
-   Fax  
-   Case  
-   Invoice  
-   Lead  
-   Letter  
-   Marketing List  
-   Opportunity  
-   Phone Call  
-   Product  
-   Price List Item  
-   Quote  
-   Recurring Appointment  
-   Sales Literature  
-   Social Activity  
-   Order  
-   User  
-   Task  
-   Team  
  
 To enable a custom table for business process flows, select the **Business process flows (columns will be created)** check box in the table definition. Note that you can’t undo this action.  
  
> [!NOTE]
>  If you navigate to the business process flow stage that contains the `Social Activity` table and choose the **Next Stage** button, you’ll see the **Create** option. When you choose **Create**, the **Social Activity** form loads. However, because `Social Activity` isn’t valid for `Create` from the app user interface, you won’t be able to save the form and you’ll see the error message: “Unexpected error.”  
  
<a name="BPF_MaxNumbers"></a>   
### Maximum number of processes, stages, and steps  
 To ensure acceptable performance and the usability of the user interface, there are some limitations you need to be aware of when you plan to use business process flows:  
  
-   There can be no more than 10 activated business process flow processes per table.  
  
-   Each process can contain no more than 30 stages.  
  
-   Multi-table processes can contain no more than five tables.
  
## Business process flow table customization support 

Introduced in the Dynamics 365 (online), version 9.0 update, business process flow tables can appear in the system so that table row data can be made available in grids, views, charts, and dashboards. 

### Use business process flow table rows with grids, views, charts, and dashboards

With business processes flows available as an table, you can now use advanced finds, views, charts, and dashboards sourced from business process flow data for a given table, such as a lead or opportunity. System administrators and customizers can create custom business process flow grids, views, charts, and dashboards similar to those created with any other table.

Business process flows, such as **Lead To Opportunity Sales Process**, appear as a customizable table in solution explorer.

![Solution Explorer with lead-to-opportunity process table.](media/bpf-lead-solution-explorer.png)

To access a default business process flow view, open solution explorer, expand **Tables** > expand the process that you want, such as **Lead To Opportunity Sales Process**, select **Views**, and then select the view that you want.

Several default views are available that you can view as a chart, such as the **Active Opportunity Sales Process** view. 

![Active Opportunity Sales Process view.](media/bpf-default-view.png)

### Interact with the business process flow table from a workflow
You can also interact with business process flow tables from a workflow. For example, you can create a workflow for the Business Process Flow table row to change the Active Stage when a column on the Opportunity table row is updated. For more information about how to do this, see [Automate business process flow stages using workflows](https://blogs.msdn.microsoft.com/crminthefield/2017/12/18/automate-business-process-flow-stages-using-workflows).

### Run business process flows offline

You can use business process flows offline if the following conditions are met:

- The business process flow is used from a Power Apps app.
- The Power Apps app is enabled for offline use.
- The business process flow has a single table.

Specifically, the three commands that are available for a business process flow when the Power Apps app is offline are:

- Next stage
- Previous stage
- Set Active stage

### Lookup column in a business process flow stage

Recent rows are visible in a lookup column in the unified interface. To prevent the most recently used items from showing up in the lookup, follow these steps:
1. Open the [Power Apps maker portal](https://make.powerapps.com/home), and then select the correct environment from the top right of the screen. 
1. Go to **Tables** under **Data**. Search for your business process flow table.

   ![A screenshot of a business process flow table.](./media/bpf-entity-table.png)

1. Select **Forms**, and select the **Information** editor.
1. Select your lookup data step from the **Tree view**, and then check **Disable most recently used items**.

   ![A screenshot how to disable the most recently used items.](./media/bpf-disable-mru.png)

1. Save, and then publish. 

### Limitations of using business process flow tables

- Currently, you can’t create custom forms for tables based on a business process flow.
- If a solution includes a business process flow table, the business process flow table must be manually added to the solution before you export it. Otherwise, the business process flow table will not be included in the solution package. More information: [create and edit tables](/powerapps/maker/common-data-service/create-edit-tables-solution-explorer).
- Adding the process table to a model-driven app may result in limited functionality. Learn more about [creating and editing business process flows](./create-business-process-flow.md). 

### Next steps  
 [Watch a short video (4:49) about business process flows](https://go.microsoft.com/fwlink/p/?linkid=842226)   
 [Create a business process flow](create-business-process-flow.md)   
 [Enhance business process flows with branching](enhance-business-process-flows-branching.md) <br/>
 [Whitepaper: Process Enablement with Dynamics 365](https://download.microsoft.com/download/C/3/B/C3B46E35-9445-43B9-800B-474E022EE352/Process%20Enablement%20with%20Microsoft%20Dynamics%20CRM%202013.pdf)</br>


[!INCLUDE[footer-include](includes/footer-banner.md)]
