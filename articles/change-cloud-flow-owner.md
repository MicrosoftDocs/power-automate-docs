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
ms.date: 09/23/2025
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---

# Change the owner of a cloud flow

The flow owner plays a vital role in the management, control, and maintenance of Power Automate flows. They have the authority to make changes, assign permissions, monitor performance, and ensure the flow meets the organization's requirements. When a flow is created, the creator is automatically set as the flow owner.

The following list includes flow owner responsibilities:

- **Flow management:** Full control over the flow, including the ability to edit, manage, and delete it. They can make necessary modifications to the flow, update its triggers and actions, or troubleshoot any issues that might arise.
- **Permissions and sharing:** Determines who can access and use the flow. They can share the flow with other users or teams within the organization.
- **Monitoring and troubleshooting:** Monitoring their flow's performance, reviewing run history, and addressing errors or exceptions.
- **Licensing:** The licenses associated with the owner can have an effect on the flow.

In cases where ownership needs to be transferred, such as when a flow owner leaves the organization or changes roles, providing a new flow owner ensures a smooth transition. The previous flow owner can transfer ownership to another user to maintain continuity and avoid disruptions in flow management.

If an administrator wants to make changes to a flow, they must first make themselves an owner or co-owner.
[Regular users](/power-platform/admin/create-users#user-types) usually own flows, but if you need to change the owner to a Service Principal application user instead, go to [Change the owner of a cloud flow to a Service Principal application user](#change-the-owner-of-a-cloud-flow-to-a-service-principal-application-user).

## Most common scenario: Reassign flows from a departed employee

When someone leaves your organization, their flows continue to run until their account is disabled or their connections expire. At that point, all flows owned by that person stop working. Here is the complete process to transfer those flows to a new owner and keep them running.

### Before you start

You need:
- **Power Platform admin** or **Environment admin** role (to transfer flows you don't own)
- The **new owner** must have an active account with a Power Automate license in the same environment
- A list of connectors used in the flow (you'll need to re-authenticate each one)

> [!IMPORTANT]
> Transferring ownership does NOT transfer the connections. All connections in the flow are tied to the original owner's Microsoft Entra ID credentials. After transfer, every connection must be re-authenticated by the new owner or replaced with a service principal connection. **If you skip this step, the flow will fail on the next run.**

### Step-by-step: Transfer ownership

#### For non-solution flows (My flows)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) as an admin.
2. Select **Environments**, then select the environment that contains the flow.
3. Select **Resources** > **Flows**.
4. Find the flow to transfer. Use the search bar or filter by the original owner's name.
5. Select the three dots (**...**) next to the flow, then select **Manage sharing**.
6. Under **Owners**, add the new owner's name or email address and select **Save**.
7. After the new owner is added, the original owner can be removed. If the original owner's account is already disabled, the new owner can remove them after accepting ownership.

> [!NOTE]
> Makers can also transfer flows they own from [make.powerautomate.com](https://make.powerautomate.com): select the flow > **Share** > add the new owner as a co-owner. The new owner can then remove the original owner.

#### For solution flows

Solution flows are owned by the system and don't have personal owners in the same way. However, the connections used by the flow still belong to specific users.

1. In the target environment, go to **Solutions** > select the solution containing the flow.
2. Select the flow, then select **Details**.
3. Under **Run only users** or **Connections**, update the connection references to point to connections owned by an active user.
4. If the flow uses connection references, go to **Connection References** in the solution and remap each reference to a new connection.

## What changes when you transfer ownership

Understanding exactly what transfers (and what doesn't) is critical to keeping the flow running.

| Aspect | Transfers to new owner? | Action needed |
|---|---|---|
| **Flow definition** (triggers, actions, logic) | Yes | None -- the flow design is preserved |
| **Run history** | Yes | None -- all previous run records are visible to the new owner |
| **Connections** (OAuth tokens, credentials) | **No** | **New owner must re-authenticate every connection** |
| **Shared users** (co-owners, run-only users) | Yes | Review and update if needed |
| **Flow state** (on/off) | Yes | Verify the flow is turned on after transfer |
| **Scheduled trigger timing** | Yes | Verify the schedule is correct (timezone may differ) |
| **Environment** | No change | Flow stays in the same environment |
| **Solution membership** | No change | Flow stays in the same solution (if applicable) |

> [!WARNING]
> **Connections are the #1 reason flows break after transfer.** Each connection stores an OAuth token issued to a specific user. When ownership changes, those tokens don't move. The flow attempts to use the old owner's token, which fails if their account is disabled or their credentials have changed.

## After transfer checklist

Complete these steps immediately after transferring ownership to prevent the flow from failing.

### 1. Re-authenticate all connections

This is the most critical step.

1. The new owner should open the flow at [make.powerautomate.com](https://make.powerautomate.com) > **My flows** > **Shared with me**.
2. Select **Edit** to open the flow in the designer.
3. Open the **Flow checker** (top right corner). It lists all connections with errors.
4. For each flagged connection:
   - Select the step that uses the connection.
   - In the connection field, select **Add new connection** or **Fix connection**.
   - Sign in with the new owner's credentials.
5. **Save** the flow after updating all connections.

> [!TIP]
> If the flow uses many connections, open the **Connections** page ([make.powerautomate.com](https://make.powerautomate.com) > **Data** > **Connections**) first and create the required connections there. Then return to the flow and select the pre-created connections from the dropdown in each step.

### 2. Verify the trigger still works

- **Scheduled triggers**: Confirm the time, timezone, and recurrence are correct.
- **Automated triggers** (when an item is created, when an email arrives): The trigger monitors events for the signed-in connection user. If the trigger is "When a new email arrives" and you re-authenticated with a different mailbox, the flow now monitors the new owner's mailbox, not the old owner's.
- **Instant triggers** (button flows): Test by clicking **Run** from the portal.

### 3. Check the run-as account

After re-authenticating, verify who the flow acts as:

- **Send email actions**: Will now send from the new connection owner's email, unless using a shared mailbox.
- **SharePoint actions**: Will now act as the new connection owner. Ensure they have the necessary permissions on the SharePoint site.
- **Dataverse actions**: The new owner must have the required Dataverse security roles.

### 4. Run a test

1. Select **Test** in the upper right of the designer.
2. Choose **Manually** (for instant triggers) or **Automatically** with a recent trigger event.
3. Verify that every step completes successfully, especially the steps where you changed connections.
4. Check the output of each step to ensure data is flowing correctly.

### 5. Update shared users

If the flow had run-only users or other co-owners, verify that those sharing permissions are still correct. The transfer itself preserves the sharing list, but you may want to update it (for example, remove the departed employee's account).

## Common issues after transfer

### New owner can't see the flow

- **Non-solution flows**: After being added as co-owner, the flow appears under **My flows** > **Shared with me**. It does NOT appear under **Cloud flows** (that tab shows only flows the user created).
- **Wrong environment**: The new owner may need to switch to the correct environment using the environment picker in the upper right of the Power Automate portal.
- **License required**: The new owner must have a Power Automate license. If the flow uses premium connectors, the new owner needs a Power Automate Premium license (or the flow needs a Power Automate Process license).

### Flow stops working after transfer

In almost all cases, this is a connection issue. Follow the [re-authenticate all connections](#1-re-authenticate-all-connections) steps above.

Other causes:
- **DLP policy**: The new owner's environment may have different DLP policies than the original owner's. Check with your admin.
- **Permissions on data sources**: The new owner's account may not have access to the SharePoint sites, SQL databases, or other data sources the flow uses. Grant the required permissions in each data source.
- **Service principal connections**: If the flow used a service principal connection owned by the departed employee's app registration, the app registration itself may need to be transferred in Microsoft Entra ID.

### Transfer succeeded but the old owner is still listed

If the original owner's account is disabled in Microsoft Entra ID:
1. The new owner should open the flow and go to **Share** (or **Manage sharing**).
2. Remove the old owner from the owners list.
3. If the old owner can't be removed (grayed out), an admin can remove them from the Power Platform admin center.

### I need to transfer many flows at once (bulk transfer)

The portal only supports transferring one flow at a time. For bulk transfers (for example, when offboarding an employee with dozens of flows):

1. Use the [Power Automate Management connector](/connectors/connector-reference/connector-reference-powerautomate-management) to list all flows owned by a user and modify sharing programmatically.
2. Alternatively, use [PowerShell for Power Platform admins](/power-platform/admin/powerapps-powershell#power-automate-commands) with the `Set-AdminFlowOwnerRole` cmdlet.

```powershell
# Example: Add a new owner to all flows owned by the departing user
$flows = Get-AdminFlow -EnvironmentName <env-id> -CreatedBy <departing-user-id>
foreach ($flow in $flows) {
    Set-AdminFlowOwnerRole -EnvironmentName <env-id> -FlowName $flow.FlowName -PrincipalType User -PrincipalObjectId <new-owner-id> -RoleName CanEdit
}
```

> [!NOTE]
> Even with bulk transfer, you must still re-authenticate connections in each flow individually. There is no bulk connection re-authentication API.

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
