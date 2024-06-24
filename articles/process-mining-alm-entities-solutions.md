---
title: Transfer ALM Process Mining entities with Power Platform solutions
description: Learn how to use the process mining capability with sample data in a tutorial.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/03/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Transfer ALM Process Mining entities with Power Platform solutions

Application lifecycle management (ALM) in Process Mining allows you to transfer your process mining entities with Power Platform solutions. You need to be in your Dev environment to create and export your solution. Then, you change to your Test environment to import your solution.

The source and target of your process mining artifacts determine which environment you need to use:

- **Dev environment**: The environment *from* which you want to port artifacts.
- **Test environment**: The environment *to* which you want to port artifacts.

## Create and export your solution

Create and export your proccess solution in the Dev environment.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select your Dev environment.
1. On the left navigation menu, select **Process mining** and create your process.

    :::image type="content" source="media/process-mining-alm-entities-solutions/create-process.png" alt-text="Screenshot of the first screen where you create your process.":::

1. On the navigation menu, select **Solutions**.

    If **Solutions** doesn't appear on the menu, select **More** > **Solutions**.

1. Create a new solution with the following steps:
    1. On the menu bar at the top, select **+New solution**.
    1. In the **Display name** field, enter the name to display.
    1. In the **Publisher** dropdown menu, select a publisher.

        If you want to edit the selected publisher, select the pencil icon next to the dropdown menu.

    1. In the **Version** field, enter a version (for example, 1.0.0.0).

1. At the bottom of the screen, select **Create**.
1. On the menu bar at the top, select **Add existing** > **More** > **Other** > **PM Inferred Task**.
1. From the **Add existing PM Inferred Task** list, select the process you created and want to copy to the Test environment, and then select **Add**.
1. On the navigation menu, select the back arrow to go to the **Solutions** screen. You should now see the solution you created.
1. Select your solution, and then select **Export solution** on the menu at the top.
1. On the **Before you export** screen, select **Publish**.
1. When all customizations are published, select **Next**.

    :::image type="content" source="media/process-mining-alm-entities-solutions/before-export.png" alt-text="Screenshot of the first screen where you create your process.":::

 1. Select **Export**.

## Download and import your exported solution

After a export successful export, a green message bar appears below the menu at the top.

1. From the green message bar, select **Download**.
1. Go to your Test environment.
1. On the left navigation menu, select **Solutions**.
1. Import the solution with the following steps.
    1. On the menu bar at the top, select **Import solution**.
    1. On the **Import a solution** screen, select **Browse**.
    1. From your file explorer, select the solution you downloaded.
    1. Select **Next**.
    1. Select **Import**.

    After the solution successfully imports, you should see the Process mining homepage with an orange exclamation mark inside a speech bubble on it.

    :::image type="content" source="media/process-mining-alm-entities-solutions/speech-bubble.png" alt-text="Screenshot of the first screen where you create your process.":::

1. To complete the import to the Test environment, select your process solution and follow the setup process.

## Update entities in your Test environment

You can update entities in your Test environment by upgrading or updating your solution. To learn more, go to [Apply the upgrade or update in the target environment](/power-apps/maker/data-platform/update-solutions#apply-the-upgrade-or-update-in-the-target-environment).

To learn more about solutions, go to [Solution concepts](/power-platform/alm/solution-concepts-alm).