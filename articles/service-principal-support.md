---
title: Support for service principal owned flows
description: Learn about support for service principal owned flows and best practices.
author: samathur
contributors:
  - samathur
  - v-aangie
ms.author: samathur
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 04/04/2024
ms.custom:
---

# Support for service principal owned flows

Power Automate has the ability for service principal application users to own and run flows to provide flexibility and stability in how organizations administer Power Automate flows.

## Service principal application users

[A service principal](/entra/identity-platform/app-objects-and-service-principals?tabs=browser) is a non-human security identity that represents an application or service that can own and manage resources within Azure and the Power Platform. To use a service principal in the Power Platform, a service principal application user needs to be created that represents the service principal [through the portal](/power-platform/admin/create-users#create-an-application-user) or [through API](/power-platform/admin/manage-application-users). An application user can have connections shared with them and own resources such as flows.

## When to use service principal application user

We recommend that the flow runs under the service principal in the cases listed in this section.

- Mission critical flows that service departmental or enterprise-wide scenarios. This insulates the flow ownership from the lifecycle of the owner and prevents issues when:
    - The owner of the flow leaves the organization or their role changes.
    - Premium license of the flow owner were to be unassigned and their flow utilizes premium capabilities.
- If the organization uses DevOps pipelines to deploy the flow across Dev, Test, and Production environments.

Since a service principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account) without a user license, it's subject to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits) and has special [licensing and request limit implications](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits).

The flow [connections need to be shared](/power-apps/maker/canvas-apps/share-app-resources#connections) with the service principal application user in order for them to successfully run the flow. 

## Prerequisites

To have a service principal own and run a flow, follow these steps.

1. [Create a service principal application user](/power-platform/admin/create-users#create-an-application-user) representing the Microsoft Entra ID service principal.
1. [Share connections](/power-apps/maker/canvas-apps/share-app-resources#connections) with the service principal application user.
1. Change the owner of the flow to the service principal application user using these steps:

    1. On Power Automate portal, open a flow.
    1. On the **Details** section, select **Edit**.

          :::image type="content" source="media/service-principal-support/flow-edit.png" alt-text="Screenshot of the 'Edit' button in the Details page.":::

    1. Replace the **Owner** with the name of the service principal application user.

         :::image type="content" source="media/service-principal-support/owner.png" alt-text="Screenshot of a computer description automatically generated.":::

        > [!NOTE]
        > A service principal application user can't be made a co-owner of a flow. You can't find a service principal application user in the **Owners** edit dialog.

1. [Turn on the flow](disable-flow.md) so it's ready to run.

## Licensing requirements

A service principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account), so it can't have a user license associated with it. Premium service principal application user-owned flows need a Power Automate Process/Power Automate per-flow license. However, if a flow doesn't utilize premium connectors, or is used exclusively [within the context](/power-platform/admin/power-automate-licensing/faqs#what-power-automate-capabilities-are-included-in-dynamics-365-licenses) of a Dynamics 365 application, it's exempted from the need for a Power Automate process or Power Automate per-flow license.

## Power Platform request limits

To learn about service principal application user-owned flows, go to [non-licensed user limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits).

| **Products** | **Pooled non-licensed tenant-level requests per 24 hours** | **Details** |
|-------------------------|-------------------------|-------------------------|
| Service principal flows in context of Dynamics 365 Enterprise &amp; Professional applications<sup>1</sup> | 500,000 base requests + 5,000 requests accrued per USL<sup>1</sup> up to 10,000,000 max<sup>2</sup></br>The flows can use both standard and premium connectors. | The following service principal owned flows are considered in context of Dynamics 365 apps:<br/><br/>In an environment with Dynamics 365 app installed and using Dataverse connector to talk to Dynamics entities in the environment.<br/><br/>Or<br/><br/>Using first party Dynamics connectors like finance and operations.<br/><br/>Or<br/><br/>[Flows associated with](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics365-apps) a Dynamics 365 app.</li></br></ol> |
| Service principal flows in context of Power Apps | Flows using standard connectors only - 25,000 base requests with no per-license accrual for the tenant.</br>Flows using premium connectors need a Power Automate Process/ Power Automate per-flow license and can get up to 250,000 requests per flow. | The following service principal owned flows are considered in context of Power Apps:</br><br/>Triggered from the canvas apps.</br></br>Or</br></br>Use Dataverse **For a select record** trigger in model driven app.</br></br>Or</br>[Flows associated with](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics365-apps) a Power App.</li></br></ol> |
| Service principal flows in a tenant with Power Automate licenses | Flows using standard connectors only - 25,000 base requests with no per-license accrual for the tenant</br>Flows using premium connectors need a Power Automate Process/ Power Automate Per-flow license and can get up to 250,000 requests per flow. |  |

## Tenant pool

Service principal flows in context of Dynamics 365 applications get 500,000 base requests + 5,000 requests accrued per USL1 up to 10,000,000 max. However, to avoid a poorly designed flow using up the tenant pool and impacting all service principal owned flows in the tenant, a maker can now enable Tenant pool on core business flows.

1. Go to the Service principal flows in context of Dynamics application.
1. On the **Details** tile, select **Edit**, and then enable **Tenant pool capacity**.

    :::image type="content" source="media/service-principal-support/capacity.png" alt-text="Screenshot of the 'Tenant pool capacity' toggle enabled.":::

Turning on tenant pool on the flow enables the flow to use higher Power Platform requests. During the [transition period](/power-platform/admin/power-automate-licensing/types#transition-period), the flow that has tenant pool enabled can go up to 10M Power Platform requests in 24 hours and the [performance profile](limits-and-config.md#performance-profiles) on the flow is UnlimitedExtended. Service principal flows in context of Dynamics application with tenant pool disabled can go up to 200K in Power Platform requests in 24 hours and the [performance profile](limits-and-config.md#performance-profiles) on the flow is Medium.

All service principal flows created before October 20, 2023 have Tenant pool enabled and use performance profile of UnlimitedExtended. A maker can disable the setting anytime. All service principal flows created after October 20, 2023 have Tenant pool disabled and use Medium performance profile. However, a maker can enable Tenant pool on the flow anytime. Once it's enabled, the flow has a performance profile of UnlimitedExtended and can scale up to 10M requests in 24 hours. It can take up to seven (7) days for the change to reflect. To force refresh, edit and save the flow for the change to take effect immediately.

## Known issue

If a flow owned by a service principal tenant pool was turned on, importing the flow as non application user throws an error.
