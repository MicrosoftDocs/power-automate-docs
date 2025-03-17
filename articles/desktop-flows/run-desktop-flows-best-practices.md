---
title: Best practices
description: See the best practices for running Power Automate desktop flows.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 03/17/2025
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

Desktop flows queue for up to six hours until a machine is available. Adopt one of the recommended strategies to distribute the workload and ensure that all desktop flows run successfully without overloading the target machines.

- Spread the load over time by planning your desktop flows to run at different times. This practice works best if you have a limited set of machines and can control the triggers that start your desktop flows.

- Create machine groups that run desktop flows with identical configurations in parallel. To find more information about machine groups, go to [Manage machine groups](manage-machine-groups.md).

- Anticipate the number of unattended desktop flows your organization plans to run in parallel, and purchase an adequate number of Process licenses. Learn more in [Power Automate Process license](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license#power-automate-process-license).

All the presented strategies prevent desktop flows from competing to run on the same device and failing due to time-outs.

> [!NOTE]
>
> If a target device goes offline due to a restart or connectivity issues, desktop flows wait up to six hours before failing. This wait time allows for transient machine states and lets you run automation successfully even if the devices go through restart or update cycles.

## Support long-running desktop flows

Some desktop flows may run for long durations—for example, more than 24 hours. To ensure that those flows run successfully and don't fail due to the default time-out values, perform the following steps:

1. Select the ellipsis (**…**) on the top of the **Run a flow built with Power Automate for desktop** cloud action, and then select **Settings**.

1. Select **Timeout** and update the duration to handle your desktop flow runs appropriately.

    :::image type="content" source="media/run-desktop-flows-best-practices/timeout-settings.png" alt-text="Screenshot of the settings option of the desktop flow cloud action.":::

1. Select **Done**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]