---
title: Assign a user license to a flow owned by a service principal
description: Keep cloud flows owned by a service principal compliant by designating a licensed user, so the flow runs under that user's entitlement instead of requiring a capacity license.
author: radioblazer
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 08/14/2026
ms.author: matow
ms.reviewer: angieandrews
ai-usage: ai-assisted
search.audienceType:
  - maker
  - admin
---

# Assign a user license to a flow owned by a service principal

A cloud flow owned by a service principal application user that uses premium features needs a license to run and stay compliant. Instead of assigning a capacity license to the flow, you can designate a licensed user. The flow then runs under that user's Power Automate entitlement.

Using a service principal to own flows is a common application lifecycle management (ALM) practice, because it removes the dependency on an individual flow owner. Designating a licensed user lets you keep that ownership model without buying an extra license for the service principal itself.

> [!NOTE]
> A service principal application user is a [non-interactive user](/power-platform/admin/create-users#create-a-non-interactive-user-account), so a license is never assigned to the service principal directly. The **User license** setting designates a separate, licensed user whose entitlement the flow runs under. The service principal remains the flow owner.

> [!IMPORTANT]
> If a service principal owned flow that uses premium features isn't licensed, it can be suspended for noncompliance with the message: *This flow was suspended because flows owned by service principals are not compliant.*

## Prerequisites

- A cloud flow owned by a service principal application user. For background, see [Support for service principal owned flows](service-principal-support.md).
- The user you designate must be a **co-owner of the flow**.
- The user you designate must hold a license sufficient to operate the flow. The license must cover every premium feature the flow uses, such as premium connectors, custom connectors, or HTTP actions. A Power Automate Premium license covers these features. A Microsoft 365 seeded license doesn't, and the flow stays noncompliant if you designate a user who only has one.
- Permission to edit the flow, and a Microsoft Dataverse environment.

## How a service principal owned flow is licensed

Open the flow's **Details** page to see which license the flow is using. You have these options:

- **Designate a user license**: The flow runs under a licensed user's entitlement and that user's action limits apply. Use this option when a co-owner of the flow holds a license that covers the flow's premium features.
- **Assign a Power Automate Process license**: A [capacity license](/power-platform/admin/power-automate-licensing/types) assigned to the flow itself, which entitles it to 250,000 actions per day independent of any user. The flow must be solution-aware. You can also assign a Process license to a [flow group](flow-groups.md) to share that capacity across up to 25 flows.

If the flow isn't licensed by either option, it runs against the tenant's [non-licensed user request limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits), and premium usage isn't compliant.

## Assign a user license

1. Confirm the user you want to designate is a **co-owner** of the flow. If they aren't, [share the flow](create-team-flows.md) with them first.
1. Confirm that user's license covers every premium feature the flow uses. If it doesn't, the flow remains noncompliant even after you designate them.
1. Open the service principal owned cloud flow's **Details** page.
1. In the licensing section, locate **User license**.
1. In the people picker, select the user to designate as the licensed user, and then save.

The flow's **Details** page now shows that the flow runs on the selected user's license.

> [!NOTE]
> The designation takes effect as soon as you save it. If the designated user later loses their Power Automate license or is removed as a co-owner, the flow can fall out of compliance and be suspended.

## If the flow was suspended

If the flow was suspended because it wasn't compliant, designate a user who is a co-owner and holds a license sufficient for the flow's premium features, or assign a Process license as described previously.

If the flow is still turned on, the change takes effect as soon as you save the designated user. If the flow was turned off, turn it back on after you designate the user.

Designating a user whose license doesn't cover the flow's premium features doesn't restore compliance.

## Assign a user license programmatically

The designation is stored in Dataverse as the **Licensee** column on the flow's row in the **Process** (`workflow`) table. The column is a lookup to a **User** (`systemuser`) record. Setting it programmatically is equivalent to using the **Details** page, and the same prerequisites apply: the user must be a co-owner of the flow and must hold a license sufficient for the flow's premium features.

You need two identifiers:

- The flow's row ID, which is the `workflowid` value. Cloud flows are rows in the **Process** table where **Category** is **Modern Flow**. The ID also appears in the flow's URL in the Power Automate portal.
- The designated user's `systemuserid` value from the **User** table.

### Use the Microsoft Dataverse connector

Use this approach to designate the user from a cloud flow, such as a step in a deployment flow that runs after a solution import.

1. Add the **Update a row** action from the [Microsoft Dataverse](/connectors/commondataserviceforapps/) connector.
1. In **Table name**, select **Processes**.
1. In **Row ID**, enter the `workflowid` of the service principal owned flow.
1. In **Licensee (Users)**, enter the designated user's record in the form `/systemusers(<systemUserId>)`. If the field isn't shown, select **Show advanced options**.
1. Save and run the flow.

To remove the designation, leave **Licensee (Users)** empty.

### Use the Dataverse Web API

Use this approach from a script or pipeline task. For general guidance, see [Update and delete tables using the Web API](/power-apps/developer/data-platform/webapi/update-delete-entities-using-web-api).

To designate a user, send a `PATCH` request that binds the **Licensee** lookup to the user's record:

```http
PATCH [Organization URI]/api/data/v9.2/workflows(<workflowId>) HTTP/1.1
Content-Type: application/json

{
  "licensee_systemuserid@odata.bind": "/systemusers(<systemUserId>)"
}
```

To read the current designation, request the lookup value. To also return the user's name, ask for formatted values:

```http
GET [Organization URI]/api/data/v9.2/workflows(<workflowId>)?$select=name,_licensee_value HTTP/1.1
Prefer: odata.include-annotations="OData.Community.Display.V1.FormattedValue"
```

To remove the designation, delete the reference. This request succeeds even if no user is currently designated, so it's safe to run in a script. For more information, see [Associate and disassociate table rows using the Web API](/power-apps/developer/data-platform/webapi/associate-disassociate-entities-using-web-api).

```http
DELETE [Organization URI]/api/data/v9.2/workflows(<workflowId>)/licensee_systemuserid/$ref HTTP/1.1
```

For the full **Process** table reference, see [Process (Workflow) table](/power-apps/developer/data-platform/reference/entities/workflow).

## Deploy to another environment

The user license designation points to a user record in a specific environment, so it isn't carried in a solution. Deploying the flow through a managed solution or a pipeline doesn't reapply it in the target environment.

After you deploy a service principal owned flow:

1. Confirm the intended licensed user is a **co-owner** of the flow in the target environment and holds a license that covers the flow's premium features in that tenant.
1. Designate the user license again on the flow's **Details** page in that environment, or set the **Licensee** column as described in [Assign a user license programmatically](#assign-a-user-license-programmatically).
1. Confirm the flow is turned on.

## Related information

- [Support for service principal owned flows](service-principal-support.md)
- [Share Process license capacity with flow groups](flow-groups.md)
- [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types)
- [Non-licensed user request limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits)
- [Process (Workflow) table](/power-apps/developer/data-platform/reference/entities/workflow)
