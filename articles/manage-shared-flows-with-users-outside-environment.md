---
title: Manage shared flows with users outside an environment
description: Learn how to manage shared flows with users outside an environment.
author: DBEKI
ms.contributors:
  - tatianas
  - evsung
ms.date: 06/10/2025
ms.custom: 
ms.topic: concept-article
ms.author: tatianas
ms.reviewer: angieandrews
---

# Manage shared flows with users outside an environment

Starting June 2025, any flow shared with a user who isn't an environment member becomes inaccessible to that user. This important change to Power Automate requires that users must be members of an environment to access flows in that environment. This change enhances security by enforcing environment boundaries. However, it impacts organizations that have flows shared across different environments, for example, a flow owner adding someone outside the environment as a co-owner or run-only user.

To comply with the new policy, Power Platform admins need to identify flows shared with users outside their environment and adjust those flows' sharing settings. This article provides a structured approach to do this.

This article helps you do the following:

* Identify flows shared with external users (users not in the flow's environment).
* Adjust sharing and access for those flows to ensure continuity (for example, add proper users to environments and use run-only access).

This article allows Power Platform admins to preemptively address sharing issues before the June 2025 enforcement. It can also help to establish governance to manage flow sharing securely going forward. To illustrate key points, this article includes real examples and step-by-step instructions.

Learn best practices for managing shared flows in [Share a cloud flow](create-team-flows.md#best-practices-for-managing-shared-cloud-flows).

## Identify flows shared with users outside their environment

The first step is to inventory all cloud flows and their shared users in each environment, then pinpoint which flows have shares with *outsiders*&mdash;users who aren't members of that environment. Power Automate flows can be created in two ways: as normal (non-solution) flows, or as solution-aware flows (part of a Dataverse solution). Both reside in an environment, and both need review. The following sections describe methods to identify externally shared flows.

### Power Platform admin center&mdash;GUI method

Environment admins can use the Power Platform admin center for a visual audit.

1. In [Power Platform admin center](https://admin.powerplatform.microsoft.com/home), select **Manage** > **Environments >** (*your environment*) > **Resources** > **Flows**.

    A lists all flows in the environment, along with an **Owners** column displays.

1. For each flow, inspect the owners. If a flow has multiple owners (creator plus co-owners), it is shared. Compare those owners against the known members of the environment. For example, compare the security group or user list for that environment.
1. Flag flows where an owner or co-owner who isn't an expected environment member. For example, if Department A's environment should only contain users from Dept A, but you see a co-owner from Dept B, that flow is shared with an outsider. You might need to select an owner's name to view details, or cross-reference with your environment's user directory.

#### Pros of Power Platform admin center&mdash;GUI method

Power Platform admin center provides a user-friendly interface and allows filtering and sorting flows by name or owner. You can quickly spot obvious mismatches if you know which teams and users belong in the environment.

#### Cons of Power Platform admin center&mdash;GUI method

This method is manual and doesn't scale well for many flows. You must individually verify owners, which can be time-consuming for large environments. It might be difficult to cross-check environment membership from the user interface directly.

### PowerShell script&mdash;automated method

For a systematic and repeatable audit, Power Automate offers administrative PowerShell cmdlets to list flows and their owners. This approach is powerful for bulk analysis across large environments or entire tenants. You can script the process to output all flows and highlight external sharings.

For example, this script uses `Get-AdminFlow` to retrieve all flows, then `Get-AdminFlowOwnerRole` for each flow to list its owners and their roles. The output lists each flow name and a bullet of `Owner: [User]`, `Role: [Owner/Co-owner]`. You can redirect this output to a file or further process it.

Next, determine external shares: Compare each owner’s user principal name (UPN) to the set of users who are members of the environment. An *external* share is indicated by any owner whose UPN isn't in the environment’s user list or security group. In practice, you might:

- Export the flow owners list from the previous script and the environment user list, then use Excel or a script to find differences, or
- Enhance the PowerShell script to cross-check against environment users through `Get-AdminEnvironmentUser`.

#### Pros of PowerShell script&mdash;automated method

This method is automated and comprehensive. It can enumerate hundreds or thousands of flows quickly and is scriptable for reporting. You can run it on a schedule such as monthly, to spot new external shares.

#### Cons of PowerShell script&mdash;automated method

Requires familiarity with PowerShell and admin privileges. Also, the raw output shows UPNs and object IDs. You need to interpret which ones are outside the environment and requires some analysis. However, this is straightforward if you know your environment's user domain or have a list of environment members.

### Center of Excellence (CoE) Toolkit&mdash;dashboard method

If your organization uses the [Power Platform Center of Excellence Starter Kit](/power-platform/guidance/coe/starter-kit), it provides Power BI dashboards and reports that include sharing metrics. The CoE's inventory of flows can highlight flows that have guest owners or owners outside the environment's normal security group. For example, the CoE dashboard might have a report of *Flows with multiple owners* or *Flows shared with guest users*. You can leverage these insights to find flows with abnormal sharing.

#### Pros of Center of Excellence (CoE) Toolkit&mdash;dashboard method

Centralized, visual reporting that might already be aggregating environment data. No extra scripting if CoE is in place. It can flag non-compliant patterns automatically.

#### Cons of Center of Excellence (CoE) Toolkit&mdash;dashboard method

Requires the CoE Starter Kit to be deployed and kept up-to-date. Data might not be real-time (usually it is refreshed on a schedule). Also, setting up custom filters, like identifying external domain users, might require tweaking the CoE components.

### Identification methods comparison

| Method | Tool/Approach | Pros | Cons |
|---|---|---|---|
| Admin center (GUI) | Power Platform admin center web interface: check flows and owners visually. | Easy, user-friendly interface. Immediate insight for small numbers of flows. | Manual verification, not scalable for large environments. No built-in cross-reference of owner versus environment membership. |
| PowerShell script | Admin PowerShell cmdlets (`Get-AdminFlow`, `Get-AdminFlowOwnerRole`). | Automated bulk output of flows and owners. Can be scheduled and results exported to CSV or other formats. High accuracy if environment user list is known. | Requires PowerShell knowledge. Must separately identify which owners are external. Needs script or post-processing. |
| CoE Toolkit (dashboard) | Power BI dashboards and CoE flows. | Already available if CoE is installed. Can highlight unusual sharing, like external or guest owners, in a centralized report. | Needs CoE deployment and maintenance. There's a data refresh lag (not real-time). Might need customization to pinpoint specific external users. |

Using one or a combination of the methods in the previous table, compile a list of flows that have external shared users. These are the affected flows needing attention before the policy change. In many organizations, this might be a manageable subset of flows, for example, only a few cross-department flows or flows shared with a partner's guest account. In others, especially tenants with open sharing practices, there could be a significant number of flows to handle, so the earlier you identify them the better.

## Adjust sharing and access for affected flows

Once you identify flows that are shared with users outside their environment, the next step is to remediate each flow's sharing configuration. The goal is to ensure that every user who needs access to a flow is properly added to the environment (or the flow's access is otherwise modified). Do this so that when the new enforcement kicks in, no one loses functionality. The following sections describe how to approach adjustments.

### Evaluate the necessity of each external share

For each flagged flow, discuss with the flow's owner or relevant business team why it was shared externally. This context is important to decide the fix. The following list describes common scenarios and actions.

- **Scenario 1: User was added as a co-owner just to run the flow or see outputs**: In many cases, owners added an outside user as an owner when all that person needed was to trigger or use the flow (not edit it). For example, the owner can add a helpdesk agent as co-owner of a flow so they could manually trigger it. In such cases, the user likely doesn't need full owner rights.
- **Action**: Remove them from the **Owners** list and instead share the flow with them as a run-only user (if applicable), after ensuring they have environment access. This provides the needed capability to run the flow without making them an owner. Learn more in the [Add necessary users to the environment](#add-necessary-users-to-the-environment) section in this article.
- **Scenario 2: User truly collaborates in building or maintaining the flow**: For example, two departments jointly develop a flow, so a user from Dept B was made co-owner in Dept A's environment.
- **Action**: Onboard that user into the environment as an owner properly with appropriate role, or consider moving the flow to a neutral environment if multiple org units should co-own it. In the short term, adding the user to the environment's allowed users list and giving them an appropriate role (Environment Maker if they need edit rights) resolves access issues.
- **Scenario 3: The share is no longer needed**: Sometimes users were added temporarily or left the project.
- **Action**: Remove the outside user from the flow's share. This is the simplest fix when applicable. If nobody outside the environment needs the flow, un-share it with them. The flow is then compliant, and only internal owners remain.
- **Scenario 4: Cross-tenant or guest user shares**: For example, a flow was shared with a guest (external tenant) account. This is blocked after enforcement.
- **Action**: Determine if that guest absolutely needs access. If yes, one option is to officially add that guest as an Azure AD guest in your tenant and into the environment's security group. This makes them an environment member. This is rare. Alternatively, work towards transferring ownership to an internal user who can act on the guest's behalf, or use a different mechanism, like expose the flow through a secure HTTP trigger rather than direct share. We recommend removing direct guest shares because even if added as environment member, cross-tenant issues might arise.

### Add necessary users to the environment

For each user who should continue to have access to the flow, make sure they're a member of the environment going forward. This usually means:

- **If the environment uses a Security Group**: Add the user's account to that Azure AD security group. This grants them the default Basic User role in the environment unless otherwise configured. The Basic User role is typically enough for someone who only needs to run flows and not create and edit. After adding, verify the user now appears in the environment's Users list in Power Platform admin center.

- **If it's the tenant default environment, which is open to all users**: Most licensed users are already in it. Ensure the user has a Power Automate license. The enforcement mainly affects non-default environments with restricted membership.

- **Environment Maker versus Basic User**: Don't grant Environment Maker unless the person truly needs to build and edit flows in that environment. In our fixes, we prefer giving just the Basic User, or a custom minimal role, which allows running shared flows. For run-only access, Basic User is sufficient&mdash;the user doesn't need to be a Maker. Limiting Maker roles is a governance best practice, which is discussed more in the following section.

### Adjust the flow's sharing settings

With the user now an environment member, adjust how the flow is shared with them.

- **If the user only needs to Run the flow**: Use Run-Only Sharing. In Power Automate, open the flow's Share settings. Remove the user from the **Owners** list, and in the Run only users section, add their name. For manually triggered flows like button flows and instant flows, or flows triggered with shareable links, this ensures the person can trigger the flow without being an owner. They can't edit or display the flow's internals and can only run it. The result is that the user remains outside the owner list so there's no environment conflict, but can use the flow's functionality as intended.

    **Example:** Bob in Marketing was co-owner of Sales' **Lead Processor** flow just to kick it off periodically. We remove Bob as co-owner smf add Bob as a run-only user. Bob is also added to the Sales environment as a Basic User. Now Bob can select the flow’s button or receive its link to run it, but he's no longer an outside owner&mdash;he's an authorized Basic User of that environment.

- **If the user needs full Owner permissions (co-authoring)**: After adding them to the environment, ensure they remain listed as an Owner on the flow. Technically, you might remove and re-add them to refresh permissions. But once they are in the environment, the share is legitimate. You might also consider moving the flow into a solution if two owners from different areas maintain it long-term. Solution flows are easier to transport to a dedicated environment if needed. In any case, double-check they appear under **Owners** and their role is Can Edit (owner) in the flow's details.

- **Remove any redundant or unauthorized shares**: During this process, take the opportunity to clean up. If someone was added just-in-case, but never uses the flow, remove them. The principle of least privilege helps reduce oversight. Ensure each flow's **Owners** list is limited to those who truly need design and edit access.

### Communicate changes to affected users

If you're removing someone's access or altering how they invoke a flow, let them know. From the user perspective, running a flow through run-only access might be slightly different. They might get a share link or see the flow in Team Flows rather than My Flows. Explain that "To comply with new Power Automate policies, we updated the sharing method for Flow X. You can continue to run it with method Y, but it no longer shows under your direct ownership." This prevents confusion.

### Verify post-adjustment status

After making changes, use PowerShell or Power Platform admin center to double-check that no flows remain with external owners. For instance, run the identification script again and confirm it no longer flags those flows. Resolve each flagged instance by either removal or proper environment membership.

By performing these adjustments, you ensure that when Microsoft flips the switch, those flows continue to run for the intended users. Instead of an error saying `you do not have access to this flow`, the user remains authorized because they're now an environment member in an appropriate capacity. Essentially, you're aligning your sharing practices with the platform’s governance model.

## Related information

- [Guide to cloud flow sharing and permissions](guide-to-cloud-flow-sharing-permissions.md)
- [Share a cloud flow](create-team-flows.md)

