---
title: Replace dialogs with business process flows or canvas apps 
description: Learn about the capabilities of business process flows and canvas apps.
ms.custom: ""
ms.date: 08/02/2018
ms.suite: ""
ms.tgt_pltfrm: ""
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "flow"
ms.assetid: 046480e6-f2ff-4c56-9e03-f642c982ff7d
caps.latest.revision: 12
author: "Mattp123"
ms.author: "angieandrews"
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Replace dialogs with business process flows or canvas apps


[Dialogs are deprecated](/dynamics365/get-started/whats-new/customer-engagement/important-changes-coming#dialogs-are-deprecated), and should be replaced by business process flows or canvas apps. This article describes different capabilities of these options. You'll also learn about situations where a business process flow or canvas app embedded in a model-driven form can be used to replace an existing dialog.

## Feature capability comparison

This table lists the set of dialog capabilities and the equivalent capabilities in business process flows and canvas apps.


|Dialog capability  | Capability in business process flows?  | Capability in canvas apps?  |
|---------|---------|---------|
|Page     | Yes <br/> (business process stage)    | Yes <br/> (app screen)        |
|Prompt only   |  No    |  Yes <br/> (labels)        |
|Prompt and response     |  Yes <br/> (table columns only)    | Yes <br/> (labels and input fields)    |
|Input arguments     |  Limited <br/> (steps in business process stage)    | Yes <br/> (query string parameters)     |
|Variables   |  No     |  Yes       |
|Query variables    |  No     |  Yes     |
|Conditional branching logic    |  Yes     | Yes <br/>  (navigate to any screen within app)    |
|Reuse <br/> (launch as a child dialog)   |  No     | Yes <br/> (navigate to any screen within app, launch a different app in a new window)     |
|Run workflows on start/end    |   Yes      |  No <br/> (use a cloud flow instead)  |
|Run workflows on input    | Yes    | No <br/> (use a cloud flow instead)   |
|Run workflows on page transition   |  Yes       | No <br/> (use a cloud flow instead)    |
|Start using a URL  |   No      |  Yes     |
|Session logging    |  Yes       |  No     |
|SDK support   |  Yes     |  Yes     |

### Additional capabilities with business process flows
- Process analytics (views, charts, and time spent in a stage)
- Custom controls

### Additional capabilities with canvas apps
- App analytics (app usage & performance)
- Multi-table page composition
- Run flows
- Data connectors (standard and custom)
- Launch as a stand-alone app
- Configurable layout

## Choosing between a business process flow or canvas app
When you choose your dialog replacement, it is important to account for the user experience you want to deliver. Also keep in mind, almost any dialog can be modeled using a canvas app.

Business process flows are best suited to replace dialogs that model processes providing guidance across an overarching workstream that requires collaboration across groups of individuals and Dynamics 365 app context. For example, quote review and routing.

Alternatively, canvas apps can be used to replace dialogs that model prescriptive tasks such as a call script for lead prospecting or to simplify the user experience for other tasks, such as updating an opportunity. Notice that these scenarios may even benefit from having a stand-alone canvas app. 

## Dialog replacement using business process flow scenario
Imagine you have a dialog that, over a series of pages, requests key pieces of information from the user, generates a quote, sends an email to reviewers to accept or reject the quote, before emailing it to the customer. This type of process is modeled more effectively using a business process flow. 

To replace the dialog, you begin by identifying the key stages in the process. These might include a *Prepare Content* stage to ensure all the products are listed and discounts are applied, a *Generate Quote* stage to create the quote and review it for accuracy of format, a *Primary Review* stage to send the quote for review and approval, a *Secondary Review* stage to review the quote under certain circumstances and finally, a *Deliver Quote* stage to send the quote to the customer.

Next, identify the key steps that users must follow in the process. For instance, the *Prepare Content* stage might contain a simple true or false step for the user to double check the products to be quoted, a mandatory lookup step to select a price list, and a numeric step to enter a discount before moving on to the next stage. The *Generate Quote* stage might have an [action step](create-business-process-flow.md#add-an-on-demand-action-to-a-business-process-flow) to create a quote based on all the information previously captured in the *Prepare Content* stage and its related Dynamics 365 row. The *Primary Review* and *Secondary Review* stages might have several true or false steps to guide quote review, along with a required step to capture the approval status, and ensure the process can only be moved to the next stage once approval is received. Configure [column level security](/dynamics365/customerengagement/on-premises/admin/field-level-security) on this step to make sure that only authorized reviewers can provide approval on the quote.  Additionally, one can add a workflow to the *Primary Review* and *Secondary Review* stages, such that on enter, an email notification is sent to all reviewers. 

Finally, configure your business process flow stages and steps, along with the conditional logic to guide the process flow. For this example, you might add a [conditional branch](enhance-business-process-flows-branching.md) following the *Primary Review* stage, such that, if a step indicates the need for a second level of review, the next stage in the process is the *Secondary Review* stage, else, it’s the *Deliver Quote* stage.

To make this business process flow available to users, ensure the right users have privileges to the business process flow and then activate it.

For more information about how to create a business process flow, see [Tutorial: Create a business process flow to standardize processes](create-business-process-flow.md).

## Dialog replacement using canvas app scenario

Suppose you have a dialog, which follows a call script that guides sales reps through cold calling leads. This process can easily be captured using a canvas app.

Begin with connecting to the data sources you’ll need to read and write data. In this example, a [connection to Dynamics 365](/powerapps/maker/canvas-apps/connections/connection-dynamics-crmonline) is used for lead, account, and contact information.

Begin by identifying the number of screens needed. For this example, you may decide to have five screens. 
-	Screen 1. To select a lead from a list to call.
-	Screen 2. For introductions, checking availability for a conversation, and scheduling a call-back at a later date. 
-	Screen 3. For determining BANT (budget, authority, need, and timeline). 
-	Screen 4. To capture next steps and schedule follow-up calls. 
-	Screen 5. Thank the lead for their time at the end of the call.

Next, build each screen. In the first screen, [build a gallery](/powerapps/maker/canvas-apps/customize-layout-sharepoint) of leads that need to be called. In the second, use labels to title the screen and provide the call script, while using controls like radio buttons to capture whether it is a good time for the person to talk. If it is, use conditional logic to enable a button to navigate to the next screen and if not, reveal a script on the same screen to attempt to schedule a call back with the customer. Similarly, define your call script across subsequent screens.

Finally, [define navigation across screens](/powerapps/maker/canvas-apps/functions/function-navigate). In this example, in addition to navigating through the screens sequentially, you might want to navigate the user from the second screen to the last screen (the end of the script thanking the lead for their time) if the lead is not interested in having a conversation.

To make this app available to users, publish the app. Consider how such a scenario might be transformed through the availability of a standalone app that provides call scripts and supports quick data entry.

Imagine you want to embed this experience in Dynamics 365 Sales. To do this, begin with creating an iframe on a Dynamics 365 Sales form. Next, navigate to the **Apps** section from the Power Apps menu, select the app you just published, copy the web link under the **Details** tab and paste it as the URL for the iframe. 

Taking this a step further, suppose you’d like for this app to be available right within the lead main form, and be in the context of the lead so that the app doesn’t require the user to select a lead in the first screen. To pass relevant information to the app, you simply modify the iframe URL to append a query string containing this information, such as lead or account Ids, using JavaScript that runs on a certain event, such as on form load. Next, update the app to remove the first screen (for lead selection) and instead access the values passed to the app via the query string using the [Param function](/powerapps/maker/canvas-apps/functions/function-param).

## Dialog replacement FAQ

Are dependencies on canvas apps be tracked? 
- Dependencies on canvas apps are tracked in the same way as dependencies in Dynamics 365 apps.

Can I launch a canvas app as a popup from a button in the command bar?
- Yes. To do this, simply set the target URL to that of your canvas app, obtained from the app's **Details** section as described earlier.

Can workflows be called from a canvas app?
- This isn't supported. We recommend using a cloud flow instead.

Can I automatically convert dialogs to business process flows or canvas apps?
- There is no automated way to convert dialogs to business process flows or canvas apps.

## Related information

- [Tutorial: Create a business process flow to standardize processes](create-business-process-flow.md) </br>
- [What are canvas apps in Power Apps?](/powerapps/maker/canvas-apps/getting-started)




[!INCLUDE[footer-include](includes/footer-banner.md)]
