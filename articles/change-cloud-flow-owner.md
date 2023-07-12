---
title: Change the owner of a cloud flow in Power Automate | Microsoft Docs
description: Learn how to change the owner of a solution-aware cloud flow in Power Automate.
services: ''
suite: flow
author: kisubedi
contributors:
 - kisubedi
 - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 02/01/2023
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---

# Change the owner of a cloud flow

The flow owner plays a vital role in the management, control, and maintenance of Power Automate flows. They have the authority to make changes, assign permissions, monitor performance, and ensure the flow meets the organization's requirements. When a flow is created, the creator is automatically set as the flow owner.

1. Flow Management: The flow owner has full control over the flow, including the ability to edit, manage, and delete it. They can make necessary modifications to the flow, update its triggers and actions, or troubleshoot any issues that may arise.
1. Permissions and Sharing: The flow owner determines who can access and use the flow. They can share the flow with other users or teams within the organization.
1. Monitoring and Troubleshooting: The flow owner is responsible for monitoring their flow's performance, reviewing run history, and addressing errors or exceptions.
1. Licensing: The licenses assoicated with the owner can have an effect on the flow.

In cases where ownership needs to be transferred, such as when a flow owner leaves the organization or changes roles, providing a new flow owner ensures a smooth transition. The previous flow owner can transfer ownership to another user to maintain continuity and avoid disruptions in flow management.

If an administrator wants to make changes to a flow, they must first make themselves an owner or co-owner.

## Change the owner of a solution-aware cloud flow

An owner, co-owner, or an admin can change the owner of a solution-aware flow to another user to ensure business continuity. After the change of ownership completes, the original owner and the new owner both become co-owners of the flow.

You can change the owner to an individual (not a distribution list) or a user account used as a service account. If the flow uses a service account, ensure it's licensed correctly to avoid [multiplexing](/power-platform/admin/power-automate-licensing/faqs#multiplexing).

Follow these steps to change the owner of a flow.

>[!IMPORTANT]
>To perform this action, the flow must be a solution-aware flow.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the menu to the left, either select **My flows**, or select **Solutions** and locate a solution the flow is referenced by.

1. Select the flow for which you're changing the owner.

1. In the **Details** section, select **Edit**

    :::image type="content" source="media/change-cloud-flow-owner/04084e3f1600f61f723714a54329c54f.png" alt-text="Screenshot showing where the edit button is located in the details section.":::

1. In the **Owner** section, remove the current owner.

    >[!div class="mx-imgBorder"]
    >![Screenshot showing the owner section.](media/change-cloud-flow-owner/d8a0028209878ca39c8ab6932a138a3d.png "Owner section")

1. Enter the email address of the new owner.

    >[!div class="mx-imgBorder"]
    >![Screenshot showing where to enter the owner email address.](media/change-cloud-flow-owner/eab1c2f164b2df4c5904e02d77f19814.png "Owner's email address")

Once assigned, the new owner gets access to the run history and connection references. The new owner can update the flow or reassign it to other users too.

>[!div class="mx-imgBorder"]
>![Screenshot that shows confirmation for the owner change.](media/change-cloud-flow-owner/e5cc876b0834b6d166215a8e8941f169.png "Change owner confirmation message")

If the flow is a **scheduled** or **automated** flow, after the owner changes, the flow runs under the license of the new owner and uses their Power Platform request limits. This change can take up to seven (7) days to become effective. If you need the new owner to take effect immediately, edit the flow, and then save it to force the flow to use the new owner’s license.

If the flow is a **manual** flow, the flow runs under the license of the user who runs the flow. The plan section shows whose license plan the flow uses.

>[!div class="mx-imgBorder"]
>![A screenshot that shows the license plan being used.](media/change-cloud-flow-owner/bc757289d2a3f7e6da27acf3d527cc90.png "Plan section showing the license plan being used")


## Change the owner of a non-solution cloud flow

To change the ownership of a non-solution-aware cloud flow, you must create a new flow via export/import, **Save as**, or **Send a copy**. In-place ownership change for non-solution-aware cloud flows is not available because the owner is part of the flow identity. 

## Ownership and licensing

If flow ownership is changed to a new owner without a premium license and the flow uses premium features, then a warning is shown with information about next steps.

>[!div class="mx-imgBorder"]
>![Screenshot that shows a warning about incorrect license.](media/change-cloud-flow-owner/667f46314ac1b6d6255c0a502589b723.png "Incorrect license warning")

The flow can still be assigned to the new owner. The flow continues to run for 30 days, allowing time for the new owner to purchase a license. If the new owner doesn't have a premium license after the grace period, Power Automate turns off the flow. They can turn it on anytime after purchasing the license. 

## Change the owner of a cloud flow to a service principal application user

### Service Principal application users
A Service Principal is a non-human security identity that represents an application or service that can own and manage resources within Azure and the Power Platform. To use a Service Principal within the Power Platform, a Service Principal application user needs to be created that represents the service principal [via the portal](/power-platform/admin/create-users#create-an-application-user) or [via API](/power-platform/admin/manage-application-users). An application user can have connections shared with them and own resources such as flows.
A Service Principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account), so it cannot have a user license associated with it and it is subject to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits). 

### Service Principal application user ownership of flows
Power Automate has the ability for Service Principal application users to own and run flows to provide flexibility and stability in how organizations administer Power Automate flows. 
When the owners of flows change roles or leave the organization entirely, the ownership of a flow needs to be changed to a different user or set of users. If the owner of the flow is a Service Principal application user, then that ownership is not tied to a user that could leave the organization.
The flow [connections need to be shared](/power-apps/maker/canvas-apps/share-app-resources#connections) with the Service Principal application user in order for them to successfully run the flow. 
Since a Service Principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account) without a user license, it is subject to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits) and has special [licensing and request limit implications](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits).

### Change the owner of a flow to a Service Principal application user
To change the owner of a flow to a Service Principal application user, open the **Details** edit dialog and replace the **Owner** with the name of the Service Principal application user. Note that a Service Principal application user cannot be made a co-owner of a flow, so attempts to find a Service Principal application user in the **Owners** edit dialog will not be successful.

### Steps to have a Service Principal own and run a flow
1. [Create an Service Principal application user](/power-platform/admin/create-users#create-an-application-user) representing the AAD Service Principal 
1. [Share connections](/power-apps/maker/canvas-apps/share-app-resources#connections) with the Service Principal application user
1. Change owner of the flow to the Service Principal application user using the steps detailed here: **Details** > **Edit** > **Owner**
1. [Turn on the flow](/power-automate/disable-flow) so it is ready to run
1. Adjust licensing to deal with [request limit implications](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits) as needed. For example: turning on [Pay As You Go](/power-platform/admin/power-automate-licensing/types#power-platform-requests-pay-as-you-go), [associating the flow to an app](/power-automate/associate-flow-to-app), or [considering a per flow license](/power-platform/admin/power-automate-licensing/types#what-can-i-do-if-my-flow-is-above-limits).

## See also

To learn how to export and import non-solution-aware flows, go to this [video](https://www.youtube.com/watch?v=K7_xWJvEPUc).

The owner of a flow left the company. How can we ensure it works without interruptions? [Learn more.](/power-platform/admin/power-automate-licensing/faqs#the-owner-of-a-flow-left-the-company-how-can-we-ensure-it-works-without-interruptions)
