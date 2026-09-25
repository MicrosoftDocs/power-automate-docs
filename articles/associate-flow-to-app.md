---
title: Associate flows with apps
description: Learn how to associate automated and scheduled flows with apps in Power Apps and with Dynamics 365 apps.
author: ChrisGarty
contributors:
  - ChrisGarty
  - lancedMicrosoft
  - v-aangie
  - cyrilanderson
ms.author: cgarty
ms.reviewer: cyanderson
ms.topic: how-to
ms.date: 09/18/2026
ms.custom:
---

# Associate flows with apps

From the Power Automate portal, you can associate automated and scheduled flows with apps in Power Apps and with Dynamics 365 apps. When you associate flows with apps, you can manage flows and apps together and track dependencies. If the associated app is missing in any environment, the flow alerts you about the missing dependency. Without an association, a flow can break if the corresponding app isn't present in the environment.

## Add an association

To associate a flow with an app in Power Apps or a Dynamics 365 app, follow these steps. The association is preserved as the flow is deployed in other environments.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left navigation pane, select **My flows**.
1. Find and select the flow that you want to associate with an app.
1. On the **Associated apps and flows** tile in the lower right, select **Edit**.

    :::image type="content" source="./media/associate-flow-to-app/edit-apps.png" alt-text="Screenshot showing the Edit button on the Associated Apps tile for a flow.":::

1. On the **Associated apps and flows** page, select **Add association**.
1. By default, the **Power Apps** tab is selected and shows the apps in Power Apps that use the same data sources as the flow. To find Dynamics 365 apps, select the **Dynamics 365** tab.

    :::image type="content" source="./media/associate-flow-to-app/add-apps.png" alt-text="Screenshot of the Add apps pane with the Power Apps and Dynamics 365 tabs and a list of available apps.":::

    > [!NOTE]
    > If you can't find your app, go to [Why can't I find my app in the list of apps?](#why-cant-i-find-my-app-in-the-list-of-apps) in the "FAQ" section of this article.

1. Select one or more apps, and then select **Save**. If save fails with "the Power App and flow are not using any common data sources," the app and flow must share a connection or data source before they can be associated.
1. To view the associated apps, go back to the flow details.

    :::image type="content" source="./media/associate-flow-to-app/assoc-apps.png" alt-text="Screenshot of the associated app list.":::

## Remove an association

To remove an association between a flow and an app, follow these steps:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the **Associated apps and flows** tile in the lower right, select **Edit**.
1. Select the app that you want to delete.
1. When a trash can symbol appears next to the app name, select it.
1. On the **Remove app association** page, select **Remove**.

## FAQ

### Why can't I find my app in the list of apps?

Your app might not be listed for one of the following reasons:

- You don't have access to the app.
- The app isn't installed in the environment.
- The app doesn't use the same data sources as the flow.

### Why does the flow details page show only four associated apps?

The **Associated apps and flows** tile on the flow details page shows only the top four apps. To view the whole list, select **Edit**. All apps then appear on the **Associated apps and flows** page.

### Do I need to associate the flow again after deploying it to production?

You need to make the association only once in the lower environments. The association is then preserved as the flow is deployed in other environments.

### Why does the status of my app association show as failed?

The **Associated apps and flows** page shows the status of your apps.

:::image type="content" source="./media/associate-flow-to-app/failed.png" alt-text="Screenshot of the Associated Apps page showing one app with an Association failed status and two apps marked Associated.":::

The *Association failed* status might be caused by one of the following reasons:

- The app is removed from the environment.
- The app is edited and no longer uses the same data sources as the flow.
- You no longer have access to the app.

### Why is the Associated apps and flows tile blank for a flow that has a Power Apps trigger?

This problem is a known issue. If a flow has a Power Apps trigger, the apps that use that flow aren't automatically shown. We plan to implement the functionality soon.

### How do I ensure that in-context flows run with a Power Apps per app license?

A Power Apps per app license allows for a limited set of Power Automate capabilities. If the flow is supporting an app in Power Apps, associate the flow with the app. After the association is made, users who have a Power Apps per app license can use the flow.

### Why are my end-user's Power Automate flow connections not working in Power Apps?

It might be that the connection for the current user becomes unauthenticated. For example, the user might change their password. The flow continuously fails. Power Apps doesn't try to automatically repair these connections or re-prompt the end user for updated credentials. This problem is a known issue for Microsoft SharePoint Online and non-Entra based connections. Refreshing the session might work. Alternatively, you might need to wrap the flow in an `IfError()` and in the failure case, invoke all the dependent connections directly to trigger reauthentication and then rerun the flow.

### How can an admin associate flows and apps in bulk?

Use the PowerShell command [Add-AdminFlowPowerAppContext](/power-platform/admin/powerapps-powershell#associate-in-context-flows-to-an-app) to associate flows and apps in bulk.

This command is also described in the [How can I associate in-context flows to Power Apps/Dynamics 365 apps?](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps) section of the [Power Automate licensing FAQ](/power-platform/admin/power-automate-licensing/faqs).

## Related information

- [How can I associate in context flows to Power Apps/Dynamics365 apps](/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-power-appsdynamics365-apps)
- [Can I use service principal in flows, and does it count against my request limits?](/power-platform/admin/power-automate-licensing/types#can-i-use-service-principal-in-flows-and-does-it-count-against-my-request-limits)
