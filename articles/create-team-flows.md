---
title: Share a cloud flow
description: Learn how to share cloud flows with others in your organization and guest users, add owners, and collaborate with them to design and manage flows.
author: ChrisGarty
contributors:
  - DBEKI
  - ChrisGarty
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 05/23/2025
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Share a cloud flow

Share a cloud flow with others in your organization and guest users so they can also benefit from automation you created. There are three primary ways to share a cloud flow in Power Automate:

- Add an owner to a cloud flow.
- Share a cloud flow with run-only privileges.
- Share a copy of a cloud flow.

## Prerequisites

- You must have either a [Power Automate license (except the free license)](https://make.powerautomate.com/pricing/) or a seeded license (Office 365, Dynamics 365 Enterprise plans, Dynamics 365 Professional plans, Dynamics 365 Team Member, Power Apps (Canvas and Model driven Apps)- Per App plans, Power Apps per user plan, Power Apps Plan 1 (exempted), Power Apps Plan 2 (exempted), Windows licenses) to share a cloud flow.
- You must be the creator or owner to add or remove owners from a cloud flow.

### About embedded and other connections

Connections used in a cloud flow fall into two categories:

- **Embedded**: These connections are used in the flow.
- **Other**: These connections were defined for a cloud flow, but aren't used in it.

If you stop using a connection in a cloud flow, that connection appears in the **Other connections** list, where it remains until an owner includes it in the flow again. To make changes to embedded connections, follow the steps in [Modify a connection](#modify-a-connection), later in this article.

The list of connections appears under the list of owners in a cloud flow's properties.

## Add an owner to a cloud flow

Adding an owner to a cloud flow is the most common way to share a cloud flow. Any owner of a cloud flow can perform these actions:

- View the run history.
- Manage the properties of the flow (for example, start or stop the flow, add owners, or update credentials for a connection).
- Edit the definition of the flow (for example, add or remove an action or condition).
- Add or remove other owners (but not the flow's creator), including guest users.
- Delete the flow.

If you're the creator or an owner of a cloud flow, you can find it listed on the **Team flows** tab in Power Automate.

> [!NOTE]
> Shared connections can be used *only* in the flow in which they were created.

Owners can use services in a cloud flow but can't modify the credentials for a connection that another owner created.

To add more owners to a cloud flow:

1. Sign in to [Power Automate](https://make.powerautomate.com), and then select **My flows**.
1. Select the flow that you want to share, select the vertical ellipsis (&vellip;), and then select **Share**.

1. Enter the name, email address, or group name for the person or group that you want to add as an owner.

    The user or group you selected becomes an owner of the flow.

Congratulations! You created your team flow.

## Add a list as a co-owner

You can add SharePoint lists as co-owners of a cloud flow so that everyone who has edit access to the list automatically gets edit access to the flow. After the flow is shared, you can distribute a link to it. More information: [Training: Create and set up a SharePoint list](https://support.microsoft.com/office/training-create-and-set-up-a-list-1ddc1f5a-a908-478b-bb6d-608f34b71f94)

Use a list when the flow is connected to SharePoint, and use a group in all other cases.

> [!IMPORTANT]
> - SharePoint users must have **Edit** permission or be a member of the **Members** or **Owners** group to run flows in SharePoint.
> - Adding a list as a co-owner isn't available in GCC High and DoD tenants.

## Remove an owner

When you remove an owner whose credentials are used to access Power Automate services, you should update the credentials for those connections so that the flow continues to run properly. To learn more, go to [Modify a connection](#modify-a-connection).

1. On the flow details page, in the **Owners** section, select **Edit**.

1. Select **Delete** (the trash can) for the owner you want to remove.

1. In the confirmation dialog box, select **Remove**.

Congratulations&mdash;the user or group that you removed is no longer listed as an owner of the flow.

## Modify a connection

You might need to change the owner of a connection in a cloud flow if you remove the existing owner or if you just want to use a different account to sign in to an action or trigger.

1. Go to the flow that you want to modify.

1. Select **Edit**.

1. Select the ellipsis (...) in the step where you want to edit the connection.

1. If you have a connection already, select it; if not, select **Add new connection** to create a new connection, and then select **Sign in** to create your new connection.

## Share a cloud flow with run-only permissions

Instant flows (that is, flows that use a manual trigger such as a button or an item being selected) can be shared by using run-only permissions. Any user who is added as a run-only user doesn't have access to edit or modify the flow in any way; they have permissions only to trigger the flow.

To add a run-only user:

1. On the flow details page, in the **Run only users** section, select **Edit**. 

1. In the **Manage run-only permissions** panel, specify the users and groups you want to provide run-only access to.

1. As an owner, you can specify whether run-only users need to provide their own connections or you can use a connection already defined in the flow.

    :::image type="content" source="./media/create-team-flows/manage-run-only-connections.png" alt-text="Screenshot of managed connections.":::

Congratulations! The user or group now has access to run the flow.

To remove a run-only user:

1. On the flow details page, in the **Run only users** section, select **Edit**. 

1. In the **Manage run-only permissions** panel, select **Delete** (the trash can) next to the user whose access you want to remove, and then select **Save**.

Congratulations&mdash;the user or group no longer has access to run this flow.

## Send a copy of a cloud flow

You can send a copy of a cloud flow to another user, who can then use the definition of the flow as a template. It provides a good way for you to share the general structure of a cloud flow without sharing any connections, while also allowing the recipient to modify their flow independently of yours, so they can make it fit their needs.

> [!NOTE]
> Sending a copy creates an independent instance of the flow for the recipient. You can't revoke access to the flow after you share it.

**To send a copy of a cloud flow**

1. On the flow details page command bar, select **Send a copy**.

1. On the **Send a copy** panel, you can edit the name and description of the flow you want to share, and specify the users with whom you want to share it.

    :::image type="content" source="./media/create-team-flows/send-a-copy3.png" alt-text="Screenshot of 'Send a copy' details.":::

1. The recipient receives an email stating that you shared a cloud flow template with them, and they can then create their own instance of that flow.

## Best practices for managing shared cloud flows

To avoid improper sharing and reduce the effort of compliance, administrators should implement best practices. Here are key recommendations to manage shared flows securely and efficiently.

### Use security roles to segment duties

Grant Environment Maker role only to users who genuinely need to create or edit flows in that environment. End-users who only run flows should stay as basic users. This principle limits who can share or modify flows. For example, if you have a group of users who only trigger flows but shouldn't create new ones, don't elevate them to makers. By keeping run-only users as basic environment members, or using run-only sharing without promotion, you prevent them from building or importing rogue flows. This segmentation creates a clear boundary: makers design, others consume. If an environment has no security group (open to all), you can still control maker privileges via roles&mdash;perhaps designate a *makers* Azure AD group and script assignment of Environment Maker role only to that group's members. This way, although everyone is in the environment, only approved makers can share or own flows. This reduces accidental external shares.

### Leverage Run-Only access instead of co-ownership

When a flow needs to be used by many people, especially outside the core team, prefer providing Run-Only access over making them co-owners. Run-Only users can execute the flow manually or through connectors like button, SharePoint, and others, without seeing or altering the flow's design. For instance, suppose a department builds an **Expense Approval** flow that managers in other departments can trigger. Rather than adding 10 managers as co-owners, which crosses environment bounds and poses governance issues, share the flow or its trigger with them as run-only users. They're able to run it through a button in Teams or a shared link, but can't edit or view the flow in Power Automate. This protects the flow and confines full control to the creators. It also simplifies compliance. Those managers don't need Environment Maker access, just run permission. In summary, only designate co-owners when collaborative editing is needed. In all other cases, use run-only or other indirect methods of interaction, such as embedding the flow in an app or using Power Apps to call the flow.

### Enforce data loss prevention (DLP) policies

DLP policies don't directly stop sharing flows, but they mitigate risks if flows are broadly shared. By classifying connectors into **Business** versus **Non-Business** and creating DLP rules, you prevent flows (even those shared widely) from using connectors that could exfiltrate data. For example, if an external user somehow gets run access to a flow, a strict DLP policy ensures that flow can't suddenly send data to an unauthorized service, like a social media or personal cloud drive connector. Also, if you suspect some flows might be shared externally, disallow custom connectors or HTTP connectors in certain environments unless necessary. This reduces what an external person could do if they had edit access. Essentially, DLP acts as a safety net. Even if sharing boundaries is stretched, the flow’s capabilities remain within acceptable limits. It's a best practice to review DLP policies whenever expanding access to flows.

### Establish regular auditing and monitoring

Make it a routine to review flow sharing and ownership. For instance, do monthly or quarterly audits of flows in each production environment. Use the PowerShell approach from [Identify flows shared with users outside their environment](manage-shared-flows-with-users-outside-an-environment.md#identify-flows-shared-with-users-outside-their-environment) to generate a current list of all flows and owners. Identify anomalies such as flows with owners outside expected teams or any new guest owners. You can automate parts of this. For example, an admin can set up a scheduled PowerShell script or a flow using the Power Platform for Admins connector to gather sharing data and send a report through email. Microsoft's documentation encourages periodic entitlement reviews. Ensure they align with current business needs and remove access for users who no longer require it. For example, if Terry was an external co-owner for a special project and that project ended, catch it in the next audit and clean it up.

> [!TIP]
> The [Power Platform admin center](https://admin.powerplatform.microsoft.com/home) analytics and the [Power Platform Center of Excellence Starter Kit](/power-platform/guidance/coe/starter-kit) dashboards can show trends, like how many flows each user runs, or how many flows each environment has. Use these to detect if a particular flow is being widely used by unexpected users. This indicates a possible unmanaged share.

## FAQ

### Manage flows when the user who created a shared flow leaves the organization

If the shared flow still has an active owner, the flow continues to run.

> [!NOTE]
> If the flow uses any active or embedded connections that belong to the user who has left the organization, those specific actions might fail. To fix this, follow the steps in [Modify a connection](#modify-a-connection), earlier in this article to update the credentials.

 If there's no active owner for a flow, you should change the owner. To change the owner of a flow, make a copy of the flow, and then let the intended owner create the flow from the copy.

### Change the owner of a solution-aware cloud flow

[Edit the details](./change-cloud-flow-owner.md) to change the ownership of a solution-aware cloud flow.

### Change the owner of a non-solution-aware cloud flow

To change the ownership of a non-solution-aware cloud flow, you must create a new flow via export/import, **Save as**, or **Send a copy**. In-place ownership change for non-solution-aware cloud flows is not available because the owner is part of the flow identity. 

### Share ownership of a solution-aware cloud flow with a user who isn't in Dataverse
When you share ownership of a solution-aware cloud flow with a user who isn't in Dataverse, that user gets added into Dataverse automatically to facilitate sharing. In a default environment, Microsoft Entra ID (Microsoft Entra ID) users have the EnvironmentMaker role. In a non-default environment, Microsoft Entra users and groups are added into Dataverse but they aren't assigned the EnvironmentMaker role automatically. Therefore, they might only be able to run the flow until an administrator assigns them a role. If the user doesn't have an appropriate role, they receive a detailed error message.

### Can connections be provided by the user that runs the flow? 
Yes. When a connection is configured to be **Provided by run-only user**, then that connection is provided by the user who runs (or invokes) the flow.

### Can a connection provided by run-only user be used by another user?
No. When a connection is configured to be **Provided by run-only user** then that connection is provided by the user that runs (or "invokes") the flow. Embedded connections are used by all users of the flow, but connections provided by a run-only user are used only by the user that provides them. When the flow connects to a service via a connector, then the **Provided by run-only user** connections allow the flow to act as the run-only user and access the data that the user has access to. If the flow is exported, then the **Provided by run-only user** connections have a **RuntimeSource** value of **invoker**.

## Related information

- [Training: Share a cloud flow with Power Automate (module)](/training/modules/share-cloud-flow/)
- [Training: Share and collaborate with Power Automate (learning path)](/training/paths/share-collaborate-power-automate/)
- [Guide to cloud flow sharing and permissions](guide-to-cloud-flow-sharing-and-permissions.md)
- [Manage shared flows with users outside an environment](manage-shared-flows-with-users-outside-an-environment.md)

 
[!INCLUDE[footer-include](includes/footer-banner.md)]
