---
title: Cancel or resubmit flow runs in bulk in Power Automate
description: Learn how to resubmit and cancel failed or successful flow runs in Power Automate.
suite: flow
author: DBEKI
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 04/16/2026
ms.author: dbekirop
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# Cancel or resubmit flow runs in bulk

You can cancel or resubmit your flow runs in bulk instead of one at a time.

## Resubmit flow runs initiated by instant triggers

Administrators can enable users to resubmit flow runs initiated by instant triggers. Instant triggers, which are used to manually start flows, can be activated through Power Automate, a mobile app, or a button in a canvas app.

> [!IMPORTANT]
> Users can always resubmit their own flow runs initiated by instant triggers. To allow users to also resubmit flow runs initiated by other users, enable the **Power Automate flow run resubmission** setting in the Power Platform admin center.

You can enable flow run resubmission for instant triggers through the Power Platform admin center or by using PowerShell.

### Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Settings** and then search for **Power Automate flow run resubmission**.
1. Select the toggle to enable or disable the functionality.

### Apply tenant setting using PowerShell

To run the following cmdlets, you need one of these prerequisites:

- Any of these roles from Microsoft Entra ID: Tenant admin, Power Platform administrator, or Dynamics 365 Service Administrator. These roles can access the Power Apps admin PowerShell cmdlets without requiring a Power Apps plan for administrative access. However, these administrators need to sign in to the Power Platform admin center at least once before using the PowerShell cmdlets. If this isn't done, the cmdlets fail with an authorization error.

- Power Platform administrator or Dynamics 365 administrator permissions are required to search through another user's resources. Environment admins only have access to those environments and environment resources for which they have permissions.

- For Dataverse for Teams environments, you must be a Power Platform administrator to manage environments where you aren't the owner of the team in Microsoft Teams.

> [!NOTE]
> It takes approximately an hour for the function to become enabled after the PowerShell commands are applied.

1. Sign in to your tenant account:

  ```powershell
   Add-PowerAppsAccount -Endpoint "prod" -TenantID <Tenant_ID>
   ```
1. Retrieve and store your tenant settings in TenantSettings:
   
  ```powershell
   $tenantSettings = Get-TenantSettings
   ```
1. Set the `powerPlatform.powerAutomate.disableFlowRunResubmission` flag to **False**, to allow flow run resubmissions for cloud flows initialized by instant triggers.

  ```powershell
   $tenantSettings.powerPlatform.powerAutomate.disableFlowRunResubmission= $False
   Set-TenantSettings -RequestBody $tenantSettings
   ```

Learn more about PowerShell commands in [PowerShell support for Power Apps and Power Automate](/power-platform/admin/powerapps-powershell#cmdlets).

## Resubmit flow runs

To resubmit previous flow runs in bulk:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows**.
1. Select the cloud flow that you want to resubmit, then select **All runs**.

    :::image type="content" source="media/cancel-resubmit-how-to/all-runs.png" alt-text="Screenshot that displays all runs for the selected flow.":::

   > [!TIP]
   > You can resubmit or cancel up to 20 flow runs at a time.

1. On the **Run history** page, select the flow runs that you want to resubmit.
1. Select **Resubmit flow run(s)**.

    :::image type="content" source="media/cancel-resubmit-how-to/select-runs.png" alt-text="Screenshot that displays the selected runs for your flow.":::

   > [!IMPORTANT]
   > The number of flow runs that you can resubmit is limited by the maximum number of API calls for the connectors in the flow.

## Cancel flow runs

Bulk cancel lets you cancel all flow runs in the **Running** or **Waiting** state at once, without selecting them individually. This is useful during incidents with many erroneous flow runs. All flow runs in the queue are immediately suspended and no longer processed. Their status transitions from **Waiting** to **Canceling** to **Canceled**.

### Cancel flow runs from the Run history page

1. Sign in to [Power Automate](https://make.powerautomate.com) and select **My flows**.
1. Next to the flow, select the ellipses (...) > **Run history**.

    Alternatively, you can select the flow name > **All runs** from the **28-day run history** list.

1. Manually select up to 20 flow runs in the **Waiting** or **Running** state.

    To cancel all flow runs at once instead, select **Cancel all flow runs** in the **Run history** menu at the top of the screen.

1. After you select **Cancel all flows**, a message appears asking you to initiate the bulk utility. Select **Yes**. Optionally, select the checkbox to turn off your flow so you can address the underlying issues that trigger faulty runs.

1. Get the updated status changes in the run history list by periodically refreshing your browser screen.

    > [!NOTE]
    > - Flows in the **Running** state are suspended and change to a state of **Canceling** before eventually changing to **Canceled**.
    > - This process can take up to 24 hours.
    > - In this scenario, the flows are suspended, and no further actions are executed.
    > - If a flow is turned off, pending canceled flows remain **Waiting**, and the queue doesn't clear until the flow is turned back on.
    > - If the flow was throttled, the queue remains stuck until you assign one or more [Power Automate Process licenses](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license#power-automate-process-license) to give the flow additional capacity. Each Process license adds 250,000 actions per day, and up to 10 can be [stacked on a single cloud flow](desktop-flows/capacity-process.md#stack-multiple-process-licenses-on-a-cloud-flow). Contact your environment administrator to [allocate Process capacity to the environment](/power-platform/admin/power-automate-licensing/buy-licenses#manage-licenses) first, then [assign it to the flow](desktop-flows/capacity-process.md#allocate-process-capacity-to-a-cloud-flow).

Flow runs that exceeded the [concurrency](limits-and-config.md#concurrency-looping-and-debatching-limits) limit may remain in the **Waiting** state alongside flow runs in the **Canceling** state. This is expected — they transition to **Canceling** when their turn in the queue arrives.

:::image type="content" source="media/cancel-resubmit-how-to/wait-cancel.png" alt-text="Screenshot of flow runs in states of 'Waiting' and 'Canceling'.":::

After the bulk cancel completes, verify that all flow runs previously in the **Running** or **Waiting** state have transitioned to **Canceled**.

:::image type="content" source="media/cancel-resubmit-how-to/canceled.png" alt-text="Screenshot of flow runs in the state of 'Canceled'.":::

## Related information

- [Power Automate limits and configuration](limits-and-config.md)
- [How to use process capacity](desktop-flows/capacity-process.md)
- [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types)
- [Power Automate licensing FAQ](/power-platform/admin/power-automate-licensing/faqs)

[!INCLUDE[footer-include](includes/footer-banner.md)]
