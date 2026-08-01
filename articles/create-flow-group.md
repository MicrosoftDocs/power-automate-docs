---
title: Create and manage a flow group
description: Create a flow group, assign a Process license, and add cloud flows to share capacity in Power Automate.
author: radioblazer
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 07/31/2026
ms.author: matow
ms.reviewer: angieandrews
ai-usage: ai-assisted
---

# Create and manage a flow group

Use flow groups to share Process license capacity across up to 25 cloud flows. Learn more in [Share Process license capacity with flow groups](flow-groups.md).

> [!NOTE]
> Flow groups start rolling out in July 2026. The feature becomes available automatically; no admin action is required to enable it. If you don't see the **Flow groups** option yet, it didn't reach your environment. Check back as the rollout continues across regions.

## Identify which flows to group

Before creating a group, confirm that your candidate flows fit within the group's shared 250,000 actions per day.

### Check a flow's daily action usage

1. Open the cloud flow in Power Automate.
1. Select **Analytics** on the flow's detail page.
1. Review the **Actions** chart for the flow's average daily action count over the last 28 days.

Good candidates for grouping have predictable, moderate usage (for example, 5,000–50,000 actions per day each). If a flow regularly exceeds 100,000 actions per day, it might be better served by a dedicated Process license.

### Use the admin usage report

Admins can use **Power Platform admin center** > **Licensing** > **Power Automate** > **Usage** to display which users and flows are approaching or exceeding capacity limits. The report helps you decide which flows need dedicated capacity and which can share a group.

## Open the Flow groups page

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select the environment that contains your Process licenses and solution flows.
1. On the left navigation, select **More** > **Flow groups**. (You can pin it for quick access.)

## Create a flow group

1. Select **New flow group**.
1. Enter a **Flow group name**.
1. Under **Process licenses**, assign the Process license (250,000 actions per day shared across the group).
1. Select **Create**.

> [!TIP]
> If you see *"Failed to create flow group: PowerAutomatePerProcess capacity … is 0,"* the environment has no available Process license capacity. Add Process licenses to the environment first.

You can also bring an existing group definition into the environment with **Import flow group**.

## Add a flow to a group

1. Open the cloud flow's **details** page.
1. In the licensing section, choose **Shared Process license (flow group)**.
1. Select a flow group from the list, then save.

The flow now draws on the group's shared capacity. To manage the group later, select **Manage flow group**.

> [!IMPORTANT]
> Adding a parent flow to a flow group doesn't add its child flows. Add each child flow to the same group separately if it should use the group's shared Process capacity. Each parent and child flow counts separately toward the 25-flow limit.

## Add or remove flows from the flow group page

You can also manage group membership directly from the flow group page instead of navigating to each flow individually.

### Add flows

1. Open the **Flow groups** page (**More** > **Flow groups** in the left navigation).
1. Select the flow group you want to manage.
1. Select **Add flow**.
1. Search for or browse the available solution-aware cloud flows in the environment, including any child flows that should use the group's capacity.
1. Select one or more flows, and then confirm.

### Remove flows

1. Open the flow group from the **Flow groups** page.
1. In the list of group members, select the flow you want to remove.
1. Select **Remove from group** (or use the context menu on the flow row).

The flow is removed from the group and returns to default user licensing unless you assign a dedicated Process license or other plan.

## Monitor group capacity

The flow group page shows capacity as: **{n}/25 flows | {n} Process licenses | {n} actions/day**.

Review consumption regularly. If one flow consistently dominates the group's capacity, move it out and assign a dedicated Process license to that flow.

## Remove a flow or change its license plan

> [!WARNING]
> Removing a flow's Process license or switching it to a different plan removes the flow from its group and breaks any associations. Flows that depended on the group's Process capacity are suspended until relicensed.

To remove a flow from a group without reducing its capacity, dedicate Process licenses to the flow from its detail page to ensure it has sufficient capacity available while no longer being a part of the group.

## Deploy flow groups across environments

Flow group membership and Process license assignments are **environment-specific**. They don't transfer automatically when you deploy flows through managed solutions or pipelines.

After deploying flows to a target environment:

1. Create (or verify) the flow group in the target environment.
1. Add each deployed parent and child flow to the group&mdash;either from the flow group page (**Add flow**) or from each flow's details page (**Shared Process license (flow group)**).
1. Assign the Process license to the group.
1. Confirm each flow is turned on and licensed.

## Related information

- [Share Process license capacity with flow groups](flow-groups.md)
- [Power Automate licensing](/power-platform/admin/power-automate-licensing/types)
- [Application lifecycle management (ALM) with Microsoft Power Platform](/power-platform/alm/)
