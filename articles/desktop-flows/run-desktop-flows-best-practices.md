---
title: Best practices
description: See the best practices for running Power Automate desktop flows.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/15/2023
ms.author: pefelesk
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Best practices

This article presents the best practices for running Power Automate desktop flows and distributing the workload.

## Avoid time-outs and distribute load across machines

Running multiple desktop flows at the same time may cause time-outs. Adopt one of the recommended strategies to distribute the workload and ensure that all desktop flows run successfully without overloading the target machines.

- Spread the load over time by planning your desktop flows to run at different times. This practice works best if you have a limited set of machines and can control the triggers that start your desktop flows.

- Create machine groups that run desktop flows with identical configurations in parallel. To find more information about machine groups, go to [Manage machine groups](manage-machine-groups.md).

- Create multiple flows that use separate connections to target different machines. To find more information about desktop flow connections, go to [Create desktop flow connections](desktop-flow-connections.md).

All the presented strategies prevent desktop flows from competing to run on the same device and failing due to time-outs.

> [!NOTE]
>
> - To run desktop flows in unattended mode, you need to anticipate the number of desktop flows your organization plans to run in parallel and then purchase an adequate amount of Unattended Add-ons.
> - If a target device or gateway becomes offline due to a restart or connectivity issues, desktop flows will wait up to three hours before failing. This wait time allows for transient machine states and enables you to run automation successfully even if the devices go through restart or update cycles.

## Support long-running desktop flows

Some desktop flows may run for long durations—for example, more than 24 hours. To ensure that those flows run successfully and don't fail due to the default time-out values, perform the following steps:

1. Select the ellipsis (**…**) on the top of the **Run a flow built with Power Automate for desktop** cloud action, and then select **Settings**.

1. Select **Timeout** and update the duration to handle your desktop flow runs appropriately.

    :::image type="content" source="media/run-desktop-flows-best-practices/timeout-settings.png" alt-text="Screenshot of the settings option of the desktop flow cloud action.":::

1. Select **Done**.

## Distribute load evenly across gateways in a cluster

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for the China region. Switch to our machine-management capabilities. [Learn more about the switch from gateways to direct connectivity.](manage-machines.md#switch-from-gateways-to-direct-connectivity)

Power Automate enables you to distribute desktop flow runs evenly across gateways in a cluster. By default, the selection of a gateway during load balancing is random.

To provide load balancing:

1. Open the Power Automate portal, navigate to **Data** > **Gateways**, and select your gateway cluster.

1. In the gateway details page, enable **Run on all gateways in the cluster**. This option allows you to distribute the desktop flow runs on all the gateways within the cluster.

    In rare cases, it can take up to 10 minutes for this setting to be effective and for load balancing runs to begin across cluster members.

    :::image type="content" source="media/run-desktop-flows-best-practices/gw-cluster.png" alt-text="Screenshot of the gateway details page.":::

>[!IMPORTANT]
>
> - Offline gateway members within a cluster will negatively impact performance. Disable or remove these members.
> - If you are using local Windows accounts, all machines in the cluster must have the same local account with the same password. Use these credentials when you create the [desktop flow connection](desktop-flow-connections.md).
>- If you are using Active Directory or Microsoft Entra ID-joined machines, confirm that the user account in the [desktop flow connection](desktop-flow-connections.md) can access all the gateways in the cluster.

[!INCLUDE[footer-include](../includes/footer-banner.md)]