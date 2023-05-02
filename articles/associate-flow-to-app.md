---
title: Associate flows to apps
description: Learn how to associate automated and scheduled flows with Power Apps and Dynamics 365 apps.
author: PriyaKodukula
contributors:
  - PriyaKodukula
  - v-aangie
ms.author: prkoduku
ms.reviewer: angieandrews
ms.topic: how-to
ms.date: 04/27/2023
ms.custom:
---

# Associate flows to apps

You can associate automated and scheduled flows with Power Apps and Dynamics 365 apps from the Power Automate portal. This feature allows you to manage flows and apps together, which makes it easier to keep track of dependencies.If the associated Power Apps or Dynamics 365 app is missing in any environment, the flow will alert you about the missing dependency. It also ensures that apps are always up to date.

This feature can provide relief to makers who often struggle to keep track of which flows are being used by which apps. Without this association, flows can break if the corresponding app isn't present in the environment. This can cause frustration and delays.


## Add an association

Once you've made the association between a flow and an app with the following steps, it will be preserved as the flow is deployed in other environments. This consistency and continuity will help to reduce errors and speed up the development process.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the panel to the left, select **My flows**.

1. Find and select the flow you want to associate.

1. On the **Associated apps** tile at the bottom-right, select **Edit**.

    :::image type="content" source="./media/associate-flow-to-app/edit-apps.png" alt-text="Screenshot of the Edit button in the Associated Apps tab.":::

1. On the **Associated Apps** page, select **Add association**.

    You'll find all the apps in Power Apps that are using the same data sources as the flow.

1. To find Dynamics 365 apps, select the **Dynamics 365** tab.

    :::image type="content" source="./media/associate-flow-to-app/ADD-apps.png" alt-text="Screenshot of the Power Apps and Dynamics 365 tabs.":::

>[!NOTE]
>
> If you're unable to find your app, go to [Why can't I find my app in the list of apps?](#why-cant-i-find-my-app-in-the-list-of-apps) in the *FAQ* section of this article.

1. On the **Associated Apps** page, select one or more apps, and then select **Save**.

1. To see the associated apps, go back to flow details.  

    :::image type="content" source="./media/associate-flow-to-app/assoc-apps.png" alt-text="Screenshot of the associated apps list.":::

## Remove an association

To remove an association between a flow and an app, follow these steps.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the **Associated apps** tile at the bottom-right, select **Edit**.

1. Select the app you want to delete.

1. When a trash can appears next to the app name, select it.

1. On the **Remove app association** screen, select **Remove**.

## FAQ

### Why can't I find my app in the list of apps?

It could be due to one of the following reasons:

- You don’t have access to the app.
- The app isn't installed in the environment.
- The app doesn't use the same data sources as the flow.  

### I associated 10 apps, but why do I see only four apps in the flow details page?

The **Associated apps** tile in the flow details page shows only the top four apps. If you want to see the entire list, select **Edit**. All apps will then appear on the **Associated apps** page.  

### I'm deploying the flow into production. Will I need to associate again, once the flow is in production?

You need to make the association only once in the lower environments. The association is preserved as the flow is deployed in other environments.  

### Why does my app association status display as failed?

You'll see the status of your apps in the **Associated Apps**  screen.

:::image type="content" source="./media/associate-flow-to-app/failed.png" alt-text="Screenshot of the status of your apps in the Associated Apps screen.":::

The **Association failed** status could be due to one of the following reasons:

- The app is removed from the environment.  
- The app is edited and is no longer using the same data sources as the flow.
- You no longer have access to the app.

### My flow has a Power Apps trigger, but why is the associated apps tile empty?

This is a known issue. We don't automatically display the apps that are using the flow when the flow has a Power Apps trigger. We plan to implement it soon.  

### I have a Power Apps per app license. How can I ensure the in-context flows run?

A Power Apps per app license allows a limited set of Power Automate capabilities. If the flow is supporting an app in Power Apps, associate the flow to the app. Once the association is done, users with Power Apps per app license can use the flow.  

### I am an admin and want to assosciate flows and apps in bulk. Is there an admin command?
Use the powershell command [here](https://learn.microsoft.com/power-platform/admin/power-automate-licensing/faqs#how-can-i-associate-in-context-flows-to-apps)

