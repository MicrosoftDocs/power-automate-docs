---
title: Guide to cloud flow sharing and permissions
description: Use this guide for assistance to identify suitable flow sharing scenarios and establish permissions to manage user access and ensure security.
author: DBEKI
ms.date: 05/23/2025
ms.custom: 
ms.topic: concept-article
ms.author: dbekirop
ms.reviewer: angieandrews
---

# Guide to cloud flow sharing and permissions

This guide can assist in identifying suitable flow sharing scenarios and establishing permissions to manage user access and ensure security.

## Manage permissions and roles in Power Automate environments

Managing who can create, edit, or merely execute flows is critical to maintaining a secure and orderly Power Automate environment. Power Automate's security model operates on multiple levels of permissions:

- **Environment-level roles** (such as Environment Admin and Environment Maker): Govern a user's ability to manage or create resources in a given [environment](/power-platform/admin/database-security).
- **Dataverse security roles** (if the environment has a Dataverse database): Like Basic User, System Customizer, and others, which control access to data and entities. For example, users typically need at least the Basic User role to run apps or flows that use Dataverse data.
- **Flow-level permissions**: Share settings on individual flows that make other users either co-owners (with edit rights) or run-only users.

### Environment roles and security

In each environment, only users with the appropriate roles can create or manage resources.

- **Environment Admin**: Has full administrative control over the environment. An Environment Admin can manage all resources, including viewing all flows, adding and removing users, and setting policies. In environments without Dataverse, this role alone can perform admin tasks. In Dataverse-enabled environments, a System Administrator role in Dataverse serves a similar purpose for data operations.

- **Environment Maker**: This role allows users to create new resources like flows, apps, and connections in the environment. The Environment Maker role doesn't grant access to existing data in Dataverse&mdash;it only confers the ability to build and share artifacts. Microsoft follows a least-privilege model for predefined roles: Environment Maker has the minimum access required to create apps/flows without exposing data they're [not permitted to display](/power-platform/admin/database-security). Makers can share the apps/flows they build with others in the organization as needed, but they can't elevate their own privileges to read data unless given additional Dataverse roles.

- **Environment User (Basic User)**: In Dataverse-backed environments, regular end users must be given the Basic User security role (sometimes called Common Data Service User) to run apps or utilize flows that interact with Dataverse data. By default, adding a user to an environment, especially if the environment has a Dataverse database, might require explicitly assigning such a role. This ensures they can run the solutions, but with only basic privileges on data. In environments without Dataverse, if a user is being shared a flow for run-only, they might not appear in the environment user list unless manually added. Their permissions are solely through the flow sharing.

### Flow-level sharing permissions

At the individual flow level, owners can share a cloud flow in two main ways: [add co-owner(s), or assign run-only user(s)](/power-automate/create-team-flows?tabs=new). It's essential to understand the difference.

- **Owner/co-owner**: A co-owner has essentially the same privileges as the original creator of the flow. Co-owners can view the run history, edit the flow's design, change its settings, start and stop the flow, manage connections, and add or remove other owners. In other words, full control is given to any co-owner, except they can't remove the original creator. Co-owners also display the flow on their **Team flows** list and can manage it like any flow they made themselves. Because of the breadth of these permissions, only trusted individuals or groups should be added as co-owners. 

    Example: If Alice is a co-owner of Bob's flow, Alice can modify that flow or delete it, so Bob's team should only add Alice if such access is intended.
  
* **Run-only user**: A run-only user is restricted to executing the flow, typically through a manual trigger like a button or SharePoint item trigger. They can't open the flow in edit mode, see its internal logic, or view past run history. This is ideal for scenarios where one wants colleagues to benefit from the automation. For example, run a button flow or an instant data processing task without giving them design privileges. Run-only users display the flow's name and can run it, but if they try to inspect details, they have limited visibility. They also can't add others or alter the flow in any way.

    Example: A helpdesk has a Power Automate button flow for *Create ticket and send acknowledgment*. All frontline employees are added as run-only users so they can trigger the flow from their devices, but they can't change what the flow does.

### Resource-specific security versus environment roles

Environment roles and flow sharing permissions work in tandem. Being an Environment Admin or having certain Dataverse privileges can allow users to see or modify flows regardless of explicit sharing, due to their broad access.

- A Power Platform Admin or Environment Admin inherently can display and manage all flows in the environment, [even if not individually shared with them](/power-platform/admin/governance-considerations?tabs=new). For instance, a Global Admin can add themselves as an owner to any flow if needed.
- Conversely, a user with no environment role can be given access to a specific flow through sharing. In this case, that user becomes a special case participant on that one flow, but might not have access to other resources in the environment.

To manage permissions effectively, organizations should formalize which users are flow *makers* (creators) and which are flow *consumers** (runners), and then apply roles accordingly. The following sections explain best practices for implementing these distinctions and minimizing risk.

### Permissions levels in Power Automate&mdash;owners versus run-only users

A key aspect of managing flow security is understanding the capabilities of different sharing permission levels. The following table summarizes the differences between co-owners and run-only users for a cloud flow. It compares flow co-owner versus run-only user permissions and capabilities in Power Automate.

| Capability / Access | Co-owner (can edit) | Run-only user (can run) |
|---|---|---|
| View and edit flow definition | Yes. Has full access to view and modify the flow's steps, settings, and connections. | No. Can't open the flow in the editor or get its configuration. They only get the run interface. |
| Run/Trigger the flow | Yes. Can manually run the flow and modify triggers. | Yes. Can trigger the flow (for example, select the button or use the designated trigger action) as allowed by the flow owner. |
| View run history (execution logs) | Yes. Can view past runs, success and failure status, and outputs in the run history. | No. Can't display the flow's run history or details of past executions. |
| Manage flow (enable/disable, rename, delete) | Yes. Can change flow properties, turn it on or off, update connections, and delete the flow entirely. | No. Can't make changes to the flow’s status or settings. They only have permission to invoke it. |
| Share flow with others | Yes. Can add or remove other co-owners, except they can't remove the original creator. Can also assign run-only users. | No. Can't share the flow with anyone else. They're a beneficiary of access, not a granter of access. |
| Use own connections (invoker) | N/A. Co-owners use the flow's defined connections. They can update connections if needed. | Depends. Run-only users might be required to use their own connections when running if the flow is configured with *Provided by run-only user* for a connector. Otherwise, the flow uses the owner's connections. |
| Visibility in Power Automate user interface | Appears under Team flows for all owners. The co-owner's name is listed in the **Owners** list. | Appears in the flow’s **Run-only** users list (flow details page) for owners; however, run-only users get the flow only in contexts where they can run it (for example, on a button or within an app; not listed under their owned or team flows). |

In practice, these distinctions mean that co-owners should be limited to users who truly need to collaborate on the design or maintenance of a flow, whereas run-only sharing is preferred for broad distribution of a flow’s functionality. Microsoft’s guidance reinforces this: "Only add co-owners for flow collaboration as needed. In most cases, if a flow needs to be shared, share it with run-only permissions." This ensures users can benefit from the automation without risking unauthorized modifications or exposure of flow internals.

## Mitigate risks of sharing flows outside their environment

Allowing users who aren't environment members to access flows can introduce some risks:

- **Governance blind spots**: Admins might not realize who has access.
- **Potential data exposure**: If flows handle sensitive data.
- **Run-only access**: Could be a concern if triggers allow parameter input or output visibility, and loss of change control. This is when co-owners outside the team make unintended edits.

To mitigate these risks, organizations should adopt a combination of policy, technical controls, and monitoring.

- **Enforce environment access controls**: A fundamental best practice is to restrict environment membership using Microsoft Entra (Azure AD) security groups. By associating a security group with an environment, only users in that group can be added to the [environment’s roles](/power-platform/admin/control-user-access). This means even if a maker attempts to share a flow with someone outside the group, that person isn't added to the environment automatically. In environments with an associated security group, any user not in the group is essentially an *outsider* and has limited capabilities until an admin grants access. This setup blocks outsiders from accessing environment resources unless an admin explicitly adds them by adding them to the security group per policy.

    For example, if Contoso's `HR Apps` environment is tied to the `HR-Team` security group, a user from Finance can't be made a co-owner of a flow in `HR Apps` unless they're first added to the `HR-Team` group by an admin. Using security groups in this way helps organizations maintain a clear boundary of who is approved to use each environment.

- **Review and limit co-ownership:** Sharing flows with co-owners should be done sparingly. Each co-owner effectively becomes a full owner of the flow, so limit the number of co-owners to only those necessary. If a flow was shared with an external person, for example, a developer or consultant from another team for troubleshooting, ensure that you remove their co-ownership after the issue is resolved. Do this unless there's an ongoing need. Organizations might implement governance processes where the addition of a co-owner outside the environment triggers an alert or requires approval. This can be achieved by using Power Automate governance tooling (for example, an admin flow using the Power Platform administration connectors to detect when a new owner is added to a flow). Then, they notify IT or a Power Platform Center of Excellence team.

- **Prefer run-only sharing for external users**: If sharing with users who aren't environment members is unavoidable or justified, use run-only permissions wherever possible instead of full edit rights. Run-only access significantly reduces risk: The user can't view flow logic or alter it, and they get past run data, which might contain sensitive payloads.

    For example, if a flow sends customer data through email, a run-only user can trigger that email send but can't open the flow to get the customer details that were processed yesterday. This principle aligns with least privilege&mdash;give the minimum access needed for the user's role. Run-only sharing can often achieve the business requirement of letting someone trigger or utilize a flow without handing over control.

- **Use security roles to segment duties**: Ensure that users who are meant to only run flows but not create them don't have the Environment Maker role. By keeping these users as basic environment users, or completely outside the environment with only run-only flow access, you reduce the chance that they can create or import rogue flows. Only designated makers should have maker privileges, whereas others might only consume the outputs of flows.

    Learn more in [Use security roles and groups: Manage makers versus run-only users](#use-security-roles-and-groups-manage-makers-versus-run-only-users).

- **Implement data loss prevention (DLP) policies**: Although DLP policies are more about controlling connector usage, they indirectly help mitigate risk by preventing shared flows from using banned connectors. For instance, if an outsider is given run-only access to a flow, a strict DLP policy ensures that flow can't suddenly start pushing data to an unauthorized service. DLP won't stop the sharing itself, but it limits the potential damage if a flow is accidentally or intentionally misused. As a best practice, classify connectors into *Business* versus *Non-business* categories, and block any dangerous combinations. This way, even if flows are shared broadly, they aren't going to leak data to unapproved endpoints.

- **Regular auditing and monitoring**: Establish a routine (for example, monthly or quarterly) to audit flow permissions. As part of this review, identify any flows that have unusual sharing, especially any with external owners or large run-only user lists. Review them if they're still needed. Microsoft documentation encourages periodic reviews of permissions to ensure they align with current business needs and to remove access for users who no longer require it.

    Monitoring can be automated. For example, an admin could set up a Power Automate flow using the admin connector that sends a report of all flows with their owners and last modified dates. The flow highlights the flows that have owners outside a specified list of approved individuals. Additionally, consider leveraging the [Power Platform Admin Analytics dashboards](/power-platform/admin/analytics-flow). It can show overall usage and potentially be filtered to learn how many users are running each flow.

- **Educate makers and enforce policies**: Sometimes the risk is introduced by lack of awareness. Document and communicate a clear policy around sharing, for example, *Do not add users from outside Environment X as co-owners without approval. Use run-only access if needed for users outside the team.* By training Power Automate makers on these guidelines, you reduce accidental exposure. If your organization has an internal Power Platform community or champion network, share reminders about the implications of sharing flows broadly. Ultimately, users should understand that while Power Automate makes sharing easy, there are compliance and security steps that must be followed for any cross-environment collaboration.

- **Use separate environments for broad sharing**: In some cases, it might be prudent to have a dedicated environment for flows that need to be used by a wide audience. For example, an organization could create a **Shared Services** environment that is open to many users with an appropriate security group. Flows that are intended for broad consumption can be developed and hosted there, rather than sharing them out of a more restricted environment. This way, environment boundaries are maintained. Your highly controlled environments remain strict, and the open environment is designated for cross-functional sharing with proper oversight. If you adopt this strategy, ensure the open environment still has strong DLP policies and monitoring in place, as it has a larger user base by design.

- **Consider copying flows instead of direct sharing**: If users in a different environment need a flow's functionality, another approach is to export the flow as a package and share the package instead of sharing the live flow. Microsoft recommends this approach in scenarios where the user isn't a member of your Power Automate environment&mdash;you can send them a copy of the flow which they import into their own environment. The recipient then sets up their own connections and runs the flow independently. This mitigates risk by avoiding any direct access to the original environment's flow. It essentially hands them the solution without giving them a foothold in your environment. The trade-off is that any updates to the flow won't be automatically synchronized, since it's a separate copy. However, for one-off needs or sharing with external teams, this method ensures a clean separation.

In summary, mitigating the risks associated with sharing flows broadly comes down to tight control of environment access, prudent use of sharing options, and vigilant oversight. By combining technical safeguards (like security group-controlled environments and DLP policies) with process safeguards (like approvals for adding owners and periodic audits), organizations can enjoy the collaborative benefits of Power Automate while minimizing security and compliance issues.

The following section focuses on a specific aspect of governance: using roles and groups to define who is a maker versus who is merely a runner of flows.

## Use security roles and groups: Manage makers versus run-only users

A critical governance decision is to determine which users should be makers, who can create and own flows, and which should be limited to running flows, who can perhaps consume the results. Power Automate and the Power Platform offer several mechanisms to enforce this distinction, primarily through security roles and security groups.

### Distinguish makers from non-makers

 In an enterprise scenario, not every user with a Power Automate license should necessarily build flows in every environment. By design, an Environment Maker can create flows and other resources in that environment. For dedicated environments, you should intentionally assign the Environment Maker role only to those users or groups who are responsible for building solutions. For example, you might decide that in the **Finance Automation** environment, only the Finance IT team and a few power users have maker permissions.

 Enforce this by doing the following:

- Assign the Environment Maker security role directly to specific users in the environment settings.
- Use an Azure active directory (AD) security group. Add all intended makers to a group (for example, **Finance Makers Group**) and if the environment has no Dataverse, assign that entire group the Environment Maker role. In Dataverse-enabled environments, you might need to add group members individually or use group teams with security roles.
- For broad control, associate the [environment with a security group](/power-platform/admin/control-user-access) so that only members can be in the environment. Then within that, grant Maker roles to the appropriate subset. This two-tier approach means outsiders can't be brought in undetected as makers, and among insiders, only some have the maker role. Reputable guidance suggests applying the environment security group feature to all production and sensitive environments to prevent undesired users' presence.

### Use security groups for run-only access

While there isn't an Environment Run-Only role, you can manage run-only permissions at scale using groups. When sharing a flow, owners can enter a group name instead of individual users for either co-owner or run-only access. This means you could create a security group like **Sales Reports Flow Users** and assign that group as a run-only user on relevant flows. All members of the group would then inherit run permission for those flows. Management becomes easier. To revoke access for a particular user, remove them from the group. They lose run access to all flows that group was assigned to. Likewise, to grant a new person run access to multiple flows, add them to the group. Security groups thus help simplify permission management by externalizing it.

Power Automate flows don't need to list 50 users as run-only; they list one group, and your Azure AD or Microsoft 365 admin processes membership.

> [!NOTE]
> If the environment itself is locked down to a security group, the group used for flow sharing should either be the same or a subset. If you share a flow with a group that contains people outside the environment’s allowed users, they might not actually be able to run it, depending on environment settings. You should coordinate group usage with environment access policies.

### Role assignment for makers versus runners

In Dataverse environments, security roles can be layered to fine-tune what makers versus run-only users can do.

- **Makers**: At minimum, they need Environment Maker role to create flows. If their flows interact with Dataverse tables, they might also need additional Dataverse roles like System Customizer, or privileges on specific tables, to design and test those properly. The combination of Environment Maker plus a role that grants data access (if needed) lets them build full solutions. It’s a best practice to grant makers only the privileges they need. For instance, if a maker only automates SharePoint and email, they might not need a Dataverse role at all aside from being present in environment. However, if a maker builds a flow to update a Dataverse record, they need permission on that table. Plan your security roles such that makers get a separate *maker data role* if necessary, instead of giving them excessive broad roles.
- **Run-only users**: These users don't need Environment Maker. If the environment has a Dataverse database and the flow touches Dataverse data, they might require the Basic User role (or another role) in order to have read/write access to the underlying data when the flow runs under their context. For example, a manual trigger flow might create a Dataverse record on behalf of the runner. If so, the runner needs permission to create that record. When using the **Run-only user provides connection** option, the flow executes in the context of the run-only user's credentials. In such cases, you must ensure those users have whatever minimal rights needed through Dataverse roles or relevant system permissions to perform the actions the flow executes. If the flow uses the owner's connection always, the run-only user might not need any special role in Dataverse&mdash;they're pressing a button and the flow uses the owner’s privilege. This nuance should be carefully considered. A safe approach is to give run-only users read access to data they can display and no more. Many companies create a custom Dataverse role or use Basic User with minimal read rights and assign it to all end users to satisfy this requirement of running apps and flows.

### Managing roles with governance in mind

Keep track of who has what role. A Power Platform administrator can list all users in an environment and their assigned security roles from the admin center or through PowerShell. This can be cross-referenced against the expected list of makers. It's a governance best practice to maintain an inventory, for example, *Environment X makers: Alice, Bob, Carol; Environment X run-only/consumers: All users in Marketing Dept*. By having clarity on this, when a request comes to add a new maker, you can check if they're group-approved or get the necessary approvals to expand the circle.

### Scenarios and examples

The following list explains some scenarios and examples of solutions for them.

- **Scenario**: A departmental environment where only a small team should build flows, but many in the department run them.
- **Solution**: The department's IT lead is given Environment Admin. An Azure AD group **Dept Makers** contains the five people who create apps and flows. That group is added to Environment Maker role. This is done either directly, or the individuals are assigned if group assignment isn't available. Everyone in the department is in the **Dept Users** group, which is associated with the environment, so they all have access to be users. Flows created in the environment that need to be run by the whole department are shared with the **Dept Users** group as run-only. This way, makers build and share. A department member can run, but non-department people can't access since they’re not in the environment’s group.
- **Scenario**: A production environment with sensitive flows that shouldn't be edited by anyone except two solution owners.
- **Solution**: Only those two individuals are Environment Makers. No one else has maker role. If other users need to trigger flows, they're given run-only access. Possibly, a dedicated service account or service principal is actually the owner of flows for stability, with the two owners as co-owners for maintenance. Using a service principal as primary owner improves governance for critical flows. All regular employees are either not in that environment or have only the user role. The environment could be tied to a security group containing just the necessary accounts to further ensure exclusivity.
- **Scenario**: A Center of Excellence environment where governance teams build monitoring flows across all environments.
- **Solution**: Only the Center of Excellence team has access. They're environment makers by role. No run-only sharing is needed because these flows are more internal. Here, its crucial Center of Excellence folks perhaps have the Power Platform Admin role at tenant level, which implicitly gives them rights on all environments.

### Benefits of role segregation

By clearly delineating maker versus runner, you achieve the following:

- **Least privilege**: Users get only the permissions they need. A run-only user can't suddenly start creating flows that bypass IT oversight, because they lack that role. Makers get freedom to create, but since that population is smaller and known, you can more easily train and watch over them.
- **Simplified lifecycle management**: When an employee leaves or changes roles, it's easier to update access. For example, if Joe was a maker and is moving off the team, you remove him from the Makers security group. He instantly loses the ability to create and edit in that environment, while retaining run access if he remains in the users group. You might then add his replacement to the Makers group. This group-based maintenance is cleaner than manually adding and removing dozens of flow permissions.
- **Compliance alignment**: Many regulations call for controlled access. Being able to show an auditor that *only these specific individuals can modify automation in this environment; all others can merely trigger approved flows* can help demonstrate strong internal controls. Auditors can also be given export of environment role assignments as evidence of enforcement.
- **Avoid confusion**: If everyone had maker rights, fewer technical users might inadvertently create or alter flows, or be confused by the Power Automate interface. By limiting maker role, you ensure only trained personnel are designing flows, which can reduce mistakes.

These measures should be revisited periodically. As business needs change, someone who is a consumer might need to become a maker (for example, a power user emerges in a new team), or a maker might need to become a consumer. The governance model should be flexible enough to accommodate this with proper approvals. Document the criteria for being granted Environment Maker privileges and the process to request it, so there's transparency and consistency. Similarly, define what conditions can trigger revoking maker access, for example, moving to a different department.

By using security roles and groups in tandem, organizations can achieve a clear and maintainable separation between those who craft automation and those who use automation. This enhances both security and productivity in Power Automate environments.

## Related information

- [Manage shared flows with users outside an environment](manage-shared-flows-with-users-outside-an-environment.md)
- [Share a cloud flow](create-team-flows.md)