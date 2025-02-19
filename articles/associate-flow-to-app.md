---
title: Associate flows with apps
description: Learn how to associate automated and scheduled flows with apps in Power Apps and with Dynamics 365 apps.
author: ChrisGarty
contributors:
  - ChrisGarty
  - lancedMicrosoft
  - v-aangie
ms.author: cgarty
ms.reviewer: angieandrews
ms.topic: how-to
ms.date: 11/21/2024
ms.custom:
---

# Associate flows with apps

From the Power Automate portal, you can associate automated and scheduled flows with apps in Power Apps and with Dynamics 365 apps. You can then manage flows and apps together and more easily keep track of dependencies. If the associated app is missing in any environment, the flow alerts you about the missing dependency. This feature also ensures that apps are always up to date.

This feature can provide relief to makers who often struggle to keep track of which flows are used by which apps. Without the association, flows can break if the corresponding app isn't present in the environment. The result can be frustration and delays.

## Add an association

To make an association between a flow and an app, follow these steps. For consistency and continuity, the association is then preserved as the flow is deployed in other environments. In this way, it helps reduce errors and speed up the development process.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. Find and select the flow that you want to associate with an app.
1. On the **Associated Apps** tile in the lower right, select **Edit**.

    :::image type="content" source="./media/associate-flow-to-app/edit-apps.png" alt-text="Screenshot that shows the Edit button on the Associated Apps tile.":::

1. On the **Associated Apps** page, select **Add association**.
1. By default, the **Power Apps** tab is selected and shows the apps in Power Apps that use the same data sources as the flow. To find Dynamics 365 apps, select the **Dynamics 365** tab.

    :::image type="content" source="./media/associate-flow-to-app/add-apps.png" alt-text="Screenshot that shows the Power Apps and Dynamics 365 tabs.":::

    > [!NOTE]
    > If you can't find your app, go to [Why can't I find my app in the list of apps?](#why-cant-i-find-my-app-in-the-list-of-apps) in the "FAQ" section of this article.

1. Select one or more apps, and then select **Save**.
1. To view the associated apps, go back to the flow details.

    :::image type="content" source="./media/associate-flow-to-app/assoc-apps.png" alt-text="Screenshot of the associated app list.":::

## Remove an association

To remove an association between a flow and an app, follow these steps.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the **Associated Apps** tile in the lower right, select **Edit**.
1. Select the app that you want to delete.
1. When a trash can symbol appears next to the app name, select it.
1. On the **Remove app association** page, select **Remove**.

## FAQ

### Why can't I find my app in the list of apps?

Your app might not be listed for one of the following reasons:

- You don't have access to the app.
- The app isn't installed in the environment.
- The app doesn't use the same data sources as the flow.

### I associated 10 apps. So why are only four apps shown on the flow details page?

The **Associated Apps** tile on the flow details page shows only the top four apps. To view the whole list, select **Edit**. All apps then appear on the **Associated Apps** page.

### I'm deploying the flow into production. Will I have to associate again after the flow is in production?

You need to make the association only once in the lower environments. The association is then preserved as the flow is deployed in other environments.

### Why is the status of my app association shown as failed?

The **Associated Apps** page shows the status of your apps.

:::image type="content" source="./media/associate-flow-to-app/failed.png" alt-text="Screenshot that shows the status of apps on the Associated Apps page.":::

The *Association failed* status might be caused by one of the following reasons:

- The app is removed from the environment.
- The app is edited and no longer uses the same data sources as the flow.
- You no longer have access to the app.

### My flow has a Power Apps trigger. So why is the Associated Apps tile blank?

This is a known issue. If a flow has a Power Apps trigger, the apps that use that flow aren't automatically shown. We plan to implement the functionality soon.

### I have a Power Apps per app license. How can I ensure that the in-context flows run?

A Power Apps per app license allows for a limited set of Power Automate capabilities. If the flow is supporting an app in Power Apps, associate the flow with the app. After the association is made, users who have a Power Apps per app license can use the flow.

### Why are my end-user's Power Automate flow connections not working in Power Apps?

It might be that the connection for the current user has become unauthenticated. For instance, the user might have changed their password. The flow will continuously fail. Power Apps doesn't try to automatically repair these connections or re-prompt the end user for updated credentials. This is a known issue for Microsoft SharePoint Online and non-Entra based connections. Refreshing the session might work. Alternatively, you might need to wrap the flow in an `IfError()` and in the failure case, invoke all the dependent connections directly to trigger reauthentication and then rerun the flow.

### I'm an admin and want to associate flows and apps in bulk. Is there an admin command?

Use the PowerShell command [Add-AdminFlowPowerAppContext](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app) to associate flows and apps in bulk.

This is also described in the [How can I associate in-context flows to Power Apps/Dynamics 365 apps?](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps) section of the [Power Automate licensing FAQ](/power-platform/admin/power-automate-licensing/faqs).

## Related information

- [How can I associate in context flows to Power Apps/Dynamics365 apps](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics365-apps)
- [Can I use service principal in flows, and does it count against my request limits?](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits)
