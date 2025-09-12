---
title: Change the owner of a cloud flow in Power Automate | Microsoft Docs
description: Learn how to change the owner of a solution-aware cloud flow in Power Automate.
suite: flow
author: kisubedi
contributors:
 - ChrisGarty
 - kisubedi
 - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 03/01/2024
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---

# Change the owner of a cloud flow

The flow owner plays a vital role in the management, control, and maintenance of Power Automate flows. They have the authority to make changes, assign permissions, monitor performance, and ensure the flow meets the organization's requirements. When a flow is created, the creator is automatically set as the flow owner.

The flow owner responsibilities include the following:

- **Flow management:** Full control over the flow, including the ability to edit, manage, and delete it. They can make necessary modifications to the flow, update its triggers and actions, or troubleshoot any issues that may arise.
- **Permissions and sharing:** Determines who can access and use the flow. They can share the flow with other users or teams within the organization.
- **Monitoring and troubleshooting:** Monitoring their flow's performance, reviewing run history, and addressing errors or exceptions.
- **Licensing:** The licenses associated with the owner can have an effect on the flow.

In cases where ownership needs to be transferred, such as when a flow owner leaves the organization or changes roles, providing a new flow owner ensures a smooth transition. The previous flow owner can transfer ownership to another user to maintain continuity and avoid disruptions in flow management.

If an administrator wants to make changes to a flow, they must first make themselves an owner or co-owner.
Flows are usually owned by [regular users](/power-platform/admin/create-users#user-types), but if you need to change the owner to a Service Principal application user instead, go to [Change the owner of a cloud flow to a Service Principal application user](#change-the-owner-of-a-cloud-flow-to-a-service-principal-application-user).

## Change the owner of a solution-aware cloud flow

An owner, co-owner, or an admin can change the owner of a solution-aware flow to another user to ensure business continuity. After the change of ownership completes, the original owner and the new owner become co-owners of the flow.

You can change the owner to an individual (not a distribution list) or a user account used as a service account. If the flow uses a service account, ensure it's licensed correctly to avoid [multiplexing](/power-platform/admin/power-automate-licensing/faqs#multiplexing).

Follow these steps to change the owner of a flow.

> [!IMPORTANT]
> To perform this action, the flow must be a solution-aware flow.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the menu to the left, either select **My flows**, or select **Solutions** and locate a solution the flow is referenced by.
1. Select the flow for which you're changing the owner.
1. In the **Details** section, select **Edit**.

    :::image type="content" source="media/change-cloud-flow-owner/details-edit.png" alt-text="Screenshot of the edit button in the details section.":::

1. In the **Owner** section, remove the current owner.
1. Enter the email address of the new owner.

    Once assigned, the new owner gets access to the run history and connection references. The new owner can update the flow or reassign it to other users.

If the flow is a **scheduled** or **automated** flow, after the owner changes, the flow runs under the license of the new owner and uses their Power Platform request limits. This change can take up to seven (7) days to become effective. If you need the new owner to take effect immediately, edit the flow, and then save it to force the flow to use the new owner’s license.

If the flow is a **manual** flow, the flow runs under the license of the user who runs the flow. The plan section shows whose license plan the flow uses.

:::image type="content" source="media/change-cloud-flow-owner/details-plan.png" alt-text="Screenshot of the license plan being used.":::

## Change the owner of a non-solution cloud flow

In-place ownership change for non-solution-aware cloud flows isn't available because the owner is part of the flow identity.

- If your environment has Dataverse, then the ideal way to change the ownership is to [add the flow into a solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution) so ownership can be changed.
- If your environment doesn't have Dataverse, then you must create a new non-solution cloud flow with export/import, **Save as**, or **Send a copy**.

## Ownership and licensing

If flow ownership is changed to a new owner without a premium license and the flow uses premium features, then a warning shows with information about next steps.

:::image type="content" source="media/change-cloud-flow-owner/details-warning.png" alt-text="Screenshot of the incorrect license warning.":::

The flow can still be assigned to the new owner. The flow continues to run for 30 days, allowing time for the new owner to purchase a license. If the new owner doesn't have a premium license after the grace period, Power Automate turns off the flow. They can turn it on anytime after purchasing the license.

## Change the owner of a cloud flow to a service principal application user

The following sections include various scenarios for changing ownership.

### Service Principal application users

A [Service Principal](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is a non-human security identity that represents an application or service that can own and manage resources within Azure and the Power Platform. To use a Service Principal within the Power Platform, a Service Principal application user needs to be created that represents the service principal [through the portal](/power-platform/admin/create-users#create-an-application-user) or [through API](/power-platform/admin/manage-application-users). An application user can have connections shared with them and own resources such as flows.

A Service Principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account), so it can't have a user license associated with it. It's also subject to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits).

### Service Principal application user ownership of flows

Power Automate has the ability for Service Principal application users to own and run flows to provide flexibility and stability in how organizations administer Power Automate flows. When the owners of flows change roles or leave the organization entirely, the ownership of a flow needs to be changed to a different user or set of users. If the owner of the flow is a Service Principal application user, then that ownership isn't tied to a user that could leave the organization.

The flow [connections need to be shared](/power-apps/maker/canvas-apps/share-app-resources#connections) with the Service Principal application user in order for them to successfully run the flow.

Since a Service Principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account) without a user license, it's subject to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits) and has special [licensing and request limit implications](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits).

### Change the owner of a flow to a Service Principal application user

To change the owner of a flow to a Service Principal application user:

1. Open the **Details** edit dialog.
1. Replace the **Owner** with the name of the Service Principal application user.

    A Service Principal application user can't be made a co-owner of a flow. Attempts to find a Service Principal application user in the **Owners** edit dialog won't be successful.

### Enable a Service Principal to own and run a flow

To have a Service Principal own and run a flow, follow these steps.

1. [Create a Service Principal application user](/power-platform/admin/create-users#create-an-application-user) representing the Microsoft Entra Service Principal.
1. [Share connections](/power-apps/maker/canvas-apps/share-app-resources#connections) with the Service Principal application user.
1. Change the owner of the flow to the Service Principal application user using the steps detailed here: **Details** > **Edit** > **Owner**.
1. [Turn on the flow](/power-automate/disable-flow) so it's ready to run.
1. Adjust licensing to deal with [request limit implications](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits) as needed.

    Examples are turning on [Pay As You Go](/power-platform/admin/power-automate-licensing/types#power-platform-requests-pay-as-you-go), [associating the flow to an app](/power-automate/associate-flow-to-app), or [considering a Power Automate Process license (previously Power Automate per flow)](/power-platform/admin/power-automate-licensing/types#what-can-i-do-if-my-flow-is-above-limits).

## Related information

- [How to manage orphaned flows when the owner leaves the organization](/troubleshoot/power-platform/power-automate/flow-management/manage-orphan-flow-when-owner-leaves-org)
- [(Video) Microsoft Power Automate Tutorial - Export Import](https://www.youtube.com/watch?v=K7_xWJvEPUc)
- [The owner of a flow left the organization. How can we ensure it works without interruptions?](/power-platform/admin/power-automate-licensing/faqs#the-owner-of-a-flow-left-the-organization-how-can-we-ensure-it-works-without-interruptions)
