---
title: Get started with Power Automate approvals
description: Learn about the permissions and general details about Power Automate approvals.
suite: flow
author: donums
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 10/21/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: get-started
---

# Get started with approvals

Whether you need written acknowledgment from your manager or a formal authorization from a diverse group of stakeholders, getting things approved is part of almost every organization.

With the approvals capability in Power Automate, you can automate sign-off requests and combine human decision-making for workflows. Some popular cases where approvals can be used include:

   - Approving vacation time requests.

   - Approving documents that need sign-off.

   - Approving expense reports.

When you submit an approval in a flow, approvers are notified and can review and act on the request.

## Approvals actions  
  
*Actions* are the events you want your flow to perform after the trigger starts the flow. For example, when a new item is added to a list created with Microsoft Lists, trigger an approval to have somebody review the new item.

The following image shows the full list of [approval actions](/connectors/approvals/#actions) that you can use in your flows.  

:::image type="content" source="media/get-started-approvals/list-approval-actions.png" alt-text="Screenshot of the actions Create an approval, Start and wait for an approval, and Wait for an approval.":::

If you want to quickly get started with approvals, use the **Start and wait for an approval** action. This action lets you provide the information that should be in the approval request and the approvers who will receive the request. 

When you use the **Start and wait for an approval** action, the flow starts and then waits for the approvers' response before it completes the run.  

There are four approval types you can use.

| **Approval type**                         | **Behavior**          |
|-------------------------------------------|-----------------------------------------------|
| Approve/Reject - Everyone must approve    | All approvers are given two options: **Approve** or **Reject**. <br> A response is needed from *each* approver before the flow run is completed. The actions that follow the **Start and wait for an approval** action run after *all* the approvers respond, or when a single rejection occurs.   |
| Approve/Reject - First to respond         | Assigned approvers are given two options: **Approve** or **Reject**. <br> Approval or rejection by any approver completes the request. The actions that follow the **Start and wait for an approval** action run after any one of the approvers gives approval. |
| Custom Responses - Wait for all responses | You define the options the assigned approvers can choose from. <br>All approvers must respond to complete the process. |
| Custom Responses - Wait for one response  | You define the options the assigned approvers can choose from. <br> A response from any approver completes the process.|
| Sequential approval | Approvals are requested one at a time, in a specific order. Each approver must respond before the request moves to the next approver in the sequence. The actions that follow the **Start and wait for an approval** action run after all the approvers in the sequence have responded.

## Prerequisites

If it's the first time you're using approvals in your organization, ensure that you've met the following prerequisites:

- [A Microsoft Dataverse database](#permissions-to-create-a-dataverse-database).
- [A valid license to create flows](#license-to-create-flows).

## Permissions to create a Dataverse database

When you create approval flows, they're saved in Dataverse. Initially, when you use the approvals connector in a cloud flow that's located in a non-default environment, the system automatically provisions a database. To be successful, the user who runs the first approval flow must have an administrator role in the environment.

It can take a few minutes for the database provisioning to be completed, and you'll notice this delay the first time that you run the flow. Other users who create approval flows don't need any elevated permissions in the environment.

> [!NOTE]
> If you're using the default environment, you don't need to provision the Dataverse database. If you create approval flows, the Dataverse database is created for you automatically in the default environment.

## License to create flows

Because the approvals connector is a standard connector, any license that grants access to Power Automate and the ability to use standard connectors is sufficient to create approval flows.

Here are the licenses that grant rights to use standard connectors:

- [Power Automate](https://powerautomate.microsoft.com/pricing/).
- Office 365.
- Dynamics 365 license with built-in Power Automate capabilities.

You can find a list of the Office 365 and Dynamics 365 licenses in the [Microsoft Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130).

## Get started

Use one of the following options to get started creating approval flows.
  
- Use an existing template&mdash;You can search the list of [approvals templates](https://make.powerautomate.com/search/?category=Approval) for your scenario, and then follow steps to create a flow that suits your needs. 

- Tweak an existing template&mdash;If one of the existing templates is similar, but doesn't fit your needs precisely, create a flow from that template and then tweak the flow to your liking. 

   After you create a flow from a template, it's yours to modify or extend. Do this by adding, editing, or removing triggers and actions. 
   
   >[!TIP]
   >You can [copy and paste](https://make.powerautomate.com/blog/introducing-clipboard-in-flow-designer-and-three-new-user-experience-updates/) actions in the same flow or across flows to speed up the editing process.

- Create an approval flow from scratch&mdash;If you can't find a suitable template, you can create a flow from scratch and then connect it to the services and the approvals you need by using the approvals actions. Learn [how to create a flow from scratch](./get-started-logic-flow.md).  

- Consult the community for inspiration and help&mdash;Power Automate has a thriving community that can help if you're stuck or looking for some inspiration. Just head over to the [Power Automate forums](https://powerusers.microsoft.com/t5/Building-Flows/bd-p/BuildingFlows) to ask specific questions and get answers.

## Assign approvals to any user in your tenant

You can assign approvals to users&mdash;including guest users and Microsoft 365 groups&mdash;in your current Dataverse environment or your Microsoft Entra tenant.

When you assign an approval to users who aren't in your environment, they're automatically given the *Approvals User* Dataverse security role. Users need this role for their responses to be processed and persisted in their approvals history.

The following tenant configurations don't allow this:

- When the AllowAdHocSubscriptions setting in Microsoft Entra is disabled. In this case, you can request your tenant administrator to enable it. You can find more information about this in the self-service signup.
- If a security group has been used to control which users have access to the Dataverse environment.
- Power Automate [US Government plans](./us-govt.md).

After you assign an approval request to a user, they can respond directly from an Outlook email, a Microsoft Teams adaptive card, or the Power Automate action center if they have a Power Automate license or an Office 365 or a Dynamics 365 license with built-in Power Automate capabilities. You can find a list of these Office 365 and Dynamics 365 licenses in the Microsoft Power Apps and Power Automate licensing guide.

## Next step

Create [approval flows](modern-approvals.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]