---
title: Overview of solution-aware flows
description: Learn solution concepts and how to implement a healthy ALM practice for flows.
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 11/16/2026
ms.author: cgarty
ms.reviewer: cyanderson
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of solution-aware flows

When you host your flows in a [solution](/power-platform/alm/solution-concepts-alm), they become portable, making it effortless to move them and all their components from one environment to another. A typical use case is for an independent software vendor (ISV) to develop flows in a sandbox environment, and then move those flows to a test environment. After testing, the ISV would then move the flows to a production environment for clients who purchase these flows. This process is much easier when you create your flows in solutions, and then move the solutions and their contents.

Flows that you create in a solution are known as *solution-aware* flows. You can add multiple flows to a single solution.

> [!TIP]
> The [Application lifecycle management (ALM) with Microsoft Power Platform](/power-platform/alm/) guide provides detailed information about solution concepts and how to implement a healthy ALM practice in your organization.

## Prerequisites

You must have the following components to create solutions, and solution-aware flows.

- [Dataverse](/powerapps/maker/data-platform/data-platform-intro).
- An environment with version 9.1.0.267 or later.

  To check your version, go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments**, and then select the environment in which you are interested. The **Details** tab displays all configuration information for the environment that you selected.

## Create a solution

Follow these steps to create a solution.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the menu to the left, select **Solutions**.

   :::image type="content" source="./media/overview-solution-flows/left-nav-solution.png" alt-text="Screenshot of the left navigation pane with Solutions highlighted.":::

1. Select **New solution**.

   :::image type="content" source="./media/overview-solution-flows/select-new-solution.png" alt-text="Screenshot of the Solutions page in Power Automate with the New solution button highlighted in the toolbar.":::

1. Provide all required information for your new solution, including the **Display Name**,  **Name**, **Publisher**, and **Version**.

   The publisher identifies who developed the solution. Create your own meaningful publisher instead of using the default one. To create one, select **New publisher** in the **New solution** pane. The publisher's customization prefix is added to the start of the names of components that you create in the solution. For more information, see [Solution publisher](/power-apps/maker/data-platform/create-solution#solution-publisher) and [Solution concepts](/power-platform/alm/solution-concepts-alm#solution-publisher).

1. Select the **Create** button.

   :::image type="content" source="./media/overview-solution-flows/new-solution.png" alt-text="Screenshot of the New solution form with Display name, Name, Publisher, and Version fields and the Create button.":::

   Your new solution might appear like this image.

   :::image type="content" source="./media/overview-solution-flows/new-solution-created.png" alt-text="Screenshot of the new solution showing on the Solutions screen.":::

Now that you created your solution, [add your flows](./create-flow-solution.md) to it.

## Known limitations

When you use flows with solutions, you might encounter the following limitations:

- You can't add some non-solution cloud flows to a solution.
- If a canvas app connects to flows that you deleted from the environment, publishing the app fails with an error. To fix this error, remove the deleted flows from the app, and then save and publish the app.

For more information about these limitations, see [Known limitations](/power-apps/maker/data-platform/solutions-overview#known-limitations) in the Power Apps docs.
  
## Related information

- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
- [Remove a solution-aware flow](./remove-solution-aware-flow.md)
- [Training: Work with solution-aware cloud flows (module)](/training/modules/solution-aware-flow/)


[!INCLUDE[footer-include](includes/footer-banner.md)]
