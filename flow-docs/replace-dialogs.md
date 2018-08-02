---
title: "Replace dialogs with business process flows or canvas apps | MicrosoftDocs"
ms.custom: ""
ms.date: 06/11/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 046480e6-f2ff-4c56-9e03-f642c982ff7d
caps.latest.revision: 12
author: "Mattp123"
ms.author: "matp"
manager: "kvivek"
---
# Replace dialogs with business process flows or canvas apps

A dialog process creates an interactive step-by-step data entry form that requires user input to start and run to completion. When the user starts the dialog process, a wizard-like interface is presented. Then, users make selections or enter data as they progress through each page of the wizard.

[Dialogs are deprecated](https://docs.microsoft.com/dynamics365/get-started/whats-new/customer-engagement/important-changes-coming#dialogs-are-deprecated). Dialogs should be replaced by Business Process Flows or Canvas Apps. This topic describes different situations where a business process flow or canvas app embedded in a model-driven form can be used to replace an existing dialog.

## Feature capability comparison

This table lists the set of dialog capabilities and the equivalent capabilities in business process flows and canvas apps.


|Dialog capability  | Capability in business process flows?  | Capability in canvas apps?  |
|---------|---------|---------|
|Page     | Yes <br/> (business process stage)    | Yes <br/> (app screen)        |
|Prompt only   |  No    |  Yes <br/> (labels)        |
|Prompt and response     |  Yes <br/> (entity attributes only)    | Yes <br/> (labels and input fields)    |
|Input arguments     |  Limited <br/> (steps in business process stage)    | Yes <br/> (query string parameters)     |
|Variables   |  No     |  Yes       |
|Query variables    |  No     |  Yes     |
|Conditional branching logic    |  Yes     | Yes <br/>  (navigate to any screen within app)    |
|Reuse <br/> (Launch as a child dialog)   |  No     | Yes <br/> (Navigate to any screen within app, launch a different app in a new window)     |
|Run workflows on start/end    |   Yes      |  No <br/> (use a flow instead)  |
|Run workflows on input    | Yes    | No <br/> (use a flow instead)   |
|Run workflows on page transition   |  Yes       | No <br/> (use a flow instead)    |
|Start using a URL  |   No      |  Yes     |
|Session logging    |  Yes       |  No     |
|SDK support   |  Yes     |  Yes     |

### Additional capabilities with business process flows
- Process analytics (views, charts, and time spent in a stage)
- Custom controls

### Additional capabilities with canvas apps
- App analytics (app usage & performance)
- Multi-entity page composition
- Run flows
- Data connectors (standard and custom)
- Launch as a stand-alone app
- Configurable layout

## Choosing between a business process flow or canvas app
When you choose your dialog replacement, it is important to account for the user experience you’d want to deliver. Also keep in mind, almost any dialog can be modeled using a canvas app.

Business process flows are best suited to replace dialogs that model processes providing guidance across an overarching workstream requiring collaboration across groups of individuals and some Dynamics 365 app context. For example, quote review and routing. 

Alternatively, canvas apps can be used to replace dialogs that model prescriptive tasks such as walking through a call script when prospecting a lead or simplify the user experience for other tasks, such as updating an opportunity. Notice that these scenarios may even benefit from having a stand-alone app. 

## Dialog replacement using business process flow scenario
Imagine you have a dialog that, over a series of pages, requests key pieces of information from the user, generates a quote, sends an email to reviewers to accept/reject the quote, before emailing it to the customer. This type of process is modeled more effectively using a business process flow. 

To replace the dialog, you begin by identifying the key stages in the process. These might include a *Prepare Content* stage to ensure all the products are listed, and discounts are applied, a *Generate Quote* stage to create the quote and review it for accuracy of format, a *Primary Review* stage to send the quote for review and approval, a *Secondary Review* stage to review the quote under certain circumstances and finally, a *Deliver Quote* stage to send the quote to the customer.

Next, identify the key steps that users must follow in the process. For instance, the *Prepare Content* stage might contain a simple true or false step for the user to double check the products to be quoted, a mandatory lookup step to select a price list, and a numeric step to enter a discount before moving on to the next stage. The *Generate Quote* stage might have a an [action step](create-business-process-flow.md#preview-feature-add-an-on-demand-action-to-a-business-process-flow) to create a quote based on all the information previously captured in the *Prepare Content* stage and its related Dynamics 365 record. The *Primary Review* and *Secondary Review* stages might have several true or false steps to guide quote review, along with a required step to capture the approval status, and ensuring the process can only be moved to the next stage once approval is received. Configure [field level security](/customer-engagement/admin/field-level-security) on this step to ensure that only authorized reviewers can provide approval on the quote.  Additionally, one can add a workflow to the *Primary Review* and *Secondary Review* stages, such that on enter, an email notification is sent to all reviewers 

Finally, configure your business process flow stages and steps, along with the conditional logic to guide the process flow. For this example, you might add a [conditional branch](enhance-business-process-flows-branching.md) following the *Primary Review* stage, such that, if a step indicates the need for a second level of review, the next stage in the process is the *Secondary Review* stage, else, it’s the *Deliver Quote* stage.

To make this business process flow available to users, ensure the right users have privileges to the business process flow and then activate it.

For more information about how to create a business process flow, see [Tutorial: Create a business process flow to standardize processes](create-business-process-flow.md).

## Dialog replacement using canvas app scenario

