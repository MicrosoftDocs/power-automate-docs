---
title: Guide to manage shared flows with users outside an environment
description: Use this guide to learn to manage shared flows with users outside an environment.
author: DBEKI
ms.date: 05/23/2025
ms.custom: 
ms.topic: concept-article
ms.author: dbekirop
ms.reviewer: angieandrews
---

# Guide to manage shared flows with users outside an environment

Microsoft is rolling out an important change to Power Automate: users must be members of an environment to access flows in that environment. Starting June 2025, any flow shared with a user who is not an environment member will become inaccessible to that user. This change enhances security by enforcing environment boundaries. However, it impacts organizations that have flows shared across different environments (e.g. a flow owner adding someone outside the environment as a co-owner or run-only user).

Power Platform administrators need to identify any flows shared with users outside their environment and adjust those flows’ sharing settings to comply with the new policy. This guide provides a structured approach to do so. Use this guide to do the following:

* Identify flows shared with external users (users not in the flow's environment).
* Adjust sharing and access for those flows to ensure continuity (for example, add proper users to environments, use run-only access).

By following this guide, Power Platform admins can preemptively address sharing issues before the June 2025 enforcement, and establish governance to manage flow sharing securely going forward. To illustrate key points, this guide includes real examples and step-by-step instructions are.

Learn best practices for managing shared flows in [Share a cloud flow](create-team-flows.md#best-practices-for-managing-shared-cloud-flows).

## 1. Identifying Flows Shared with Users Outside Their Environment

The first step is to inventory all cloud flows and their shared users in each environment, then pinpoint which flows have shares with “outsiders” – i.e. users who are not members of that environment. Power Automate flows can be created in two ways: as normal (non-solution) flows or as solution-aware flows (part of a Dataverse solution). Both reside in an environment, and both need review. Here are methods to identify externally shared flows:

### Power Platform Admin Center (GUI Method)

Environment admins can use the Power Platform admin center for a visual audit. In Platform admin center:

* Navigate to Environments > Your Environment > Resources > Flows. This lists all flows in the environment, along with an “Owner(s)” column.
* For each flow, inspect the Owners. If a flow has multiple owners (creator plus co-owners), it’s been shared. Compare those owners against the known members of the environment (e.g. the security group or user list for that environment).
* Flag any flow where an owner/co-owner is not an expected environment member. For example, if Department A’s environment should only contain users from Dept A, but you see a co-owner from Dept B, that flow is shared with an outsider. You may need to click an owner’s name to view details, or cross-reference with your environment’s user directory.

Pros: PPAC provides a user-friendly interface and allows filtering/sorting flows by name or owner. You can quickly spot obvious mismatches if you know which teams/users belong in the environment.

Cons: This method is manual and doesn’t scale well for many flows. You must individually verify owners, which is time-consuming for large environments. It may be hard to cross-check environment membership from the UI directly.

### PowerShell Script (Automated Method):

For a systematic and repeatable audit, Power Automate offers administrative PowerShell cmdlets to list flows and their owners. This approach is powerful for bulk analysis across large environments or entire tenants. You can script the process to output all flows and highlight external sharings. For example:

This script uses Get-AdminFlow to retrieve all flows, then Get-AdminFlowOwnerRole for each flow to list its owners and their roles. The output will list each Flow Name and a bullet of Owner: [User], Role: [Owner/Co-owner]. You can redirect this output to a file or further process it.

Next, determine external shares: Compare each owner’s user principal name (UPN) to the set of users who are members of the environment. An “external” share is indicated by any owner whose UPN is not in the environment’s user list or security group. In practice, you might:

* Export the flow owners list (from the script above) and the environment user list, then use Excel or a script to find differences.
* Or enhance the PowerShell script to cross-check against environment users via Get-AdminEnvironmentUser.

Pros: This method is automated and comprehensive – it can enumerate hundreds or thousands of flows quickly and is scriptable for reporting. You can run it on a schedule (e.g. monthly) to spot new external shares.

Cons: Requires familiarity with PowerShell and admin privileges. Also, the raw output shows UPNs and object IDs; you’ll need to interpret which ones are outside the environment (some analysis required). However, this is straightforward if you know your environment’s user domain or have a list of environment members.

### Center of Excellence (CoE) Toolkit (Dashboard Method):

If your organization uses the Power Platform Center of Excellence Starter Kit, it provides Power BI dashboards and reports that include sharing metrics. The CoE’s inventory of flows can highlight flows that have guest owners or owners outside the environment’s normal security group. For example, the CoE dashboard might have a report of “Flows with multiple owners” or “Flows shared with guest users.” You can leverage these insights to find flows with abnormal sharing.

Pros: Centralized, visual reporting that might already be aggregating environment data. No extra scripting if CoE is in place; it can flag non-compliant patterns automatically.

Cons: Requires the CoE Starter Kit to be deployed and kept up-to-date. Data might not be real-time (usually it’s refreshed on a schedule). Also, setting up custom filters (like identifying external domain users) might require tweaking the CoE components.

### Summary – Identification Methods Comparison:

| Method | Tool/Approach | Pros | Cons |
|---|---|---|---|
| Admin Center (GUI) | PPAC web interface – check flows and owners visually. | Easy, user-friendly interface; immediate insight for small numbers of flows. | Manual verification, not scalable for large environments; no built-in cross-reference of owner vs environment membership. |
| PowerShell Script | Admin PowerShell cmdlets (`Get-AdminFlow`, Get-AdminFlowOwnerRole). | Automated bulk output of flows & owners; can be scheduled and results exported (CSV, etc.). High accuracy if environment user list is known. | Requires PowerShell knowledge; must separately identify which owners are external (script or post-processing needed). |
| CoE Toolkit (Dashboard) | Power BI dashboards and CoE flows. | Already available if CoE is installed; can highlight unusual sharing (e.g. external or guest owners) in a centralized report. | Needs CoE deployment & maintenance; data refresh lag (not real-time); might need customization to pinpoint specific external users. |

Using one or a combination of the methods above, compile a list of flows that have external shared users. These are the “affected flows” needing attention before the policy change. In many organizations, this might be a manageable subset of flows – for example, only a few cross-department flows or flows shared with a partner’s guest account. In others, especially tenants with open sharing practices, there could be a significant number of flows to handle, so the earlier you identify them the better.

## 2. Adjusting Sharing & Access for Affected Flows

Once you’ve identified flows that are shared with users outside their environment, the next step is to remediate each flow’s sharing configuration. The goal is to ensure that every user who needs access to a flow is properly added to the environment (or the flow’s access is otherwise modified) so that when the new enforcement kicks in, no one loses functionality. Here’s how to approach adjustments:

### A. Evaluate the necessity of each external share:

For each flagged flow, discuss with the flow’s owner or relevant business team why it was shared externally. This context is important to decide the fix. Common scenarios and actions:

* **Scenario 1: User was added as a co-owner just to run the flow or see outputs** – In many cases, owners added an outside user as an Owner when all that person needed was to trigger or use the flow (not edit it). For example, adding a helpdesk agent as co-owner of a flow so they could manually trigger it. In such cases, the user likely does not need full owner rights.
  * **Action:** Remove them from the Owners list and instead share the flow with them as a Run-Only user (if applicable), after ensuring they have environment access (see part B below). This provides the needed capability to run the flow without making them an owner.

* **Scenario 2: User truly collaborates in building or maintaining the flow** – e.g. two departments jointly develop a flow, so a user from Dept B was made co-owner in Dept A’s environment.
  * **Action:** Onboard that user into the environment as an owner properly (via appropriate role), or consider moving the flow to a neutral environment if multiple org units should co-own it. In the short term, adding the user to the environment’s allowed users list and giving them an appropriate role (Environment Maker if they need edit rights) will resolve access issues.

* **Scenario 3: The share is no longer needed** – sometimes users were added temporarily or have left the project.
  * **Action:** Simply remove the outside user from the flow’s share. This is the simplest fix when applicable: if nobody outside the environment needs the flow, un-share it with them. The flow will then be compliant (only internal owners remain).

* **Scenario 4: Cross-tenant or guest user shares** – e.g. a flow was shared with a guest (external tenant) account. This will definitely be blocked after enforcement.
  * **Action:** Determine if that guest absolutely needs access. If yes, one option is to officially add that guest as an Azure AD Guest in your tenant and into the environment’s security group (making them an environment member), though this is rare. Alternatively, work towards transferring ownership to an internal user who can act on the guest’s behalf, or use a different mechanism (like expose the flow via a secure HTTP trigger rather than direct share). Removing direct guest shares is recommended because even if added as environment member, cross-tenant issues might arise.

### B. Add necessary users to the environment:

For each user who should continue to have access to the flow, make sure they are a member of the environment going forward. This usually means:

* If the environment uses a Security Group: Add the user’s account to that Azure AD security group. This will grant them the default Basic User role in the environment (unless otherwise configured). The Basic User role is typically enough for someone who only needs to run flows (not create/edit). After adding, verify the user now appears in the environment’s Users list in PPAC.
* If it’s the tenant default environment (open to all users): Most licensed users are already in it. Simply ensure the user has a Power Automate license. The enforcement mainly affects non-default environments with restricted membership.
* Environment Maker vs. Basic User: Do not grant Environment Maker unless the person truly needs to build or edit flows in that environment. In our fixes, prefer giving just the Basic User (or a custom minimal role) which allows running shared flows. For run-only access, Basic User is sufficient – the user does not need to be a Maker. Limiting maker roles is a governance best practice (discussed more in the next section).

### C. Adjust the flow’s sharing settings:

With the user now an environment member, adjust how the flow is shared with them:

* If the user only needs to Run the flow: Use Run-Only Sharing. In Power Automate, open the flow’s Share settings. Remove the user from the Owners list, and in the Run only users section, add their name. For manually-triggered flows (button flows, instant flows) or flows triggered via shareable links, this ensures the person can trigger the flow without being an owner. They will not be able to edit or see the flow’s internals – only run it. Result: The user remains outside the owner list (so no environment conflict) but can use the flow’s functionality as intended.
  * **Example:** Bob (Marketing) was co-owner of Sales’ “Lead Processor” flow just to kick it off periodically. We remove Bob as co-owner, add Bob as a run-only user. Bob is also added to the Sales environment as a Basic User. Now Bob can click the flow’s button (or receive its link) to run it, but he’s no longer an outside owner; he’s an authorized Basic User of that environment.

* If the user needs full Owner permissions (co-authoring): After adding them to the environment, simply ensure they remain listed as an Owner on the flow. Technically, you might remove and re-add them to refresh permissions. But once they are in the environment, the share is kosher. You might also consider moving the flow into a Solution if two owners from different areas will maintain it long-term; solution flows are easier to transport to a dedicated environment if needed. In any case, double-check they appear under Owners and their role is Can Edit (owner) in the flow’s details.
* Remove any redundant or unauthorized shares: During this process, take the opportunity to clean up. If someone was added “just in case” but never uses the flow, remove them. Principle of least privilege helps reduce oversight. Ensure each flow’s Owners list is limited to those who truly need design/edit access.

### D. Communicate changes to affected users

If you are removing someone’s access or altering how they invoke a flow, let them know. From the user perspective, running a flow via run-only access might be slightly different (they might get a share link or see the flow in Team Flows rather than My Flows). Explain that “to comply with new Power Automate policies, we’ve updated the sharing method for Flow X – you’ll continue to be able to run it via method Y, but it will no longer show under your direct ownership.” This prevents confusion.

### E. Verify post-adjustment status

After making changes, use PowerShell or Admin Center to double-check that no flows remain with external owners. For instance, run the identification script again and confirm it no longer flags those flows. Each flagged instance should be resolved by either removal or proper environment membership.

By performing these adjustments, you ensure that when Microsoft flips the switch, those flows will continue to run for the intended users. Instead of an error saying “you do not have access to this flow,” the user will remain authorized because they are now an environment member in an appropriate capacity. Essentially, you are aligning your sharing practices with the platform’s governance model.

## Related information

- [Guide to cloud flow sharing and permisssions](guide-to-cloud-flow-sharing-and-permissions.md)
- [Share a cloud flow](create-team-flows.md)

